# Display single
ds() {
  xrandr -s 1
}

# Display extend
de() {
  xrandr -s 0
  bspc desktop 4 -m DVI-D-0
  bspc desktop 5 -m DVI-D-0
  bspc desktop 6 -m DVI-D-0
  bspc desktop Desktop -r
}
