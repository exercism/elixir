#!/bin/bash

if [ -d "./exercises/$1-bkp" ] && [ -d "./exercises/$1" ]
then
    echo "RESETING \"$1\" TO BASE"

    rm -rf "./exercises/$1"
    mv "./exercises/$1-bkp" "./exercises/$1"
else
    echo "NOTHING TO RESET"
fi