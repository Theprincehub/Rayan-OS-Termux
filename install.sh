#!/data/data/com.termux/files/usr/bin/bash

clear
figlet "Rayan OS" | lolcat
echo "🔵 Installing Rayan OS... Please wait..." | lolcat

# Update and upgrade packages
pkg update -y && pkg upgrade -y

# Install necessary packages
pkg install proot-distro -y
pkg install git wget python figlet -y

# Install Ubuntu 24.04
proot-distro install ubuntu-24.04

# Login into Ubuntu 24.04 and install XFCE, VNC, and GNOME dark theme
proot-distro login ubuntu-24.04 --shared-tmp -- bash -c "
    apt update -y && apt upgrade -y
    apt install xfce4 xfce4-goodies tightvncserver gnome-themes-extra -y
    apt install fonts-arabic -y  # For Arabic language support
    # Set GNOME Dark Theme
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
    # Enable Arabic input (Arabic language support)
    apt install ibus-mozc -y
"

# Clear screen and show success message
clear
figlet "Rayan OS Installed!" | lolcat
echo "✅ Rayan OS installed successfully!" | lolcat
echo "For graphical interface, use VNC Viewer with default settings." | lolcat
echo "Arabic writing support enabled." | lolcat
