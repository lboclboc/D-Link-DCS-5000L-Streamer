#!/bin/bash

source env.sh

process() {
    while true; do
        read length
        read date
        read type
        read empty
        length=$(echo $length | sed -e 's/.* //' -e $'s/\r$//')
        dd bs=1 count=$length
    done
}

PW=$(echo -n $USER:$PASSWORD | base64)
curl --silent -H "User-Agent: user" -H "Authorization: Basic $PW"\
    http://192.168.69.73/mjpeg.cgi 
