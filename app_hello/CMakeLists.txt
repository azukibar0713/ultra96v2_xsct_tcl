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

cmake_minimum_required(VERSION 3.1)
project(hello_world C CXX)

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

message("-----end message after project-----")

# ------------------
# Target Build
# ------------------
set(TARGET_NAME hello)
set(EXECTABLE_NAME ${CMAKE_PROJECT_NAME}.elf)
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

target_link_libraries(${TARGET_NAME}
 ${LIBRARY_XIL}
 ${LIBRARY_FREERTOS}
)





