#!/bin/bash
#Author: Vanson
#QQ: 297778672
#Time: 2018-07-04 18:06:38
#Name: rsyncd.sh
#Version: V1.0.0
#Description: This is a script to manage rsync.

#source system script
source /etc/init.d/functions

function usage()
{
    echo "Usage:$0 {start|stop|restart}"
    exit 1
}

function start()
{
    rsync --daemon
    sleep 1
    if [ `netstat -lntup|grep rsync|wc -l` -ge 1 ]; then
        action "rysncd is started." /bin/true
    else
        action "rysncd is stopped." /bin/false
    fi
}

fucntion stop()
{
    killall rsync &>/dev/null
    sleep 2
    if [ `netstat -lntup|grep rsync|wc -l` -eq 0 ]; then
        action "rysncd is stopped." /bin/true
    else
        action "rysncd is started." /bin/false
    fi
}

function main()
{
    if [ $# -ne 1 ]; then
        usage
    fi

    if [ "$1" = "start" ]; then
        start
    elif [ "$1" = "stop" ]; then
        stop
    elif [ "$1" = "restart" ]; then
        stop
        sleep 1
        start
    else
        usage 
    fi
}

main $*
