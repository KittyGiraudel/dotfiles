if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

colorflag="-G"

# Funky list
alias ls="command ls ${colorflag}"
alias l="ls -lF ${colorflag}"
alias ll="ls -laF ${colorflag}"
alias lsd="ls -lF ${colorflag} | grep "^d""

# Quick move
alias ..="cd .."
alias ...="cd ../../"

# Don't remove yourself
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i' 

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi

