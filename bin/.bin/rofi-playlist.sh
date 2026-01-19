#!/bin/sh

playlist=$(mpc lsplaylists | rofi -dmenu -i -p ">")

if [ -n "$playlist" ]; then
  mpc clear
  mpc load "$playlist"
  mpc play
fi
