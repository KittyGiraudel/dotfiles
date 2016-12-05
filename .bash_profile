# Don’t remove yourself
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i' 

# Not sure what this does
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi


# Load .bashrc for every new session
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# Load bash completion for every new session
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
