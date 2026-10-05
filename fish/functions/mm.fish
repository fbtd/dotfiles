function mm --description 'Open a man page in nvim' --wraps man
    # nvim is assumed installed. v is an abbreviation, so this calls nvim directly.
    if not man --where $argv &>/dev/null
        echo 'man page not found'
        return 1
    end
    nvim -c 'source $VIMRUNTIME/ftplugin/man.vim' -c "Man $argv" -c only
end
