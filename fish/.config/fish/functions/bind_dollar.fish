function bind_dollar
    switch (commandline --current-token)[-1]
        case "*!\\"
            commandline --insert '$'
        case "!" "*!"
            echo $history[1] | read --list --tokenize last_cmdline
            commandline --current-token -- (string escape --no-quoted -- $last_cmdline[-1])
            commandline --function repaint
        case "*"
            commandline --insert '$'
    end
end
