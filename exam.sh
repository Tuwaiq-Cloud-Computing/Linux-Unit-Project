#!/bin/bash


echo "*****Welcome to Alibab cloud*****"



read -p "can you tell me your name ??" username


echo "are you ready $username ??"

echo "-----------------------------------------------------------------------"


read -p "1/ The ls command is used to list all files and directories in a directory. T or F ? " q1
if [ "T" = "$q1" ]
then
  echo "Yup ,ls command is used to list all files and directories in a directory. "
else
  echo "Wrong answer ); , please talk with Naif ,Abdullah and Azez :|"
fi


echo "-----------------------------------------------------------------------"



read -p "Q2/The mkdir command is used to remove a directory. T or F ?  " q2
if [ "F" = "$q2" ]
then
  echo "Yup , The mkdir command is used to create a directory , not remove it."
else
  echo "Wrong answer ); , please talk with Naif ,Abdullah and Azez  :|"
fi

echo "-----------------------------------------------------------------------"



read -p "Q3/ The tar command is used to create a compressed archive of files and directories. T or F ?" q3
if [ "T" = "$q3" ]
then
  echo "Yup ,The tar command is used to create a compressed archive of files and directories."
else
  echo "Wrong answer ); , please talk with Naif ,Abdullah and Azez  :|"
fi


echo "-----------------------------------------------------------------------"
echo "Are you ready to last Question ???????"
read -p "Last Question who is best instructor ? Naif or Aziz or Abdullah or no one :)" q4

if [ "all" = "$q4" ]
then
  echo "Yup ,they are all excellent."
else
  echo "Wrong answer ); , they are all excellent. :)"
fi


echo "-----------------------------------------------------------------------"




#read -p "How many time do you want thanks instructors ???"
for i in {1..5}; do
  echo  "Thank you :) $i "

done


