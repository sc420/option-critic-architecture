from __future__ import absolute_import

from gym import wrappers
import argparse
import gym
import numpy as np
import os
import pandas as pd
import sys
import tensorflow as tf

from option.models.option_critic_network import OptionsNetwork
from option.helper.buffer import ReplayBuffer
from option.helper.state_processor import StateProcessor

# ========================================
#   Utility Parameters
# ========================================
# Render gym env during training
RENDER_ENV = False
# Gym environment
# ENV_NAME = 'Seaquest-v0'
# # Directory for storing gym results
# MONITOR_DIR = './results/gym_ddpg'
# # Directory for storing tensorboard summary results
# SUMMARY_DIR = './results/tf_ddpg'
# Seed
# RANDOM_SEED = 1234
# np.random.seed(RANDOM_SEED)

# ==========================
#   Training Parameters
# ==========================
# Update Frequency
update_freq = 4
# Max training epochs
MAX_EPOCHS = 1
# Max episode length
MAX_EP_STEPS = 250000
# Maximum frames per game
MAX_STEPS = 18000
# Base learning rate for the Actor network
ACTOR_LEARNING_RATE = 0.00025
# Base learning rate for the Critic Network
CRITIC_LEARNING_RATE = 0.00025
# Contributes to the nitial random walk
MAX_START_ACTION_ATTEMPTS = 30
# Update params
FREEZE_INTERVAL = 10000
# Discount factor
GAMMA = 0.99
# Soft target update param
TAU = 0.001
# Starting chance of random action
START_EPS = 1
# Final chance of random action
END_EPS = 0.1
# How many steps of training to reduce startE to endE.
ANNEALING = 1000000
# Number of options
# OPTION_DIM = 8
# Size of replay buffer
BUFFER_SIZE = 1000000
# Minibatch size
MINIBATCH_SIZE = 32


def get_reward(reward):
    if reward < 0:
        score = -1
    elif reward > 0:
        score = 1
    else:
        score = 0

    return score, reward


def get_epsilon(frm_count):
    return 0.05

# ===========================
#   Agent Playing
# ===========================


def play(sess, env, option_critic):  # , critic):
    # Initialize random generator
    np.random.seed(RANDOM_SEED)
    rng = np.random.RandomState(RANDOM_SEED)

    sess.run(tf.global_variables_initializer())

    # Initialize the saver
    saver = tf.train.Saver()

    # Load the model
    load_model(saver, sess, 'best_model.ckpt')

    # Initialize target network weights
    # option_critic.update_target_network()
    # critic.update_target_network()

    # State processor
    state_processor = StateProcessor()

    # Initialize replay memory
    replay_buffer = ReplayBuffer(84, 84, rng, BUFFER_SIZE, 4)
    frame_count = 0
    print_option_stats = False
    # Initialize action counter to 0
    action_counter = [{j: 0 for j in range(
        env.action_space.n)} for epoch_idx in range(OPTION_DIM)]
    total_reward = 0

    # Initialize the stats
    since_last_term_list = []

    # Initialize the lists updated after the episode is terminated
    ep_count_list = []
    frame_count_list = []
    ep_reward_list = []
    termination_counter_list = []
    avg_since_last_term_list = []

    for epoch_idx in range(MAX_EPOCHS):
        start_frames = frame_count

        while MAX_EP_STEPS > (frame_count - start_frames):
            # if RENDER_ENV:
            #     env.render()

            current_state = env.reset()  # note I'm using only one step, original uses 4
            current_state = state_processor.process(sess, current_state)
            current_state = np.stack([current_state] * 4, axis=2)
            current_option = 0
            current_action = 0
            new_option = np.argmax(option_critic.predict(current_state))
            # + (1./(1. + i)) # state has more than 3 features in pong
            done = False
            termination = True
            ep_reward = 0
            ep_ave_max_q = 0
            termination_counter = 0
            since_last_term = 1
            game_over = False

            start_frame_count = frame_count
            episode_counter = 0

            # Run the episode until the environment is terminated or the frame
            # count for the current episode has exceeded the limit
            while not game_over:
                frame_count += 1
                episode_counter += 1
                eps = get_epsilon(frame_count)
                if termination:
                    if print_option_stats:
                        print("terminated ------- {}".format(since_last_term))

                    # Save the stat
                    since_last_term_list.append(since_last_term)

                    termination_counter += 1
                    since_last_term = 1
                    current_option = np.random.randint(OPTION_DIM) \
                        if np.random.rand() < eps else new_option
                else:
                    if print_option_stats:
                        print("keep going")

                    since_last_term += 1

                action_probs = option_critic.predict_action(
                    [current_state], np.reshape(current_option, [1, 1]))[0]

                # Make the probability sum to 1.0
                # Reference: https://stackoverflow.com/a/53605818
                action_probs = np.asarray(action_probs).astype('float64')
                action_probs = action_probs / np.sum(action_probs)

                current_action = np.argmax(
                    np.random.multinomial(1, action_probs))
                if print_option_stats:
                    if print_option_stats:
                        action_counter[current_option][current_action] += 1
                        data_table = []
                        option_count = []
                        for ii, aa in enumerate(action_counter):
                            s3 = sum([aa[a] for a in aa])
                            if s3 < 1:
                                continue

                            print(ii, aa, s3)
                            option_count.append(s3)
                            print([str(float(aa[a]) / s3)[:5] for a in aa])
                            data_table.append([float(aa[a]) / s3 for a in aa])
                            print

                        print

                next_state, reward, done, info = env.step(current_action)
                next_state = state_processor.process(sess, next_state)
                next_state = np.append(
                    current_state[:, :, 1:],
                    np.expand_dims(next_state, 2),
                    axis=2)
                score, reward = get_reward(reward)
                game_over = done or (frame_count-start_frame_count) > MAX_STEPS

                total_reward += reward

                replay_buffer.add_sample(
                    current_state[:, :, -1], current_option, score, game_over)

                term = option_critic.predict_termination(
                    [next_state], [[current_option]])
                option_term_ps, Q_values = term[0], term[1]
                ep_ave_max_q += np.max(Q_values)
                new_option = np.argmax(Q_values)
                randomize = np.random.uniform(size=np.asarray([0]).shape)
                termination = np.greater(option_term_ps[0], randomize)

                current_state = next_state
                ep_reward += reward

                if done:
                    break

            # Add stats to the lists
            ep_count_list.append(episode_counter)
            frame_count_list.append(frame_count)
            ep_reward_list.append(ep_reward)
            termination_counter_list.append(termination_counter)

            if len(since_last_term_list) >= 0:
                avg_since_last_term_list.append(np.mean(since_last_term_list))
            else:
                avg_since_last_term_list.append(None)

            print('| Reward: %.2i' % int(ep_reward),
                  " | Episode %d" % (episode_counter),
                  ' | Qmax: %.4f' % (ep_ave_max_q / float(episode_counter)),
                  ' | Cumulative Reward: %.1f' % (
                      total_reward / float(episode_counter)),
                  ' | %d Remaining Frames' % (
                      MAX_EP_STEPS - (frame_count - start_frames)),
                  ' | Epsilon: %.4f' % eps,
                  " | Termination Count: %d" % (termination_counter),
                  ' | Episode Count: %d' % (episode_counter),
                  ' | Frame Count: %d' % (frame_count))

            # Save the stats to the file
            df_stats = pd.DataFrame(data={
                'ep_count': ep_count_list,
                'frame_count': frame_count_list,
                'ep_reward': ep_reward_list,
                'termination_count': termination_counter_list,
                'avg_since_last_term': avg_since_last_term_list,
            })

            df_stats.to_csv('{}/stats.csv'.format(STATS_DIR))

    # Print the message
    print('Done playing')


