#!/bin/bash

# Set the directory for screenshots
PICTURES_DIR=$(xdg-user-dir PICTURES)
MONTH_DIR=$(date +%Y-%m)
TARGET_DIR="$PICTURES_DIR/Screenshots/$MONTH_DIR"

# Create the directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Function to generate the filename
generate_filename() {
  local app_name=$1
  echo "$(date +%Y-%m-%d-%H_%M_%S)-$app_name.png"
}

# Function to take a screenshot of the entire screen
full_screenshot() {
  local filename
  filename=$(generate_filename "fullscreen")
  grim "$TARGET_DIR/$filename"
  wl-copy < "$TARGET_DIR/$filename"
}

# Function to take a screenshot of a selected area
selection_screenshot() {
  local filename
  filename=$(generate_filename "selection")
  grim -g "$(slurp)" "$TARGET_DIR/$filename"
  wl-copy < "$TARGET_DIR/$filename"
}

# Function to take a screenshot of the focused window
window_screenshot() {
  local filename
  local focused_rect
  local app_name

  app_name=$(hyprctl activewindow | grep "class:" | awk '{print $2}' | sed 's/[^a-zA-Z0-9]/_/g')
  filename=$(generate_filename "$app_name")

  # Extract the focused window's geometry
  local at_coords size_coords
  at_coords=$(hyprctl activewindow | grep "at:" | awk '{print $2}')
  size_coords=$(hyprctl activewindow | grep "size:" | awk '{print $2}')

  local at_x at_y size_w size_h
  IFS=',' read -r at_x at_y <<< "$at_coords"
  IFS=',' read -r size_w size_h <<< "$size_coords"

  # Debugging information
  echo "Window Geometry: at_x=$at_x, at_y=$at_y, size_w=$size_w, size_h=$size_h"

  # Check if geometry is extracted correctly
  if [[ -z "$at_x" || -z "$at_y" || -z "$size_w" || -z "$size_h" ]]; then
    echo "Failed to determine focused window geometry."
    exit 1
  fi

  focused_rect="${at_x},${at_y} ${size_w}x${size_h}"
  echo "Focused Rect: $focused_rect" # Debugging information

  grim -g "$focused_rect" "$TARGET_DIR/$filename"
  wl-copy < "$TARGET_DIR/$filename"
}

# Parse arguments
while getopts ":FSW" opt; do
  case $opt in
    F)
      full_screenshot
      ;;
    S)
      selection_screenshot
      ;;
    W)
      window_screenshot
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done
