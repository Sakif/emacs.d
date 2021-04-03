#/bin/env bash
youtube-dl --output "%(title)s.%(ext)s" --format "bestvideo[height<1444]+bestaudio/best"
# --playlist-start 1 --playlist-end 1 --output "%(playlist_index)s.%(ext)s"
