#!/bin/bash
#Author: Vanson
#QQ: 297778672
#Time: 2018-07-04 18:24:35
#Name: add_color.sh
#Version: V1.0.0
#Description: This is a script to add color.

function AddColor()
{
    RED_COLOR='\E[1;31m'
    GREEN_COLOR='\E[1;32m'
    YELLOW_COLOR='\E[1;33m'
    BLUE_COLOR='\E[1;34m'
    PINK_COLOR='\E[1;35m'
    RES='\E[0m'

    if [ $# -ne 2 ]; then
        echo "Usage: $0 content {red|yellow|blue|green}"
        exit 1
    fi

    case "$2" in
        red|RED)
            echo -e "${RED_COLOR}$1${RES}"
            ;;
        yellow|YELLOW)
            echo -e "${YELLOW_COLOR}$1${RES}"
            ;;
        green|GREEN)
            echo -e "${GREEN_COLOR}$1${RES}"
            ;;
        blue|BLUE)
            echo -e "${BLUE_COLOR}$1${RES}"
            ;;
        pink|PINK)
            echo -e "${PINK_COLOR}$1${RES}"
            ;;
        *)
            echo "Usage: $0 content {red|yellow|blue|green}"
            exit
        esac
}

function main()
{
    AddColor $1 $2
}

main $*
