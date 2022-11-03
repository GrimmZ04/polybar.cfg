#!/bin/bash
icon="%{F#2495e7}醙 "
check_status() {
	mute_status=$(amixer -D pulse get Master | grep "Front Left:" | cut -d '[' -f3 | cut -d ']' -f1)
	if [ $mute_status  == "on" ]; then
		volume_status=$(amixer -D pulse get Master | grep "Front Left:" | cut -d '[' -f2 | cut -d ']' -f1)
		echo ${icon}"%{F#ffffff}"${volume_status}
	else
		echo ${icon}"%{F#ffffff}"${mute_status}
	fi
}
case $1 in
	status) check_status;;
	mute) amixer get Master | (grep "off" && amixer set Master unmute || amixer set Master mute) >/dev/null;;
	up) ;;
	down) ;;
esac
