function C(num)
    maxcount = 0
    maxnum = 1
    for i = 1:num
        count = 0
        function compute(x, count)
            # print(x, " ")
            if x == 1
                count += 1
                return count
            end
            if x % 2 == 0
                count += 1
                return compute(x / 2, count)
            else
                count += 1
                return compute(3x + 1, count)
            end
        end
        # print("i:", i, " \t")
        temp = compute(i, count)
        if temp > maxcount
            maxcount = temp
            maxnum = i
        end
        # println("=======")
    end
    return maxcount, maxnum
end


@show @time C(1000000)
