
# NEOVIM Config

---

Config for an Android terminal emulator — Termux.

![NEOVIM](./screenshots/Screenshot_1.jpg)

## Features

---

> Configurable under `~/.config/nvim/init.vim`

**Aesthetics**

- Buffer - `akinsho/bufferline.nvim`
- Statusline - `nvim-lualine/lualine.nvim`
- Icons - `ryanoasis/vim-devicons`
- Colorscheme - `sam4llis/nvim-tundra`

**Functionality**

- Start Prompt- `mhinz/vim-startify`
- Indentation - `Yggdroot/indentLine`
- Auto Pairing - `jiangmiao/auto-pairs`
- Tags - `preservim/tagbar`
- Command - `folke/which-key.nvim`
- Terminal - `akinsho/toggleterm.nvim`

**File Explorer**

- Fuzzy Finder
  - `junegunn/fzf`
  - `junegunn/fzf.vim`

- Nvim Tree
  - `kyazdani42/nvim-web-devicons`
  - `kyazdani42/nvim-tree.lua`

- Telescope
  - `nvim-telescope/telescope.nvim`
  - `nvim-lua/plenary.nvim`

**Completion, Linters, and Syntax Highlighting**

- LSP - `neoclide/coc.nvim`
- LaTeX - `lervag/vimtex`
- Syntax Highlighting - `nvim-treesitter/nvim-treesitter`
- Color Value Highlighter - `norcalli/nvim-colorizer.lua`

**Git**

- Git Command Mode - `tpope/vim-fugitive`
- Gutter Changes - `lewis6991/gitsigns.nvim`

## Setup

---

**Required**

- Neovim
- Git
- Lua
- [Vim-Plug (Plugin Manager)](https://github.com/junegunn/vim-plug )

**Optional**

- Ctags (for :TagbarToggle)

**Installation**

1. Install git, neovim, lua, and ctags

    ```console
    apt install git lua neovim ctags
    ```

2. Install plugin manager (preferably Vim-plug)

    > Read documentation on how to install.
    - [Vim-Plug](https://github.com/junegunn/vim-plug ) plugin manager

3. Clone repository to $HOME/.config/nvim

    ```console
    git clone https://github.com/steguiosaur/nvim ~/.config/nvim
    ```

4. Install Packages

    Open Neovim by executing `nvim` and type

    ```vim
    :PlugInstall
    ```

    in command mode.

## KeyMaps and Command Shortcuts

---

### KeyMaps

**Change windows with ctrl+(hjkl)**

| KeyMap |    Action    |
|--------|--------------|
| Ctrl h | Left window  |
| Ctrl j | Down window  |
| Ctrl k | Up window    |
| Ctrl l | Right window |

**Buffer**

| KeyMap |      Action     |
|--------|-----------------|
| b n    | Buffer-Next     |
| b p    | Buffer-Previous |
| b d    | Buffer-Delete   |

**Drawer File Explorer**

| KeyMap |       Action      |
|--------|-------------------|
| Ctrl b | `:NvimTreeToggle` |

**Telescope nvim**

| KeyMap  |          Action         |
|---------|-------------------------|
| Spc f f | `:Telescope find_files` |
| Spc f g | `:Telescope live_grep`  |
| Spc f b | `:Telescope buffers`    |
| Spc f h | `:Telescope help_tags`  |

### Command Mode Shortcuts

**Vim-plug**

|  Shortcut  |  Command   |
|------------|------------|
| `:PC` | `:PlugClean`    |
| `:PI` | `:PlugInstall`  |
| `:PU` | `:PlugUpdate`   |

**FuzzyFinder + Tagbar**

|  Shortcut  |  Command   |
|------------|------------|
| `:FZ` | `:FZF`          |
| `:TT` | `:TagbarToggle` |
