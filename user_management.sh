#!/bin/bash
create_user(){

        read -p " Enter a username:" username

        count=$(cat /etc/passwd | grep $username| wc | awk '{print $1}')

        echo $count

        if [ "$count" -ne 0 ];
        then
                echo "Uer already exsists"
                exit 1
        fi


        read -s -p " enter password: " password
        sudo useradd -m "$username"
        echo -e "$password\n$password" | sudo passwd $username
        echo "$username is added successfully"
}

delete_user(){

        read -p " Enter a username:" username

        count=$(cat /etc/passwd | grep $username| wc | awk '{print $1}')

        echo $count

        if [ "$count" -eq 0  ];
        then
                echo "Uer doesnot  exsists"
                exit 1
        fi


        sudo userdel $username
        echo "User Delete Successfully"
}
reset_password(){
        read -p " Enter a username:" username

        count=$(cat /etc/passwd | grep $username| wc | awk '{print $1}')

        echo $count

        if [ "$count" -eq 0 ];
        then
                echo "User doesnot  exsists"
                exit 1
        fi


        read -s -p " enter new  password: " password
        echo "$username:$password" | sudo chpasswd
        #echo -e "$password\n$password" | sudo passwd $username
        echo "password is reset successfully"

}

list_users(){
        echo "Users on this System"
        echo "---------------------------------------------------------------------"
         awk -F: '{printf "%-15s %-10s %-30s %-20s\n", "uname: "$1, "uid: "$3, "Home Dir: "$6, "Shell: "$7}' /etc/passwd
         echo "---------------------------------------------------------------------"
 }

show_help() {
    echo "Usage: Choose an option from the prompt:"
    echo "Options:"
    echo "  -c|--create - Create a new user"
    echo "  -d|--delete - Delete an existing user"
    echo "  -r|--reset - Reset a user's password"
    echo "  -l|--list - List all users"
    echo "  -h|--help - Help"
}

echo "Choose an option:"
echo "  -c | --create   → Create user"
echo "  -d | --delete   → Delete user"
echo "  -r | --reset    → Reset password"
echo "  -l | --list     → List users"
echo "  -h | --help     → Help"
read -p "Enter your choice: " choice

# Handle the choice
case "$choice" in
    -c|--create) create_user ;;
    -d|--delete) delete_user ;;
    -r|--reset) reset_password ;;
    -l|--list) list_users ;;
    -h|--help) show_help ;;
    *) echo "Invalid option"; show_help ;;
esac
