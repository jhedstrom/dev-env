# Select random word from dictionary
#
# Use 5-7 words for strong passwords

filename=/home/jonathan/bin/diceware8k.txt

if test -z "$1"
then
  for i in `seq 1 4`;
    do
      if (( $i < 4 ))
      then
        echo -n "$(sed -n $[ $RANDOM % $(wc -l < $filename) + 1 ]p $filename)."
      else
        echo "$(sed -n $[ $RANDOM % $(wc -l < $filename) + 1 ]p $filename)"
      fi
    done

else
  for i in `seq 1 $1`;
    do
      if (( $i < $1 ))
      then
        echo -n "$(sed -n $[ $RANDOM % $(wc -l < $filename) + 1 ]p $filename)."
      else
        echo "$(sed -n $[ $RANDOM % $(wc -l < $filename) + 1 ]p $filename)"
      fi
    done
fi
