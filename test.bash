#!/bin/bash

tmp=/tmp/$$
ERROR_EXIT () {
  echo "$1" >&2
  rm -f $tmp-*
  exit 1
}

##################################### # TEST1 #####################################
echo aaa bbb NG > $tmp-ans
./same.py aaa bbb > $tmp-out || ERROR_EXIT "TEST1-1"
diff $tmp-ans $tmp-out || ERROR_EXIT "TEST1-2"

echo OK

rm -f $tmp-*

exit 0


