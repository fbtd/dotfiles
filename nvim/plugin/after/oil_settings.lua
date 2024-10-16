require("oil").setup({
     columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
    },
    constrain_cursor = "name",
    view_options = {
        show_hidden = true
    }
})
