#!/bin/bash
option=0
until [ $option -eq 5 ];
do

echo "Do you want to:
1. search for a land
2. add land
3. change the status of a land to sold
4. get seller info
5. exit"


read option

if [ $option -eq 1 ];
then
    read -p "Enter the search Neighborhood: " neighborhood
    read -p "Enter the search Direction: " direction
    read -p "Enter the search RealEstateType: " RealEstateType

awk -F ',' -v neighborhood="$neighborhood" -v direction="$direction" -v RealEstateType="$RealEstateType" '$0 ~ neighborhood && $0 ~ direction && $0 ~ RealEstateType { print $0 }' Land.csv
elif [ $option -eq 2 ];
then
    IFS="," read -p "Enter neighborhood, direction, region, realestate type, space, price, Seller ID and Land ID separated by a comma: " NEIGHBORHOOD DIRECTION REGION TYPE SPACE PRICE SELLERID LANDID
    echo ‘$NEIGHBORHOOD,$DIRECTION,$REGION,$TYPE,$SPACE,$PRICE,$SELLERID,$LANDID,Available’ >> Land.csv
elif [ $option -eq 3 ];
then
    read -p "Enter the land ID to change it status to sold: " SLANDID
    sed -i'' "s/\($SLANDID\),.*/\1,Sold/" Land.csv
elif [ $option -eq 4 ];
then
    read -p "Enter the seller ID to to get info: " SSELLERID
    awk -F',' -v ssellerID="$SSELLERID" '{ if($1 == ssellerID) {print $2,$3,$4} }' Seller.csv
elif [ $option -eq 5 ];
then
    echo "exit"
else
    echo "wrong option"
fi
done
