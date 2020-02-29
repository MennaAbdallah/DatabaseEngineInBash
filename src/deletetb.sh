#!/usr/bin/bash

deletetb(){
    fgred=`echo "\033[31m"`
    normal=`echo "\033[m"`
    echo -n "Write one of the following "
    source ../../listtb.sh
    listtb
    read tbname
    if [ -f "$tbname.csv" ]; then
        rm "$tbname.csv";
        printf "${fgred}$tbname ${normal}is deleted" ;
    else
        echo "Table doesn't exist"
    fi
}
