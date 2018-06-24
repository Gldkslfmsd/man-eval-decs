
echo 1M:

quickjudge anotation-dm --print  | cut -f 2,3 | grep 1M | cut -f 2 | sort | uniq -c

echo

echo 250k
quickjudge anotation-dm --print  | cut -f 2,3 | grep 250k | cut -f 2 | sort | uniq -c
