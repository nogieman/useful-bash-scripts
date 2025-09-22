
#!/bin/bash
set -e

# Find latest kernel version available
KVER=$(ls /lib/modules | sort -V | tail -n 1)

echo "==> Latest kernel detected: $KVER"

# Install image + headers
sudo apt update
sudo apt install -y linux-image-$KVER linux-headers-$KVER

# Build NVIDIA DKMS module
sudo dkms install nvidia-current/550.163.01 -k $KVER || true

# Update initramfs + grub
sudo update-initramfs -u -k $KVER
sudo update-grub

echo "==> Done! Now reboot into $KVER"
