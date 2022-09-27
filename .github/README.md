
# NEOVIM Config

Config in use on an Android terminal emulator — Termux.

![NEOVIM](./screenshots/Screenshot_1.jpg)

---

## Setup

**Required**

- Neovim
- Git

```console
apt install git
```

- Lua

```console
apt install lua
```

- [Vim-Plug (Plugin Manager)](https://github.com/junegunn/vim-plug )

**Installation**

```console
git clone https://github.com/steguiosaur/nvim ~/.config/nvim
cd .config/nvim
```

**Command Mode**

```console
nvim
:PlugInstall
```

---

## Key Maps and Command Shortcuts

### Key Maps

**Change windows with ctrl+(hjkl)**
Ctrl h
Ctrl j
Ctrl k
Ctrl l

**Buffer**
bn Buffer-Next
bp Buffer-Previous
bd Buffer-Delete

**Drawer File Explorer**
Ctrl b

**Telescope nvim**
Spc + ff Telescope find_files
Spc + fg Telescope live_grep
Spc + fb Telescope buffers
Spc + fh Telescope help_tags

### Command Shortcuts

**Vim-Plug**
PC :PlugClean
PI  :PlugInstall
PU :PlugUpdate

FZ :FZF
TT :TagbarToggle

