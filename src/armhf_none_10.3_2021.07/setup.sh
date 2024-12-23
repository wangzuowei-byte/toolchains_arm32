#! /bin/sh

TOOLCHAINS_PATH=${TOOLCHAIN_PATH}/gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf
# current path
if [ -z "${TOOLCHAIN_PATH}" ];then
    echo -e "\033[31m[ERROR] TOOLCHAIN_PATH is NULL. \033[0m"
    exit 1
fi

if [ ! -d "${TOOLCHAINS_PATH}" ];then
    echo -e "\033[31m[ERROR] Is not installed. \033[0m"
    exit 1
fi

# complier
export PATH=${TOOLCHAINS_PATH}/bin:$PATH

export OS="linux"
export CC="arm-none-linux-gnueabihf-gcc"
export CXX="arm-none-linux-gnueabihf-g++"
export AS="arm-none-linux-gnueabihf-as"
export LD="arm-none-linux-gnueabihf-ld"
export SYSROOT=${TOOLCHAINS_PATH}/arm-none-linux-gnueabihf/libc

export REMOTE_DEBUG=${TOOLCHAINS_PATH}/bin/arm-none-linux-gnueabihf-gdb


