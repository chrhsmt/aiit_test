#!/bin/bash

tmp=/tmp/$$
ERROR_EXIT () {
  echo "$1" >&2
  rm -f $tmp-*
  exit 1
}

##################################### # TEST1 #####################################
echo 4 > $tmp-ans
./gcd.bash 20 12 > $tmp-out || ERROR_EXIT "TEST1-1"
diff $tmp-ans $tmp-out || ERROR_EXIT "TEST1-2"

##################################### # TEST2 #####################################
echo 10 > $tmp-ans
./gcd.bash 100 10 > $tmp-out || ERROR_EXIT "TEST2-1"
diff $tmp-ans $tmp-out || ERROR_EXIT "TEST2-2"

##################################### # TEST3 #####################################
echo 2 > $tmp-ans
./gcd.bash 128 198 > $tmp-out || ERROR_EXIT "TEST3-1"
diff $tmp-ans $tmp-out || ERROR_EXIT "TEST3-2"

set +e
##################################### # TEST4 #####################################
./gcd.bash 10 100 > $tmp-out
[ $? -eq 0 ] || ERROR_EXIT "TEST4-1" 

##################################### # TEST5 #####################################
./gcd.bash 10 0 1000 > $tmp-out 2>&1
[ $? -ne 0 ] || ERROR_EXIT "TEST5-1"

echo OK

rm -f $tmp-*

exit 0


