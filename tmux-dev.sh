#!/bin/sh

# pane config basic dev env.
# Michael Holmes 2019

activate_vim=true   # open vim on start-up?
session="dev"       # session name
terminal_height=20  # terminal heigh in percent
debug_width=20      # debug pane width in percent
debugger="gdb"      # debugger to use in session

 # kill any existing session
tmux kill-server

#start tmux server
tmux start-server

# start a new tmux session
tmux new-session -d -s $session -n 'vim'

#select pane 1
tmux selectp -t 1

#send vim to pane 1
if ($activate_vim); then
   tmux send-keys "vim" C-m
fi

# split main pain for debug sidebar
tmux splitw -h -p $debug_width

# send debugger
tmux send-keys $debugger C-m

# select pane 1
tmux selectp -t 1

# split pane 1 for terminal window
tmux splitw -v -p $terminal_height

tmux attach-session -t $session
