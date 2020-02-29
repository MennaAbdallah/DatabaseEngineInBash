#!/usr/bin/bash

deletedb(){
    echo -n "Write one of the following "
    source ./listdb.sh
    listdb
    read dbname
    if [ -d "data/$dbname" ]; then
        rm -rf data/$dbname;
        echo "$dbname is deleted" ;
    else
        echo "Database doesn't exist"
    fi
}
