# lvctr's dotfiles

Hello and welcome to my dotfiles repo.
This is mainly just for me so that I have a documentation of everything I use, but feel free to grab whatever you want from here.

### SPECS
|  | RAINLILY | WATERLILY | WINTERBERRY
|--|--|--|--|
| **Class** | Desktop | Laptop | Laptop
| **Host** | ASUS ROG STRIX X470-F | Lenovo ThinkPad T480s | Dell XPS 13 9360
| **OS** | Arch Linux (VFIO Windows) | Arch Linux/Windows | Arch Linux
| **CPU** | AMD Ryzen 7 5800X | Intel Core i7-8650U vPro | Intel Core i5-7200U
| **Host GPU** | AMD Radeon RX 5500 XT | Intel HD Graphics 620 | Intel HD Graphics 620
| **Guest GPU** | Nvidia GeForce RTX 3070Ti | |
| **RAM** | 32GB DDR4-3200 | 24GB DDR4-2400 | 8GB DDR3-1866
| **SSD1** | Kioxia Exceria Pro 1TB (Linux) | Intel 500GB (Linux) | SK Hynix 250GB
| **SSD2** | Kioxia Exceria Pro 2TB (Windows) | WD SN520 256GB (Windows)

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
| **menu** | `wofi` |
| **bg** | `hyprpaper` |
| **ime** | `fcitx5` |

### PROGRAMS
|||
|--|--|
| **term** | `kitty` |
| **fm** | `thunar` |
| **editor** | `visual-studio-code-bin` and `sublime-text` |
| **images** | `viewnior` |
| **audio** | `pragha` and `spotify` |
| **video** | `mpv-full` with `svp` and `vlc` |

### AUDIO

For audio I use `pipewire` with the following additions:
- `pipewire-alsa`
- `pipewire-jack` and `pipewire-jack-dropin` for JACK support
- `pipewire-pulse` for PulseAudio support

and manage devices with `pavucontrol` for PulseAudio and `qjackctl` for JACK.

### OTHERS
- `openrgb-bin` for RGB control
- `earlyoom` for OOM management
- `tlp` and `tlpui` for battery management

### VFIO

In order to play video games and use Photoshop on my system, I have my guest GPU passed through to a Windows VM.

||||
|--|--|--|
| **environment** | - | qemu/kvm managed with `virt-manager` |
| **video** | `looking-glass` ||
| **audio**| - |  |

This part of the document is incomplete.
