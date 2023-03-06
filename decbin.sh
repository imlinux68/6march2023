#!/bin/bash

function makedirs () {

echo "1. build directories"
cd ~
mkdir -p grocery/{Fruit/{Mango,Eggs},Vegetables/{Celery,Onion}}
echo "2. rename eggs to grapes"
mv grocery/Fruit/Eggs grocery/Fruit/Grapes

echo "3. wirte sentence"
echo "Fruit is not a dessert" > grocery/Fruit/Grapes/Banana

echo "4. Copy banana"
cat grocery/Fruit/Grapes/Banana |  tee grocery/Fruit/Mango/Banana grocery/Vegetables/Celery/Banana
tree grocery

echo "5. create Tomato in veg and move to fruit"
mkdir grocery/Vegetables/Tomato ; mv grocery/Vegetables/Tomato grocery/Fruit/

echo "6. Delete grocery"
rm -rvf grocery
}

function bindec () {
	read -p "Enter Binary Num:  " binum
	local result=`echo $((2#$binum))`
	echo -e "\n\n Your result is $result\n\n"
}

function decbin () {
	read -p "Enter Decimal Num:  " denum
	local result=`echo "obase=2; $denum" | bc `
	echo -e "\n\n Your result is $result\n\n"
}

function calc () {
while [ 1 = 1 ]
	do
		echo "*************************"
		echo "What you wanna to convert"
		echo "*************************"
		echo "1. Decimal to Binary"
		echo "2. Binary to Decimal"
		echo "3. Exit"
		read -p "Make you choice now: " c
		case $c in
			1) decbin ;;
			2) bindec ;;
			3) exit 5 ;;
			*) echo "1-3 ONLY!" ; sleep 3 ;;
		esac
	done
}
calc
