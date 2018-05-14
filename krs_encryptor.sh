# krs_encryptor.sh
# 5-14-18
# Encrypts/decrypts plaintext messages using the RSA algorithm.
# Built by Fordham Rose Hill students Kat Lego, Ronald Hung, and Saul Soto

<<<<<<< HEAD
=======

>>>>>>> 7131fbf00230b5a83cea7126fb9cb14c61da4d45
#--------------------------------------
#Functions for sending text and email

#sendEmailTo: sendEmailTo katlegolpk@me.com file.txt
function sendEmailTo() {
	#Storing email address to send to
	emailAddress=$1
<<<<<<< HEAD
	file=$2
	n_val=$3
	d_val=$4
	echo "N: $n_val D: $d_val"
	echo "Sending $file to $emailAddress"
	
	echo "Totally Generic Message: $n_val $d_val" | mailx -s"Confidential" -a "$file" $emailAddress
=======

	file=$2

	echo "Sending $file to $emailAddress"
	
	mailx -s"Confidential" -a $file $emailAddress
>>>>>>> 7131fbf00230b5a83cea7126fb9cb14c61da4d45

	#Inform that email has been sent
	echo "Email has been sent to $emailAddress"
}

#sendTextTo: sendTextTo 1234567891 file.txt
function sendTextTo() {
        phoneNumber=$1
<<<<<<< HEAD
        file=$2
	n_val=$3
        d_val=$4
        
	providerIncorrect=1
=======
        file=$(cat $2)


        echo "Sending $file to $phoneNumber"

        providerIncorrect=1
>>>>>>> 7131fbf00230b5a83cea7126fb9cb14c61da4d45

        while [[ $providerIncorrect -eq 1 ]]
        do
                echo -n "What is the phone numbers network provider (eg T-Mobile)? "
                read provider

                case $provider in
                        T-Mobile)
<<<<<<< HEAD
                                echo "Sending text to T-Mobile number $phoneNumber"
                                mailx -s "Confidential: $n_val $d_val" $phoneNumber@tmomail.net < "$file"
=======
                                echo "Sending text to T-Mobile number"
                                echo $file | mailx $phoneNumber@vtmomail.com
>>>>>>> 7131fbf00230b5a83cea7126fb9cb14c61da4d45
                                providerIncorrect=0
                                ;;
                        Verizon)
                                echo "Sending text to Verizon number"
<<<<<<< HEAD
                                mailx -s "Confidential: $n_val $d_val" $phoneNumber@vtext.com < "$file"
=======
                                echo $file | mailx $phoneNumber@vtmomail.com
>>>>>>> 7131fbf00230b5a83cea7126fb9cb14c61da4d45
                                providerIncorrect=0
                                ;;
                        Sprint)
                                echo "Sending text to Sprint number"
<<<<<<< HEAD
                                mailx -s "Confidential: $n_val $d_val" $phoneNumber@messaging.sprintpcs.com < "$file"
=======
                                echo $file | mailx $phoneNumber@vtmomail.com
>>>>>>> 7131fbf00230b5a83cea7126fb9cb14c61da4d45
                                providerIncorrect=0
                                ;;
                        AT'&'T)
                                echo "Sending text to AT&T number"
<<<<<<< HEAD
                                mailx -s "Confidential: $n_val $d_val" $phoneNumber@txt.att.net < "$file"
=======
                                echo $file | mailx $phoneNumber@txt.att.net
>>>>>>> 7131fbf00230b5a83cea7126fb9cb14c61da4d45
                                providerIncorrect=0
                                ;;
                        *)
                                echo "Provider entered has an error"
                                echo "Options: T-Mobile"
                                echo -e "\t AT&T"
                                echo -e "\t Sprint"
                                echo -e "\t Verizon"
                                ;;
                esac
        done

        echo "Text has been sent to $phoneNumber"       
}

<<<<<<< HEAD
function sendMessage(){
	n_val=$1
	d_val=$2
	messageIncorrect=1
	filename="discretetextfile.txt"
	echo -n $send_message_eort
	read message_check

	while [[ $messageIncorrect -eq 1 ]]
	do
		case $message_check in
			 e)
				echo -n "Please enter your email (e.g. email@gmail.com): "
				read emailAddress
				sendEmailTo $emailAddress $filename $n_val $d_val
				messageIncorrect=0
				;;
		 	t)
				echo -n "Please enter your phone number (e.g. 1234567891): "
				read phoneNumber
				sendTextTo $phoneNumber $filename $n_val $d_val
				messageIncorrect=0
				;;
		 	x)
				echo "Goodbye!"
				exit 0
				;;
		 	*)
				echo -n "Input Invalid, please enter again: "
				read message_check
				messageIncorrect=1
				;;
			esac
	done
}	

