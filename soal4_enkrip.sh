#!/bin/bash

jam=`date "+%H"`
namafile=`date "+%H:%M %d-%m-%Y"`

hurufkecil=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
hurufbesar=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

kecil=${hurufkecil[$hour]}
besar=${hurufbesar[$hour]}

cat /var/log/syslog | tr '[a-z]' "[$kecil-za-$kecil]" | tr '[A-Z]' "[$besar-ZA-$besar]" > /home/lutfiy/nomor4/"$namafile".txt
