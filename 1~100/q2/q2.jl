"""
By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
"""
function sumFiboEven(num)
    a = []
    Fi_pre = 2
    push!(a, Fi_pre)
    Fi = 3
    while Fi <= num
        # println(Fi)
        if Fi % 2 == 0
            push!(a, Fi)
        end
        Fi_temp = Fi
        Fi = Fi + Fi_pre
        Fi_pre = Fi_temp
    end
    sum(a)
end

# @show @time sumFiboEven(90)
@show @time sumFiboEven(4000000)
