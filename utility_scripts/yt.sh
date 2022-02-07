#!/usr/bin/env bash
# --playlist-start 1 --playlist-end 1 --output "%(playlist_index)s.%(ext)s"
youtube-dl --geo-bypass --restrict-filenames --format "bestvideo[height<1444]+bestaudio/best" --output "%(title)s.%(ext)s"
