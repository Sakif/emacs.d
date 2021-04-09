#/bin/env bash

cwd=$PWD

for d in $(ls -d */);do
    cd "$d";
    tar cf "${PWD##*/}.cbt" *;
    mv -v "${PWD##*/}.cbt" ../;
    cd "$cwd";
done
