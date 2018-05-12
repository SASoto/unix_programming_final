# krs_encryptor.sh
# Encrypts text message.

checkentered_message="Have you entered the message you would like to encrypt into the text file 'discretetextfile.txt' (y/n)?"
pleaseenter_message="Please enter the message you'd like to encrypt in the 'discretetextfile.txt'"
enterintofile_message="Would you like to enter the message into the text file manually or type it out below (m = manually / b = below)?"

echo "Welcome to the KRS Encryptor!"
echo "-----------------------------"

while :
do	
	echo $pleaseenter_message
	echo -n $checkentered_message
	read readyresponse

	if ((readyresponse == "y" || readyresponse == "Y"))
	then
	# call function
	else
		echo -n $enterintofile_message
		read manualordirectly 
		if ((manualordirectly == "b"))
		then
			echo -n "Enter your message: "
			read m_1
			
			# call function
		else
			exit
		fi
	fi
done
