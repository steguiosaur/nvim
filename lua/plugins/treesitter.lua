require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
        "cpp",
        "lua",
        "java",
        "rust",
        "javascript",
        "python",
        "latex",
        "markdown"
    },
    highlight = {
        enable = true,
    },
}
