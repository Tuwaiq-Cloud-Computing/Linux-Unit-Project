#!/bin/bash

  PS4='Please enter your choice: '
    options1=("Create New User" "Update User" "Quit")
        select opt1 in "${options1[@]}"
        do
            case $opt1 in
                "Create New User")
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
                                    echo " created folder for $user and make him\her the owner of folder"
                                    mkdir $user; chown $user $user
                            
                                    echo "File created successfully"
                                    break
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
                        else
                            break
                        fi   
                    fi 
                done
                break
                ;;
                "Update User")
                    echo "This is list for last 5 users in system, please write the name of which user you want to update."
                    getent passwd | cut -d: -f1 | tail 
                    echo "Please Write user name:" 
                    read UserName
                    if grep -q $UserName /etc/passwd;
                    then 
                        PS5='Please enter your choice: '
                        options2=("Change role" "Change Extention Date" "Add Password" "Quit")
                        select opt2 in "${options2[@]}"
                        do
                            case $opt2 in
                                "Change role")
                                    echo "Please write new Role:"
                                    read NewRole
                                    sudo usermod -c $NewRole $UserName
                                    echo " User role updated successfully"
                                    break
                                ;;
                                "Change Extention Date")
                                    echo "Please write new extination Date:"
                                    read NewexDate
                                    sudo usermod -e $NewexDate $UserName
                                    echo " User Extention Date updated successfully"
                                    break
                                ;;
                                "Add Password")
                                    echo "Please write new Password:"
                                    read NewPSWD
                                    sudo usermod -p $NewPSWD $UserName
                                    echo " User password updated successfully"
                                    break


                                ;;
                                "Quit")
                                break
                                ;;
                            esac
                        done

                   
                    else

                    echo "Sorry, Wrong Entries"
                    break
                    fi
                    break

                ;;
                "Quit")
                break
                ;;
                *) echo "invalid option $REPLY";;
            esac
        done
#echo "do you want add the users to group ?"