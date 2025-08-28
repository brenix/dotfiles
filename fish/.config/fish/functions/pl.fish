function pl
    set playlist (mpc lsplaylists | fzf --reverse)
    if test -n "$playlist"
        mpc clear
        mpc load "$playlist"
        mpc play
    end
end
