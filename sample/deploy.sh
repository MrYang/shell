#!/usr/bin/env bash

gitPath="/data/git/repo"
appHome="/data/app"
appName="push-server"
pidfile="${appHome}/${appName}/logs/app.pid"

function update() {
    cd ${gitPath}
    git checkout dev
    git pull
}

function check_pid() {
    if [ -f ${pidfile} ];then
        pid=`cat ${pidfile}`
        if [ -n ${pid} ]; then
            running=`ps -p ${pid}|grep -v "PID TTY" |wc -l`
            return ${running}
        fi
    fi
    return 0
}

function start() {
    check_pid
    running=$?
    if [ ${running} -gt 0 ];then
        echo -n "${appName} now is running already, pid="
        cat ${pidfile}
        return 1
    fi

    cd ${appHome}
    java -jar -Dserver.port=80 ${appName}.jar > /dev/null 2>&1 &
    echo $! > ${pidfile}
}

function stop() {
    check_pid
    running=$?
    if [ ${running} -gt 0 ];then
        pid=`cat ${pidfile}`
        kill ${pid}
    fi
}

function restart() {
    stop
    sleep 1
    start
}

function status() {
    check_pid
    running=$?
    if [ ${running} -gt 0 ];then
        echo started
    else
        echo stoped
    fi
}

function package(){
    update
    cd ${gitPath}/${appName}
    gradle clean distTar -x test
}

function help() {
    echo "$0 start|stop|restart|status|package"
}

if [ "$1" == "" ]; then
    help
elif [ "$1" == "stop" ];then
    stop
elif [ "$1" == "start" ];then
    start
elif [ "$1" == "restart" ];then
    restart
elif [ "$1" == "status" ];then
    status
elif [ "$1" == "package" ];then
    package
else
    help
fi
