#!/bin/bash

MAX=10000

set -e

if [[ $# != 2 ]] ; then
  echo "引数は2つで！" >&2
  exit 1
elif [[ $1 =~ ^[0-9]+$ && $2 =~ ^[0-9]+$ ]] ; then
:
else
  echo "引数は自然数の数字で！" >&2
  exit 1
fi

counter=1
result=0
while [[ $counter -lt $MAX  ]]
do
  rest1=$(( $1 % $counter ))
  rest2=$(( $2 % $counter ))
  if [[ $rest1 -eq 0 && $rest2 -eq 0 ]] ; then
    # 公約数なら上書き保存
    result=$counter
  fi

  if [[ $counter -eq $1 || $counter -eq $2 ]]; then
    # 引数２つのどちらかと同値になったら終了
    echo $result
    exit 0
  fi
  counter=$((counter + 1))
done

echo "むりぽ" >&2
exit 1
