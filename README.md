# insti's dotfiles

Hello and welcome to my dotfiles repo.
This is mainly just for me so that I have a documentation of everything I use, but feel free to grab whatever you want from here.

### SPECS
|  | RAINLILY | LAVENDER | WINTERBERRY
|--|--|--|--|
| **Class** | Desktop | Laptop | Laptop
| **Model** | | Lenovo Legion 5 15 | Dell XPS 13 9360
| **OS** | Arch Linux (VFIO Windows) | Arch Linux | Arch Linux
| **CPU** | AMD Ryzen 7 5800X | AMD Ryzen 7 4800H | Intel Core i5 7200U
| **Host GPU** | AMD Radeon RX 550 | AMD Radeon Vega 7 | Intel HD Graphics 620
| **Guest GPU** | AMD Radeon RX 6800 XT | Nvidia GeForce GTX 1650Ti
| **RAM** | 32GB DDR4-3200 | 16GB DDR4-3200 | 8GB DDR3-1866
| **SSD1** | SK Hynix 256GB | Crucial M500 500GB | SK Hynix 250GB
| **SSD2** | WD Blue 1TB | 
| **SSD3** | Samsung 860 EVO 1TB | 
| **HDDs** | Toshiba 1TB 5400RPM |

## ENVIRONMENT

### SHELL
Main shell is `zsh` with the following plugins:

- `zsh-autosuggestions`
- `zsh-completions`
- `zsh-syntax-highlighting`

managed using `oh-my-zsh`.

I am also using the `powerlevel10k` theme.

### DESKTOP
|||
|--|--|
| **wm** | `bspwm` |
| **com** | `picom-tryone-git` |
| **bar** | `polybar` |
| **notifs** | `dunst` |
| **menu** | `rofi` |
| **bg** | `feh` |
| **ime** | `fcitx5-mozc` |

### PROGRAMS
|||
|--|--|
| **term** | `kitty` |
| **fm** | `thunar` |
| **editor** | `sublime-text` |
| **images** | `gpicview` |
| **video** | `mpv-full` with `svp` |

### AUDIO

For audio I use `pipewire` with the following additions:
- `pipewire-alsa`
- `pipewire-jack` and `pipewire-jack-dropin` for JACK support
- `pipewire-pulse` for PulseAudio support

and manage devices with `pavucontrol` for PulseAudio and `qjackctl` for JACK.

### CHAT

Mainly use `discord` with `betterdiscord-installer` to chat, with the following plugins:

- to do
- theres so many lmao
- just check the repo its all there

### OTHERS
- `openrgb-git` for RGB control
- `liquitctl` for AIO control
- `earlyoom` for OOM management
- `tlp` and `autosuspend` for battery management

### VFIO

In order to play video games and use Photoshop on my system, I have my guest GPU passed through to a Windows VM.

||||
|--|--|--|
| **environment** | - | qemu/kvm managed with `virt-manager` |
| **video** | `looking-glass` ||
| **audio**| - | JACK routing is natively supported by `libvirt` |

This part of the document is incomplete.
