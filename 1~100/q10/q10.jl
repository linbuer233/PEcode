using Primes
function C(num)
    a = primes(num)
    sum(a)
end

@show @time C(2 * 10^6)
