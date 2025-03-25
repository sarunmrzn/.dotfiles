# System Keybinds Documentation

## Table of Contents
- [Neovim](#neovim)
- [Hyprland](#hyprland)
- [Tmux](#tmux)
- [Kitty Terminal](#kitty-terminal)
- [Rofi](#rofi)

## Neovim

### General Navigation
| Keybind | Description |
|---------|-------------|
| `<Esc>` | Clear search highlighting |
| `<C-h/j/k/l>` | Move focus between windows |
| `<C-Up/Down/Left/Right>` | Resize windows |
| `<S-H/L>` | Next/Previous buffer |
| `<leader>` | Space key (main modifier) |

### LSP (Language Server Protocol)
| Keybind | Description |
|---------|-------------|
| `gd` | Go to Definition |
| `gr` | Go to References |
| `gI` | Go to Implementation |
| `<leader>D` | Type Definition |
| `<leader>ds` | Document Symbols |
| `<leader>ws` | Workspace Symbols |
| `<leader>rn` | Rename |
| `<leader>ca` | Code Action |
| `gD` | Go to Declaration |
| `<leader>th` | Toggle Inlay Hints |

### Telescope (Fuzzy Finder)
| Keybind | Description |
|---------|-------------|
| `<leader>fh` | Search Help |
| `<leader>fk` | Search Keymaps |
| `<leader>ff` | Find Files |
| `<leader>fs` | Select Telescope |
| `<leader>fw` | Search Current Word |
| `<leader>fg` | Live Grep |
| `<leader>fd` | Search Diagnostics |
| `<leader>fr` | Resume Last Search |
| `<leader>f.` | Search Recent Files |
| `<leader><leader>` | Find Existing Buffers |
| `<leader>/` | Fuzzy Search in Current Buffer |
| `<leader>s/` | Search in Open Files |
| `<leader>sn` | Search Neovim Files |

### Harpoon (File Management)
| Keybind | Description |
|---------|-------------|
| `<leader>a` | Add file to Harpoon list |
| `<C-e>` | Toggle Harpoon quick menu |
| `<C-1/2/3/4>` | Select Harpoon file 1-4 |
| `<C-S-P/N>` | Previous/Next Harpoon file |

### Debug
| Keybind | Description |
|---------|-------------|
| `<F5>` | Start/Continue Debug |
| `<F1>` | Step Into |
| `<F2>` | Step Over |
| `<F3>` | Step Out |
| `<leader>b` | Toggle Breakpoint |
| `<leader>B` | Set Conditional Breakpoint |
| `<F7>` | Toggle Debug UI |

### Formatting
| Keybind | Description |
|---------|-------------|
| `<leader>fx` | Format buffer |

### Neo-tree (File Explorer)
| Keybind | Description |
|---------|-------------|
| `\` | Toggle Neo-tree |

## Hyprland

### Window Navigation
| Keybind | Description |
|---------|-------------|
| `$mainMod + h/j/k/l` | Move focus between windows |
| `$mainMod + Shift + h/j/k/l` | Move windows |

### Application Launchers
| Keybind | Description |
|---------|-------------|
| `$mainMod + t` | Terminal |
| `$mainMod + b` | Browser |
| `$mainMod + e` | File Manager |
| `$mainMod + d` | Menu |
| `$mainMod + c` | Clipboard Manager |
| `$mainMod + n` | Notification Center |
| `$mainMod + p` | Display Settings |
| `$mainMod + Shift + r` | Set Wallpaper |

### Screenshot & Recording
| Keybind | Description |
|---------|-------------|
| `PRINT` | Full Screenshot |
| `$mainMod + Shift + s` | Area Screenshot |
| `$mainMod + Shift + v` | Start Screen Recording |
| `$mainMod + Ctrl + v` | Stop Screen Recording |

### System Controls
| Keybind | Description |
|---------|-------------|
| `$mainMod + X` | Lock Screen |
| `$mainMod + END` | Enable Blue Light Filter |
| `$mainMod + HOME` | Disable Blue Light Filter |

### Window Management
| Keybind | Description |
|---------|-------------|
| `$mainMod + q` | Kill Active Window |
| `$mainMod + m` | Exit Hyprland |
| `$mainMod + v` | Toggle Floating |
| `$mainMod + i` | Toggle Split |
| `$mainMod + f` | Toggle Fullscreen |

### Workspaces
| Keybind | Description |
|---------|-------------|
| `$mainMod + 1-0` | Switch to Workspace 1-10 |
| `$mainMod + Shift + 1-0` | Move Window to Workspace 1-10 |
| `$mainMod + Z` | Toggle Special Workspace |
| `$mainMod + Shift + Z` | Move to Special Workspace |

### Window Grouping
| Keybind | Description |
|---------|-------------|
| `$mainMod + G` | Toggle Group |
| `$mainMod + tab` | Next Group Window |
| `$mainMod + Shift + tab` | Previous Group Window |
| `$mainMod + Alt + H/J/K/L` | Move Window in Group |

### Media Keys
| Keybind | Description |
|---------|-------------|
| `XF86AudioRaiseVolume` | Volume Up |
| `XF86AudioLowerVolume` | Volume Down |
| `XF86AudioMute` | Toggle Mute |
| `XF86AudioMicMute` | Toggle Mic Mute |
| `XF86MonBrightnessUp/Down` | Brightness Up/Down |
| `XF86AudioNext/Prev` | Next/Previous Track |
| `XF86AudioPlay/Pause` | Play/Pause |

## Tmux
| Keybind | Description |
|---------|-------------|
| `Ctrl + Space` | Prefix key |
| `h/j/k/l` | Select pane |
| `H/J/K/L` | Resize pane |
| `c` | New window |
| `v` | Split window horizontally |
| `s` | Split window vertically |

## Kitty Terminal
| Keybind | Description |
|---------|-------------|
| `Ctrl + Shift + c` | Copy to clipboard |
| `Ctrl + Shift + v` | Paste from clipboard |
| `Ctrl + Shift + +/-` | Increase/decrease font size |
| `Ctrl + Shift + Backspace` | Reset font size |
| `Ctrl + Shift + Enter` | New window |
| `Ctrl + Shift + n` | New OS window |
| `Ctrl + Shift + w` | Close window |
| `Ctrl + Shift + [/]` | Next/Previous tab |
| `Ctrl + Shift + t` | New tab |
| `Ctrl + Shift + q` | Close tab |
| `Ctrl + Shift + l` | Next layout |
| `Ctrl + Shift + 1-5` | Go to tab 1-5 |

## Rofi
| Keybind | Description |
|---------|-------------|
| `Up/Ctrl + k` | Move up |
| `Down/Ctrl + j` | Move down |
| `Left/Ctrl + h` | Move left |
| `Right/Ctrl + l` | Move right |
| `Ctrl + z/Ctrl + y/Return` | Accept entry |
| `Ctrl + b` | Move character back |
| `Backspace` | Remove character back |
| `Ctrl + f` | Move character forward |
| `Ctrl + o` | Mode complete |

## Notes
- `$mainMod` is the Super/Windows key
- `<leader>` is the Space key in Neovim
- Some keybinds may require specific plugins or configurations to work 