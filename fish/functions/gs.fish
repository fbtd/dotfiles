function gs --description 'git status plus staged and unstaged diff stats'
    git status
    echo "--- HEAD ----"
    git diff --stat
    echo
    echo "--- INDEX ---"
    git diff --stat --staged
end
