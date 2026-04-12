function bind_dollar
    switch (commandline --current-token)[-1]
        case "*!\\"
            commandline --insert '$'
        case "!" "*!"
            if set -q history[1]
                echo $history[1] | read --list --tokenize last_cmdline

                set -l last_token (string escape --no-quoted -- $last_cmdline[-1] | string replace -r '^\\\\~' '~')

                commandline --current-token -- $last_token
            end
            commandline --function repaint
        case "*"
            commandline --insert '$'
    end
end
