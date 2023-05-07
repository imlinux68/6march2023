#!/bin/bash

function makedirs() {
echo "1. create dirs"
mkdir -p ~/grocery/{fruit/{apple,potato,startpatterns},vegetables/{tomato,corn}}

echo "2.1 fix start patterns to banana"
mv ~/grocery/fruit/startpatterns ~/grocery/fruit/banana

echo "2.2 move potato to vegetables"
mv ~/grocery/fruit/potato ~/grocery/vegetables/

echo "2.3 write banana fact"
echo "banana fact" >  ~/grocery/fruit/banana/banana

echo "3. create secret tomato receip in tomato"
mkdir ~/grocery/secret/tomato
touch ~/grocery/secret/tomato/Receipe

echo "4.remove w perms"
chmod go -w ~/grocery/secret/tomato/Receipe

echo "5 create user tomato thief"
sudo useradd tomatothief
echo "5.1 dont give rwx perms to tomatothief"
setfact -m u:tomatothief: ~/grocery/secret/tomato/Receipe
echo "5.2 check the perms"
cd ~/grocery/secret/tomato
su tomatothief
cat Receipe
whoami
read -p "are you tomatothief user? y/n? " ans
	if [[ $ans == "y" ]]
		then
			exit
	fi

echo "6.delete grocery"
rm -rvf ~/grocery

echo "7. delete new user"
sudo userdel tomatothief
}










