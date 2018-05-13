message=`cat discretetextfile.txt`
isprime_returnedval=2
isgcd_returnedval=10
e_val=2
d_val=0

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
	p=0
	temp_1=$1
	temp_2=$2
	while [[ $temp_2 -ne 0 ]]
	do
		p=$(($temp_1 % $temp_2))
		temp_1=$temp_2
		temp_2=$p
	done
	
	isgcd_returnedval=$temp_1
}

function encrypt_message() {
	n_val=$(($1 * $2))
	tot_val=$(((($1 - 1) * ($2 - 1))))
	
	if [[ $e_val -gt $tot_val ]]
	then
		isgcd $tot_val $e_val	
	else
		isgcd $e_val $tot_val
	fi
	
	while [[ $isgcd_returnedval -ne 1 ]]
	do
		e_val2=$(($e_val + 1))
		e_val=$e_val2
		isgcd $e_val $tot_val	
	done
	
	k=3
	d_val=$((((($k * $tot_val) + 1) / $e_val)))
	tracker=0
	if [[ $tracker -eq 0 ]]
	then
		while [[ $tracker -eq 0 ]]
		do
			if ! [[ $d_val =~ ^[0-9]+$ ]]
			then
				k_2=$(($k+1))
				k=$k_2
				d_val=$((((($k * $tot_val) + 1) / $e_val)))
				#awk "BEGIN {print ($d_val)}"	
			else
				#awk "BEGIN {print ($d_val)}"
				tracker=1
			fi
		done
	fi

	> discretetextfile.txt
	for j in $(seq 1 ${#message})
	do
		intoint=`printf '%d\n' "'${message:j-1:1}"`
		encrypt_char=$(((($intoint**$e_val) % $n_val)))
		echo $encrypt_char
		echo -n $encrypt_char >> discretetextfile.txt
	done
}

p_1=$((1 + $RANDOM % 1000))
is_prime $p_1
while [[ $isprime_returnedval -eq 0 ]]
do
	p_1=$((1 + $RANDOM % 1000))
	is_prime $p_1
done

isprime_returnedval=2 
p_2=$((1 + $RANDOM % 1000))
is_prime $p_2
while [[ $isprime_returnedval -eq 0 ]]
do
	p_2=$((1 + $RANDOM % 1000))
	is_prime $p_2
done

encrypt_message $p_1 $p_2
