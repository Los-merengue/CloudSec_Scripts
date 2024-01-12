#!/bin/bash

my_array=("value 1" "value 2" "value 3" "value 4")

letters=("A""B""C""D""E")
echo ${letters}

echo ${my_array[3]:0:7}

echo ${#my_array[2]}