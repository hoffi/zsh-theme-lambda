function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%B%F{196}(ssh) %{$fg_bold[white]%}%n@%2m:"
  fi
}

git_prompt_info() {
  echo $(git symbolic-ref --short HEAD)
}

function git_status() {
  git_status=$(git status --porcelain -b -unormal --ignore-submodules=all)
  output=""
  if $(echo "$git_status" | grep '^UU ' &> /dev/null); then
    output="$output%{$fg[blue]%}°"
  fi
  if $(echo "$git_status" | grep -E '^(.M|R.|C.|.T) ' &> /dev/null); then
    output="$output%{$fg[yellow]%}!"
  fi
  if $(echo "$git_status" | grep '^A. ' &> /dev/null); then
    output="$output%{$fg[green]%}+"
  fi
  if $(echo "$git_status" | grep -E '^(D.|.D) ' &> /dev/null); then
    output="$output%{$fg[red]%}-"
  fi
  if $(echo "$git_status" | grep '^?? ' &> /dev/null); then
    output="$output%{$fg[white]%}*"
  fi
  if $(echo "$git_status" | grep '^## .*ahead' &> /dev/null); then
    output="$output%F{156}⬈"
  fi
  echo $output
}

function my_git_prompt() {
  tester=$(git rev-parse --git-dir 2> /dev/null) || return
  if [ ! -z $git_status ]
     then
     git_status=" $git_status"
  fi
  echo "%{$fg[white]%}‹%B%F{136} $(git_prompt_info)$(git_status) %{$fg[white]%}›"
}

lambda() {
  echo "%(?.%{$fg_bold[green]%}.%{$fg_bold[red]%})λ"
}

PROMPT=$'$(ssh_connection)%B%F{245}%~ $(my_git_prompt)\n$(lambda) %{$reset_color%}'
