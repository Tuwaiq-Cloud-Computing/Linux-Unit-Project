#! /bin/bash


echo "Enter the first number:"
read num1


echo "Enter the second number:"
read num2

echo "Choose an operation:"
echo "1. Add"
echo "2. Subtract"
echo "3. Multiply"
echo "4. Divide"
read choice


if [ $choice -eq 1 ]; then
  result=$(($num1 + $num2))
  operator="+"
elif [ $choice -eq 2 ]; then
  result=$(($num1 - $num2))
  operator="-"
elif [ $choice -eq 3 ]; then
  result=$(($num1 * $num2))
  operator="*"
elif [ $choice -eq 4 ]; then 
  result=$(($num1 / $num2))
  operator="/"
else
   echo"invalid number"
fi

 echo $num1 $operator $num2 = $result 




