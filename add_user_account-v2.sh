#!/bin/bash

#  This script creates a new user credentials on the local system. 

if [[ "${UID}" -ne 0 ]]
then
    echo "Please run with sudo or as root"
    exit 1
fi

if [[ ${#} -eq 0 ]]
then
    echo "Usage:./add_new_user_account.sh USERNAME [COMMENTS]..."
    exit 1
fi

#Password generator for the new user

LOW='qwertyuiopasdfghjklzxcvbnm'
CAP='QWERTYUIOPASDFGHJKLZXCVBNM'
SPECIAL='!@#$%^&*()_+{}[];:?></\|-='
INTEGER='1234567890'

# You can change the length of the password by changing the interger value inside UNTIL condition
until [[ x -gt 5 ]]
do 
    ((x=x+1))
    # Get random character
    CHAR1=$(echo ${LOW} | fold -w1 | shuf | head -c1)
    CHAR2=$(echo ${CAP} | fold -w1 | shuf | head -c1)
    CHAR3=$(echo ${SPECIAL} | fold -w1 | shuf | head -c1)
    CHAR4=$(echo ${INTEGER} | fold -w1 | shuf | head -c1)
    ALL_CHARS=${CHAR1}${CHAR2}${CHAR3}${CHAR4}
    ARRAY+=${ALL_CHARS}
    # Randomization to change the order 
    RANDOM_PASSWORD=$(echo ${ARRAY} | fold -w1 | shuf | tr -d '\n')
done



#Create the username and shift comment parameter for correct output 
USER_NAME=${1}
useradd -m ${USER_NAME} -c "${*}" ; shift

if [[ "${?}" -ne 0 ]]
then
    echo "The ACCOUNT could not be created."
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
