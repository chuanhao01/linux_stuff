# Starting the server
tmux start-server

# Creating the first new session
tmux new-session -d -s watching -n htop \; \
	new-window -d -n demo \; \
	send-keys -t htop 'htop' Enter \; \
	send-keys -t demo 'cd ../My_Folder/Github/Crazy_Ideas/python_web/login' Enter \; \

tmux new-session -d -s own -n BED \; \
	split-window -v \; \
	selectp -t 1 \; \
	send-keys 'cd ../My_Folder/Github/Full_Stack_Web_App' C-m\; \
	selectp -t 0 \; \
	send-keys 'cd ../My_Folder/Github/Full_Stack_Web_App' C-m\; \
	new-window -d -n CS \; \
	selectw -t CS \; \
	send-keys 'cd ../My_Folder/Github/CS_CPP' C-m\; \

tmux new-session -d -s school -n PDS \; \
	send-keys 'goschgit' C-m\; \
	send-keys 'cd PDS/' C-m\; \
	new-window -n DAVI \; \
	send-keys 'goschgit' C-m\; \
	send-keys 'cd DVis/' C-m\; \
	new-window -n Stats \; \
	send-keys 'goschgit' C-m\; \
	send-keys 'cd stats/' C-m\; \
	new-window -n Nat\; \
