function vl --description 'Edit file:line' --argument-names spec
    # v is an abbreviation, so this calls nvim directly. No colon opens the path as-is.
    set -l parts (string split --max 1 : -- $spec)
    if set -q parts[2]
        nvim +$parts[2] $parts[1]
    else
        nvim $spec
    end
end
