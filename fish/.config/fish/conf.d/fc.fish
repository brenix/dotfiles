function fc
    commandline --replace ''
    history | head -n 1 | read -l last
    commandline --insert $last
    edit_command_buffer
end
