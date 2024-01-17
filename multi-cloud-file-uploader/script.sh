#!/bin/bash

my_array=("value 1" "value 2" "value 3" "value 4")

letters=("A""B""C""D""E")
echo ${letters}

echo ${my_array[3]:0:7}

echo ${#my_array[2]}

# File expressions

[[ -a ${file} ]] #True if file exists

[[ -b ${file} ]] #True if file exists and is a block special file

[[ -c ${file} ]] #True if file exists and is a character special file

[[ -d ${file} ]] #True if file exists and is a directory

[[ -e ${file} ]] #True if file exists

[[ -f ${file} ]] #True if file exists and is a regular file