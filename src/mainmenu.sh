#!/usr/bin/sh

show_main_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} List Databases ${normal}\n"
    printf "${menu}**${number} 2)${menu} Create Database ${normal}\n"
    printf "${menu}**${number} 3)${menu} Connect Database ${normal}\n"
    printf "${menu}**${number} 4)${menu} Delete Database ${normal}\n"
    printf "${menu}*********************************************${normal}\n"
    printf "Please enter a menu option or enter ${fgred}x to exit. ${normal}"
    read opt
}

option_picked(){
    msgcolor=`echo "\033[01;31m"` # bold red
    normal=`echo "\033[00;00m"` # normal white
    message=${@:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

clear
show_main_menu
while [ $opt != '' ]
do
    if [ $opt = '' ]; then
        exit;
    else
        case $opt in
            1) clear;
                option_picked "Option 1 Picked";
                source ./listdb.sh
                listdb
                show_main_menu;
                ;;
            2) clear;
                option_picked "Option 2 Picked";
                source ./createdb.sh
                createdb
                show_main_menu;
                ;;
            3) clear;
                option_picked "Option 3 Picked";
                source ./connectdb.sh
                connectdb
                source ../../secmenu.sh
                show_sec_menu;
                ;;
            4) clear;
                option_picked "Option 4 Picked";
                source ./deletedb.sh
                deletedb
                show_main_menu;
                ;;
            x)exit;
                ;;
            \n)exit;
                ;;
            *)clear;
                option_picked "Pick an option from the menu";
                show_main_menu;
                ;;
        esac
    fi
done

