#!/bin/bash
#Student: David Maison
#Assignment: 2 
#Write a shell script to concatenate lists together, and output the resulting list. Do not include any argument that is a sub-list of the entire list. Remove any redundant items.

#concatenate all arguments into an initial list before checking for duplicates
for TempItem in $@
do
	#handle colon as an argument
	if [ $TempItem == ":" ]
		then
			InitialListItem="."
		else
		
			#check if there is a colon with no preceeding value
			if [[ $TempItem == :* ]]
				then
					InitialListItem=".$TempItem"
				else
					
					#if there is a colon with no value after it
					if [[ $TempItem == *: ]]
						then
							InitialListItem="$TempItem."
						else
							#set the value to the argument
							InitialListItem=$TempItem 
					fi
			fi
	fi

	InitialList="$InitialList$InitialListItem:"
done

#split all entered colons from initial list and begin checking for duplicates
for RevisedListItem in `echo $InitialList | sed 's/:/\\n/g'`
do

	#reset Duplicate checking
	isDuplicate=0

	#check for duplicates
	for CheckDuplicate in `echo $RevisedList | sed 's/:/\\n/g'`
	do			
		if [ $RevisedListItem != $CheckDuplicate ] && [ $isDuplicate == 0 ]
			then
				isDuplicate=0 #is not duplicate		
			else
				isDuplicate=1 #is duplicate
		fi
	done
	
	#if it is not a duplicate, add to the revised list
	if [ $isDuplicate == 0 ]
		then
			RevisedList="$RevisedList$RevisedListItem:"
	fi
	
done

#create the final list, trimming a trailing ":" character
FinalList=`echo $RevisedList | sed 's/:\+$//'`
echo $FinalList