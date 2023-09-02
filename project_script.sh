#i!/bin/bash

encrypt_file() {
    read -p "Enter the input filename: " input_file
    read -p "Enter the output filename for encrypted file: " encrypted_file
    
    openssl enc -aes-256-cbc -salt -in "$input_file" -out "$encrypted_file"
    
}

decrypt_file() {
    read -p "Enter the input filename (encrypted): " encrypted_file
    read -p "Enter the output filename for decrypted file: " decrypted_file
    
    openssl enc -aes-256-cbc -d -in "$encrypted_file" -out "$decrypted_file"
    
}

while true;
do
    echo "================================="
    echo "File Encryption/Decryption:"
    echo "================================="
    echo "1. Encrypt a file"
    echo "2. Decrypt a file"
    echo "3. Exit"
    echo "================================="
    
    read -p "Enter your choice: " choice
    echo "---------------------------------"
    
    if [ $choice -eq 1 ];
    then
            encrypt_file
            read -p "Press enter to continue..."
    elif [ $choice -eq 2 ];
    then
            decrypt_file
            read -p "Press enter to continue..."
          
    elif [ $choice -eq 3 ];
    then 
            echo "Exiting..."
            exit 0
          
     else 
            echo "Invalid choice. Please select a valid option."
            read -p "Press enter to continue..."
       
   fi
done
