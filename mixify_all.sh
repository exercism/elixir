#!/bin/bash

EXERCISES=$(cd exercises; ls -d *)

for EXERCISE in $EXERCISES
do
    echo "* Attempting mixify: ${EXERCISE}"
    ./mixify_exercise.sh ${EXERCISE}
done

