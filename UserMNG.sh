#!/bin/bash

read -p "Create New Users (Separated by 'Space') : " Users

for user in ${Users[@]}
do  
   
    if grep -q $user /etc/passwd;
    then 
     echo "User already exist"
    else
     echo "Create" $user 
        echo "please enter $user information"
        echo "Role:" 
        read Role
        echo "exprition date:" 
        read exDate
        echo "do you want to create Password for $user (y/n) ? " 
        read ansPass
        

        if  [[ $ansPass == "y" ]]
        then
            echo "Enter Password" 
            read Password
            useradd -e $exDate -c $Role -p $Password $user
        else
            useradd -e $exDate -c $Role $user
        fi 

        echo "do you want to create folder for $user (y/n) ? "
        read folderuser

        if [[ $folderuser == "y" ]]
        then
            mkdir $user 
            
        fi 

    fi 
done

echo "do you want add the users to group ?"