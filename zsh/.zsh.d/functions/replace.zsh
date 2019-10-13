# find and replace text in current path
replace() {
  rg -l "$1" | xargs sed -i 's,'"$1"','"$2"',g'
}
