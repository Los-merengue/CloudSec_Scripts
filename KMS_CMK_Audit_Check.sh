#!/bin/bash

:'

In a case of using data encryption, a service in AWS that can be used to achieve
this is KMS. KMS generate a Customer Managed Key (CMK) which is guided by 
Hardware Security Module (HSM) ny KMS. 

There is need to check the policy that guides the users that have access to this
CMK. And that is what this script is used for.

This script is used to audit the users and resources that have access to the KMS
and as a consquence of that, an access to the CMK. 

The essence of this is to prevent leakage of keys during data encryption. Which can be
used by KMS.

Author: Emeka Michael Nzeopara

'

time_map=$(date +"%m-%d-%Y");

echo -e "[*] Starting script execution at: $time_map\n"

# Obtaining the KMS TargetKeyId with the below command

echo -e "[*]Getting the KMS Target Key ID /n"

aws kms list-aliases --region us-west-1 --query 'Aliases[*].TargetKeyId' --text > KMS.txt

FILE=KMS.txt

# Dump the Policy that is used with this KMS Target Key

echo -e "[*] Getting the Policy of the KMS Key"

aws kms get-key-policy --region us-west-1 --key-id $FILE --policy-name default

echo -e "[*]=====COMPLETED EXECUTION OF THE PROGRAM=====[*]\n"