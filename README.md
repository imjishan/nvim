# nvim


sudo apt install libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev meson ninja-build uthash-dev








#!/bin/bash

# Check if picom is already installed
if picom --version >/dev/null 2>&1; then
    echo "Picom is already installed. Skipping installation."
    exit 0
fi

# If picom is not installed, proceed with installation steps here
echo "Picom is not installed. Installing..."

# Update and install dependencies
sudo apt update
sudo apt install -y libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev libxext-dev meson ninja-build uthash-dev

# Clone the picom repository
git clone https://github.com/yshui/picom ~/picom
cd ~/picom

# Build and install picom
meson setup --buildtype=release build
ninja -C build
sudo ninja -C build install

echo "Installation complete."
