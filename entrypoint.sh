#!/bin/sh -l

AUTHOR="$1"
DAYS="$2"

# 2021-08-20
LAST_COMMIT_DATE="$(git log --author="$AUTHOR" -1 --pretty=%ad --date=short)"
NOW="$(date +%F)"

printf "lastCommitDate=%s now=%s\n" "$LAST_COMMIT_DATE" "$NOW"

if [ -z "$LAST_COMMIT_DATE" ]; then
  echo "Nothing happened!"
  exit 1
fi

LAST_EPOCH=$(date --date="$LAST_COMMIT_DATE" +%s)
NOW_EPOCH=$(date --date="$NOW" +%s)

printf "lastEpoch=%s now=%s\n" "$LAST_EPOCH" "$NOW_EPOCH"

EPOCH_DIFF=$(($NOW_EPOCH - $LAST_EPOCH))
DAY_DIFF=$(($EPOCH_DIFF / (60 * 60 * 24)))

printf "epochDiff=%s dayDiff=%s\n" "$EPOCH_DIFF" "$DAY_DIFF"

if [ "$DAY_DIFF" -gt "$DAYS" ]; then
  echo "It's been too many days"
  exit 1
fi
