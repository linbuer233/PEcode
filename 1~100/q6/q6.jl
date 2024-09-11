function C()
    a = 0
    b = 0
    for i = 1:100
        a = a + i^2
        b = b + i
    end
    return b^2 - a
end

@show @time C()
