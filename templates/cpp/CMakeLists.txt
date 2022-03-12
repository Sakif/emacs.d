cmake_minimum_required(VERSION 3.20)
# -pthread
add_compile_options(-Wall -Wextra -pedantic -Werror -Ofast -flto -m64 -march=native -mtune=native -fstrict-aliasing)
add_link_options(-flto)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_EXTENSIONS ON)
set(CMAKE_C_EXTENSIONS ON)

project("template" VERSION 1.0)

add_executable(${PROJECT_NAME} main.cpp)
