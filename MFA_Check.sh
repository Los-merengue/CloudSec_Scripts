#!/bin/bash

:'
This script is useful for automating the dumping process of IAM users.
It simply gives an overview of the users that have virtual MFA devices
configured.

It was originally authored by: Aditya K Sood

And I reengineered some of the syntax
'

time_map=$(date +"%m-%d-%Y");

echo -e "[*] Starting script execution at: $time_map\n"

# Dump the IAM users with Username, UserId, Last_Used Password and ARN.

echo -e "[*] Dumping the IAM Users with - username, UserId, Last_Used Password and ARN\n"

aws iam list-users --output table --query 'User[*].[UserName,UserId,PasswordLastUsed,Arn]\n'

# Dump this same information in a text file

echo -e "[*] Dumping the list of usernames to text file : dumped_users.txt \n"

aws iam list-users --output text --query 'Users[*].[UserName]' > dumped_users.txt

FILE=dumped_users.txt

if [ -f "$FILE" ]; then
    echo -e "[*] Users dumped to the $FILE \n"
else
    echo -e "[*] An error in the creation of the file"
fi

echo -e "\n[*] Checking the Multifactor authentication for dumped IAM users \n"

while IFS= read -r line; do echo -e "$line\n"; aws iam list-mfa-devices --user-name $line; \ 

echo -e "\n--------------------------"; done < dumped_users.txt

echo -e "\n[*] MFA assessment completed.\n"

echo -e "[*] Checking if any virtual MFA devices configured in the account.\n"

aws iam list-virtual-mfa-devices

echo -e "[*] Script executed successfully. \n"