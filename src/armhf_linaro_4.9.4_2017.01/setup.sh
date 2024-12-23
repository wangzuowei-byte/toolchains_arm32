#! /bin/sh

TOOLCHAINS_PATH=${TOOLCHAIN_PATH}/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf
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
export CC="arm-linux-gnueabihf-gcc"
export CXX="arm-linux-gnueabihf-g++"
export AS="arm-linux-gnueabihf-as"
export LD="arm-linux-gnueabihf-ld"
export SYSROOT=${TOOLCHAINS_PATH}/arm-linux-gnueabihf/libc

export REMOTE_DEBUG=${TOOLCHAINS_PATH}/bin/arm-linux-gnueabihf-gdb


