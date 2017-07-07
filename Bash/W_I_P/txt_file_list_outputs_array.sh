ARRAY=()

while read line; do ARRAY+="$line"; done <$1

echo $ARRAY
