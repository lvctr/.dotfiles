# lvctr's dotfiles

Hello and welcome to my dotfiles repo.
This is mainly just for me so that I have a documentation of everything I use, but feel free to grab whatever you want from here.

### SPECS
|  | RAINLILY | WATERLILY
|--|--|--|
| **Class** | Desktop | Laptop
| **Host** | GIGABYTE AORUS X570 | Lenovo ThinkPad X1 Carbon Gen 12
| **OS** | Arch Linux/Windows | Arch Linux/Windows
| **CPU** | AMD Ryzen 7 5800X | Intel Core Ultra 7 155U
| **Host GPU** | Nvidia GeForce RTX 4080 | Intel Arc Xe-LPG 64EU
| **RAM** | 64GB DDR4-3200 | 32GB DDR5-6400
| **SSD1** | Kioxia Exceria Pro 2TB | Kioxia Exceria Pro 1TB

## ENVIRONMENT

### SHELL
Main shell is `zsh` with the following plugins:

- `zsh-autosuggestions`
- `zsh-completions`
- `zsh-syntax-highlighting`
- `sudo`
- `git`
- `colored-man-pages`

managed using `zinit`.

I am also using the `powerlevel10k` theme.

### DESKTOP
|||
|--|--|
| **de** | `hyprland` |
| **bar** | `waybar` |
| **notifs** | `swaync` |
| **menu** | `rofi-wayland` |
| **bg** | `hyprpaper` |
| **ime** | `fcitx5` |

### PROGRAMS
|||
|--|--|
| **term** | `kitty` |
| **fm** | `thunar` |
| **editor** | `sublime-text` and `visual-studio-code-bin` |
| **images** | `viewnior` |
| **audio** | `pragha` and `spotify-launcher` |
| **video** | `vlc` and `mpv-full` with `svp` |
| **comms** | `vesktop-bin` |

### AUDIO

For audio I use `wireplumber` with the following additions:
- `pipewire-alsa`
- `pipewire-jack` and `pipewire-jack-dropin` for JACK support
- `pipewire-pulse` for PulseAudio support

and manage devices with `pavucontrol` for PulseAudio and `qjackctl` for JACK.

### OTHERS
- `openrgb-bin` for RGB control
- `earlyoom` for OOM management
- `tlp` and `tlpui` for battery management
