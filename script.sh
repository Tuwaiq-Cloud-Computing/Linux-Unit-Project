#!/bin/bash

echo "Please choose from the following:"
echo "	[v] to view all contacts"
echo "	[c] to create new phone contact"
echo "	[s] to search for phone contact"
echo "	[m] to modify a phone contact"
echo "	[d] to delete a contact"

read choice

case ${choice} in 
  V | v) 
		echo "Viewing all contacts..."
		cat phone_numbers.csv
		;;
  C | c) 
		echo "Create a new contact..."
		while read -p "Enter name: " name ;
		do 
			found=$(grep $name phone_numbers.csv)
			if [ -z "$found" ];
			then
				while read -p "Enter phone number: " number ;
				do
				found=$(grep $number phone_numbers.csv)
					if [ -z "$found" ];
					then
						echo $name $number >> phone_numbers.csv
						echo "Contact created."
						break
					fi
				echo "Phone number is registered."
				done
				break
			fi
			echo "Name is registered."
		done
		;;
  S | s) 
		echo "Searching for contact..."
		read -p "Enter name or phone number : " search
		found=$(grep $search phone_numbers.csv)
		if  [ -z "$found" ] ;then
			echo "No result."
		else 
			echo "$found"
		fi
		;;
  M | m) 
  		echo "Modifying a contact..."
		read -p "Enter the old name or phone number : " oldContact
		found=$(grep $oldContact phone_numbers.csv)
		if  [ -z "$found" ] ;then
			echo "No result."
		else 
			read -p "Enter the new name or phone number : " newContact
			sed -i "s/$oldContact/$newContact/" phone_numbers.csv
			echo "Contact edited."
		fi
		;;
  D | d) 
		echo "Deleting a contact..."
		read -p "Enter name or phone number : " search
		found=$(grep $search phone_numbers.csv)
		if  [ -z "$found" ] ;then
			echo "No result."
		else 
			sed -i "/$found/d" phone_numbers.csv
			echo "Contact deleted."
		fi
		;;
	*) 
		echo "Make a valid selection";
		;;
esac
