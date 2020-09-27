# 便利な環境変数
# https://gitlab.kitware.com/cmake/community/-/wikis/doc/cmake/Useful-Variables
# ------------------
# cmakeコマンド.
# > cmake -G "Unix Makefiles" -DCMAKE_TOOLCHAIN_FILE=./armr5_toolchain.cmake ..
# ------------------
message("CMAKE_CURRENT_SOURCE_DIR : " ${CMAKE_CURRENT_SOURCE_DIR})
message("CMAKE_SYSTEM_PROCESSOR   : " ${CMAKE_SYSTEM_PROCESSOR})
message("CMAKE_SYSROOT            : " ${CMAKE_SYSROOT})
message("-----end message when entry-----")

set(PROJECT_NAME project_name_app_hello)
cmake_minimum_required(VERSION 3.1)
project(${PROJECT_NAME} C CXX)

message("CMAKE_BINARY_DIR         : " ${CMAKE_BINARY_DIR})
message("CMAKE_CURRENT_SOURCE_DIR : " ${CMAKE_CURRENT_SOURCE_DIR})
message("CMAKE_SYSTEM_PROCESSOR   : " ${CMAKE_SYSTEM_PROCESSOR})
message("CMAKE_SYSTEM_NAME        : " ${CMAKE_SYSTEM_NAME})
message("CMAKE_SYSROOT            : " ${CMAKE_SYSROOT})
message("CMAKE_TOOLCHAIN_FILE     : " ${CMAKE_TOOLCHAIN_FILE})
message("CMAKE_C_COMPILER         : " ${CMAKE_C_COMPILER})
message("CMAKE_LINKER             : " ${CMAKE_LINKER})
message("CMAKE_C_OUTPUT_EXTENSION : " ${CMAKE_C_OUTPUT_EXTENSION})
message("CMAKE_ASM_OUTPUT_EXTENSION : " ${CMAKE_ASM_OUTPUT_EXTENSION})
message("CMAKE_C_LINK_EXECUTABLE  : " ${CMAKE_C_LINK_EXECUTABLE})
message("CMAKE_C_FLAGS            : " ${CMAKE_C_FLAGS})
message("CMAKE_EXE_LINKER_FLAGS   : " ${CMAKE_EXE_LINKER_FLAGS})
message("-----end message after project-----")

# ------------------
# My Env
# ------------------
set(PROJECT_PARENT_DIR ${CMAKE_BINARY_DIR}/../..)
message("PROJECT_PARENT_DIR : " ${PROJECT_PARENT_DIR})

# ------------------
# Target Build
# ------------------
set(TARGET_NAME hello)
add_executable(${TARGET_NAME}
 ./src/freertos_hello_world.c)
include_directories(../bsp/psu_cortexr5_0/include/)

# ------------------
# Library
# ------------------
find_library(LIBRARY_XIL
 NAMES xil
 HINTS ${CMAKE_CURRENT_SOURCE_DIR}/../bsp/psu_cortexr5_0/lib/
)
find_library(LIBRARY_FREERTOS
 NAMES freertos
 HINTS ${CMAKE_CURRENT_SOURCE_DIR}/../bsp/psu_cortexr5_0/lib/
)
message("LIBRARY_XIL : " ${LIBRARY_XIL})
message("LIBRARY_FREERTOS : " ${LIBRARY_FREERTOS})
link_directories(${TARGET_NAME} ${CMAKE_CURRENT_SOURCE_DIR}/../bsp/psu_cortexr5_0/lib/)

target_link_libraries(${TARGET_NAME}
 -Wl,--start-group
 ${LIBRARY_XIL}
 ${LIBRARY_FREERTOS}
 gcc
 c
 -Wl,--end-group
)

