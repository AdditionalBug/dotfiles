export PS1="\u@\h:\w\$ "
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
#export PS1="\[\033[38;5;183m\]\u@\h\[\033[00m\]:\[\033[38;5;150m\]\w\[\033[00m\]\$ "
#export PS1="\[\033[38;5;215m\]➜  \[\033[38;5;183m\]\u \[\033[38;5;244m\]in \[\033[38;5;150m\]\w \[\033[00m\]\n\$ "
#export PS1="\[\033[38;5;215m\]➜  \[\033[38;5;150m\]\w \[\033[38;5;183m\]\$\[\033[00m\] "
export PATH="$HOME/.local/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/vi/miniconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/vi/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/vi/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/vi/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
