################################################################################
# Train in Tmux detached session
################################################################################

# Seed: 1000
ENV_ID='BeamRider-v0'; NUM_OPTIONS=5; SEED=1000; GPU_DEVICES='0'; tmux new -d -s "train/option/env_id-$ENV_ID/seed-$SEED" "mkdir -p results/env_id-$ENV_ID/seed-$SEED; python -m option.train --env_id=$ENV_ID --num_options=$NUM_OPTIONS --seed=$SEED --gpu_devices=$GPU_DEVICES > results/env_id-$ENV_ID/seed-$SEED/stdout.log 2> results/env_id-$ENV_ID/seed-$SEED/stderr.log"
ENV_ID='Breakout-v0'; NUM_OPTIONS=5; SEED=1000; GPU_DEVICES='0'; tmux new -d -s "train/option/env_id-$ENV_ID/seed-$SEED" "mkdir -p results/env_id-$ENV_ID/seed-$SEED; python -m option.train --env_id=$ENV_ID --num_options=$NUM_OPTIONS --seed=$SEED --gpu_devices=$GPU_DEVICES > results/env_id-$ENV_ID/seed-$SEED/stdout.log 2> results/env_id-$ENV_ID/seed-$SEED/stderr.log"
ENV_ID='Enduro-v0'; NUM_OPTIONS=6; SEED=1000; GPU_DEVICES='0'; tmux new -d -s "train/option/env_id-$ENV_ID/seed-$SEED" "mkdir -p results/env_id-$ENV_ID/seed-$SEED; python -m option.train --env_id=$ENV_ID --num_options=$NUM_OPTIONS --seed=$SEED --gpu_devices=$GPU_DEVICES > results/env_id-$ENV_ID/seed-$SEED/stdout.log 2> results/env_id-$ENV_ID/seed-$SEED/stderr.log"
ENV_ID='Pong-v0'; NUM_OPTIONS=4; SEED=1000; GPU_DEVICES='0'; tmux new -d -s "train/option/env_id-$ENV_ID/seed-$SEED" "mkdir -p results/env_id-$ENV_ID/seed-$SEED; python -m option.train --env_id=$ENV_ID --num_options=$NUM_OPTIONS --seed=$SEED --gpu_devices=$GPU_DEVICES > results/env_id-$ENV_ID/seed-$SEED/stdout.log 2> results/env_id-$ENV_ID/seed-$SEED/stderr.log"
ENV_ID='Qbert-v0'; NUM_OPTIONS=6; SEED=1000; GPU_DEVICES='0'; tmux new -d -s "train/option/env_id-$ENV_ID/seed-$SEED" "mkdir -p results/env_id-$ENV_ID/seed-$SEED; python -m option.train --env_id=$ENV_ID --num_options=$NUM_OPTIONS --seed=$SEED --gpu_devices=$GPU_DEVICES > results/env_id-$ENV_ID/seed-$SEED/stdout.log 2> results/env_id-$ENV_ID/seed-$SEED/stderr.log"
ENV_ID='Seaquest-v0'; NUM_OPTIONS=7; SEED=1000; GPU_DEVICES='0'; tmux new -d -s "train/option/env_id-$ENV_ID/seed-$SEED" "mkdir -p results/env_id-$ENV_ID/seed-$SEED; python -m option.train --env_id=$ENV_ID --num_options=$NUM_OPTIONS --seed=$SEED --gpu_devices=$GPU_DEVICES > results/env_id-$ENV_ID/seed-$SEED/stdout.log 2> results/env_id-$ENV_ID/seed-$SEED/stderr.log"
ENV_ID='SpaceInvaders-v0'; NUM_OPTIONS=5; SEED=1000; GPU_DEVICES='0'; tmux new -d -s "train/option/env_id-$ENV_ID/seed-$SEED" "mkdir -p results/env_id-$ENV_ID/seed-$SEED; python -m option.train --env_id=$ENV_ID --num_options=$NUM_OPTIONS --seed=$SEED --gpu_devices=$GPU_DEVICES > results/env_id-$ENV_ID/seed-$SEED/stdout.log 2> results/env_id-$ENV_ID/seed-$SEED/stderr.log"

