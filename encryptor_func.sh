# Get message from text file or from passed message
if [[ ! -s discretetextfile.txt ]]
then
        message=$1
else
        message=`cat discretetextfile.txt`
fi

isprime_returnedval=2
isgcd_returnedval=10
e_val=2
d_val=0
n_val=0
tot_val=0

function is_prime() {
    if [[ $1 -eq 2 || $1 -eq 3 ]]
    then
        isprime_returnedval=1
	return 1
    fi

    if [[ $(($1 % 2)) -eq 0 || $(($1 % 3)) -eq 0 ]]
    then
        isprime_returnedval=0
	return 1
    fi
    
    i=5 
    w=2

    while [[ $(($i * $i)) -le $1 ]]
    do
        if [[ $(($1 % $i)) -eq 0 ]]
        then
            	isprime_returnedval=0
		return 1
        fi
	i_2=$(($i + $w))
        i=$i_2
	w_2=$((6 - $w))
        w=$w_2
    done

    isprime_returnedval=1
}

function isgcd() {
	m=$1
	b=$2
	while [[ $m -ne 0 ]]
	do
		x=$(($1 % $m))
		y=$(($b % $m))
		
		if [[ $x -eq 0 && $y -eq 0 ]]
		then
			isgcd_returnedval=$m
			break
		fi
		
		tempm=$(($m - 1))
		m=$tempm
	done
}

function encrypt_message() {
	tot_val=$(((($1 - 1) * ($2 - 1))))
	if [[ $e_val -gt $tot_val ]]
	then
		isgcd $tot_val $e_val	
	else
		isgcd $e_val $tot_val
	fi
	
	# if numbers are not coprime/relatively prime
	while [[ $isgcd_returnedval -ne 1 ]]
	do
		e_val2=$(($e_val + 1))
		e_val=$e_val2
        	
		if [[ $e_val -gt $tot_val ]]
        	then
                	isgcd $tot_val $e_val
        	else
                	isgcd $e_val $tot_val
        	fi
	done
	
	k=3
	newdval_1=$(((($k * tot_val)+1)))
	d_val=`echo "scale = 5; $newdval_1 / $e_val" | bc`
	tracker=0
	numadding=0.4
	if [[ $tracker -eq 0 ]]
	then
		while [[ $tracker -eq 0 ]]
		do
			checkdeci=`echo "$d_val" | cut -d. -f2`
			if [[ $checkdeci == "00000" ]]
			then
				tracker=1
				d_val2=$d_val
				d_val=`printf "%.0f" $d_val2`
				break
			else
                                k_2=$(($k+1))
                                k=$k_2
				newdval_1=$(((($k * tot_val)+1)))
                                d_val=`echo "scale = 5; $newdval_1 / $e_val" |bc`
			fi
		done
	fi

	> discretetextfile.txt
	for j in $(seq 1 ${#message})
	do
		intoint=`printf '%d\n' "'${message:j-1:1}"`
		encrypt_char=`echo "(($intoint^$e_val) % $n_val)" | bc`
		echo -n "$encrypt_char:" >> discretetextfile.txt
	done
	
	echo
}

while [[ $n_val -lt 255 ]]
do
	p_1=$((1 + $RANDOM % 100))
	is_prime $p_1
	while [[ $isprime_returnedval -eq 0 ]]
	do
		p_1=$((1 + $RANDOM % 10))
		is_prime $p_1
	done

	p_2=$((1 + $RANDOM % 100))
	is_prime $p_2
	while [[ $isprime_returnedval -eq 0 ]]
	do
		p_2=$((1 + $RANDOM % 10))
		is_prime $p_2
	done

	n_val=$(($p_1 * $p_2))
done

echo "Encrypting message..."
encrypt_message $p_1 $p_2

echo "N = $n_val D = $d_val"
tempn=$n_val
tempd=$d_val

export tempn
export tempd
#sh decryptor_func.sh
