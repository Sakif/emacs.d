#/bin/env bash

cwd=$PWD

for d in `fd -t d --exact-depth 1`;
do
    cd "$d";
    tar cf "${PWD##*/}.cbt" *;
    mv -v "${PWD##*/}.cbt" ../;
    cd "$cwd";
done
