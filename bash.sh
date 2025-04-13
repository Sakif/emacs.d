#!/usr/bin/env bash
# PS1="[\u@\h \W]\$ "

alias cls="clear"
alias zstd="zstdmt -v --rm --ultra -22"
alias make="make --max-load -j`nproc`"
alias evening_adhkar="mpv --no-video https://youtu.be/fQUbhEHetks"
alias morning_adhkar="mpv --no-video https://youtu.be/P8EIBksC0MA"
steam="/home/z/.local/share/Steam/steamapps/common/"

cb () {
    tar cf "${PWD##*/}.cbt" *
    mv -v "${PWD##*/}.cbt" ../
}

folder_cbt () {
    cwd=$PWD
    for d in `fd -t d --exact-depth 1`;
    do
        cd "$d"
        tar cf "${PWD##*/}.cbt" *
        mv -v "${PWD##*/}.cbt" $cwd
        cd "$cwd"
    done
}

tzst () {
    tar cf "${PWD##*/}.tar" *
    zstdmt -v --rm --ultra -22 "${PWD##*/}.tar"
    mv -v "${PWD##*/}.tar.zst" ../
}

img_to_webp () {
    fd -e jpg -e jpeg -e png -e bmp -e heif -e heic -x magick -quality 85 {} {.}.webp
}

img_to_jxl () {
    fd -e jpg -e jpeg -e png -e bmp -e heif -e heic -x magick {} {.}.jxl
}

xmlf () {
    fd -e xml -x xmlformat --selfclose --overwrite {}
}
