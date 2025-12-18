#!/bin/bash
# SPDX-FileCopyrightText: 2025 manamu asano
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo ${1}行目が違うよ
    res=1
}

res=0

out=$(echo "國立大學" | ./kyuji)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "国立大学" ] || ng "$LINENO"

out=$(echo "こんにちは" | ./kyuji)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "こんにちは" ] || ng "$LINENO"

out=$(echo "100圓" | ./kyuji)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "100円" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
