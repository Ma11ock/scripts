#!/usr/bin/env zsh
echoerr() { echo "$@" 1>&2; }

if [ "" = "$1" ] ; then
    echoerr "usage $0 <window title>"
    exit 1;
fi

window_list=()
while [ -n "$1" ]; do
    # Get window list and reverse the order (the newest window is
    # probably the one we want to use the most).
    tmp_list=(`wmctrl -l | grep "$1" -i | cut -d ' ' -f1`)
    window_list+=(${(Oa)tmp_list})
    shift
done
# Focus.
foreach win in $window_list; do
    wmctrl -i -a "$win"
done

