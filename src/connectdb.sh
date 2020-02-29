#!/usr/bin/bash
connectdb(){
    echo -n "Write one of the following "
    source ./listdb.sh
    listdb
    read dbname
    if [ -d "data/$dbname" ]; then
        cd data/$dbname/;
        echo "$dbname is connected" ;
    else
        echo "Database is not exist"
    fi
}
