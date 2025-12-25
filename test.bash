#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Reoto Koya <s24c1053jd@s.chibakoudai.jp>
# SPDX-License-Identifier: BSD-3-Clause

ng () {
   echo ${1}行目が違うよ
   res=1
} 

res=0

out=$(echo "10 10.5" | ./rel_er)
[ "${out}" = "5.00%" ] || ng "$LINENO"

out=$(echo -e "10 10.5\n9 9.5" | ./rel_er)
expected=$'5.00%\n5.56%'
[ "${out}" = "$expected"  ] || ng "$LINENO"

out=$(echo "0 1" | ./rel_er )
[ "$?" = 1 ] || ng "$LINEO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo -e  "10 10.5 11\n2 3" | ./rel_er )
[ "$?" = 2 ] || ng "$LINEO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo "" | ./rel_er )
[ "$?" = 2 ] || ng "$LINEO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo "" | ./rel_er )
[ "$?" = 2 ] || ng "$LINEO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo "10 10.5\n9 9.5" | ./rel_er)
[ "$?" = 3 ] || ng "$LINEO"
[ "${out}" = ""  ] || ng "$LINENO"

out=$(echo "q" | ./rel_er )
[ "$?" = 3 ] || ng "$LINEO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo "q 2" | ./rel_er )
[ "$?" = 3 ] || ng "$LINEO"
[ "${out}" = "" ] || ng "$LINENO"


[ "${res}" = 0 ] && echo OK

exit $res
