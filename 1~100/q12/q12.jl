function C(num)
    i = 1
    temp = 0
    yue = 0
    while true
        yue = []
        temp = temp + i
        # println("temp = ", temp)
        for j = 1:Int64(ceil(temp / 2))
            if temp % j == 0
                push!(yue, j)
            end
        end
        i = i + 1
        if length(yue) + 1 >= num
            break
        end
    end
    return temp, yue
end


@show @time C(500)
