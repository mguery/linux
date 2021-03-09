#! /bin/bash 
# this is a comment
echo "Hey world"
myvar="yo world"
echo "this is my 1st var -" $myvar
myothervar=$( ls /new-dir | wc -l )
echo There are $myothervar entries in the directory /new-dir 