checkentered_message_d="Have you entered the message that you would like to decrypt into the text file 'discretetextfile.txt' (y/n)?"
checkentered_message_e="Have you entered the message that you would like to encrypt into the text file 'discretetextfile.txt' (y/n)?"
=======

checkentered_message_d="Have you entered the message you would like to decrypt into the text file 'discretetextfile.txt' (y/n)?"
checkentered_message_e="Have you entered the message you would like to encrypt into the text file 'discretetextfile.txt' (y/n)?"
>>>>>>> 7131fbf00230b5a83cea7126fb9cb14c61da4d45
encryptdecrypt_message="Would you like to encrypt or decrypt a message or exit the program (e = encrypt / d = decrypt / x = exit) (*encrypt is the default setting)?"
enterintofile_message="Would you like to enter the message into the text file manually or type it out below (m = manually / b = below) (*manually is the default setting)?"
pleaseenter_message_d="Please enter the message that you'd like to decrypt in the 'discretetextfile.txt'"
pleaseenter_message_e="Please enter the message that you'd like to encrypt in the 'discretetextfile.txt'"
sucess_message_d="Your message has been SUCCESSFULLY decrypted."
sucess_message_e="Your message has been SUCCESSFULLY encrypted."
fileempty_message="It appears that the file is empty."
send_message_eort="Do you want to send your encrypted message using email or a text message (e = email / t = text message / x=exit)?"

echo
echo "Welcome to the KRS RSA Encryptor/Decryptor!"
echo "-----------------------------"
echo

while :
do
	# asks user to encrypt message or decrypt
	echo -n $encryptdecrypt_message
	read eordresponse
	
	# EXIT
	# -----------------------------------------
	if [[ $eordresponse == x ]]
	then
		echo "Terminating program."
		exit 0

	# DECRYPT
	# -----------------------------------------
	elif [[ $eordresponse == d ]]
	then
		# asks user if they've got their message ready
                echo $pleaseenter_message_d
                echo -n $checkentered_message_d
                read readyresponse
		echo

                # message is ready
                if [[ $readyresponse == y ]]
                then
			# if file is still empty
			if [[ ! -s discretetextfile.txt ]]
			then
				echo $fileempty_message
				echo -n $enterintofile_message
                        	read manualordirectly
				echo

                        	if [[ $manualordirectly == b ]]
                        	then
					> discretetextfile.txt
                                	echo -n "Enter your message: "
                                	read m_1

                                	# call decryptor function, pass message as parameter
					sh decryptor_func.sh $m_1
					echo
					echo $sucess_message_d
					echo
                        	else
					echo "Terminating program."
                                	exit 0
                        	fi
			else
                        	# call decryptor function
				echo "Keep in mind that discretetextfile.txt might contain an already encrypted message"
				echo

				sh decryptor_func.sh
				echo
				echo $sucess_message_d
				echo
			fi
                else
                        echo -n $enterintofile_message
                        read manualordirectly
			echo

                        if [[ $manualordirectly == b ]]
                        then
				> discretetextfile.txt
                                echo -n "Enter your message: "
                                read m_1

                                # call decryptor function, pass message as parameter
				sh decryptor_func.sh $m_1
				echo
				echo $sucess_message_d
				echo
                        else
			 	echo "Terminating program."
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
		echo

		# message is ready
		if [[ $readyresponse == "y" ]]
		then
			# if file is still empty
                        if [[ ! -s discretetextfile.txt ]]
                        then
                                echo $fileempty_message
                                echo -n $enterintofile_message
                                read manualordirectly
				echo

                                if [[ $manualordirectly == "b" ]]
                                then
					> discretetextfile.txt
                                        echo -n "Enter your message: "
                                        read m_1

                                        # call encryptor function, pass message as parameter
                                        . ./encryptor_func.sh $m_1
					echo $sucess_message_e
					echo

					# call send email/text function with n and d values
					sendMessage $tempn $tempd
					echo
                                else
					echo "Terminating program."
                                        exit 0
                                fi
                        else
                                # call encryptor function
                                . ./encryptor_func.sh
				echo $sucess_message_e
				echo

				sendMessage $tempn $tempd
				echo
                        fi
		else
			echo -n $enterintofile_message
			read manualordirectly
			echo

			if [[ $manualordirectly == "b" ]]
			then
				> discretetextfile.txt
				echo -n "Enter your message: "
				read m_1
				
				# call encryptor function, pass message as parameter
				. ./encryptor_func.sh $m_1
				echo $sucess_message_e
				echo

				sendMessage $tempn $tempd
				echo
			else
				echo "Terminating program."
				exit 0
			fi
		fi
	fi
done
