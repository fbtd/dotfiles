function last_history_item --description 'Print the previous command, for the !! abbreviation'
    # Fish's documented stand-in for bash history expansion. $history[1] is the
    # last command that actually ran, not the line being typed.
    echo $history[1]
end
