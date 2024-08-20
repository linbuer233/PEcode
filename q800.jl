#quesion 800
using Primes

function C(logn)
    P = primes(floor(Int, logn / log(2)))
    logP = log.(P)
    cnt = 0
    for (i, p) in enumerate(P)
        2logP[i] * p ≤ logn || break
        # 上一行代码等同于
        # if 2logP[i] * P > logn
        #     break
        # end
        j = length(P)
        mid = floor(Int, (i + j) // 2)
        while j > i
            if logP[i] * P[mid] + logP[mid] * p > logn
                j = mid
                mid = floor(Int, (i + j) // 2)
                # println(j)
            end
            if logP[i] * P[j] + logP[j] * p <= logn
                # println(P[j], "\t", P[i], "\t", P[j]^P[i] * P[i]^P[j])
                cnt += 1
            end
            j -= 1
        end
    end
    cnt
end

# @show @time C(log(800))
# @show @time C(log(800) * 800)
@show @time C(log(800800) * 800800)
