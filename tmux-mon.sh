#!/bin/sh

# tmux session for monitoring system

session="monitor"

# start new session
tmux new-session -d -s $session -n 'monitor'

# select pane
tmux selectp -t 1

# send wavemon
tmux send-keys "wavemon" C-m

# split pane horizontally
tmux splitw -h -p 70

# send htop
tmux send-keys "htop" C-m

# attach sess
tmux attach-session -t $session
