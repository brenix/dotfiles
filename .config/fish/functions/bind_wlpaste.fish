function bind_wlpaste
    commandline -t -- (wl-paste -p -n)
    commandline -f repaint
end
