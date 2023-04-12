require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "go",
        "java",
        "javascript",
        "latex",
        "lua",
        "markdown",
        "python",
        "rust",
        "zig"
    },
    highlight = {
        enable = true,
    },
}
