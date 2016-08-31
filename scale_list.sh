#!/bin/bash

id=0
option=$1


view_list(){
	filename=$1
	__rows=($(wc -l $filename))
	__records=$((${__rows[0]}-1))
	__items=$((${__rows[0]}+1))

	#Heading 
	head -n 1 $filename	

	for (( i=2; $i < ${__items[0]}; i++ ))
	do
		id=$((id+1))
		printf "${id}|`head -n $i $filename | tail -n 1 | tr -d '\"' | tr ',' '|'`\n"
	done
	echo "Total Items [ ${__records[0]} ]"
	}	

help_menu(){
	printf "\033[33mBlacklist\033[0m \033[32mD\033[0m\033[31mB\033[0m v1.0\n"
	printf "\033[36mView Entries\033[0m\t[\033[32m -v, -view, --view\033[0m ] [ DATABASE_FILENAME ]\n"
	}

case $option in
	-v|-view|--view) 
	if [ -e "$2" ];
	then
		view_list $2
	else
		printf "\033[35mError:\033[0m\tUnable to find filename \033[45m'$2'\033[0m\n" 
	fi
	;;	
	-h|-help|--help) help_menu;;
	*) printf "\033[35mError:\033[0m\tMissing or invalid parameter was entered!\n"
	printf "\033[33mTry\033[0m \033[45m'-h'\033[0m \033[35mto view options.\033[0m\n"
	;;
esac
