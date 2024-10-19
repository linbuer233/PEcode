

function mat_dp(M::Matrix{Int})
    m, n = size(M)
    dp = zeros(Int, m, n)
    paths = Array{Int}(undef, (m,))
    # 边界条件 
    dp[1, 1] = M[1, 1]
    paths[1] = 1
    # 状态转移方程
    for i = 2:n
        dp[i, 1] = dp[i-1, 1] + M[i, 1]
    end
    for i = 2:n
        dp[i, i] = dp[i-1, i-1] + M[i, i]
        paths[i] = i
    end
    for i = 3:n
        for j = 2:n
            dp[i, j] = max(dp[i-1, j-1], dp[i-1, j]) + M[i, j]
            paths[j] = dp[i-1, j-1] > dp[i-1, j] ? j - 1 : j
        end
    end
    # 找到全局最优路径
    bestpath = paths
    besten = maximum(dp[m, 1:n])
    return bestpath, besten
end


using BenchmarkTools
mat = zeros(Int, 15, 15)
open("/Users/linziyang/Desktop/work/project/PEcode/1~100/q18/el-18.txt") do file
    for (index, value) in enumerate(eachline(file))
        mat[index, 1:index] = split(value, " ") .|> x -> parse(Int, x)
    end
end
@show mat_dp(mat)
