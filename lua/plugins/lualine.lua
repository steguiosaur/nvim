require('lualine').setup {
    options = { theme = 'nightfly' },
    sections = {
        lualine_c = { 'g:coc_status' },
        lualine_x = { 'encoding', 'filetype' },
    },
}
