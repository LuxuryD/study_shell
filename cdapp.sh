#!/bin/sh

#This is the first file about cdapp

menu_choice=""
current_cd=""
title_file="title.cdb"
tracks_file="tracks.cdb"
temp_file=/tmp/cdb.$$
trap "rm -f $temp_file" EXIT

getReturn(){
	echo -e "Press return \c"
	read x
	return 0
}

getConfirm(){
	echi -e "Are you sure? \c"
	while true
	do
		read x
		case "$x" in
			y | yes | Y | Yes | YES )	return 0;;
			n | no | N | NO )
				echo 
				echo "Cancelled"
				return 1;;
			*)	echo "Please enter yes or no" ;;
		esac
	done
}

setMenuChoice(){
	clear
	echo "Option :-"
	echo
	echo "	a)	Add new CD"
	echo "	b)	Find CD"
	echo "	c)	Count the CDs and tracks in the catalog"

	if [ "$cdcatnum" != "" ] ; then
		echo "	1)	List tracks on $cdtitle"
		echo "	r) 	Remove $cdtitle"
		echo "	u)	Update track information for $cdtitle"
	fi
	echo "	q)	Quit"
	echo 
	echo -e "Please enter choice then press return \c"
	read menu_choice
	return
}
