# Custom tcsh environment
set autolist
set ellipsis
set autoexpand
set nobeep
set showdots
set term=xterm-256color
set prompt='%B%m%b_tcsh: %{\033[0;37m%}%c03%{\033[0m%} > '

# Refresh env vars for smooth X11 forwarding in tmux
alias refresh 'set temp=`tmux show-environment | grep "^DISPLAY" | sed "s/=/ /"`; setenv $temp; echo "\033[1;32mrefresh:\033[0m Updated DISPLAY variable"'
