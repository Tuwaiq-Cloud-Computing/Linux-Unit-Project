# RASA Airlines
project by: Sarah Aldrees & Raghad Alshammari

### Overview:
We created an airline booking system with specific destinations:
- Paris
- Rome
- Istanbul
- Seoul
  
In order to book, the user must enter a valid number of flights (from 1 to 4), enter the departure date in a specific format (YYYY-MM-DD), choose a class (First, Business, Economy), and enter the passenger names.

If the previous steps were successful, the user will be asked to input the credit card information with the following specifications:
- Card number must be 16 digits only
- Expiration date must be in a specific format (MM/YY)
- CVV must be only 3 digits only

Based on the flight chosen, inputed details get appended to a specific txt file based on the selected destination.
Limitations:
- Each flight contains only five passengers; if the flight is full, it will not be shown in the list
-  If the user inputs a number of passengers that would increase the limit, it will reject it and ask the user to enter a different number
-  - Example: if flight Paris contains 3 passengers and the user chooses to add 4 passengers, it will show an error message and ask the user to re-enter the total passenger numbers again

### User Stories:
1. The user chooses the destination by inputting the number
<img width="505" alt="Screenshot 2023-11-02 at 6 29 00 PM" src="https://github.com/SarahAldrees1/Linux-Unit-Project/assets/100089507/56a0e284-ad90-45db-8c66-e1d4f71764c3">

2. After choosing the flight the user gets asked to input the number of passengers, takeoff date, class, and passenger name
<img width="374" alt="Screenshot 2023-11-02 at 6 56 09 PM" src="https://github.com/SarahAldrees1/Linux-Unit-Project/assets/100089507/872822d7-f598-4c1e-8d43-0f8e89157d75">

3. Later on, the user enters the card details to complete the purchase
<img width="339" alt="Screenshot 2023-11-02 at 7 00 41 PM" src="https://github.com/SarahAldrees1/Linux-Unit-Project/assets/100089507/700096a7-e343-4ea0-871a-3474a386c856">

4. After the card details have been entered successfully a message will appear
<img width="390" alt="Screenshot 2023-11-02 at 7 10 38 PM" src="https://github.com/SarahAldrees1/Linux-Unit-Project/assets/100089507/df6ab1da-4f7d-48cc-a639-689d7cbcecf3">

* Showing the list when one of the flights is full
<img width="510" alt="Screenshot 2023-11-02 at 7 24 16 PM" src="https://github.com/SarahAldrees1/Linux-Unit-Project/assets/100089507/aaa5af3d-3a43-4051-afb6-7a192e2773d5">

* Showing error message when exceeding the maximum number of passengers
<img width="500" alt="image" src="https://github.com/SarahAldrees1/Linux-Unit-Project/assets/100089507/95ffd9ce-07ce-4042-b48f-261ce16b7c9c">

* Showing error message when the credit card information is entered in the wrong format
<img width="664" alt="image" src="https://github.com/SarahAldrees1/Linux-Unit-Project/assets/100089507/1f7900df-e0c0-4faa-a941-feed69e181ac">


### Bash script file:
#!/bin/bash

is_flight_full()
{
        local passengers=$1
        if [ "$passengers" -ge 5 ]
        then
                return 0
        else
                return 1
        fi
}

validate_flight_selection() {
    local selection=$1
    if [[ "$selection" =~ ^[1-4]$ ]]; then
        return 0
    else
        return 1
    fi
}

seatsParis=$(wc -l < /Destinations/Paris.txt)
seatsRome=$(wc -l <  /Destinations/Rome.txt)
seatsIstanbul=$(wc -l < /Destinations/Istanbul.txt)
seatsSeoul=$(wc -l < /Destinations/Seoul.txt)

flights=("Paris" "Rome" "Istanbul" "Seoul")
passenger_counts=($seatsParis $seatsRome $seatsIstanbul $seatsSeoul)

printf  "\n\n\n\n✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️ RASA Airlines ✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️✈️"


echo -e "\n\n                  Welcome! Book your flight               "

echo -e "\nChoose your destination from the list below (Ex: 3):"

for i in "${!flights[@]}"; do
    if ! is_flight_full "${passenger_counts[$i]}"; then
        echo "$(($i + 1)). ${flights[$i]}"
    fi
done

read -p "Destination: " destinationNum

