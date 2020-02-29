#!/usr/bin/bash

deleterow() {
    echo -n "Enter table name: "
    read tbname
    source ../../selectall.sh
    selectall $tbname
    echo -n "Enter an id: "
    read idd
    iddArray=$(cut -f1 -d',' "$tbname.csv" |sed '1d')
	lastid=$(awk '/./{line=$0} END{print line}' "$tbname.csv"|cut -f1 -d',')
    if [ $idd -le $lastid ];then
        echo "$(sed -e "/^"$idd",/d" "$tbname.csv")" > "$tbname.csv"
        selectall $tbname
    else
        echo -e "Invalid id "
    fi
}
