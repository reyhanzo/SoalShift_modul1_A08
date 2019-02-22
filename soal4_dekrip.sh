#!/bin/bash

hurufkecil=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
hurufbesar=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

for file in /home/lutfiy/nomor4/*.txt
do
jam=${file:38:2}
let reverse=$jam*-1
namafile=${file:38:16}
kecil=${hurufkecil[$reverse]}
besar=${hurufbesar[$reverse]}

cat "$file" | tr '[a-z]' "[$kecil-za-$kecil]" | tr '[A-Z]' "[$besar-ZA-$besar]" >> /home/lutfiy/nomor4/dekrip/"$namafile".txt
done

