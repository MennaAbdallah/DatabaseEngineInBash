#!/usr/bin/bash

elementIn() {
    local e match="$1"
    shift
    for e; do [[ "$e" == "$match" ]] && echo "y" && return 0; done
    echo "n" && return 1
}

createtb() {
    fgred=`echo "\033[31m"`
    normal=`echo "\033[m"`
    echo -n "Enter the table name: "
    read tbname
    if [ -f "$tbname.csv" ]; then
        echo "Table already exists" ;
    else
        echo -n "Enter number of columns execluding id column: "
        read numcol
        colname=()
        colname[0]="id"
        for ((i=1 ; i <= numcol ; i++))
        do
            echo -n "Enter column name from one character or more: "
            read cn
            while [ $(elementIn "$cn" "${colname[@]}") == "y" ];
            do
                echo "Column already exist Enter another name";
                read cn
            done
            colname[i]=$cn
        done
        str=$(IFS=,; echo "${colname[*]}")
        echo "$str" > "$tbname.csv"
	printf "${fgred}$tbname ${normal}table is created with ${fgred}$(( $numcol+1 )) ${normal}columns which are: ${fgred}$str .${normal}"
    fi
}

