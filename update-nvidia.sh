
#!/bin/bash
set -e
KVER=$(ls /lib/modules | sort -V | tail -n 1)  # Find latest kernel version available
echo "-> Latest kernel detected: $KVER"

sudo apt update
sudo apt install -y linux-image-$KVER linux-headers-$KVER  # Install image + headers

sudo dkms install nvidia-current/550.163.01 -k $KVER || true  # Build NVIDIA DKMS module

sudo update-initramfs -u -k $KVER  # Update initramfs + grub
sudo update-grub

echo "-> Done! Now reboot into $KVER"
