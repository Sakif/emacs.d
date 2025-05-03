#!/usr/bin/env bash
# PS1="[\u@\h \W]\$ "

alias cls="clear"
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

xmlf () {
    fd -e xml -x xmlformat --selfclose --overwrite {}
}

jxl_cb () {
    tar cf "${PWD##*/}.cbt" *
    mv -v "${PWD##*/}.cbt" ../
    fd -e jpg -e jpeg -e png -e bmp -x magick {} {.}.jxl
    fd -e jpg -e jpeg -e png -e bmp -x rm
    zip -9rq "${PWD##*/}.cbz" *
    mv -v "${PWD##*/}.cbz" ../
}
