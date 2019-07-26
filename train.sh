# Train directly
python -m option.main

# Train in Tmux detached session
tmux new -d -s "train/option" "python -m option.main"
