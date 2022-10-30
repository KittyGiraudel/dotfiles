# Define a few options: case-insensitive globbing, auto `cd`-ing (if omitted),
# and correction of commands.
# https://scriptingosx.com/2019/06/moving-to-zsh-part-3-shell-options/
setopt NO_CASE_GLOB
setopt AUTO_CD
setopt CORRECT_ALL

# Load our custom functions by adding the `.zshfunctions` directory to the
# search path for functions and declaring our all utilities.
# https://scriptingosx.com/2019/07/moving-to-zsh-part-4-aliases-and-functions/
fpath+=~/.zshfunctions
autoload ll
autoload lcff
autoload groom
autoload groom_deps

# Load Git completion
# https://scriptingosx.com/2019/07/moving-to-zsh-part-5-completions/
autoload -Uz compinit && compinit

# Set up the prompt
# https://kittygiraudel.com/2022/10/29/making-sense-of-zsh/
autoload -Uz vcs_info
precmd() { vcs_info }
setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' formats '%F{153}%b%f'
PROMPT='%(?.%F{green}●.%F{red}●%f) %F{211}%1~%f ${vcs_info_msg_0_} '
RPROMPT='%F{245}%*%f'

# Make sure destructive operations require confirmation.
# https://gist.github.com/lyoshenka/6903705
unsetopt RM_STAR_SILENT
setopt RM_STAR_WAIT
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Alias typos for the `git` command despite `CORRECT_ALL` being set, as it
# requires confirmation, which we don’t need for that command.
alias igt='git'
alias got='git'
alias gto='git'