# Seed: 1001
ENV_ID='BeamRider-v0'; NUM_OPTIONS=5; SEED=1001; GPU_DEVICES='0'; tmux new -d -s "train/option/env_id-$ENV_ID/seed-$SEED" "mkdir -p results/env_id-$ENV_ID/seed-$SEED; python -m option.train --env_id=$ENV_ID --num_options=$NUM_OPTIONS --seed=$SEED --gpu_devices=$GPU_DEVICES > results/env_id-$ENV_ID/seed-$SEED/stdout.log 2> results/env_id-$ENV_ID/seed-$SEED/stderr.log"
ENV_ID='Breakout-v0'; NUM_OPTIONS=5; SEED=1001; GPU_DEVICES='0'; tmux new -d -s "train/option/env_id-$ENV_ID/seed-$SEED" "mkdir -p results/env_id-$ENV_ID/seed-$SEED; python -m option.train --env_id=$ENV_ID --num_options=$NUM_OPTIONS --seed=$SEED --gpu_devices=$GPU_DEVICES > results/env_id-$ENV_ID/seed-$SEED/stdout.log 2> results/env_id-$ENV_ID/seed-$SEED/stderr.log"
ENV_ID='Enduro-v0'; NUM_OPTIONS=6; SEED=1001; GPU_DEVICES='0'; tmux new -d -s "train/option/env_id-$ENV_ID/seed-$SEED" "mkdir -p results/env_id-$ENV_ID/seed-$SEED; python -m option.train --env_id=$ENV_ID --num_options=$NUM_OPTIONS --seed=$SEED --gpu_devices=$GPU_DEVICES > results/env_id-$ENV_ID/seed-$SEED/stdout.log 2> results/env_id-$ENV_ID/seed-$SEED/stderr.log"
ENV_ID='Pong-v0'; NUM_OPTIONS=4; SEED=1001; GPU_DEVICES='0'; tmux new -d -s "train/option/env_id-$ENV_ID/seed-$SEED" "mkdir -p results/env_id-$ENV_ID/seed-$SEED; python -m option.train --env_id=$ENV_ID --num_options=$NUM_OPTIONS --seed=$SEED --gpu_devices=$GPU_DEVICES > results/env_id-$ENV_ID/seed-$SEED/stdout.log 2> results/env_id-$ENV_ID/seed-$SEED/stderr.log"
ENV_ID='Qbert-v0'; NUM_OPTIONS=6; SEED=1001; GPU_DEVICES='0'; tmux new -d -s "train/option/env_id-$ENV_ID/seed-$SEED" "mkdir -p results/env_id-$ENV_ID/seed-$SEED; python -m option.train --env_id=$ENV_ID --num_options=$NUM_OPTIONS --seed=$SEED --gpu_devices=$GPU_DEVICES > results/env_id-$ENV_ID/seed-$SEED/stdout.log 2> results/env_id-$ENV_ID/seed-$SEED/stderr.log"
ENV_ID='Seaquest-v0'; NUM_OPTIONS=7; SEED=1001; GPU_DEVICES='0'; tmux new -d -s "train/option/env_id-$ENV_ID/seed-$SEED" "mkdir -p results/env_id-$ENV_ID/seed-$SEED; python -m option.train --env_id=$ENV_ID --num_options=$NUM_OPTIONS --seed=$SEED --gpu_devices=$GPU_DEVICES > results/env_id-$ENV_ID/seed-$SEED/stdout.log 2> results/env_id-$ENV_ID/seed-$SEED/stderr.log"
ENV_ID='SpaceInvaders-v0'; NUM_OPTIONS=5; SEED=1001; GPU_DEVICES='0'; tmux new -d -s "train/option/env_id-$ENV_ID/seed-$SEED" "mkdir -p results/env_id-$ENV_ID/seed-$SEED; python -m option.train --env_id=$ENV_ID --num_options=$NUM_OPTIONS --seed=$SEED --gpu_devices=$GPU_DEVICES > results/env_id-$ENV_ID/seed-$SEED/stdout.log 2> results/env_id-$ENV_ID/seed-$SEED/stderr.log"

