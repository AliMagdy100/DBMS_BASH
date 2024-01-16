#!/bin/bash
shopt -s extglob 
export LC_COLLATE=C

while true; do
    read -p "Please Enter The Database Name (or 'Q' to exit): " DB_Name

    if [ "$DB_Name" == "Q" ]; then
        echo "Exiting..."
        source ../Main_Menu.sh
    fi

    DB_Name=$(echo "$DB_Name" | sed 's/ /_/g')

    if [ -z "$DB_Name" ]; then
        echo "Please Enter a Name"
    else
        if [[ "$DB_Name" =~ ^[[:digit:]] ]]; then
            echo "Database name cannot start with a number"
        elif [[ ! "$DB_Name" =~ ^[[:alnum:]_]+$ ]]; then
            echo "Database name can only contain letters, numbers, and underscores"
        elif [ -e "$DB_Name" ]; then
            echo "Database '$DB_Name' already exists. Please enter another name."
        else
            mkdir "$DB_Name"
            echo "Database '$DB_Name' is successfully created"
        fi
    fi
done

