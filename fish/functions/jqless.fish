function jqless --description 'Pretty-print JSON in less'
    jq . -C $argv | less -r
end
