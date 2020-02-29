#!/usr/bin/bash
listtb(){
    echo -n "Tables: "
    printf "\n"
    ls -1 | sed -e 's/\.csv$//'
}
