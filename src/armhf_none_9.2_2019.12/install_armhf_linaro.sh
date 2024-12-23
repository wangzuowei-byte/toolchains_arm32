#! /bin/bash

CURRENT_PATH=$(readlink -f "$(dirname "$0")")
TOOLCHAINS_ROOT=${CURRENT_PATH}/..
TOOLCHAINS_DOWNLOAD=${CURRENT_PATH}/../download

REMOTE_PATH=third_party
INSTALL_NAME=gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf
INSTALL_TAR=${INSTALL_NAME}.tar.xz
INSTALL_PATH=${TOOLCHAINS_ROOT}/armhf_linaro
INSTALL_FLODER=${INSTALL_PATH}/${INSTALL_NAME}

source ${TOOLCHAINS_ROOT}/scripts/install.inc
do_check
if [ ! $? == 0 ];then
    echo -e "\033[31m[ERROR] Call do_check. \033[0m"
    exit 1
fi

do_reinstall
if [ ! $? == 0 ];then
    echo -e "\033[31m[ERROR] Call do_reinstall. \033[0m"
    exit 1
fi

exit 0