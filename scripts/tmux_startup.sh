#!/usr/bin/env zsh

# Starting the server
tmux start-server

# Creating the first new session
tmux new-session -d -s watching -n htop \; \
    new-window -d -n redshift \; \
	send-keys -t htop 'htop' Enter \; \
    send-keys -t redshift 'redshift -t 3200:3200' C-m\; \

tmux new-session -d -s own \; \
	send-keys 'cd ~/github' C-m\; \

tmux new-session -d -s school -n main \; \
	send-keys 'goschgit' C-m\; \
