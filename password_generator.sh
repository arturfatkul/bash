#!/bin/bash

usage() {
    echo "Usage: ${0} [-l LENGTH]" >&2
    echo "Generate a random password."
    echo "  -l LENGTH  Specify the password length"
}

if [[ ${#} -eq 0 ]]
then
    usage
fi

LOW='qwertyuiopasdfghjklzxcvbnm'
CAP='QWERTYUIOPASDFGHJKLZXCVBNM'
SPECIAL='!@#$%^&*()_+{}[];:?></\|-='
INTEGER='1234567890'

while getopts l: OPTION
do
  case ${OPTION} in
    l) LENGTH=${OPTARG};;
    ?) usage ;;
   esac
done

until [[ x -ge ${LENGTH}  ]]
do
    # Get random number from the variables
    CHAR1=$(echo ${LOW} | fold -w1 | shuf | head -c1)
    CHAR2=$(echo ${CAP} | fold -w1 | shuf | head -c1)
    CHAR3=$(echo ${SPECIAL} | fold -w1 | shuf | head -c1)
    CHAR4=$(echo ${INTEGER} | fold -w1 | shuf | head -c1) 

    for i in ${CHAR1} ${CHAR2} ${CHAR3} ${CHAR4}
    do
        ((x=x+1))
        if [[ x -le ${LENGTH} ]]
        then
            ARRAY+=${i}
        fi
    done
done
    
# Randomization to change the order 
RANDOM_PASSWORD=$(echo ${ARRAY} | fold -w1 | shuf | tr -d '\n')

echo "${RANDOM_PASSWORD}"

exit 0
