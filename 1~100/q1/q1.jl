function sum3or5(num)
    a = []
    for i = 1:num-1
        if (i % 3 == 0) || (i % 5 == 0)
            push!(a, i)
        end
    end
    sum(a)
end

@show @time sum3or5(10)
@show @time sum3or5(1000)
