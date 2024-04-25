#!/bin/sh
#encrypt files with aes-256-cbc cipher using openssl


if [ "$1" = "-e" ]; #encrypt files
then
    if [ -f "$2" ];
    then
		openssl aes-256-cbc -a -e -salt -pbkdf2 -in "$2" -out "$2.aes"
    else
       echo "This file does not exist!" 
    fi

elif [ "$1" = "-d" ]; #decrypt files
then
    if [ -f "$2" ];
    then
        openssl aes-256-cbc -a -d -salt -pbkdf2 -in "$2" -out "$2.decrypted"
    else
        echo "This file does not exist!" 
    fi
	

elif [ "$1" = "--help" ]; #show help
then
    echo "This software uses openssl for encrypting files with the aes-256-cbc cipher"
    echo "Usage for encrypting: ./aes.sh -e [file]"
    echo "Usage for decrypting: ./aes.sh -d [file]"
else
    echo "This action does not exist!"
    echo "Use ./aes.sh --help to show help."
fi
