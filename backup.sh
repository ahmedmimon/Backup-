#!/bin/bash
<<comment
	#This Script To Backup Files and location
	#The File Will Be search From The User's Home Dir. and only can be Backuped to a Dir. within home dir.
comment

read -p "Which file types do you want to backup " FILE_SUFF
read -p "Which directory do you want to backup to " DIR_NAME

# The next lines creates the directory if it does not exist

test -d $HOME/$DIR_NAME || mkdir -m 700 $HOME/$DIR_NAME # -m --> for mode (chmod)

<<comment
	# The find command will copy files the match the
	  search criteria ie .sh . The -path, -prune and -o
	  options are to exclude the backdirectory from the
	  backup.
comment

find $HOME -path $HOME/$DIR_NAME -prune -o \
-name "*$FILE_SUFF" -exec cp {} $HOME/$DIR_NAME/ \;

exit 0
