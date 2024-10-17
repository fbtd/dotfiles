BEGIN {
    OFS = ":"
}

{
    # "realpath --relative-base " "/home/u222693/dotfiles "  $1 | getline path
    "realpath --relative-base " cwd " " $1 | getline path
    # gsub("/\n/", "", path)
    $1 = path
    $2 = 1
    $3 = "x"
    print $0
}
