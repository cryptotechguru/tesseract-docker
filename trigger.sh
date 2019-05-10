while sleep 10; do
  tc getmininginfo > /dev/null
  tc getchaintxstats > /dev/null
done
