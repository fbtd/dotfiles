function rghless --description 'rg including hidden and ignored files, paged'
    rg --pretty --hidden --no-ignore $argv | less -r
end
