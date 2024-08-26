using Primes
function C()
    a = primes(1000000)
    a[10001]
end

@show @time C()