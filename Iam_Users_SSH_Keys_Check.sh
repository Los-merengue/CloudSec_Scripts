#! /bin/bash

:'
This script is useful for auditing the SSH Keys in the following ways:
- Which  IAM accounts are using SSH keys
- Which SSH keys are active and inactive
- The SSH keys rotation and others

It is essential to use this command so that unused credentials and resources
will be cleaned to prevent an extra vector of security flaws

It was originally authored by: Aditya K Sood

And I reengineered some of the syntax
'

time_map=$(date +"%m-%d-%Y");

echo -e "[*] starting script execution at: $time_map\n"

# Dump IAM users with Username and UserId
echo -e "[*] dumping IAM users with - username, userid \n"

aws iam list-users --output text --query 'Users[*].[UserName,UserId]'

echo -e "[*] dumping the list of usernames to text file : SSH_Keys_users.txt \n"

aws iam list-users --output text --query 'Users[*].[UserName]' > SSH_Keys_users.txt

FILE=SSH_Keys_users.txt

if [ -f "$FILE" ]; then
    echo -e "[*] users dumped to the $FILE \n"
fi

echo -e "\n[*] checking the SSH Keys status for dumped IAM users \n"

while IFS= read -r line; do echo -e "$line\n"; \ 
aws iam list-ssh-public-keys --user-name $line; \
echo -e "\n--------------------------"; done < SSH_Keys_users.txt

echo -e "\n[*] SSH keys assessment for IAM users completed.\n"

echo -e "[*]======Script Executed Successfully.========\n"