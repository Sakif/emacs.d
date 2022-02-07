#!/usr/bin/env bash

fd -e png -e jpg -x convert -quality 85 {} {.}.webp