# Seed: 1002
ENV_ID='BeamRider-v0'; NUM_OPTIONS=5; SEED=1002; GPU_DEVICES='0'; tmux new -d -s "train/option/env_id-$ENV_ID/seed-$SEED" "mkdir -p results/env_id-$ENV_ID/seed-$SEED; python -m option.train --env_id=$ENV_ID --num_options=$NUM_OPTIONS --seed=$SEED --gpu_devices=$GPU_DEVICES > results/env_id-$ENV_ID/seed-$SEED/stdout.log 2> results/env_id-$ENV_ID/seed-$SEED/stderr.log"
ENV_ID='Breakout-v0'; NUM_OPTIONS=5; SEED=1002; GPU_DEVICES='0'; tmux new -d -s "train/option/env_id-$ENV_ID/seed-$SEED" "mkdir -p results/env_id-$ENV_ID/seed-$SEED; python -m option.train --env_id=$ENV_ID --num_options=$NUM_OPTIONS --seed=$SEED --gpu_devices=$GPU_DEVICES > results/env_id-$ENV_ID/seed-$SEED/stdout.log 2> results/env_id-$ENV_ID/seed-$SEED/stderr.log"
ENV_ID='Enduro-v0'; NUM_OPTIONS=6; SEED=1002; GPU_DEVICES='0'; tmux new -d -s "train/option/env_id-$ENV_ID/seed-$SEED" "mkdir -p results/env_id-$ENV_ID/seed-$SEED; python -m option.train --env_id=$ENV_ID --num_options=$NUM_OPTIONS --seed=$SEED --gpu_devices=$GPU_DEVICES > results/env_id-$ENV_ID/seed-$SEED/stdout.log 2> results/env_id-$ENV_ID/seed-$SEED/stderr.log"
ENV_ID='Pong-v0'; NUM_OPTIONS=4; SEED=1002; GPU_DEVICES='0'; tmux new -d -s "train/option/env_id-$ENV_ID/seed-$SEED" "mkdir -p results/env_id-$ENV_ID/seed-$SEED; python -m option.train --env_id=$ENV_ID --num_options=$NUM_OPTIONS --seed=$SEED --gpu_devices=$GPU_DEVICES > results/env_id-$ENV_ID/seed-$SEED/stdout.log 2> results/env_id-$ENV_ID/seed-$SEED/stderr.log"
ENV_ID='Qbert-v0'; NUM_OPTIONS=6; SEED=1002; GPU_DEVICES='0'; tmux new -d -s "train/option/env_id-$ENV_ID/seed-$SEED" "mkdir -p results/env_id-$ENV_ID/seed-$SEED; python -m option.train --env_id=$ENV_ID --num_options=$NUM_OPTIONS --seed=$SEED --gpu_devices=$GPU_DEVICES > results/env_id-$ENV_ID/seed-$SEED/stdout.log 2> results/env_id-$ENV_ID/seed-$SEED/stderr.log"
ENV_ID='Seaquest-v0'; NUM_OPTIONS=7; SEED=1002; GPU_DEVICES='0'; tmux new -d -s "train/option/env_id-$ENV_ID/seed-$SEED" "mkdir -p results/env_id-$ENV_ID/seed-$SEED; python -m option.train --env_id=$ENV_ID --num_options=$NUM_OPTIONS --seed=$SEED --gpu_devices=$GPU_DEVICES > results/env_id-$ENV_ID/seed-$SEED/stdout.log 2> results/env_id-$ENV_ID/seed-$SEED/stderr.log"
ENV_ID='SpaceInvaders-v0'; NUM_OPTIONS=5; SEED=1002; GPU_DEVICES='0'; tmux new -d -s "train/option/env_id-$ENV_ID/seed-$SEED" "mkdir -p results/env_id-$ENV_ID/seed-$SEED; python -m option.train --env_id=$ENV_ID --num_options=$NUM_OPTIONS --seed=$SEED --gpu_devices=$GPU_DEVICES > results/env_id-$ENV_ID/seed-$SEED/stdout.log 2> results/env_id-$ENV_ID/seed-$SEED/stderr.log"

