#!/usr/bin/zsh

read "?Name file: " file

while read name; do
	if [ -z $name ]; then
		echo "Empty: Continuing"
		continue
	fi
	name=${(L)name}
	name=$(sed 's| |.|g' <<< $name)
	name1=$(cut -d '.' -f 1 <<< $name)
	name2=$(cut -d '.' -f 2 <<< $name)
	echo "Name: $name | Name1: $name1 | Name2: $name2"
	echo ${(C)name1}.${(C)name2} >> staff.txt
	echo ${(L)name1}.${(L)name2} >> staff.txt
	echo $name1 >> staff.txt
	echo ${(C)name1} >> staff.txt
done < $file
