#!/usr/bin/env bash
PS1="[\u@\h \W]\$ "

alias cls="clear"
steam="/home/z/.local/share/Steam/steamapps/common/"

youtube () {
    mpv
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
        if [[ -d "$d" ]]
        then
            cd "$d"
            tar cf "${PWD}.cbt" *
            cd -
        else
            continue
        fi
    done
}

tzst () {
    tar cf "${PWD}.tar" *
    zstdmt -v --rm --ultra -22 "${PWD}.tar"
}

jxl_cb () {
    tar cf "${PWD}.cbt" *
    fd -e jpg -e jpeg -e png -e bmp -x magick {} {.}.jxl
    fd -e jpg -e jpeg -e png -e bmp -x rm
    zip -9rq "${PWD}.cbz" *
}

jxl_cb_huge () {
    tar cf "${PWD}.cbt" *
    for i in *.jpg *.png
    do
        magick $i -resize 3840x3840\> "${i%.*}.jxl"
        rm $i
    done
    zip -9rq "${PWD}.cbz" *
}

shallow_fetch_all () {
    for i in */.git
    do
        cd $i/..
        git stash
        git stash drop
        git fetch --depth=1 --prune --rebase
        git pull --depth=1 --prune --rebase
        cd -
    done
}

split_files() {
    local dir_size=500
    local dir_name="f"
    n=$((`find . -maxdepth 1 -type f | wc -l` / $dir_size+1))
    for i in `seq 1 $n`
    do
        mkdir -p "$dir_name$i"
        find . -maxdepth 1 -type f | head -n $dir_size | xargs -i mv "{}" "$dir_name$i"
    done
}
