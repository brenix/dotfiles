NOTEDIR=$HOME/notes

dn() {
  local year=$(date +%Y)
  local month=$(date +%m)
  local day=$(date +%d)

  # create dir
  mkdir -p "${NOTEDIR}/work/daily/$year/$month" &>/dev/null
  local note="${NOTEDIR}/work/daily/$year/$month/$day.md"

  test -f "${note}" && \
    local msg="Updated daily work notes" || local msg="Added daily work notes"

  # edit file
  $EDITOR "${note}"

  # cleanup empty files and dirs
  find "${NOTEDIR}/work/daily -type d -empty -delete" &>/dev/null
  find "${NOTEDIR}/work/daily -type f -size 0 -delete" &>/dev/null

  pushd "${NOTEDIR}"
  git add "${note}"
  git commit -m "${msg}"
  git push origin master
  popd
}
