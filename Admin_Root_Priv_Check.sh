#!/bin/bash

:'

This is a useful script for obtaining the IAM Users with the Highest Privilege

Obtaining this information is useful because it will give an audit on the iam
users that need to have strict policies guiding them.

After Using this script, another script to use subsequently is the Cred_Rotation
so as to avoid reusing of previous credentials for this users, resulting to 
dumpster diving.

Originally Authored: Aditya K Sood

'

time_map=$(date +"%m-%d-%Y");

echo -e "[*] starting script execution at: $time_map\n"

# Dump IAM users with Username and UserId

echo -e "[*] dumping IAM users with - username, userid \n"

aws iam list-users --output text --query 'Users[*].[UserName, UserId]'

echo -e "[*] dumping the list of usernames to text file : priv_users.txt \n"

aws iam list-users --output text --query 'Users[].[UserName]' > priv_users.txt


FILE=priv_users.txt

if [ -f "$FILE" ]; then
    echo -e "[*] users dumped to the $FILE \n"
fi

echo -e "\n[*] checking the administrator/root privileges for dumped IAM users \n"

while IFS= read -r line; do echo -e "$line\n"; aws iam list- attached-user-policies --user-name $line \
 --query 'AttachedPoli-cies[].PolicyName'; echo -e "\n--------------------------"; done < priv_users.txt

echo -e "\n[*] Administrator/Root privileges assessment completed.\n"

echo -e "[*]====Script Executed Successfully.=======\n"