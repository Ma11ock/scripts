#!/usr/bin/sh


# detect git push -f
force=0
while read -r old new ref; do
 	hasrevs=$(git rev-list "$old" "^$new" | sed 1q)
 	if test -n "$hasrevs"; then
 		force=1
 		break
 	fi
done

# remove commits and .cache on git push -f
#if test "$force" = "1"; then
# ...
#fi

# see example_create.sh for normal creation of the files.
