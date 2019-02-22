#!/bin/bash
a=1

cd ~/Downloads

unzip nature.zip

for file in nature/*.jpg
do
base64 -d $file | xxd -r > "images/"$a"_pic.jpg"
a=$((a+1))
rm file
done

