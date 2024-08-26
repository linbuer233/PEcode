#!/bin/bash

a=$1

if [ -z "$a" ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

# 检查参数是否为正整数
if ! [[ "$a" =~ ^[0-9]+$ ]]; then
    echo "Error: <number> must be a positive integer."
    exit 1
fi

downs=$(((a / 100) * 100 + 1))
b=$99
ups=$((downs+99))
/Users/linziyang/.local/bin/julia ./$downs~$ups/q$a/q$a.jl