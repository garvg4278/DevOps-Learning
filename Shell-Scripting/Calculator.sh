#!/bin/bash

echo "---------------------Welcome to the Calculator-----------------------------------"
echo 
echo
echo "Which operation do you want to perfom enter you choice: "
echo -e "a) Addition\nb) Subtraction\nc) Multiplicatoin\nd) Division\ne) Modulus"
read choice
read -p "Enter the values: " var1 var2
case $choice in 
	a)echo "Addition of the two numbers is: $(( var1+var2 ))";;
	b)echo "Subtravction of the two numbers is: $(( var1-var2 ))";;
	c)echo "Multiplication of the two numbers is: $(( var1*var2 ))";;
	d)if [[ $var2 -le 0 ]]
		echo "Division with denominator is not possible."
	 else
		echo "Division of the two numbers is: $(( var1/var2 ))"
	fi
	e)echo "Modulus of the two numbers is: $(( var1%var2 ))";;
esac
