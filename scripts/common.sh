#! /bin/bash

function log_e()
{
    echo -e "\033[31m[ERROR] $1 \033[0m"
}

function log_s()
{
    echo -e "\033[32m[SUCCESS] $1 \033[0m"
}

function tips()
{
    echo -e "\033[33m[tips] $1 \033[0m"
}

function log_check_return()
{
    local RETURN=$?
    local MESSAGE=$1

    if [[ ! ${RETURN} == 0 ]]; then
        log_e "${MESSAGE}, return ${RETURN}"
        exit 1
    else
        log_s "${MESSAGE}"
        return 0
    fi
}

function log_check_make_return()
{
    local RETURN=$?
    local MESSAGE=$1

    if [[ ${RETURN} == 0 ]]; then
        log_s "${MESSAGE}"
        return 0
    elif [[ ${RETURN} == 2 ]]; then
        log_s "${MESSAGE}"
        return 0
    else
        log_e "${MESSAGE}, return ${RETURN}"
        exit 1
    fi
}


function Decompression_tar_xz()
{

    local Decompression_path=$1
    local Decompression_name=$2

    tips "tar ${Decompression_name}"
    tar -xvf ${Decompression_name} --strip-components 1 -C ${Decompression_path}
    log_check_return "tar ${Decompression_name} -> ${Decompression_path}"

    return 0
}

