#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Reoto Koya <s24c1053jd@s.chibakoudai.jp>
# SPDX-License-Identifier: BSD-3-Clause

ng () {
   echo ${1}行目が違うよ
   res=1
} 

res=0

out=$(echo 100 | ./as_f)
[ "${out}" = "2 2 5 5" ] || ng "$LINENO"

out=$(echo 45 | ./as_f)
[ "${out}" = "3 3 5" ] || ng "$LINENO"

out=$(echo 97 | ./as_f)
[ "${out}" = "97" ] || ng "$LINENO"

out=$(echo abc | ./as_f)
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo "10 7" | ./as_f)
expected=$'2 5\n7'
[ "${out}" = "$expected" ] || ng "$LINENO"

out=$(echo -10 | ./as_f)
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo 0.1 | ./as_f)
[ "${out}" = "" ] || ng "$LINENO"


[ "${res}" = 0 ] && echo OK

exit $res

out=$(echo 100 | ./as_f)
 ++ echo 100
 ++ ./as_f
 + out=2 2 5 5
[ "${out}" = "2 2 5 5" ] || ng "$LINENO"
+ '[' 2 2 5 5 = 2 2 5 5 ']'

out=$(echo 45 | ./as_f)
++ echo 45
++ ./as_f
+ out=3 3 5
[ "${out}" = "3 3 5" ] || ng "$LINENO"
+ '[' 3 3 5 = 3 3 5']'

out=$(echo 97 | ./as_f)
++ echo 97
++ ./as_f
+ out=97
[ "${out}" = "97" ] || ng "$LINENO"
+ '[' 97 = 97 ']'

out=$(echo abc | ./as_f)
++ echo abc
++ ./as_f
+ out= 
[ "${out}" = "" ] || ng "$LINENO"
+ '[' '' = '' ']'

out=$(echo "10 7" | ./as_f)
++ echo 10 7
++ ./as_f
+ out=2 5
7
[ "${out}" = "$expected" ] || ng "$LINENO"
+ '[' '2 5
7' = '2 5
7' ']'

out=$(echo -10 | ./as_f)
++ echo -10
++ ./as_f
+ out= 
[ "${out}" = "" ] || ng "$LINENO"
+ '[' '' = '' ']'

out=$(echo 0.1 | ./as_f)
++ echo 0.1
++ ./as_f
+ out= 
[ "${out}" = "" ] || ng "$LINENO"
+ '[' '' = '' ']'

[ "${res}" = 0 ] && echo OK
+ '[' 0 = 0 ']'
+ echo OK
OK
exit $res
+ exit 0
