
if [[ -z $MACROS_DIR ]] ; then
    export MACROS_DIR="$HOME/.macrosdir"
fi

if [[ ! -f $MACROS_DIR ]]; then
    mkdir -p $MACROS_DIR
fi

function addmac() {
    echo "Macro filename: "
    read somename
    vim ${MACROS_DIR}/${somename}
}

fzfcmdmacro() {
   [ ${FZF_TMUX:-1} -eq 1 ] && echo "fzf-tmux -d${FZF_TMUX_HEIGHT:-40%} --reverse" || echo "fzf"
}

function mac() {
    #local jumpline=$(ls ${MACROS_DIR} | $(fzfcmdmacro) --bind=ctrl-y:accept --tac)
    local jumpline=$(ls ${MACROS_DIR} | awk '{print $1}' | xargs -I {} bash -c "echo -n '{}  -->  ' ; head -1 ${MACROS_DIR}/{}" | $(fzfcmdmacro) --bind=ctrl-y:accept --tac)
    if [[ -n ${jumpline} ]]; then
        /bin/bash ${MACROS_DIR}/$jumpline
    fi
}

function vimac() {
    local jumpline=$(ls ${MACROS_DIR} | $(fzfcmdmacro) --bind=ctrl-y:accept --tac)
    if [[ -n ${jumpline} ]]; then
        vim ${MACROS_DIR}/$jumpline
    fi
}

function delmac()  {
    local macros_to_delete=$(ls $MACROS_DIR | $(fzfcmdmacro) -m --bind=ctrl-y:accept,ctrl-t:toggle-up --tac)

    if [[ -n ${macros_to_delete} ]]; then
      while read -r line; do
          rm -f ${MACROS_DIR}/${line}
      done <<< "$macros_to_delete"

      echo "** The following macros were deleted **"
      echo ${macros_to_delete}
    fi
}

#bind '"\C-g":"jump\n"'
