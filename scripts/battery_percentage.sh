#!/bin/bash
battery_percentage=$(acpi -b | awk -F , '{print $2}' | cut -d % -f1)
battery_charging=$(acpi -b | awk -F , '{print $1}' | cut -d " " -f3)
#echo "%{F#2495e7} %{F#ffffff}"${battery_percentage}"%"
if [ $battery_charging == "Charging" ];then 
	echo "%{F#2495e7}%{F#ffffff}"${battery_percentage}"%"
else
	battery="";
	if [ $battery_percentage -eq 100 ];then battery=""; fi
	if [ $battery_percentage -lt 100 ];then battery=""; fi
	if [ $battery_percentage -lt 50 ];then battery=""; fi
	if [ $battery_percentage -lt 30 ];then battery=""; fi
	if [ $battery_percentage -lt 16 ];then notify-send -i battery -u critical "Battery low!" >/dev/null; fi
	if [ $battery_percentage -lt 6  ];then notify-send -i battery -u critical "Battery low!" "Critical battery level, please connect charger." >/dev/null; fi 
	echo "%{F#2495e7}${battery}%{F#ffffff}"${battery_percentage}"%"
fi
