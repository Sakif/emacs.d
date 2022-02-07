#/bin/env bash

cwd=$PWD

for d in `find . -mindepth 1 -maxdepth 1 -type d`;
do
    cd "$d";
    tar cf "${PWD##*/}.cbt" *;
    mv -v "${PWD##*/}.cbt" ../;
    cd "$cwd";
done
