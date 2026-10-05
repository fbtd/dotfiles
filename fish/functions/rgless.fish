function rgless --description 'rg --pretty, paged'
    rg --pretty $argv | less -r
end
