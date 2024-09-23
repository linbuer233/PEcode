function C(num)
    n = BigInt(2)
    temp = string(n^num)
    temp1 = 0
    for j in temp
        temp1 += parse(Int, j)
    end
    return temp1
end


@show @time C(1000)
