#!/bin/bash
#Author: Vanson
#QQ: 297778672
#Time: 2018-06-29 22:07:32
#Name: check_memcached.sh
#Version: V1.0.0
#Description: This is a script to chech memcached status.

function check_memcached()
{
    printf "del key\r\n"|nc 127.0.0.1 11211 &>/dev/null  #<==connect memcached and delete key.
    printf "set key 0 0 10 \r\nvanson\r\n"|nc 127.0.0.1 11211 &>/dev/null   #<==insert key=Vanson
    McValues=`printf "get key\r\n"|nc 127.0.0.1 11211|grep Vanson|wc -l`
    if [ $McValues -eq 1 ]; then
        echo "memcached status is ok!"
    else
        echo "memcached status is bad!"
    fi
}

function main()
{
    check_memcached $#
}

main $*
