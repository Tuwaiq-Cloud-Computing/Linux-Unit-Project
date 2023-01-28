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

        echo 'user Successfully created, Now do you want to continue?(y/n)'
        read ans3

        if [[ $ans3 == "y" ]]
        then 
            PS3='Please enter your choice: '
            options=("Create Folder for $user" "Create Group for $user" "Add $user into group" "Quit")
            select opt in "${options[@]}"
            do
                case $opt in
                    "Create Folder for $user")
                     echo " create folder for $user and make him the owner of folder"
                      mkdir $user; chown $user $user
                        ;;
                    "Create Group for $user")
                        echo "Create new group and add $user to the group"
                        echo "please enter new group name:"
                        read Ngroup
                        groupadd $Ngroup
                        usermod -a -G $Ngroup $user
                        ;;
                    "Add $user into group")
                        echo "Add $user into group"
                       echo "please enter group name "
                        read GroupN
                        if grep -q $GroupN /etc/passwd;
                            then 
                                usermod -a -G $GroupN $user
                        else 
                            echo "Group not exist"
                        fi 
                          
            
                        ;;
                    "Quit")
                        break
                        ;;
                    *) echo "invalid option $REPLY";;
                esac
            done
        fi 
       # echo "do you want to create folder for $user (y/n) ? "
       # read folderuser

       # if [[ $folderuser == "y" ]]
       # then
      #       
            
       # fi 

    fi 
done

#echo "do you want add the users to group ?"