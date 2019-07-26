# Train directly
mkdir -p results; python -m option.main > results/stdout.log 2> results/stderr.log

# Train in Tmux detached session
tmux new -d -s "train/option" "mkdir -p results; python -m option.main > results/stdout.log 2> results/stderr.log"

# Kill the Tmux detached session
tmux kill-ses -t "train/option"
