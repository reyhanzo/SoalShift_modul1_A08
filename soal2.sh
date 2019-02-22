#!/bin/bash

#(a)
echo "2a)"
awk -F ',' '{if($7 -eq '2012') a[$1]+=$10} END {for(x in a) print a[x] , x}' WA_Sales_Products_2012-14.csv | sort -nr | head $

#(b)
echo "2b)"
awk -F, '{if($1 -eq "United States" && $7 == "2012") a[$4]+=$10} END {for(x in a) print a[x], x}' WA_Sales_Products_2012-14.c$

#(c)
echo "2c)"
echo "Personal Accesories : "
awk -F, '{if($1 == "United States" && $7 == "2012" && $4 == "Personal Accessories") a[$6]+=$10} END {for(x in a) print a[x],x$

echo "Camping Equipment :"
awk -F, '{if($1 == "United States" && $7 == "2012" && $4 == "Camping Equipment") a[$6]+=$10} END {for(x in a) print a[x],x}' $

echo "Outdoor Protection : "
awk -F, '{if($1 == "United States" && $7 == "2012" && $4 == "Outdoor Protection") a[$6] += $10} END {for(x in a) print i[x],x$
