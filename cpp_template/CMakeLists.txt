cmake_minimum_required(VERSION 3.30 FATAL_ERROR)

# set(CMAKE_C_COMPILER "/usr/bin/clang")
# set(CMAKE_CXX_COMPILER "/usr/bin/clang++")
# set(CMAKE_CXX_COMPILER "/usr/bin/x86_64-w64-mingw32-g++")
# set(CMAKE_C_COMPILER "/usr/bin/x86_64-w64-mingw32-gcc")

add_compile_options(-Wall -Wextra -Wpedantic -Werror
  -m64 -march=native -mtune=native -Os -g0)
add_link_options(-flto -fuse-ld=mold)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_C_STANDARD 17)
set(CMAKE_CXX_EXTENSIONS ON)
set(CMAKE_C_EXTENSIONS ON)

project(c_temp VERSION 0.1 LANGUAGES C)

find_package(SDL3 3.2 REQUIRED)
find_package(SDL3_image REQUIRED)
find_package(SDL3_ttf REQUIRED)
include_directories(${SDL3_INCLUDE_DIR} ${SDL3_image_INCLUDE_DIR} ${SDL3_ttf_INCLUDE_DIR})

file(GLOB_RECURSE SRC CONFIGURE_DEPENDS
  # Automatically reconfigure if source files are added/removed.
  ${PROJECT_SOURCE_DIR}/src/*.c)

add_executable(${PROJECT_NAME} ${SRC})
target_link_libraries(${PROJECT_NAME} ${SDL3_LIBRARIES} ${SDL3_image_LIBRARIES} ${SDL3_ttf_LIBRARIES})
