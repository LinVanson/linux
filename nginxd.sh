#!/bin/bash
#Author: Vanson
#QQ: 297778672
#Time: 2018-07-04 20:52:56
#Name: nginxd.sh
#Version: V1.0.0
#Description: This is a script to manage nginx. judge by nginx PID file.

PATH=/application/nginx/sbin
PID=/application/nginx/logs/nginx.pid
RETVAL=0
source /etc/init.d/functions

function start()
{
    if [ ! -f $PID ]; then
        $PATH/nginx #<==start
        RETVAL=$?
        if [ $RETVAL -eq 0 ]; then
            action "nginx is started" /bin/true
            return $RETVAL
        else
            action "nginx is started" /bin/false
            return $RETVAL
        fi
    else
        echo "nginx is running"
        return 0
    fi
}

function stop()
{
    if [ -f $PID ]; then
        $PATH/nginx -s stop #<==stop
        RETVAL=$?
        if [ $RETVAL -eq 0 ]; then
            action "nginx is stopped" /bin/true
            return $RETVAL
        else
            action "nginx is stopped" /bin/false
            return $RETVAL
        fi
    else
        echo "nginx in no running"
        return $RETVAL
    fi
}

case "$1" in 
    start)
        start
        RETVAL=$?
        ;;
    stop)
        stop
        RETVAL=$?
        ;;
    restart)
        stop
        sleep 1
        start 
        RETVAL=$?
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
esac

exit $RETVAL

