# Atheer Alshehri & Basmah Bahubayl
##### Project Name :Riyadh Restaurants

##### Riyadh Restaurants :A program in which the user chooses the cuisine he wants, then a list of restaurants is shown to him based on the cuisine he chose, and he can see this list with or without ratings, according to his desire.


#!/bin/bash

choice=0
choice2=0
choice3=""

    echo "


                            Welcome !!
                  Are Looking for a restaurants ?
                           We are here
    "
while [ "$choice" != "5" ]; do



    # Display the menu options
    echo "Menu:"
    echo "1. Italian cuisine "
    echo "2. Japanese cuisine "
    echo "3. Indian cuisine "
    echo "4. Mexican cuisine "
    echo "5. Exiting.."


    # Read the user's choice
    read -p "Enter your choice: " choice

    # Process the user's choice
    case $choice in
        1)
            echo "You chose  Italian cuisine "
              read -p "Do you want to display restaurants with ratings? Type y to display or n to not display: " choice3
              if [ $choice3 == 'y' ] ; then
                  echo "1. Oulu      - Rating [4.1]"
                  echo "2. Melenzane - Rating [4.0]"
                  echo "3. Perimeter - Rating [4.1] "
                  echo "4. L'olimpo  - Rating [4.2] "
          elif [ $choice3 == 'n' ] ; then
                  echo "1. Oulu "
                  echo "2. Melenzane"
                  echo "3. Perimeter"
                  echo "4. L'olimpo"
          else
                 echo "Invalid choice."
          fi    ;;

        2)
               echo "You chose Japanese cuisine "
              read -p "Do you want to display restaurants with ratings? Type y to display or n to not display: " choice3
              if [ $choice3 == 'y' ] ; then
                  echo "1. Roka        - Rating [4.3]"
                  echo "2. Sushi yoshi - Rating [4.0]"
                  echo "3. Nozomi      - Rating [4.5] "
                  echo "4. Kampai      - Rating [4.2] "
          elif [ $choice3 == 'n' ] ; then
                  echo "1. Roka "
                  echo "2. Sushi yoshi"
                  echo "3. Nozomi "
                  echo "4. Kampai"

          else
                 echo "Invalid choice."
          fi

                ;;
        3)
             echo "You chose Indian cuisine "
              read -p "Do you want to display restaurants with ratings? Type y to display or n to not display: " choice3
              if [ $choice3 == 'y' ] ; then
                  echo "1. Ruhi      - Rating [4.3]"
                  echo "2. Zafran    - Rating [4.3]"
                  echo "3. Peradiz   - Rating [4.6] "
                  echo "4. Kumar     - Rating [4.1] "

          elif [ $choice3 == 'n' ] ;  then
                  echo "1. Ruhi  "
                  echo "2. Zafran"
                  echo "3. Peradiz"
                  echo "4. Kumar "


          else
                 echo "Invalid choice."
          fi


            ;;    

        4)
             echo "You chose Mexican cuisine "
              read -p "Do you want to display restaurants with ratings? Type y to display or n to not display: " choice3
              if [ $choice3 == 'y' ] ; then
                  echo "1. Fire grill  - Rating [4.1]"
                  echo "2. Amigos      - Rating [4.1]"
                  echo "3. Mexika      - Rating [4.2] "
                  echo "4. Tacoville   - Rating [3.9] "
          elif [ $choice3 == 'n' ] ; then
                  echo "1. Fire grill"
                  echo "2. Amigos "
                  echo "3. Mexika "
                  echo "4. Tacoville "

          else
                 echo "Invalid choice."
          fi

            ;;

        5)
            echo "Exiting..."
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
    read -p "if you want Exit Enter 5 " choice
    echo # Print an empty line for readability
done


