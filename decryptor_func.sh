# Get message from text file or from passed message
if [[ ! -s discretetextfile.txt ]]
then
	e_message=$1
else
	e_message=`cat discretetextfile.txt`
fi

numfields=`echo $e_message | grep -o ":" | wc -l`

#Set N (modulus) and D (private key) values
echo -n "Enter N and D values (e.g. 1 3): "
read n_val d_val

echo "Decrypting message..."

> discretetextfile.txt

for i in $(seq 1 $numfields)
do
	e_char=`echo $e_message | cut -d: -f$i`
	hugenum_1=`echo "($e_char^$d_val)" | bc`
	d_char=`echo "$hugenum_1 % $n_val" | bc`
	
	intoascii_1=`echo $d_char | awk '{printf("%c",$1)}'`
	
	if [[ "$intoascii_1" == " " ]]
	then
		echo -n " " >> discretetextfile.txt
	elif [[ "$intoascii_1" == "\n" ]]
	then
		echo -n "\n" >> discretetextfile.txt
	else
		echo -n $intoascii_1 >> discretetextfile.txt
	fi
done
