setopt always_to_end          # Move cursor to end of word if completed in-word
setopt append_history         # allow multiple sessions to append to history
setopt auto_cd                # if a command cant be executed, cd into the dir
setopt auto_pushd             # make cd push the old dir onto the dir stack
setopt clobber                # allow files to be clobbered
setopt completeinword         # not just at the end
setopt correctall             # autocorrect commands
setopt extendedglob           # allow reg-ex style matching
setopt hash_list_all          # hash command paths when completion is attempted
setopt hist_expire_dups_first # ignore recording duplicate commands
setopt hist_ignore_all_dups   # ignore recording duplicate commands
setopt hist_ignore_space      # ignore recording commands prefixed with a space
setopt interactivecomments    # enable comments on the command line
setopt menucomplete           # show menu completions
setopt no_auto_menu           # bash-like completion
setopt nobeep                 # avoid beeping
setopt noflowcontrol          # no c-s/c-q output freezing
setopt nohup                  # dont send SIGHUP to background processes when exiting
setopt promptsubst            # allow expansion in prompts
setopt pushd_ignore_dups      # dont push the same dir twice
setopt unset                  # dont error out when unset parameters are used
