#!/bin/bash
file=questions.txt
correct=0
index=0

while read -u9 line; do
    question=`echo $line | cut -d';' -f 1`
    choice1=`echo $line | cut -d';' -f 2`
    choice2=`echo $line | cut  -d';' -f 3`
    choice3=`echo $line | cut  -d';' -f 4`

    #save soulution for later comparison
    solution=`echo $line | cut  -d';' -f 5`

  
    echo  "$question\n - $choice1\n - $choice2\n - $choice3" #print question and choices

    read -p "- Your response: " answer # get the user answer


    if [ "$answer" == "$solution" ] #compare user answer with correct answer
    then
        score=$(( ++score ))
        echo "\xE2\x9C\x94" #print check mark for correct answer
    else
        echo   "\xE2\x9D\x8C" #print 'x' mark for wrong answer
    fi
    index=$(( ++index )) #calculate the number of question to give final score 

    echo
done 9< $file

echo "Your score is $score/$index" # print score