#!/bin/bash

#  This script creates a new user credentials on the local system. 

if [[ "${UID}" -ne 0  ]]
then
    echo "Please run with sudo or as root" >&2
    exit 1 
fi

if [[ ${#} -eq 0 ]]
then
    echo "Usage: ${0} USERNAME [COMMENTS]..." >&2
    exit 1
fi

#Password generator for the new user

# Password length
LENGTH=8

LOW='qwertyuiopasdfghjklzxcvbnm'
CAP='QWERTYUIOPASDFGHJKLZXCVBNM'
SPECIAL='!@#$%^&*()_+{}[];:?></\|-='
INTEGER='1234567890'

until [[ x -ge ${LENGTH}  ]]
do
    # Get random number
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



#Create the username and shift comment parameters for the correct output 
USER_NAME=${1}
useradd -m ${USER_NAME} -c "${*}" ; shift


if [[ "${?}" -ne 0 ]]
then
    echo "The ACCOUNT could not be created." >&2
    exit 1
fi

#Set the password
echo ${RANDOM_PASSWORD} | passwd --stdin ${USER_NAME}

if [[ "${?}" -ne 0 ]]
then
    echo "The password for the account could not be set."
    exit 1
fi

#Force password change on first login.
passwd -e ${USER_NAME}

echo
echo "USERNAME:" 
echo ${USER_NAME}
echo
echo "PASSWORD:"
echo "${RANDOM_PASSWORD}"
echo
echo "COMMENTS:" 
echo "${*}"
echo
echo "HOST"
echo ${HOSTNAME}

exit 0
