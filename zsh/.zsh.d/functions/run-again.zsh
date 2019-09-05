function run-again {
    # get previous history item
    zle up-history
    # confirm command
    zle accept-line
}

# define run-again widget from function of the same name
zle -N run-again

# bind widget to Ctrl+X in viins mode
bindkey -M viins '^[x' run-again
# bind widget to Ctrl+X in vicmd mode
bindkey -M vicmd '^[x' run-again
