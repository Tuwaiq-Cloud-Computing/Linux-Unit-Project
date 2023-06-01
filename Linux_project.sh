if [ $UID -eq 0 ]
then


echo "Enter 1 to add username"
echo "Enter 2 to delete username"
echo "Enter 3 to add user to group, knowing that the essential groups are (Admin, Teacher)"
echo "Enter 4 to create group"
echo "Enter 5 to delete group"


read choice

if [[ $choice -eq 1 ]] ; then
	echo "Enter teacher username"
	read username
	useradd $username
	if [ $? -eq 0 ]; then
	echo "User $username has been added !"
	fi
#########################################################################################

elif [[ $choice -eq 2 ]] ; then
	echo "Enter username to delete"
	read username
	userdel $username
	if [ $? -eq 0 ]; then
	echo "user $username has been deleted !"
	fi
#########################################################################################

elif [[ $choice -eq 3 ]] ; then
	echo "Enter username"
	read username
	echo "Enter group name"
	read groupname
	usermod -a -G $groupname $username
	if [ $? -eq 0 ]; then
	echo "User $username has been added to group $groupname"
	fi
#########################################################################################

elif [[ $choice -eq 4 ]] ; then
	echo "Enter a group name"
	read groupname
	groupadd $groupname
	if [ $? -eq 0 ]; then 
	echo "Group $groupname has been added !"
	fi
#########################################################################################

elif [[ $choice -eq 5 ]] ; then
	echo "Enter groupname to delete it"
	read groupname
	groupdel $groupname
	if [ $? -eq 0 ]; then
	echo "Group $groupname has been deleted !"
	fi

else
echo "Invalid choice"
fi
else 
	echo "You are not Manager !"
fi 
