#! /bin/bash

TOOLCHAINS_TAR=gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf.tar.xz
TOOLCHAINS_INSATLL_DIR=gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf
TOOLCHAINS_BASH_PATH=armhf_linaro_4.9.4_2017.01


function install_armcc()
{
    local workspace_path=$1
    local install_path=$2

    if [ -d ${install_path}/${TOOLCHAINS_BASH_PATH} ]; then
        rm -rf ${install_path}/${TOOLCHAINS_BASH_PATH}
        log_check_return "rm -rf ${install_path}/${TOOLCHAINS_BASH_PATH}"
    fi

    mkdir -p ${install_path}/${TOOLCHAINS_BASH_PATH}/${TOOLCHAINS_INSATLL_DIR}
    log_check_return "mkdir ${install_path}/${TOOLCHAINS_BASH_PATH}/${TOOLCHAINS_INSATLL_DIR}"

    cp -a ${workspace_path}/src/${TOOLCHAINS_BASH_PATH} ${install_path}/
    log_check_return "cp ${workspace_path}/src/${TOOLCHAINS_BASH_PATH} -> install_path/"

    cp -a ${workspace_path}/src/scripts ${install_path}/
    log_check_return "cp ${workspace_path}/src/scripts -> install_path/"


    Decompression_tar_xz    ${install_path}/${TOOLCHAINS_BASH_PATH}/${TOOLCHAINS_INSATLL_DIR} \
                            ${workspace_path}/pack_tar/${TOOLCHAINS_TAR}



    return 0
}

