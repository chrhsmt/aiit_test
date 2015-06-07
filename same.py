#!/usr/bin/python

import sys

res = "NG"
if sys.argv[1] == sys.argv[2]:
  res = "OK"

print sys.argv[1], sys.argv[2], res
