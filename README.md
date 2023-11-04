The project is Hospital system.

This script is designed to handle the user login and registration process for the Health Hospital system. It allows users to either log in using their existing account or register a new account if they do not have one and the patient will be able to use the hospital services whether the user wants to book or cancel the appointment.

## Usage

To use this script, follow the instructions below:

1. Run the script using ‘bash script.sh ‘
2. welcome message and asked if you have an account.
3. If you have an account, enter "yes" or "no" to proceed with login or registration, respectively.
4. If you choose to login, enter your User ID and password when prompted.
5. If the entered User ID and password match with patient_information file, you will be able to book or cancel an appointment by choosing the respective option (1 for booking, 2 for cancellation).
6. If you choose to register, enter your desired User ID, password, confirm the password, email, and phone number when prompted.
7. Once registration is complete, you will be redirected to the login process, where you can enter your User ID and password to access the hospital's services.
8. After successful login, you can again choose to book or cancel an appointment by selecting the respective option (1 for booking, 2 for cancellation).

The script assumes the presence of a file named `patient_information.txt` in the same directory to store user information. This file is used for both login and registration processes.
