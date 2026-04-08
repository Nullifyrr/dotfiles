#!/bin/bash

DIR=$HOME/Downloads/Installer-Stuff

# Download Programs
curl -o $DIR/Davinci-Resolve.zip https://swr.cloud.blackmagicdesign.com/DaVinciResolve/v20.3.2/DaVinci_Resolve_20.3.2_Mac.zip?verify=1775626297-CSKjLZCsDWFkYTOFP8x8%2BNC7NytG2ZnsGTQX8WEb%2BeE%3D
curl -o $DIR/Eden-macOS.tar.gz https://git.eden-emu.dev/eden-emu/eden/releases/download/v0.2.0-rc2/Eden-macOS-v0.2.0-rc2.tar.gz

# Extract Programs
7z x "$DIR/Davinci-Resolve.zip" -o"$DIR/Davinci-Resolve"
7z x "$DIR/Eden-macOS.tar.gz" -o"$DIR"
7z x "$DIR/Eden-macOS.tar" -o"$DIR"

# Remove Zips
rm -rf $DIR/Davinci-Resolve.zip $DIR/Eden-macOS.tar.gz

# Install Eden
mv $DIR/Eden-macOS/eden.app/ $HOME/Applications/

# Install Davinci Resolve
MOUNT_INFO=$(hdiutil attach -nobrowse -plist "$DIR/Davinci-Resolve/DaVinci_Resolve_20.3.2_Mac.dmg")
MOUNT_POINT=$(echo "$MOUNT_INFO" | grep -o '/Volumes/[^<]*' | head -n 1)

# Run the .pkg installer (Requires sudo)
PKG_PATH=$(find "$MOUNT_POINT" -name "*.pkg" | head -n 1)
sudo installer -pkg "$PKG_PATH" -target /

hdiutil detach "$MOUNT_POINT"
rm -rf "$DIR"

echo "Davinci Resolve installed, Eden installed"