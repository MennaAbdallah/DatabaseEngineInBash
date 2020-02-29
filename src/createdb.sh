#!/usr/bin/bash

createdb() {
    echo -n "Enter the database name: "
    read dbname
    if [ -d "data/$dbname" ]; then
        echo "Database already exists" ;
    else
        mkdir -p data/$dbname;
        echo "$dbname database is created"
    fi
}

