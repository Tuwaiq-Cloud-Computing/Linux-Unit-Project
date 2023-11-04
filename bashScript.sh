#!/bin/bash
# Saha Hospital User Script

# Welcoming message
echo "Welcome to Saha Hospital"
# To ask the user if they have an existing account (yes) for login or (no) for register
read -p "Do you have an account? (yes/no): " answer

# If the user answers 'yes' in any form
if [[ "$answer" == "Y" || "$answer" == "y" || "$answer" == "Yes" || "$answer" == "yes" ]]; then
    valid_login=false
        while [ "$valid_login" == false ]; do

# Login Process user_ID & password
        read -p "UserID: " user_id
        # The ID must be 10 numbers long.
        if [[ "$user_id" =~ ^[0-9]{10}$ ]]; then
            # To input the user password, it's secret.
            read -s -p "Password: " password
            # To Check if the entered User ID and password match with what the hospital has in its records.
            if grep -q "$user_id $password" patient_information.txt; then
                valid_login=true

#If they match the user can use the hospital's services.
# hospital services
    read -p "Choose 1 if you want to book an appointment and choose 2 if you want to cancel an appointment: (1/2): " answer2
                # If the user wants to reserve an appointment
                if [[ "$answer2" -eq "1" ]]; then
                # If the user wants to cancel an appointment
                    echo "The Hospital will contact you as soon as possible"
                elif [[ "$answer2" -eq "2" ]]; then
                        echo "The appointment is canceled"
                fi

            else
                echo "Login failed. Invalid User ID or password."
            fi


        else
            echo "Invalid UserID or Password. Please try again."
        fi
        done

# Registration proccess if the user doesn't have an account
elif [[ "$answer" == "N" || "$answer" == "n" || "$answer" == "No" || "$answer" == "no" ]]; then
    valid_registration=false

    while [ "$valid_registration" == false ]; do
        # Input ID from the user
        read -p "UserID: " user_id
        # To limit the ID to exactly 10 digits
        if [[ "$user_id" =~ ^[0-9]{10}$ ]]; then
            read -s -p "Password: " password
            echo
            read -s -p "Confirm password: " confirm_password
            echo
            # To make sure the password and confirm_password are the same value
            if [[ "$password" == "$confirm_password" ]]; then
                read -p "Email: " email
                read -p "Phone number: " phone_number
                # To make sure the password and confirm_password are the same value
                if [[ "$phone_number" =~ ^[0-9]{10}$ ]]; then
                    echo "Account created with UserID: $user_id"
                    # Append user information to patient_information.txt
                    echo "$user_id $password $email $phone_number" >> patient_information.txt
                    valid_registration=true

#After the user registered then returen him to login proccess
#login proccess
                    read -p "UserID: " user_id
                        if [[ $user_id =~ ^[0-9]{10}$ ]]; then
                        read -s -p "Password: " password
                         # Make sure to have `patient_information.txt` in the same directory to store user information.
                         grep -q "$user_id $password" patient_information.txt;
                         echo -e "\nLogin completed successfully"

                         # Now the user can use hospital services
                         read -p "Choose 1 if you want to book an appointment and choose 2 if you want to cancle an appointment : (1/2): " answer3

                             if [[ $answer3 -eq "1" ]]; then
                                echo -e "\nThe Hospital will contact with you as soon as possible"
                             elif  [[ $answer3 -eq "2" ]]; then
                                echo -e "\nThe Appointment is canceled"
                             fi
                        else
                             echo "Invalid UserID"
                        fi
                 else
                    echo "Invalid Phone number. Please try again."
                 fi
            else
                echo "Passwords do not match. Please try again."
            fi
        else
            echo "Invalid UserID. Please try again."
        fi
    done
else
    echo "Invalid response"
fi
