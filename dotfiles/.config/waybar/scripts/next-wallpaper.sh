#!/bin/bash
# Get next wallpaper from directory
DIR="$HOME/Pictures/Wallpapers"
NEXT=$(ls "$DIR" | shuf -n1)
swww img "$DIR/$NEXT"

