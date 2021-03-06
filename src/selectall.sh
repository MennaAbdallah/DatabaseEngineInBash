#!/usr/bin/bash

selectall(){

    tdname=$1
    
    awk -F, '
    {
    if (NF > max_fields) 
        max_fields = NF;
    for (f=1; f<=NF; f++) {
        field[NR, f] = $f;
        if (length($f) > field_length[f]) 
            field_length[f] = length($f);
    }
    }
    END {
    for (f=1; f<=max_fields; f++) {
        l = field_length[f];
        field_format[f] = "%-" l "." l "s";
    }
    for (r=1; r<=NR; r++) {
        out = "";
        for (f=1; f<=max_fields; f++) 
            out = out "|" sprintf(field_format[f], field[r, f]);
        print out "|"
    }
    }      

' "$tdname.csv"
}