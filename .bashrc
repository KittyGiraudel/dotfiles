YELLOW="\033[38;5;33m"
BLUE="\033[38;5;33m"
RED="\033[1;31m"
PINK="\033[38;5;213m"
PURPLE="\033[38;5;141m"
COLOR_NONE="\e[0m"

function parse_git_branch {
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^On branch ([^${IFS}]*)"
  remote_pattern="Your branch is (.*) of"
  diverge_pattern="Your branch and (.*) have diverged"

  #if [[ ! ${git_status}} =~ "working directory clean" ]]; then
    #state="${RED} ✨ "
  #fi

  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote="${YELLOW} ↑ "
    else
      remote="${YELLOW} ↓ "
    fi
  fi

  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="${YELLOW} ↕ "
  fi

  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch="${PURPLE}${BASH_REMATCH[1]}"
    echo " ${branch}${remote}"
  fi
}

function prompt_func() {
  previous_return_value=$?;
  prompt="${PINK}\w$(parse_git_branch) ${COLOR_NONE}"

  if test $previous_return_value -eq 0
  then
    PS1="${prompt}${BLUE}\\\$${COLOR_NONE} "
  else
    PS1="${prompt}${RED}\\\$${COLOR_NONE} "
  fi
}

PROMPT_COMMAND=prompt_func
