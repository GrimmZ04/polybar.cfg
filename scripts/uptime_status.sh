#!/bin/sh
echo "%{F#2495e7} %{F#ffffff}$(uptime | awk -F , '{sub(".*up ",x,$1);print $1}')"
