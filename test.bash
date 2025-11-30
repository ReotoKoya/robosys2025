#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Reoto Koya <s24c1053jd@s.chibakoudai.jp>
# SPDX-License-Identifier: BSD-3-Clause

# 1) 正の整数: 100 → 2 2 5 5
result=$(echo 100 | ./as_f)
[ "$result" = "2 2 5 5" ] || {
    echo "Test1 failed (100): got '$result'"
    exit 1
}

# 2) 正の整数: 45 → 3 3 5
result=$(echo 45 | ./as_f)
[ "$result" = "3 3 5" ] || {
    echo "Test2 failed (45): got '$result'"
    exit 1
}

# 3) 素数: 97 → 97
result=$(echo 97 | ./as_f)
[ "$result" = "97" ] || {
    echo "Test3 failed (97): got '$result'"
    exit 1
}

# 4) 無効入力は無視されるテスト: abc → 出力なし
result=$(echo abc | ./as_f)
[ "$result" = "" ] || {
    echo "Test4 failed (abc): got '$result'"
    exit 1
}

# 5) 複数入力のテスト: "10 7" → "2 5" と "7" の2行
result=$(echo "10 7" | ./as_f)
expected=$'2 5\n7'
[ "$result" = "$expected" ] || {
    echo "Test5 failed (10 7):"
    echo "  expected: '$expected'"
    echo "  got:      '$result'"
    exit 1
}

# 6) 負の整数: -10 → 出力なし
result=$(echo -10 | ./as_f)
[ "$result" = "" ] || {
    echo "Test3 failed (-10): got '$result'"
    exit 1
}

# 7) 小数: 0.1 → 出力なし
result=$(echo 0.1 | ./as_f)
[ "$result" = "" ] || {
    echo "Test3 failed (0.1): got '$result'"
    exit 1
}


echo "All tests passed"
