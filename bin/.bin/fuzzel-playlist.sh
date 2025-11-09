#!/bin/sh
playlist=$(mpc lsplaylists | fuzzel --dmenu --minimal-lines)

if [ -n "$playlist" ]; then
  mpc clear
  mpc load "$playlist"
  mpc play
fi
