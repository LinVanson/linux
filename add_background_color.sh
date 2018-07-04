#!/bin/bash
#Author: Vanson
#QQ: 297778672
#Time: 2018-07-04 18:24:35
#Name: add_color.sh
#Version: V1.0.0
#Description: This is a script to add color.

function AddColor()
{
    BLACK_COLOR='\033[40;37m'
    RED_COLOR='\033[41;37m'
    GREEN_COLOR='\033[42;37m'
    BROWN_COLOR='\033[43;37m'
    BLUE_COLOR='\033[44;37m'
    PINK_COLOR='\033[45;37m'
    BLUEGREEN_COLOR='\033[46;37m'
    WHITE_COLOR='\033[47;30m'
    RES='\033[0m'

    if [ $# -ne 2 ]; then
        echo "Usage: $0 content {black|red|green|brown|blue|pink|bluegreen|white}"
        exit 1
    fi

    case "$2" in
        black|BLACK)
            echo -e "${BLACK_COLOR}$1${RES}"
            ;;
        red|RED)
            echo -e "${RED_COLOR}$1${RES}"
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
        brown|BROWN)
            echo -e "${BROWN_COLOR}$1${RES}"
            ;;
        bluegreen|BLUEGREEN)
            echo -e "${BLUEGREEN_COLOR}$1${RES}"
            ;;
        white|WHITE)
            echo -e "${WHITE_COLOR}$1${RES}"
            ;;
        *)
            echo "Usage: $0 content {black|red|green|brown|blue|pink|bluegreen|white}"
            exit
        esac
}

function main()
{
    AddColor $1 $2
}


main $*
