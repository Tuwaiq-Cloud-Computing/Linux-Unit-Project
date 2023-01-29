 #!/bin/bash 
echo " Hala Hala! welcome to the Gift Selection Menu"

PS3=''
options=("Order" "List Our Options" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Order")
            echo "Hayooo you choose Order, Let's Move On"
            ;;

        "List Our Options")
            echo "Here's Our Amazing Selections"
          cat lagi.txt mangi.txt homegi.txt
		exit  ;;
        "Quit")
	echo "Bye Bye, See you Later!"
	exit
            ;;
        *) echo "invalid option";;

esac
break
done


if [[ $opt=="Order" ]] 
 then


options2=("Gift for a Lady" "Gift for a Man" "Home Gifts" "Random Gift" )
select opt2 in "${options2[@]}"
do
endmsg() {
echo "Please tell us the color of wrapping  and occasion of the gift? "
read wrap
echo "Please enter your name to confirm your order"
read name 
echo "Plese enter your phone"
read phone 
echo "Thank you for ordering dear $name, you order is $choice, with $wrap wrapping, and your phone is $phone We Will Contact with you"  
}

    case $opt2 in
        "Gift for a Lady")
        echo "Choose from our list"    
	cat lagi.txt
	echo "What is your choice? "
	read choice
	echo "You chose $choice, a GOOD Choice!!!"
	endmsg
	 	;;
       
	 "Gift for a Man")
	echo "Choose from our list"
	cat mangi.txt
         echo "What is your choice? "
        read choice
        echo "You chose $choice, a GOOD Choice!!!"
   	endmsg
	 ;;

        "Home Gifts")
         echo "Choose From our home gifts selection"
        cat homegi.txt   
	 echo "What is your choice? "
        read choice
        echo "You chose $choice, a GOOD Choice!!!"
 	endmsg

	 ;;
	"Random Gift")
	echo "Let's pick 3 random gifts for you, please choose what you like"
	echo "hmmmmm we picked for you ... "
		cat rangift.txt | shuf -n 3
	echo "Which one you like? "
	read choice
	echo "You choose from the random list a $choice"
	endmsg
	;;

	*) echo "invalid option"


esac
break
done
fi

