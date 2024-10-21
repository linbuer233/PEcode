function C(num)
    num = BigInt(num)
    temp = BigInt(1)
    for i in 1:num
        temp = temp * num
        num -= 1
    end
    tempstr = string(temp)
    temp = 0
    for i in tempstr
        temp = temp + parse(Int64, i)
    end
    return temp
end


@show @time C(100)
