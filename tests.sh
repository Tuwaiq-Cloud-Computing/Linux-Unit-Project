#!/bin/bash

echo "Enter your name"
read name

c=0

echo "choose 1 for true or 2 false"


while ((c < 2)); do

  echo "Q1: The ls command is used to list files and directories in Linux"
read choice1
if (($choice1 == 1)); then
 ((c++))
fi

echo "Q2: The cd command is used to change the current working directory in Linux"
read choice2
if (($choice2 == 1)); then
 ((c++)) 
fi
echo "Q3: The rm command is used to remove files and directories in Linux.x"
read choice3
if (($choice3 == 1)) ; then
 ((c++)) 
fi
echo "Q4: The mkdir command is used to create a new directory (not a file) in Linux"
read choice4
if (($choice4 == 2)); then
 ((c++)) 
fi
echo "Q5: The cat command is used to display the contents of a file in Linux"
read choice5
if (($choice5 == 1 )); then
 ((c++)) 
fi
if (($c > 2)) ; then
 break
else
 c=0
 echo "please Try Again!!!"
fi
done

echo "Congrats 🙂 $name your result $c out of 5"
