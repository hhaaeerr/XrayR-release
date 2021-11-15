#!/bin/bash

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'

echo "\
###########################################################
XRAYR后端偷懒脚本
############################################################
"
    wget --no-cache -N -P /etc/XrayR https://raw.githubusercontent.com/hhaaeerr/XrayR-release/master/config.yml >/dev/null 2>&1
        echo "节点ID" &&
            read -ep "请输入当前节点的面板ID: " nodeid &&
            read -ep "请确认节点类型(1代表V2ray 2代表Shadowsocks 默认回车为V2ray） " nodetype
            
   if [[ ${nodetype} == 1 ]]; then
        nodetype="V2ray"
    fi
    
   if [[ ${nodetype} == 2 ]]; then
        nodetype="Shadowsocks"
    else
        nodetype="V2ray"
    fi
            
    sed -i "s/nodeid/${nodeid}/" /etc/XrayR/config.yml
    sed -i "s/nodetype/${nodetype}/" /etc/XrayR/config.yml

    echo -e "${green}XrayR${plain} 配置成功，后端启动中"

    xrayr start
    
