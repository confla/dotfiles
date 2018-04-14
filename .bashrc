echo "Running bash..."

# Custom bash environment
#set autolist
#set ellipsis
#set autoexpand
#set nobeep
#set showdots
#set term=xterm-256color

# Custom prompt
PROMPT_DIRTRIM=3
PS1='\[\e[1m\]\u\[\e[0m\]@\h-bash: \[\e[0;37m\]\w\[\e[0m\] > '

# Refresh env vars for smooth X11 forwarding in tmux
#alias refresh 'set temp=`tmux show-environment | grep "^DISPLAY" | sed "s/=/ /"`; setenv $temp; echo "\033[1;32mrefresh:\033[0m Updated DISPLAY variable"'
