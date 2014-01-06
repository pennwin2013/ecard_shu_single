#!/bin/bash

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.

if [ -f $HOME/ykt/bin/ecard-function ];then
   source $HOME/ykt/bin/ecard-function
fi

PROC="glacier2router"
check_proc_running $PROC

if [ $? -eq 0 ]; then
    echo "$PROC already start"
else
    echo "start $PROC waiting..."
    ./glacier2router --nochdir --daemon --Ice.Config=config.glacier2
fi

