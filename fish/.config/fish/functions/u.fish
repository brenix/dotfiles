function u
    # if type -q mise
    #     mise up
    # end
    if type -q pacman
        sudo pacman -Syu
    else if type -q apt
        sudo apt update
        sudo apt upgrade -y
    else if type -q dnf
        sudo dnf upgrade --refresh -y
    else if type -q zypper
        sudo zypper refresh
        sudo zypper update
    else if type -q brew
        brew update
        brew upgrade
    else
        return 1
    end
end
