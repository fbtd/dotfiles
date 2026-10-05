function we --description 'Open a path in Explorer; defaults to the current directory'
    set -l path .
    set -q argv[1]; and set path $argv[1]
    explorer.exe $path
end
