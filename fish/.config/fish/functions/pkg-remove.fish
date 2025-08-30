function remove --argument package_name
    if test -z "$package_name"
        return 1
    end

    if type -q pacman
        sudo pacman -Rnsc "$package_name"
    else if type -q apt
        sudo apt purge --autoremove "$package_name"
    else if type -q dnf
        sudo dnf autoremove "$package_name"
    else if type -q zypper
        sudo zypper remove "$package_name"
    else if type -q brew
        brew uninstall "$package_name"
    else
        return 1
    end
end
