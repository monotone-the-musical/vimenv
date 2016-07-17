# Setup fzf
# ---------
if [[ ! "$PATH" == */root/.fzf/bin* ]]; then
  export PATH="$PATH:/root/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */root/.fzf/man* && -d "/root/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/root/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/root/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/root/.fzf/shell/key-bindings.bash"


#
# Customized
#

alias fuz='echo ; cat ~/.fzf.bash |grep -v alias |grep "()" | sed s/"() { #"/"\t--->\t"/g ; echo'

fd() { # cd to selected directory
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

fda() { # cd to directory including hidden directories
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

fe() { # edit file
  IFS='
'
  local declare files=($(fzf-tmux --query="$1" --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
  unset IFS
}

fea() { # edit file including hidden files
  local files
  files=$(find ${1:-.} -type f 2> /dev/null | fzf +m) && vim "$files"
}

fh() { # search history
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

fg() { # grep for something
	grep --line-buffered --color=never -r "" * | fzf -m
}

fl() { # locate
	locate / | fzf -m
}

ff() { # find file
	find . -type f | fzf -m
}



# Bookmarks script
. ~/.fzf-marks.plugin.bash

