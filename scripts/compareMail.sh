#!/bin/sh

FIRST=$1
SECOND=$2

if [ ! -r "$FIRST" ] || [ ! -r "$SECOND" ]; then
        echo "Usage: diff.sh first_file second_file"
        exit 1
fi

read UNIQUE_LEFT UNIQUE_RIGHT <<< `diff "$FIRST" "$SECOND" | awk '
/^\<.*/ { LEFT += 1; next }
/^\>.*/ { RIGHT += 1 }
END { print LEFT, RIGHT }'`

echo "$FIRST: $UNIQUE_LEFT uniques"
echo "$SECOND: $UNIQUE_RIGHT uniques"

FIRST_LINES=`wc -l $FIRST | awk ' { print $1 }'`

COMMON=`expr $FIRST_LINES - $UNIQUE_LEFT`
echo "Common: $COMMON"
