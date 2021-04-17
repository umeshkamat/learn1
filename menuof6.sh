#!/bin/bash
echo "press number to enter into menu"
echo -e "1.search word\n2.edit file\n3.create softlink\n4.find location of file or dir\n5.checkname\n6.exit\n "
echo "select option you want to perform"
read opt
case $opt in
1)echo "enter the word"
	read word
	grep –l $word * > menulog
	if [ $? –eq 0 ];then
	echo "$word is found"
	cat menulog
	else
	echo "$word is not found"
	fi
	;;
2)echo "enter file you want to edit"
	read file
	if [ -f $file ];then
	echo "$file is a file"
	vi $file
	elif [ -d $file ];then 
	echo "$file is a dir"
	elif [ -l $file ];then 
	echo "$file is a link"
	else 
	echo "$file not exists"
	fi
	;;
3)echo "enter filename to create a softlink"
	read file
	if [ ! –f $file ];then 
	echo "file doesn‘t exits"
	exit 1
	fi
	echo "enter softlink name"
	read link
	if [ -l	$link ];then
	echo "$link already exists"
	exit 1
	fi
	ln –s $file $link
	;;
4)echo "enter file or dir name to find location"
	read name
	find . –iname $name > pent
	if [ $? –eq 0 ];then
	echo "$name is in below loc"
	cat pent
	else
	echo "$name is not found"
	fi
	;;
5) echo "check the name is a directory/file/link"
	read name
	if [ -L $name ];then echo "$name is a link"
	elif [ -f $name ];then echo "$name is a file"
	elif [ -d $name ];then echo "$name is a dir"
	else	
	echo "$name is doesnt exists"
	fi
	;;
*)exit 1
	;;
	esac
