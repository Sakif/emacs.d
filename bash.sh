#/bin/env bash
PS1="\W\$ "

alias cls="clear"
alias zstd="zstdmt -v --rm --ultra -22"
alias ed="emacs -nw"
alias xmlf="xmlformat --overwrite"
alias xmlc="xmlformat --overwrite --compress"
alias t-start="sudo service transmission-daemon start"
alias t-stop="sudo service transmission-daemon stop"
alias make="make --max-load -j 3"
alias lsd="ls -d */"

export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

cb () {
    tar cf "${PWD##*/}.cbt" * &&
    mv -v "${PWD##*/}.cbt" ../;
}

tzst () {
    tar cf "${PWD##*/}.tar" * &&
    zstdmt -v --rm --ultra -22 "${PWD##*/}.tar" &&
    mv -v "${PWD##*/}.tar.zst" ../;
}
