#!/usr/bin/env zsh

# Starting the server
tmux start-server

# Creating the first new session
tmux new-session -d -s watching -n htop \; \
    new-window -d -n redshift \; \
	new-window -d -n demo \; \
	send-keys -t htop 'htop' Enter \; \
    send-keys -t redshift 'redshift -t 3500:3500' C-m\; \
	send-keys -t demo 'cd ~/home/Github/Crazy_Ideas/python_web' Enter \; \

tmux new-session -d -s own -n BED \; \
	split-window -v \; \
	selectp -t 1 \; \
	send-keys 'cd ~/home/Github/Full_Stack_Web_App' C-m\; \
	selectp -t 0 \; \
	send-keys 'cd ~/home/Github/Full_Stack_Web_App' C-m\; \
	new-window -d -n CS \; \
	selectw -t CS \; \
	send-keys 'cd ~/home/Github/CS_CPP' C-m\; \

tmux new-session -d -s school -n main \; \
	send-keys 'goschgit' C-m\; \
