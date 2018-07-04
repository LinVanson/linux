#!/bin/bash
#Author: Vanson
#QQ: 297778672
#Time: 2018-07-04 20:28:14
#Name: add-openvpn-user.sh
#Version: V1.0.0
#Description: This is a script to add user.

#source function library
source /etc/init.d/functions

#config file path
FILE_PATH=/etc/openvpn_authfile.conf  #<==openvpn的登录授权文件

[ ! -f $FILE_PATH ] && touch $FILE_PATH

function usage()
{
    cat <<EOF
    USAGE:`basename $0` {-add|-del|-search} username
EOF
}

#judge run user
if [ $UID -ne 0 ]; then
    echo "You are not allow to run this script,only for root."
    exit 1
fi

#judge arg numbers
if [ $# -ne 2 ]; then
    usage 
    exit 2
fi

case "$1" in
    -a|-add)
        shift  #<==过滤第一个参数
        if grep "^$1$" ${FILE_PATH} >/dev/null 2>&1
        then
            action "vpnuser $1 is exist." /bin/false
            exit
        else
            chattr -i ${FILE_PATH}
            /bin/cp ${FILE_PATH} ${FILE_PATH}.$(date +%F%T)
            echo "$1" >>${FILE_PATH}
            [ $? -eq 0 ] && action "Add $1" /bin/true
            chattr +i ${FILE_PATH}
        fi
        ;;
    -d|-del)
        shift
        if [ `grep "\b$1\b" ${FILE_PATH}|wc -l` -lt 1 ]; then
            action "vpnuser $1 is not exist." /bin/false
            exit
        else
            chattr -i ${FILE_PATH}
            /bin/cp ${FILE_PATH} ${FILE_PATH}.$(date +%F%T)
            sed -i "/^${1}$/d" ${FILE_PATH}
            chattr +i ${FILE_PATH}
            exit
        fi
        ;;
    -s|-search)
        shift
        if [ `grep -w "$1" ${FILE_PATH}|wc -l` -lt 1 ]; then
            echo "vpnuser $1 is not exist."
            exit
        else
            echo "vpnuser $1 is exist."
            exit
        fi
        ;;
    *)
        usage 
        exit
        ;;
esac


