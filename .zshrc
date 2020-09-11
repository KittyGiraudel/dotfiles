# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%F{153}%b%f'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{211}%1~%f ${vcs_info_msg_0_} %(?.%F{green}✓.%F{red}𐄂)%f '
RPROMPT='%F{245}%*%f'

# Don’t remove yourself
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Git aliases
alias gti='git'
alias gto='git'
alias got='git'

# Return the last commit for the given file
function lcff {
  SHA=$(git log -n 1 --pretty=format:%H -- $1)
  git show --no-patch $SHA
}
