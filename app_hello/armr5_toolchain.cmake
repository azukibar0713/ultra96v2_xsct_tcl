# ------------------
# 以下のエラー対策.
# ARMコンパイラをWindows環境でテストするのエラーとなってしまうのでworkすることにする.
#  The C compiler
#    "F:/Xilinx/SDK/2019.1/gnu/armr5/nt/gcc-arm-none-eabi/bin/armr5-none-eabi-gcc.exe"
#  is not able to compile a simple test program.
# ------------------
SET (CMAKE_C_COMPILER_WORKS 1)
SET (CMAKE_CXX_COMPILER_WORKS 1)

set(CROSS_PREFIX "armr5-none-eabi-")
# ------------------
# preparation for XSDK path
# ------------------

if(WIN32)
    execute_process(COMMAND where ${CROSS_PREFIX}gcc OUTPUT_VARIABLE GCC_FILE_PATH)
else()
    execute_process(COMMAND which ${CROSS_PREFIX}gcc OUTPUT_VARIABLE GCC_FILE_PATH)
endif()

get_filename_component(GCC_ARM_NONE_EABI_BIN_DIR ${GCC_FILE_PATH} PATH)
get_filename_component(GCC_ARM_NONE_EABI_DIR     ${GCC_ARM_NONE_EABI_BIN_DIR} PATH)

message("GCC_ARM_NONE_EABI_BIN_DIR : " ${GCC_ARM_NONE_EABI_BIN_DIR})

# ------------------
# target
# ------------------
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

# ------------------
# toolchain
# ------------------
set(CMAKE_C_COMPILER   ${CROSS_PREFIX}gcc)
#set(CMAKE_C_COMPILER   armr5-none-eabi-gcc)
#set(CMAKE_CXX_COMPILER ${CROSS_PREFIX}g++)
#set(CMAKE_LINKER       ${CROSS_PREFIX}ld)
set(CMAKE_LINKER       ${CROSS_PREFIX}gcc) # SDKではgccになってる.
#set(CMAKE_AR           ${CROSS_PREFIX}ar)
#set(CMAKE_RANLIB       ${CROSS_PREFIX}ranlib)
#set(CMAKE_AS           ${CROSS_PREFIX}as)
#set(CMAKE_NM           ${CROSS_PREFIX}nm)
#set(CMAKE_OBJDUMP      ${CROSS_PREFIX}objdump)

