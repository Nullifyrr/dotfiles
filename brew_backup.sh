#!/bin/bash

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

BACKUP_DIR="$HOME/Documents/Brew-Backups"

if [ ! -d "$DIRECTORY" ]; then
    mkdir $BACKUP_DIR
fi

TIMESTAMP=$(date +"%d%m%Y-%H%M%S")

brew bundle dump --file="$BACKUP_DIR/Brewfile-$TIMESTAMP" --force