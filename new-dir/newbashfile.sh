#!/bin/bash 
# write a short desc about this file
# Marj 3/8/21

# this is a comment
:'multi-line comment here
another line goes here'

echo "Hey world" # can write another comment here
myvar="yo world"
echo "this is my 1st var -" $myvar
myothervar=$( ls /new-dir | wc -l )
echo There are $myothervar entries in the directory /new-dir 

# sample script and notes from https://ryanstutorials.net
echo My name is $0 and I have been given $# command line arguments
echo Here they are: $*
echo And the 2nd command line argument is $2
:'$0 - The name of the script.
$1 - $9 - Any command line arguments given to the script. $1 is the first argument, $2 the second and so on.
$# - How many command line arguments were given to the script.
$* - All of the command line arguments.

run this - ./newbashfile.sh bob fred sally'

# another sample script
lines=`cat $1 | wc -l` # this saves input into a var
echo The number of lines in the file $1 is $lines
:'run - ./newbashfile.sh newcopy2.txt'