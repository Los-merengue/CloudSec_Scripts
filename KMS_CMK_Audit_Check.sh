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