# Train directly
mkdir -p results/$ENV_ID; python -m option.main > results/$ENV_ID/stdout.log 2> results/$ENV_ID/stderr.log

# Train in Tmux detached session
ENV_ID='BeamRider-v0'; GPU_DEVICES='0'; tmux new -d -s "train/option/env-id-$ENV_ID" "mkdir -p results/$ENV_ID; python -m option.main --env_id=$ENV_ID --gpu_devices=$GPU_DEVICES > results/$ENV_ID/stdout.log 2> results/$ENV_ID/stderr.log"
ENV_ID='Breakout-v0'; GPU_DEVICES='0'; tmux new -d -s "train/option/env-id-$ENV_ID" "mkdir -p results/$ENV_ID; python -m option.main --env_id=$ENV_ID --gpu_devices=$GPU_DEVICES > results/$ENV_ID/stdout.log 2> results/$ENV_ID/stderr.log"
ENV_ID='Enduro-v0'; GPU_DEVICES='0'; tmux new -d -s "train/option/env-id-$ENV_ID" "mkdir -p results/$ENV_ID; python -m option.main --env_id=$ENV_ID --gpu_devices=$GPU_DEVICES > results/$ENV_ID/stdout.log 2> results/$ENV_ID/stderr.log"
ENV_ID='Pong-v0'; GPU_DEVICES='0'; tmux new -d -s "train/option/env-id-$ENV_ID" "mkdir -p results/$ENV_ID; python -m option.main --env_id=$ENV_ID --gpu_devices=$GPU_DEVICES > results/$ENV_ID/stdout.log 2> results/$ENV_ID/stderr.log"
ENV_ID='Qbert-v0'; GPU_DEVICES='0'; tmux new -d -s "train/option/env-id-$ENV_ID" "mkdir -p results/$ENV_ID; python -m option.main --env_id=$ENV_ID --gpu_devices=$GPU_DEVICES > results/$ENV_ID/stdout.log 2> results/$ENV_ID/stderr.log"
ENV_ID='Seaquest-v0'; GPU_DEVICES='0'; tmux new -d -s "train/option/env-id-$ENV_ID" "mkdir -p results/$ENV_ID; python -m option.main --env_id=$ENV_ID --gpu_devices=$GPU_DEVICES > results/$ENV_ID/stdout.log 2> results/$ENV_ID/stderr.log"
ENV_ID='SpaceInvaders-v0'; GPU_DEVICES='0'; tmux new -d -s "train/option/env-id-$ENV_ID" "mkdir -p results/$ENV_ID; python -m option.main --env_id=$ENV_ID --gpu_devices=$GPU_DEVICES > results/$ENV_ID/stdout.log 2> results/$ENV_ID/stderr.log"

# Kill the Tmux detached session
ENV_ID='BeamRider-v0'; tmux kill-ses -t "train/option/env-id-$ENV_ID"
ENV_ID='Breakout-v0'; tmux kill-ses -t "train/option/env-id-$ENV_ID"
ENV_ID='Enduro-v0'; tmux kill-ses -t "train/option/env-id-$ENV_ID"
ENV_ID='Pong-v0'; tmux kill-ses -t "train/option/env-id-$ENV_ID"
ENV_ID='Qbert-v0'; tmux kill-ses -t "train/option/env-id-$ENV_ID"
ENV_ID='Seaquest-v0'; tmux kill-ses -t "train/option/env-id-$ENV_ID"
ENV_ID='SpaceInvaders-v0'; tmux kill-ses -t "train/option/env-id-$ENV_ID"
