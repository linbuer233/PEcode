function C()
    a = 2520
    result = 1
    while true
        b = []
        for i = 6:20
            if a % i == 0
                push!(b, i)
            end
        end
        if length(b) == 15
            println(result)
            result = a
            break
        end
        a = a + 1
    end
    result
end

@show @time C()
