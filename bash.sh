#!/usr/bin/env bash
PS1="[\u@\h \W]\$ "

alias cls="clear"
alias zstd="zstdmt -v --rm --ultra -22"
alias make="make --max-load -j`nproc`"

cb () {
    tar cf "${PWD##*/}.cbt" * &&
    mv -v "${PWD##*/}.cbt" ../
}

tzst () {
    tar cf "${PWD##*/}.tar" * &&
    zstdmt -v --rm --ultra -22 "${PWD##*/}.tar" &&
    mv -v "${PWD##*/}.tar.zst" ../
}

img_to_webp () {
    fd -e bmp -e heif -e heic -e png -e jpg -x convert -quality $1 {} {.}.webp
}

xml_c () {
    fd -e xml -x xmlformat --overwrite --selfclose --compress
}

xml_f () {
    fd -e xml -x xmlformat --overwrite --selfclose
}

steam="/home/z/.local/share/Steam/steamapps/common/"
