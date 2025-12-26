function remove
    if type -q pacman
        sudo pacman -Rnsc
    else if type -q xbps-remove
        sudo xbps-remove -R
    else
        return 1
    end
end