while true
do
          if validate_flight_selection "$destinationNum";
          then
                  index=$((destinationNum - 1))

                  echo -e "\nPlease enter the following details:"
                  echo -e "\nPlease enter number of passenger/s:"
                  read -p "Number of passengers: " passNum

                  if [[ ! $passNum =~ ^[1-9]$ ]]; then
                          echo "Invalid number of passengers. Please enter a number from 1 to 9."
                          read -p "Number of passengers: " passNum
                  else
                          # Check if adding the passengers would exceed the maximum
                          total_passengers=$((${passenger_counts[$index]} + passNum))

                          if [ "$total_passengers" -gt 5 ]
                          then
                                  echo "Cannot add $passNum passengers. Maximum passenger count exceeded."
                          else
                                  # Add the passengers
                                  passenger_counts[$index]=$total_passengers

                                  read -p "Takeoff date (format: YYYY-MM-DD): " TAKEOFF_DATE

                                  if [[ ! "$TAKEOFF_DATE" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]
                                  then
                                                  echo "Invalid takeoff date. Please enter the takeoff  date in the format YYYY-MM-DD."
                                                  read -p "Takeoff date (format: YYYY-MM-DD): " TAKEOFF_DATE
                                   fi

                                        read -p "Class: -First -Buisness -Economy: " CLASS

                                  for ((i=1; i<= "$passNum"; i++))
                                  do
                                          echo -e "\nEnter details for Passenger $i:\n"
                                          read -p "Passenger $i name: " PASSENGERNAME

                                          if [ "$destinationNum" -eq 1 ]
                                          then
                                                  printf  "Passenger $i details:\n1- Name: $PASSENGERNAME\n2- Date: $TAKEOFF_DATE\n3- Class: $CLASS\n4- Destination: Paris\n"
                                                  echo -e "Passenger details: 1- Name: $PASSENGERNAME 2- Date: $TAKEOFF_DATE 3- Class: $CLASS 4- Destination: Paris" >> /Destinations/Paris.txt

                                          elif [ "$destinationNum" -eq 2 ]
                                          then
                                                  printf "Passenger $i details:\n1- Name: $PASSENGERNAME\n2- Date: $TAKEOFF_DATE\n3- Class: $CLASS\n4- Destination: Rome\n"
                                                  echo "Passenger details: 1- Name: $PASSENGERNAME 2- Date: $TAKEOFF_DATE 3- Class: $CLASS 4- Destination: Rome" >> /Destinations/Rome.txt

                                          elif [ "$destinationNum" -eq 3 ]
                                          then
                                                  printf "Passenger $i details:\n1- Name: $PASSENGERNAME\n2- Date: $TAKEOFF_DATE\n3- Class: $CLASS\n4- Destination: Istanbul\n"
                                                  echo -e "Passenger details: 1- Name: $PASSENGERNAME 2- Date: $TAKEOFF_DATE 3- Class: $CLASS 4- Destination: Istanbul" >> /Destinations/Istanbul.txt

                                          elif [ "$destinationNum" -eq 4 ]
                                          then
                                                  printf "Passenger $i details:\n1- Name: $PASSENGERNAME\n2- Date: $TAKEOFF_DATE\n3- Class: $CLASS\n4- Destination: Seoul\n"
                                                  echo -e "Passenger details: 1- Name: $PASSENGERNAME 2- Date: $TAKEOFF_DATE 3- Class: $CLASS 4- Destination: Seoul" >> /Destinations/Seoul.txt
                                          fi
                                  done
                                  break
                          fi
                  fi
          fi
 done

printf  "\n\nPlease enter your credit card details 💳:\n"
read -p "Card holder: " CARDHOLDER
read -p "Card number: " CARDNUMBER

if [[ ! "$CARDNUMBER"  =~ ^[0-9]{16}$ ]]; then
    echo "Invalid card number. Please enter a 16-digit numeric card number."
    read -p "Card number: " CARDNUMBER
fi

read -p "Date (format: MM/YY): " CARD_DATE

if [[ ! "$CARD_DATE"  =~ ^[0-9]{2}/[0-9]{2}$ ]]; then
    echo "Invalid expiration date. Please enter the expiration date in the format MM/YY."
    read -p "Date (format: MM/YY): " CARD_DATE
fi

read -p "CVV: " CARD_CVV

if [[ ! "$CARD_CVV"  =~ ^[0-9]{3}$ ]]; then
    echo "Invalid CVV. Please enter a 3-digit numeric CVV."
    read -p "CVV: " CARD_CVV
fi

echo -e "\nSucceful puchase!! Your flight has been booked.\nTravel safely!"

### Text files
<img width="1509" alt="image" src="https://github.com/SarahAldrees1/Linux-Unit-Project/assets/100089507/11cedc82-0990-4f48-bfb5-78e8affd1858">

<img width="1512" alt="image" src="https://github.com/SarahAldrees1/Linux-Unit-Project/assets/100089507/6fd3c58b-42cb-4097-91d8-802807732a96">
