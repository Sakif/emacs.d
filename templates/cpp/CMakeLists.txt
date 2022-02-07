cmake_minimum_required(VERSION 3.20)
# -pthread
add_compile_options(-Wall -Wextra -pedantic -Werror -Ofast -flto -m64 -march=native -mtune=native -fstrict-aliasing)
add_link_options(-flto)

project("Template" VERSION 1.0)

add_executable(program main.cpp)
