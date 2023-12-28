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

aws apigateway get-rest-apis --region us-west-2 --output text --query 'items[*].id' > API_id.txt

# Getting the Stages and Information of the API in these stages

while IFS= read -r line; do echo -e "$line\n"; aws apigateway get-stages --region us-west-2 --rest-api-id $line \
 --query 'item[?(stageName=='Staging')].clientCertificateId'; echo -e "\n--------------------------"; done < API_id.txt


while IFS= read -r line; do echo -e "$line\n"; aws apigateway get-stages --region us-west-2 --rest-api-id $line \
 --query 'item[?(stageName=='Development')].clientCertificateId'; echo -e "\n--------------------------"; done < API_id.txt



echo -e "[*]=====COMPLETED EXECUTION OF THE PROGRAM=====[*]\n"