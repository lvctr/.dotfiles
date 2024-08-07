# VFIO Installation

THIS GUIDE IS FOR MY PERSONAL USE.

IT MAY NOT WORK FOR YOU.

PLEASE READ [PCI passthrough via OVMF on the Arch Linux Wiki](https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF) IF YOU ARE INTERESTED IN SETTING UP VFIO YOURSELF.

ALSO SINGLE GPU PASSTHROUGH IS STUPID. JUST DUAL BOOT LMAO.

## Windows 11

### Kernel-related settings

#### VFIO kernel
```
yay -Syu linux-vfio linux-vfio-headers
```
And then add the boot entries.

#### mkinitcpio
```
/etc/mkinitcpio.conf

MODULES=(... vfio_pci vfio vfio_iommu_type1 ...)
HOOKS=(... modconf ...)
```

And then regenerate mkinitcpio.
```
mkinitcpio -p linux-vfio
```

### Install dependencies
```
yay -S qemu-desktop libvirt edk2-ovmf virt-manager dnsmasq iptables-nft swtpm
```

### Install Looking Glass
```
yay -S looking-glass-rc
```

### Add user to libvirt group
```
sudo gpasswd -a $USER libvirt 
```

### Networking settings

Note: might not work if you don't run these with sudo, so if it doesn't work just sudo it.

```
virsh net-autostart default
virsh net-start default
```

### Enable and start services
```
systemctl enable libvirtd.service
systemctl start libvirtd.service virtlogd.service
```

### Other settings
#### Setting user for PipeWire backend
```
/etc/libvirt/qemu.conf

user = "insti"
```

## Import XML
```
virsh define win11.xml
```

### Edit XML
- Make sure to double check the PCI devices.
    - IOMMU groups and PCI IDs can be checked using `~/.scripts/iommu.sh`.

### Add hooks
Copy `hooks/qemu` to `/etc/libvirt/`.
`/etc/libvirt/hooks/qemu` for reference.
