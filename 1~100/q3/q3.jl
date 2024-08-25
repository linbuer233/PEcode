using Primes

function C(num)
    P = primes(floor(Int, log(num) * 10000))
    a = Vector{Int64}()
    b = []
    num_i = num
    for i in P
        if num_i % i == 0
            push!(a, i)
            num_i = num_i / i
            push!(b, num_i)
        end
    end
    println(b)
    a
end

# @show @time C(13195)
@show @time C(600851475143)