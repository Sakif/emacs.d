cmake_minimum_required(VERSION 4.3 FATAL_ERROR)

# set(CMAKE_C_COMPILER "/usr/bin/clang")
# set(CMAKE_CXX_COMPILER "/usr/bin/clang++")
# set(CMAKE_CXX_COMPILER "/usr/bin/x86_64-w64-mingw32-g++")
# set(CMAKE_C_COMPILER "/usr/bin/x86_64-w64-mingw32-gcc")
set(CMAKE_BUILD_TYPE MinSizeRel)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_LINKER_TYPE MOLD)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_C_STANDARD 20)
set(CMAKE_CXX_EXTENSIONS ON)
set(CMAKE_C_EXTENSIONS ON)
set(INTERPROCEDURAL_OPTIMIZATION TRUE)

add_compile_options(-Wall -Wextra -Wpedantic -Werror
  -m64 -march=native -mtune=native -Os -g0)
add_link_options(-flto)

project(template
  VERSION 0.1
  DESCRIPTION "A cmake project template"
  LANGUAGES C)

find_package(SDL3 3.4 REQUIRED)
find_package(SDL3_image 3.4 REQUIRED)
find_package(SDL3_ttf 3.2 REQUIRED)
find_package(SDL3_sound 3.2 REQUIRED)
include_directories(${SDL3_INCLUDE_DIR} ${SDL3_image_INCLUDE_DIR} ${SDL3_ttf_INCLUDE_DIR} ${SDL3_sound_INCLUDE_DIR})

file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS
  # Automatically reconfigure if source files are added/removed.
  ${PROJECT_SOURCE_DIR}/src/*.c)

add_executable(${PROJECT_NAME} ${SRC_FILES})
target_link_libraries(${PROJECT_NAME} ${SDL3_LIBRARIES} ${SDL3_image_LIBRARIES} ${SDL3_ttf_LIBRARIES} ${SDL3_sound_LIBRARIES})
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD COMMAND ${CMAKE_STRIP} --strip-all $<TARGET_FILE:${PROJECT_NAME}>)
