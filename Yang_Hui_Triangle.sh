#!/bin/bash
#Author: Vanson
#QQ: 297778672
#Time: 2018-06-28 22:16:47
#Name: Yang_Hui_Triangle.sh
#Version: V1.0.0
#Description: This is a script to print Yang Hui triangle.

function yang_hui_triangle()
{
    if (test -z $1); then
        read -p "Please input max Lines:" MAX  #<==Control the max lines you want to print.
    else
        MAX=$1
    fi

    i=1
    while [ $i -le $MAX ]
    do
        j=1
        while [ $j -le $i ]
        do
            f=$[i-1]
            g=$[j-1]
            if [ $j -eq $i ] || [ $j -eq 1 ]; then
                declare SUM_${i}_$j=1
            else
                declare A=$[SUM_${f}_$j] #<==get upper row j variable
                declare B=$[SUM_${f}_$g] #<==get upper row j-1 variable
                declare SUM_${i}_$j=`expr $A + $B`  #<==declare and calculate current variable
            fi
            echo -en $[SUM_${i}_$j]" "
            let j++
        done
        echo   #<==print a blank line
        let i++
    done
}

function main()
{
    yang_hui_triangle $*
}

main $*
