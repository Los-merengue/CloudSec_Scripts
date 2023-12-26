#!/bin/bash

#enumerate all setting of active lambda function
aws Lambda get-function --region us-west-2 --function-name WriteS3Bucket --query 'Configuration.Role'

#enumerate the associated policy within the role
aws iam list-role-policies --region us-west-2 --role-name Lambda-administrative-access --query 'PolicyNames'


#retrieve the policy content 
aws iam get-role-policy --role-name serverless-Lambda-administrative-access --policy-name admin-privileges --query 'Policy-Document's