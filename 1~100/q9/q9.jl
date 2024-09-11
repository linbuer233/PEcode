function C(num)
    for i = 1:num-2
        for j = i:num-1-i
            for z = j:num-i-j
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
