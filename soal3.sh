#!/bin/bash

name='password'
number=0
suffix=1
while test -e "$name$suffix.txt";
do
(( ++number ))
suffix="$(printf -- '%d' "$number")"
done

PASS=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)
echo "$PASS" >> "$name$suffix.txt"
