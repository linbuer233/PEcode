function C(num)
    a = []
    for i in 2:num
        if i in a
            continue
        end
        temp = yue(i)
        if temp <= 3
            continue
        end
        if yue(temp) == i && i != yue(i)

            push!(a, i)
        end
    end
    return a, sum(a)
end

# 求真约数之和
function yue(num)
    a = []
    for i in 1:num-1
        if num % i == 0
            push!(a, i)
        end
    end
    return sum(a)
end

@show @time C(10000)