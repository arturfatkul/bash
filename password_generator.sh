#!/bin/bash

LOW='qwertyuiopasdfghjklzxcvbnm'
CAP='QWERTYUIOPASDFGHJKLZXCVBNM'
SPECIAL='!@#$%^&*()_+{}[];:?></\|-='
INTEGER='1234567890'

# You can change the length of the password by changing the interger value inside UNTIL condition
until [[ x -gt 5 ]]
do 
    ((x=x+1))
    # Get random number from the variables
    CHAR1=$(echo ${LOW} | fold -w1 | shuf | head -c1)
    CHAR2=$(echo ${CAP} | fold -w1 | shuf | head -c1)
    CHAR3=$(echo ${SPECIAL} | fold -w1 | shuf | head -c1)
    CHAR4=$(echo ${INTEGER} | fold -w1 | shuf | head -c1)
    ALL_CHARS=${CHAR1}${CHAR2}${CHAR3}${CHAR4}
    ARRAY+=${ALL_CHARS}
    # Randomization to change the order 
    RANDOM_PASSWORD=$(echo ${ARRAY} | fold -w1 | shuf | tr -d '\n')
done

echo "${RANDOM_PASSWORD}"
