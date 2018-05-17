#!/bin/bash

#Select a message program
msg=""
if [[ -z "`which zenity`" ]]
then
	if [[ -z "`which xmessage`" ]]
	then
		msg="echo"
	else
		msg="xmessage"
	fi
else msg="zenity --info --text";fi

if [[ -z "`which love`" ]]
then
	#Love is not installed
	$msg "LÖVE not installed, please install from http://love2d.org"
else
	#Love is installed: which version?
	love_version="`love --version | grep 11.1`"
	if [[ -z $love_version ]]
	then
		#Not 11.1
		$msg "LÖVE 11.1 is required. Currently installed: `love --version`. Please install LOVE v11.1 from http://love2d.org."
	else
		#11.1 installed, launch LIKO-12
		love .
	fi
fi
