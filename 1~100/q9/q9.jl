function C(num)
    for i in 1:num-2
        for j in i:num-1-i
            for z in j:num-i-j
                if i + j + z == num
                    if i^2 + j^2 == z^2
                        return (i, j, z)
                    end
                end
            end
        end
    end
end

@show @time C(1000)