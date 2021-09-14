#!/bin/sh -l

AUTHOR="$1"
DAYS="$2"

# 2021-08-20
LAST_COMMIT_DATE="$(git log --author="$AUTHOR" -1 --pretty=%ad --date=short)"
NOW="$(date +%F)"

LAST_EPOCH=$(date --date="$LAST_COMMIT_DATE" +%s)
NOW_EPOCH=$(date --date="$NOW" +%s)

EPOCH_DIFF=$(($NOW_EPOCH - $LAST_EPOCH))
DAY_DIFF=$(($EPOCH_DIFF / (60 * 60 * 24)))

if [ $DAY_DIFF -gt $DAYS ]; then
  echo "It's been too many days"
  exit 1
fi
