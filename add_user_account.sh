#!/bin/bash

#  This script creates a new user on the local system. 

if [[ "${UID}" -ne 0 ]]
then
    echo "Please run with sudo or as root"
    exit 1
fi

read -p "Enter the new username: " USER_NAME
read -p "Enter the full name of the user: " FULL_NAME 
read -p "Enter the password for the new username: " PASSWORD

useradd -c "${FULL_NAME}" -m ${USER_NAME}

if [[ "${?}" -ne 0 ]]
then
    echo "The account could not be created."
    exit 1
fi

echo ${PASSWORD} | passwd --stdin ${USER_NAME}

if [[ "${?}" -ne 0 ]]
then
    echo "The password for the account could not be set."
    exit 1
fi

passwd -e ${USER_NAME}

echo
echo "Username:" 
echo ${USER_NAME}
echo
echo "Real Name:" 
echo ${FULL_NAME}
echo
echo "Password:"
echo ${PASSWORD}
echo

exit 0
