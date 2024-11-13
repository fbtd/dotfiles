# stdin:    abs_path per line
#       if already in the vimgrep format, ignore lines
# stdout:   rel_path:1:x per line

BEGIN {
    FS = ":"
    OFS = ":"
}

NF >= 3 {print}

NF < 3 {
    "realpath --relative-base " cwd " '" $0 "' 2>/dev/null" | getline path
    $1 = path
    $2 = 1
    $3 = "x"
    print $0
}

