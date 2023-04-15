require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "go",
        "html",
        "java",
        "javascript",
        "latex",
        "lua",
        "markdown",
        "python",
        "rust",
        "typescript",
        "zig"
    },
    highlight = {
        enable = true,
    },
}
