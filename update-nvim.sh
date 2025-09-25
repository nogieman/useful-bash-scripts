
#!/usr/bin/env bash
set -e
arch=$(uname -m)
if [ "$arch" != "x86_64" ]; then
    echo "This script currently only supports x86_64 Linux."
    exit 1
fi

echo "Removing old Neovim AppImage..."
sudo rm -f /usr/local/bin/nvim /usr/local/bin/nvim.appimage

echo "Downloading latest Neovim AppImage..."
curl -fLO --location https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage

echo "Making it executable..."
chmod u+x nvim-linux-x86_64.appimage

echo "Installing to /usr/local/bin..."
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim.appimage
sudo ln -sf /usr/local/bin/nvim.appimage /usr/local/bin/nvim

echo "Neovim update complete!"
echo "Current version:"
nvim --version
