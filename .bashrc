# Custom bash environment
bind '"\t":menu-complete'
bind '"\ep":history-search-backward'
set bell-style visible

# Custom prompt
export PROMPT_DIRTRIM=3
export PS1='\[\e[1m\]\h\[\e[0m\]_bash: \[\e[0;37m\]\w\[\e[0m\] > '

# Refresh env vars for smooth X11 forwarding in tmux
function refresh()
{
    if [ -z "$TMUX" ]; then
        echo -e '\e[1;32mrefresh:\e[0m FAILED - Not in a tmux session'
    else
        export $(tmux show-environment | grep "^DISPLAY")
        echo -e '\e[1;32mrefresh:\e[0m Updated DISPLAY variable'
    fi
}
