# krs_encryptor.sh
# Encrypts/decrypts text message.

checkentered_message_d="Have you entered the message you would like to decrypt into the text file 'discretetextfile.txt' (y/n)?"
checkentered_message_e="Have you entered the message you would like to encrypt into the text file 'discretetextfile.txt' (y/n)?"
encryptdecrypt_message="Would you like to encrypt or decrypt a message or exit the program (e = encrypt / d = decrypt / x = exit) (*encrypt is the default setting)?"
enterintofile_message="Would you like to enter the message into the text file manually or type it out below (m = manually / b = below) (*manually is the default setting)?"
pleaseenter_message_d="Please enter the message you'd like to decrypt in the 'discretetextfile.txt'"
pleaseenter_message_e="Please enter the message you'd like to encrypt in the 'discretetextfile.txt'"
sucess_message_d="Your message has been SUCCESSFULLY decrypted."
sucess_message_e="Your message has been SUCCESSFULLY encrypted."
fileempty_message="It appears that the file is empty."

echo "Welcome to the KRS Encryptor/Decryptor!"
echo "-----------------------------"

while :
do
	# asks user to encrypt message or decrypt
	echo -n $encryptdecrypt_message
	read eordresponse
	
	# EXIT
	# -----------------------------------------
	if [[ $eordresponse == x ]]
	then
		exit

	# DECRYPT
	# -----------------------------------------
	elif [[ $eordresponse == d ]]
	then
		# asks user if they've got their message ready
                echo $pleaseenter_message_d
                echo -n $checkentered_message_d
                read readyresponse

                # message is ready
                if [[ $readyresponse == y ]]
                then
			# if file is still empty
			if [[ ! -s discretetextfile.txt ]]
			then
				echo $fileempty_message
				echo -n $enterintofile_message
                        	read manualordirectly

                        	if [[ $manualordirectly == b ]]
                        	then
                                	echo -n "Enter your message: "
                                	read m_1

                                	# call decryptor function, pass message as parameter
                                	
					echo $sucess_message_d
                        	else
                                	exit 0
                        	fi
			else
                        	# call decryptor function
				
				echo $sucess_message_d
			fi
                else
                        echo -n $enterintofile_message
                        read manualordirectly

                        if [[ $manualordirectly == b ]]
                        then
                                echo -n "Enter your message: "
                                read m_1

                                # call decryptor function, pass message as parameter
				
				echo $sucess_message_d
                        else
                                exit 0
                        fi
                fi

	# ENCRYPT
	# -------------------------------------
	else
		# asks user if they've got their message ready	
		echo $pleaseenter_message_e
		echo -n $checkentered_message_e
		read readyresponse

		# message is ready
		if [[ $readyresponse == "y" ]]
		then
			# if file is still empty
                        if [[ ! -s discretetextfile.txt ]]
                        then
                                echo $fileempty_message
                                echo -n $enterintofile_message
                                read manualordirectly
                                if [[ $manualordirectly == "b" ]]
                                then
                                        echo -n "Enter your message: "
                                        read m_1

                                        # call encryptor function, pass message as parameter
                                        
					echo $sucess_message_e
                                else
                                        exit 0
                                fi
                        else
                                # call encryptor function
                                
				echo $sucess_message_e
                        fi
		else
			echo -n $enterintofile_message
			read manualordirectly 
			if [[ $manualordirectly == "b" ]]
			then
				echo -n "Enter your message: "
				read m_1
				
				# call encryptor function, pass message as parameter
				
				echo $sucess_message_e
			else
				exit 0
			fi
		fi
	fi
done
