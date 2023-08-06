#!/usr/bin/env bash

dir="$PWD/build/"
if [ ! -d "$dir" ];then
   cmake -GNinja -S $PWD -B $dir -DCMAKE_EXPORT_COMPILE_COMMANDS=1
fi

cmake --build $dir
