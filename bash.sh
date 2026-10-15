#!/usr/bin/env bash

PS1="[\u@\h \W]\$ "
alias cls="clear"
steam="/home/z/.local/share/Steam/steamapps/common/"

youtube () {
    mpv https://youtu.be/d9uqOFiKcjQ https://youtu.be/rW8Lyyxz0SM https://youtu.be/TgAokVflzuI
}

morning_adhkar () {
    mpv --ytdl-format="ba" "https://youtu.be/P8EIBksC0MA"
}

evening_adhkar () {
    mpv --ytdl-format="ba" "https://youtu.be/fQUbhEHetks"
}

o_message () {
    mpv "https://youtube.com/playlist?list=PLlXVKBG9es9UamBMS7aubQSGe8u9RYGOk"
}

cb () {
    tar cf "${PWD}.cbt" *
}

folder_cbt () {
    for d in *
    do
        [ -d "${d}" ] || continue
        cd "${d}"
        tar cf "${PWD}.cbt" *
        cd -
    done
}

tzst () {
    tar cf "${PWD}.tar" *
    zstdmt -v --rm --ultra -22 "${PWD}.tar"
}

jxl_cb () {
    tar cf "${PWD}.cbt" *
    fd -e webp -e jpg -e jpeg -e png -e bmp -x magick {} {.}.jxl
    fd -e webp -e jpg -e jpeg -e png -e bmp -x rm
    zip -9rq "${PWD}.cbz" *
}

jxl_cb_huge () {
    tar cf "${PWD}.cbt" *
    for i in *.jpg *.png
    do
        [ -f "${i}" ] || continue
        magick "${i}" "${i%.*}.jxl" # -resize 4000x4000\>
        rm "${i}"
    done
    zip -9rq "${PWD}.cbz" *
}

shallow_fetch_all () {
    for i in */.git
    do
        cd $i/..
        git stash
        git stash drop
        git fetch --depth=1 --prune
        git pull --depth=1 --prune --rebase
        cd -
    done
}

split_files () {
    local folder_size=200
    local i=0
    for file in *
    do
        [ -f "${file}" ] || continue
        local folder=$(( i / folder_size ))
        local subfolder=$( printf "f%03d" $folder )
        mkdir -p "${subfolder}"
        mv "${file}" "${subfolder}/"
        ((i++))
    done
}
