# 一共要走40步，其中有20步往下走
using Combinatorics
function C()
    return factorial(BigInt(40)) / factorial(BigInt(20)) / factorial(BigInt(20))
end

@show @time C()
