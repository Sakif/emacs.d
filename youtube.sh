#/bin/env bash
youtube-dl --format "bestvideo[height<1444]+bestaudio/best" --output "%(title)s.%(ext)s" --geo-bypass
# --playlist-start 1 --playlist-end 1 --output "%(playlist_index)s.%(ext)s"
