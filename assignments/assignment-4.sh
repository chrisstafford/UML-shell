#!/bin/bash
#Student: David Maison
#Assignment: 4
#Write a shell script to send a customized mail message to the users listed on the command line by login (user) name, only if they are currently logged on.

#catch error message
if [ -z "$1" ]
	then
		echo "ERROR: You must enter at least one recipient to use execute this script."  >&2 #error message	
		exit
fi

#loop through entire list of recipients
for Recipient in $@
do

#create custom message for each recipient
Message="Hello $RecipientFullName,
\n\n****** This email is automatically generatated by `whoami`  ******
\n\nMy instructor requires that I send this message as part of an assignment for class 92.312. The current time and date is `date`.
\n\nHave a nice day.
\n\n`whoami`"

done

echo -e $Message #remove later