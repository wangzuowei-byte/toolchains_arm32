#! /bin/bash


function install_aptget()
{
    apt-get update

    apt-get install -y openssh-server


    apt-get install -y lsb-core lib32stdc++6

    # make TF-A install env
    apt-get install -y device-tree-compiler
    # make uboot install env
    apt-get install -y libncurses5-dev bison flex

    # make kernel install env
    apt-get install -y lzop
    apt-get install -y libssl-dev
    apt-get install -y u-boot-tools

    return 0
}