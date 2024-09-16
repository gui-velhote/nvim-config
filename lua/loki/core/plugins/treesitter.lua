require("nvim-treesitter.configs").setup{
    ensure_installed = { "lua", "vim", "python", "java", "html", "css", "javascript", "json", "json5", "go"},
    sync_install = false,
    auto_install = true,
    autotag = {
        enable = true
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
