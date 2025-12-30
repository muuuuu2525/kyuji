#!/bin/bash
# SPDX-FileCopyrightText: 2025 Manamu Asano
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

### TEST 1: 通常の変換 ###
out=$(echo "國立大學" | ./kyuji)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "国立大学" ] || ng "$LINENO"

### TEST 2: 何も変換しない場合 ###
out=$(echo "こんにちは" | ./kyuji)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "こんにちは" ] || ng "$LINENO"

### TEST 3: 記号や数字 ###
out=$(echo "100圓!?" | ./kyuji)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "100円!?" ] || ng "$LINENO"

### TEST 4: 空文字 ###
out=$(echo "" | ./kyuji)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

### TEST 5: エラー動作の確認（ここが重要！） ###
# 引数をつけて実行し、終了ステータスが 1 になることを確認する
./kyuji arg1 > /dev/null 2>&1
[ "$?" = 1 ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
