#!/usr/bin/env bash
PS1="[\u@\h \W]\$ "

alias cls="clear"
alias zstd="zstdmt -v --rm --ultra -22"
alias ed="clear;emacs -nw"
alias xmlf="xmlformat --overwrite --selfclose"
alias make="make --max-load -j`nproc`"

if [ -f /usr/bin/fdfind ]; then
    xml_c () {
        fdfind -e xml -x xmlformat --overwrite --selfclose --compress
    }
elif [ -f /usr/bin/fd ]; then
    xml_c () {
        fd -e xml -x xmlformat --overwrite --selfclose --compress
    }
fi

if [ -f /usr/bin/clang ]; then
# if clang exists set clang as default c compiler
    export CC=/usr/bin/clang
fi

if [ -f /usr/bin/clang++ ]; then
# if clang++ exists set clang as default cpp compiler
    export CXX=/usr/bin/clang++
fi

cb () {
    tar cf "${PWD##*/}.cbt" * &&
    mv -v "${PWD##*/}.cbt" ../;
}

tzst () {
    tar cf "${PWD##*/}.tar" * &&
    zstdmt -v --rm --ultra -22 "${PWD##*/}.tar" &&
    mv -v "${PWD##*/}.tar.zst" ../;
}
