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
echo $ups
echo $downs
mkdir -p ./$downs~$ups/q$a
touch ./$downs~$ups/q$a/q$a.jl
echo "function C(num)" >> ./$downs~$ups/q$a/q$a.jl
echo "" >> ./$downs~$ups/q$a/q$a.jl
echo "end" >> ./$downs~$ups/q$a/q$a.jl
echo "" >> ./$downs~$ups/q$a/q$a.jl
echo "" >> ./$downs~$ups/q$a/q$a.jl
echo "@show @time C()" >> ./$downs~$ups/q$a/q$a.jl