################################################################################
# Kill the Tmux detached session
################################################################################

# Seed: 1000
ENV_ID='BeamRider-v0'; SEED=1000; tmux kill-ses -t "train/option/env_id-$ENV_ID/seed-$SEED"
ENV_ID='Breakout-v0'; SEED=1000; tmux kill-ses -t "train/option/env_id-$ENV_ID/seed-$SEED"
ENV_ID='Enduro-v0'; SEED=1000; tmux kill-ses -t "train/option/env_id-$ENV_ID/seed-$SEED"
ENV_ID='Pong-v0'; SEED=1000; tmux kill-ses -t "train/option/env_id-$ENV_ID/seed-$SEED"
ENV_ID='Qbert-v0'; SEED=1000; tmux kill-ses -t "train/option/env_id-$ENV_ID/seed-$SEED"
ENV_ID='Seaquest-v0'; SEED=1000; tmux kill-ses -t "train/option/env_id-$ENV_ID/seed-$SEED"
ENV_ID='SpaceInvaders-v0'; SEED=1000; tmux kill-ses -t "train/option/env_id-$ENV_ID/seed-$SEED"

# Seed: 1001
ENV_ID='BeamRider-v0'; SEED=1001; tmux kill-ses -t "train/option/env_id-$ENV_ID/seed-$SEED"
ENV_ID='Breakout-v0'; SEED=1001; tmux kill-ses -t "train/option/env_id-$ENV_ID/seed-$SEED"
ENV_ID='Enduro-v0'; SEED=1001; tmux kill-ses -t "train/option/env_id-$ENV_ID/seed-$SEED"
ENV_ID='Pong-v0'; SEED=1001; tmux kill-ses -t "train/option/env_id-$ENV_ID/seed-$SEED"
ENV_ID='Qbert-v0'; SEED=1001; tmux kill-ses -t "train/option/env_id-$ENV_ID/seed-$SEED"
ENV_ID='Seaquest-v0'; SEED=1001; tmux kill-ses -t "train/option/env_id-$ENV_ID/seed-$SEED"
ENV_ID='SpaceInvaders-v0'; SEED=1001; tmux kill-ses -t "train/option/env_id-$ENV_ID/seed-$SEED"

# Seed: 1002
ENV_ID='BeamRider-v0'; SEED=1002; tmux kill-ses -t "train/option/env_id-$ENV_ID/seed-$SEED"
ENV_ID='Breakout-v0'; SEED=1002; tmux kill-ses -t "train/option/env_id-$ENV_ID/seed-$SEED"
ENV_ID='Enduro-v0'; SEED=1002; tmux kill-ses -t "train/option/env_id-$ENV_ID/seed-$SEED"
ENV_ID='Pong-v0'; SEED=1002; tmux kill-ses -t "train/option/env_id-$ENV_ID/seed-$SEED"
ENV_ID='Qbert-v0'; SEED=1002; tmux kill-ses -t "train/option/env_id-$ENV_ID/seed-$SEED"
ENV_ID='Seaquest-v0'; SEED=1002; tmux kill-ses -t "train/option/env_id-$ENV_ID/seed-$SEED"
ENV_ID='SpaceInvaders-v0'; SEED=1002; tmux kill-ses -t "train/option/env_id-$ENV_ID/seed-$SEED"
