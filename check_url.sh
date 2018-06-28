#!/bin/bash
#Author: Vanson
#QQ: 297778672
#Time: 2018-06-28 23:34:55
#Name: check_url.sh
#Version: V1.0.0
#Description: This is a script to check url status.

function usage()
{
    echo "Usage: $0 url"
    exit 1
}

function check_url()
{
    wget --spider -q -o /dev/null --tries=1 -T 5 $1
    if [ $? -eq 0 ]; then
        echo "$1 is ok."
        exit 0
    else
        echo "$1 is wrong."
        exit 1
    fi
}

function main()
{
    if [ $# -ne 1 ]; then
        usage
    fi
    check_url $1
}

main $*
