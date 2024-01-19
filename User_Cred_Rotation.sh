#!/bin/bash

:'

This is a useful script for obtaining the credentials (Password, certificate)
rotation policy.
Obtaining this information is useful because it will give an audit of how 
often the rotation of password and access keys occurs.

Author: Emeka Michael Nzeopara

'

time_map=$(date +"%m-%d-%Y");

echo -e "[*] Starting User Credentials Rotation Script execution at: $time_map\n"


#Dump the AccessKeys Information with Username, Access_Key_Id, and the Creation_Date.

echo -e "[*] Dumping the AccessKeys Information with - Username, Access Key Id and Creation Time\n"

aws iam list-access-keys --output table --query 'AccessKeyMetadata[*].[UserName,AccessKeyId,CreateDate]'


# Dump only the Creation Date of the AccessKeys 

echo -e "[*] Dumping the User's Creation Dates\n"

aws iam list-users --output text --query 'Users[*].[UserName,CreateDate]'

echo -e "[*]=====COMPLETED EXECUTION OF THE PROGRAM=====[*]\n"