def set_up_gym(env_id):
    env = gym.make(env_id)
    env.seed(RANDOM_SEED)
    env.reset()
    return env


def load_model(saver, sess, filename):
    # Build the path
    path = '{}/{}'.format(MODEL_DIR, filename)

    # Load the model
    saver.restore(sess, path)


def parse_args():
    # Build an argument parser
    parser = argparse.ArgumentParser(description='Train with Option-Critic')

    # Add arguments
    parser.add_argument('--env_id', type=str, default='Seaquest-v0',
                        help='Environment ID')
    parser.add_argument('--num_options', type=int, default=8,
                        help='Number of options')
    parser.add_argument('--seed', type=int, default=1000,
                        help='Random seed')
    parser.add_argument('--gpu_devices', type=str, default='0',
                        help='Set the GPU devices to use')

    # Parse the arguments
    args = parser.parse_args()

    return args


def main(_):
    # Create directories if not existed
    if not os.path.exists(STATS_DIR):
        os.makedirs(STATS_DIR)

    state_dim = env.observation_space.shape[0]
    action_dim = env.action_space.n

    if state_dim == 210:
        # state_dim *= env.observation_space.shape[1] # for grey scale
        state_dim = 84 * 84 * 4
    # action_bound = env.action_space.high
    # Ensure action bound is symmetric
    # assert(env.action_space.high == -env.action_space.low)

    # Allow GPU memory growth
    config = tf.ConfigProto()
    config.gpu_options.allow_growth = True

    with tf.Session(config=config) as sess:
        tf.set_random_seed(RANDOM_SEED)
        # sess, h_size, temp, state_dim, action_dim, option_dim, action_bound, learning_rate, tau
        option_critic = OptionsNetwork(
            sess, 512, 1, state_dim, action_dim, 8, ACTOR_LEARNING_RATE, TAU, GAMMA, clip_delta=1)

        # Play the network
        play(sess, env, option_critic)

    # if GYM_MONITOR_EN:
    #     env.monitor.close()


if __name__ == '__main__':
    # Parse the arguments
    args = parse_args()

    # Set visible CUDA devices
    os.environ['CUDA_VISIBLE_DEVICES'] = args.gpu_devices

    # Modify global variables
    global MODEL_DIR
    global STATS_DIR
    global OPTION_DIM
    global RANDOM_SEED
    MODEL_DIR = './results/env_id-{}/seed-{}/models'.format(
        args.env_id, args.seed)
    STATS_DIR = './results/env_id-{}/seed-{}/stats'.format(
        args.env_id, args.seed)
    OPTION_DIM = args.num_options
    RANDOM_SEED = args.seed

    # Set up Gym environment
    env = set_up_gym(args.env_id)

    # Run the main function
    tf.app.run()
