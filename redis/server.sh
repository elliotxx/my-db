#!/bin/bash
script_file="server.sh"
server_name="redis-server"

start_cmd="nohup redis-server redis.conf > /dev/null 2>&1 &"
stop_cmd="ps -ef | grep $server_name | grep -v grep | cut -c 10-15 | xargs kill -9"
status_cmd="ps -ef | grep $server_name | grep -v grep | grep -v $script_file"
log_cmd="tail -f $server_name.log"

if [ ! -n "$1" ]
then
    echo "Usages: sh $script_file [start|stop|restart|status|log]"
    exit 0
fi

if [ $1 = start ]
then
    psid=`ps aux | grep $server_name | grep -v "grep" | wc -l`
    if [ $psid -gt 0 ]
    then
        echo "$server_name is running!"
        exit 0
    else
        eval $start_cmd
        echo "Start $server_name service [OK]"
    fi
    

elif [ $1 = stop ];then
    eval $stop_cmd
    echo "Stop $server_name service [OK]"

elif [ $1 = restart ];then
    eval $stop_cmd
    echo "Stop $server_name service [OK]"
    sleep 2
    eval $start_cmd
    echo "Start $server_name service [OK]"

elif [ $1 = status  ];then
    eval $status_cmd

elif [ $1 = log  ];then
    eval $log_cmd
        
else
    echo "Usages: sh $script_file [start|stop|restart|status|log]"
fi
