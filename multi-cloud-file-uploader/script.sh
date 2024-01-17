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

[[ -h ${file} ]] #True if file exists and is a symbolic link

[[ -r ${file} ]] #True if file exists and is readable

[[ -s ${file} ]] #True if file exists and has a size greater than zero

[[ -w ${file} ]] #True if file exists and is writable

[[ -x ${file} ]] #True if file exists and is executable

[[ -L ${file} ]] #True if file exists and is a symbolic link

[[ -v ${varname} ]] #True if the shell variable varname is set (has been assigned a value)

[[ -z ${string} ]] #True if the length of the string is zero

[[ -n ${string} ]] #True if the length of the string is non-zero