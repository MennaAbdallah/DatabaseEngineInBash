#!/usr/bin/sh

show_sec_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} List Tables ${normal}\n"
    printf "${menu}**${number} 2)${menu} Create Table ${normal}\n"
    printf "${menu}**${number} 3)${menu} Drop Table ${normal}\n"
    printf "${menu}**${number} 4)${menu} Insert into Table ${normal}\n"
    printf "${menu}**${number} 5)${menu} Select All from Table ${normal}\n"
    printf "${menu}**${number} 6)${menu} Delete from Table${normal}\n"
    printf "${menu}**${number} 7)${menu} Return To Main Menu ${normal}\n"
    printf "${menu}*********************************************${normal}\n"
    printf "Please enter a menu option and enter or ${fgred}x to exit. ${normal}"
    read opt
}
option_picked(){
    msgcolor=`echo "\033[01;31m"` # bold red
    normal=`echo "\033[00;00m"` # normal white
    message=${@:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

clear
show_sec_menu
while [ $opt != '' ]
do
    if [ $opt = '' ]; then
        exit;
    else
        case $opt in
            1) clear;
                option_picked "Option 1 Picked";
                source ../../listtb.sh
                listtb
                show_sec_menu;
                ;;
            2) clear;
                option_picked "Option 2 Picked";
                source ../../createtb.sh
                createtb
                show_sec_menu;
                ;;
            3) clear;
                option_picked "Option 3 Picked";
                source ../../deletetb.sh
                deletetb
                show_sec_menu;
                ;;
            4) clear;
                option_picked "Option 4 Picked";
                source ../../inserttb.sh
                inserttb
                show_sec_menu;
                ;;
            5) clear;
                option_picked "Option 5 Picked";
                echo -n "Enter table name: "
                read tdname
                source ../../selectall.sh
                selectall $tdname
                show_sec_menu;
                ;;
            6) clear;
                option_picked "Option 6 Picked";
                source ../../deleterow.sh
                deleterow
                show_sec_menu;
                ;;
            8) clear;
                option_picked "Option 7 Picked";
                cd ../..
                source ./mainmenu.sh
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

