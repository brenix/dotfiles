bindkey -v
bindkey "^A" beginning-of-line      # ctrl+a
bindkey "^E" end-of-line            # ctrl+e
bindkey "^F" vi-change-whole-line   # ctrl+f
bindkey "^[OF" end-of-line          # end key
bindkey "^[OH" beginning-of-line    # home key
bindkey "^[[2~" overwrite-mode      # insert key
bindkey "^[[3~" delete-char         # del key

# ctrl+arrows
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
# urxvt
bindkey "\eOc" forward-word
bindkey "\eOd" backward-word

# ctrl+delete
bindkey "\e[3;5~" kill-word
# urxvt
bindkey "\e[3^" kill-word

# ctrl+backspace
bindkey '^H' backward-kill-word

# ctrl+shift+delete
bindkey "\e[3;6~" kill-line
# urxvt
bindkey "\e[3@" kill-line

# clear screen
bindkey "^[d" clear-screen
