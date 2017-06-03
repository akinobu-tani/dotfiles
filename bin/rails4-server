#!/bin/bash
set -e

export RAILS_SERVE_STATIC_FILES=true

PIDFILE=tmp/pids/server.pid
case "$1" in
    start)
        if [ -f $PIDFILE ]
        then
            echo "$PIDFILE exists, process is already running or crashed"
        else
            bundle exec rails server --bind 0.0.0.0 --daemon
        fi
        ;;
    stop)
        if [ ! -f $PIDFILE ]
        then
            echo "$PIDFILE does not exist, process is not running"
        else
            PID=$(cat $PIDFILE)
            echo "Stopping ..."
            kill $PID
            while [ -x /proc/${PID} ]
            do
                echo "Waiting for Rails to shutdown ..."
                sleep 1
            done
            echo "Rails stopped"
        fi
        ;;
    status)
        PID=$(cat $PIDFILE)
        if [ ! -x /proc/${PID} ]
        then
            echo 'Rails is not running'
        else
            echo "Rails is running ($PID)"
        fi
        ;;
    restart)
        $0 stop
        $0 start
        ;;
    *)
        echo "Please use start, stop, restart or status as first argument"
        ;;
esac
