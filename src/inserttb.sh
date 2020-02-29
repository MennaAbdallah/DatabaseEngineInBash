#!/usr/bin/bash

inserttb() {
	echo -n "Enter table name: "
	read tbname
	line=$(head -n 1 "$tbname.csv")
	data=$(head -n 1 "$tbname.csv"|cut -f2- -d',')
	printf "Enter comma separated values for \n$data\n" 
	colnum=$(cat "$tbname.csv"|tr ',' ' '|wc -w)
	idd=$(awk '/./{line=$0} END{print line}' "$tbname.csv"|cut -f1 -d',')
	if [ $idd == id ];then
		idd=1
	else
		idd=$(($idd+1))
	fi
	read input
	echo "$(sed -e "\$a\\"$idd","$input "$tbname.csv")" > "$tbname.csv"
}
