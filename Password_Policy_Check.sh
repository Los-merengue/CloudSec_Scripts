#!/bin/bash

:'

This is a useful script for obtaining the Password Policy configuration

Obtaining this information is useful because it will give an audit of how 
password are being implemented within the cloud environment.

This is essential to prevent the likes of Bruteforce Attacks.

Author: Emeka Michael Nzeopara

'

time_map=$(date +"%m-%d-%Y");

echo -e "[*] Starting Password Policy Check Script execution at: $time_map\n"


# Dumping the Password Policy  .

echo -e "[*] Getting the Password Policy Configuration\n"
