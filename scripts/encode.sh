#!/bin/sh

INFILE=$1
OUTFILE=$2

safe_openssl() {
        EMAIL=$1
        # strip the prefix "(stdin)=" that newer versions of openssl add to the output
        echo $EMAIL | openssl sha1 | awk '
        /^\(stdin\)=/ { print $2; next }
        { print $1 }'
}


if [ ! -r "$INFILE" ] || [ -z "$OUTFILE" ]; then
        echo "Usage: enc.sh inputfile outputfile"
        exit 1
fi


SANITIZED_TMP=`mktemp sanitized.XXXXXX`

cat "$INFILE" | sed 's/[ \t,;]*//g' > $SANITIZED_TMP

while read EMAIL; do
        safe_openssl "$EMAIL"
done < $SANITIZED_TMP | sort | uniq -u > $OUTFILE

# remove temp file
rm $SANITIZED_TMP
