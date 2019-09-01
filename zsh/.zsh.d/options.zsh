setopt alwaystoend         # Move cursor to end of word if completed in-word
setopt appendhistory       # allow multiple sessions to append to history
setopt autocd              # if a command cant be executed, cd into the dir
setopt autopushd           # make cd push the old dir onto the dir stack
setopt clobber             # allow files to be clobbered
setopt completeinword      # not just at the end
setopt extendedglob        # allow reg-ex style matching
setopt hashlistall         # hash command paths when completion is attempted
setopt histexpiredupsfirst # ignore recording duplicate commands
setopt histignorealldups   # ignore recording duplicate commands
setopt histignorespace     # ignore recording commands prefixed with a space
setopt interactivecomments # enable comments on the command line
setopt menucomplete        # show menu completions
#setopt noautomenu          # bash-like completion
setopt nobeep              # avoid beeping
setopt noflowcontrol       # no c-s/c-q output freezing
setopt nohup               # dont send SIGHUP to background processes when exiting
setopt promptsubst         # allow expansion in prompts
setopt pushdignoredups     # dont push the same dir twice
setopt unset               # dont error out when unset parameters are used
