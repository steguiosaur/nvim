require('lualine').setup {
    disabled_filetypes = { 'vim-plug', 'NvimTree' },
    options = { theme = 'nightfly' },
    sections = {
        lualine_c = { 'filename', 'g:coc_status' },
        lualine_x = { 'encoding', 'filetype' },
    },
    inactive_sections = {
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
    },
}
