#!/bin/bash

:'

This is a useful script for making the configuration of authenticity mechanism
is done on the client side of the API gateway e.g SSL/TLS in order to make sure
that the request to the backend system is coming from the right source that is
required to perform this operation.

If no clientCertificateId is given after the second command it means the SSL/TLS
certificate was not configured and this can result to a vulnerability because 
it implies that authenticity can be forged.

Obtaining this information is useful for audit and it prevent forgery of request
from an unauthentic user.

Author: Emeka Michael Nzeopara

'
time_map=$(date +"%m-%d-%Y");

echo -e "[*] Starting API Gateway Client-Side Certificates For Authenticity Script execution at: $time_map\n"

#Dump the API Gateway ID Information.

echo -e "[*] Dumping the API Gateway ID\n"

aws apigateway get-rest-apis --region us-west-2 --output json --query 'items[*].id'




# Dump only the Creation Date of the AccessKeys 

echo -e "[*] Dumping the User's Creation Dates\n"

aws iam list-users --output text --query 'Users[*].[UserName,CreateDate]'

echo -e "[*]=====COMPLETED EXECUTION OF THE PROGRAM=====[*]\n"