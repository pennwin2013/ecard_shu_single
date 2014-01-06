#!/bin/bash

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.

if [ -f $HOME/ykt/bin/ecard-function ];then
   source $HOME/ykt/bin/ecard-function
fi

PROC="icegridregistry"
check_proc_running $PROC

if [ $? -eq 0 ]; then
    echo "$PROC already start"
else
    echo "start $PROC waiting..."
    DBDIR='./db/master'
    if ! ls $DBDIR > /dev/null 2>&1 ; then
        mkdir -p $DBDIR
    fi
    ./icegridregistry --nochdir --daemon --Ice.Config=config.ecard.master
fi
