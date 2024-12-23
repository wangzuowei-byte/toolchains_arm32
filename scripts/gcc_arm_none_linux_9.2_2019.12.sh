#! /bin/bash

TOOLCHAINS_TAR=gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf.tar.xz
TOOLCHAINS_INSATLL_DIR=gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf
TOOLCHAINS_BASH_PATH=armhf_none_9.2_2019.12

TOOLCHAINS_STM_SRC_NAME=stm32wrapper4dbg-master
TOOLCHAINS_BIN_NAME=stm32wrapper4dbg

function link_stm_tools()
{
    local link_name=$1
    local tools_path=$2
    local link_path=$3

    cd ${link_path}/bin
    log_check_return "cd link path: ${link_path}/bin"

    rm -rf ./${link_name}

    ln -sPf ../../${tools_path}/${link_name} ./${link_name}
    log_check_return "create link ${tools_path}/${link_name} -> ${link_name}"

    return 0
}

function install_stm_tools()
{
    local install_path=$1
    local tools_name=$2


    cd ${install_path}/
    log_check_return "cd dir ${install_path}"

    unzip ./${tools_name}.zip
    log_check_return "unzip ./${tools_name}.zip"

    cd ${install_path}/${tools_name}
    log_check_return "cd ${tools_name}"

    make
    log_check_return "make stm tools"

    return 0
}

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

    cp ${workspace_path}/pack_tar/${TOOLCHAINS_STM_SRC_NAME}.zip ${install_path}/${TOOLCHAINS_BASH_PATH}/
    log_check_return "cp ${workspace_path}/pack_tar/${TOOLCHAINS_STM_SRC_NAME}.zip -> install_path/"

    install_stm_tools ${install_path}/${TOOLCHAINS_BASH_PATH} ${TOOLCHAINS_STM_SRC_NAME}

    link_stm_tools ${TOOLCHAINS_BIN_NAME} ${TOOLCHAINS_STM_SRC_NAME} ${install_path}/${TOOLCHAINS_BASH_PATH}/${TOOLCHAINS_INSATLL_DIR}


    return 0
}




