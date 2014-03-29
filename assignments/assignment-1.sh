#!/bin/bash
#Student: David Maison
#Assignment: 1 (third attempt)
#Find all occurences of file(s) if first argument is -a, if not stop after first occurence of file is found

findall=0 #Start new assuming we're not looking for all occurences

#Determine whether or not to find all occurences of the file
if [ $1 == "-a" ]
	then
		findall=1
		shift
fi

#loop through current arguments
for file in $@
do
	filefound=0 # start new search assuming there is no file
	
	#look through $PATH and directories
	for P in `echo $PATH | sed -e 's/^:/.:/' -e 's/::/:.:/' -e 's/:$/:./' -e 's/:/ /g'`
		do
			if [ -s "$P/$file" ] || [ -d "$P/$file" ]
				then
				echo "$P/$file"
				filefound=1
			fi
			if [ $filefound == 1 ] && [ $findall == 0 ] # Exit if found the first occurence and not finding all
				then 
					exit
			fi
	done
	
	#look through current directory
	if [ $findall == 1 ] || [ $filefound == 0 ] && [ $findall == 0 ]
		then 
			if [ -s "$file" ] || [ -d "$file" ]
				then
				echo "$file"
				filefound=1
			fi
	fi
	
	#return error message and send to the console
	if [ $filefound != 1 ]
		then
			echo "$file NOT FOUND." >&2 #error message	
	fi
done