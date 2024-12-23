#! /bin/bash

WORKSPACE_PATH=$(readlink -f "$(dirname "$0")")

TOOLCHAIN_PATH=${WORKSPACE_PATH}/toolchains

source ${WORKSPACE_PATH}/scripts/common.sh

function env_link_toolchains()
{
    local install_path=$1

    rm -rf /toolchains

    mkdir -p ${install_path}/

    ln -sf ${install_path} /toolchains

    return 0;
}

function install_bash_env()
{
    source ${WORKSPACE_PATH}/scripts/bash_env.sh
    log_check_return "source ./scripts/bash_env.sh"

    install_aptget

    return 0
}

function install_arm_none_9.2_2019.12()
{
    local workspace_path=$1
    local install_path=$2

    source ${WORKSPACE_PATH}/scripts/gcc_arm_none_linux_9.2_2019.12.sh
    log_check_return "source ./scripts/gcc_arm_none_linux_9.2_2019.12.sh"

    install_armcc ${workspace_path} ${install_path}

    log_s "install arm gcc none"

    return 0
}

function install_arm_none_10.3_2021.07()
{
    local workspace_path=$1
    local install_path=$2

    source ${WORKSPACE_PATH}/scripts/gcc_arm_none_linux_10.3_2021.07.sh
    log_check_return "source ./scripts/gcc_arm_none_linux_10.3_2021.07.sh"

    install_armcc ${workspace_path} ${install_path}

    log_s "install arm gcc none"

    return 0
}

function install_arm_linaro_4.9.4_2017.01()
{
    local workspace_path=$1
    local install_path=$2

    source ${WORKSPACE_PATH}/scripts/gcc_arm_linaro_linux_4.9.4_2017.01.sh
    log_check_return "source ./scripts/gcc_arm_linaro_linux_4.9.4_2017.01.sh"

    install_armcc ${workspace_path} ${install_path}

    log_s "install arm gcc linaro"

    return 0
}



function do_once_menu()
{

    env_link_toolchains ${TOOLCHAIN_PATH}

    echo -e "\033[34m"
    echo -e "----------------------------------------"
    echo -e "1. Install None armcc 9.2-2019.12"
    echo -e "2. Install None armcc 10.3-2021.07"
    echo -e "3. Install Linaro armcc 4.9.4-2017.01"
    echo -e "9. Install Bash Env"
    echo -e "0. Exit"
    echo -e "----------------------------------------"
    echo -e "\033[0m"

    read KEY_VAL

    case ${KEY_VAL} in
    1)  install_arm_none_9.2_2019.12        ${WORKSPACE_PATH}        ${TOOLCHAIN_PATH} ;;
    2)  install_arm_none_10.3_2021.07       ${WORKSPACE_PATH}        ${TOOLCHAIN_PATH} ;;
    3)  install_arm_linaro_4.9.4_2017.01    ${WORKSPACE_PATH}        ${TOOLCHAIN_PATH} ;;
    9)  install_bash_env;;
    0)  exit 0 ;;
    *)  echo -e "\033[31m[ERROR] Input key is error. \033[0m";;
    esac

    return 0
}


do_once_menu