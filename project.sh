#!/bin/bash



echo " Welcome to Linux Unit project "

echo "This Project done by Basil & Zaid :)"
 


#useradd username

#usermod -ag groupname username 

#userdel user name 

#groupadd groupname


read -p "Please wiret username : " username

sudo useradd $username
#sudo usermod -ag Engineers $username

echo "**"

read -p "what is the group 
h=HR , e = enginner , a = accounting: " gn

if [ "$gn" = "h" ]
then
 
echo "User added to HR group $gn  ."
sudo usermod -g HR $username

else
  echo ""
fi
#**
if [ "$gn" = "e" ]
then
 
echo " User added to Enginner group $gn  ."
sudo usermod -g Enginner $username

else
  echo "no"
fi
#**
if [ "$gn" = "a" ]
then
 
echo " User added to accounting group $gn  ."
sudo usermod -g accounting $username


else
  echo "no"
fi










echo "**"

read -p "Do you want to delete user ? (y ||n) ? " A

if [ "$A" = "y" ]
then
  read -p "Please enter username " un

echo "User $un deleted ."

  sudo userdel "$un"
else
  echo ""
fi



echo "*"
