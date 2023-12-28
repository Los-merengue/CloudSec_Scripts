#!/bin/bash

:'

This is a useful script for obtaining the credentials (Password, certificate)
rotation policy.
Obtaining this information is useful because it will give an audit of how 
often the rotation of password and access keys occurs.

'
time_map=$(date +"%m-%d-%Y");

echo -e "[*] Starting User Credentials Rotation Script execution at: $time_map\n"