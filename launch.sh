#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch

## Left bar
polybar menu -c ~/.config/polybar/current.ini &
polybar date -c ~/.config/polybar/current.ini &
polybar ip_local -c ~/.config/polybar/current.ini &
## Center bar
polybar workspace -c ~/.config/polybar/workspace.ini &
## Right bar
polybar system -c ~/.config/polybar/current.ini &
polybar sysmenu -c ~/.config/polybar/current.ini &
