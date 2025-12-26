function remove -w pacman -w xbps-remove
    set -l packages $argv
    if type -q pacman
        sudo pacman -Rnsc $packages
    else if type -q xbps-remove
        sudo xbps-remove -R $packages
    else
        return 1
    end
end
