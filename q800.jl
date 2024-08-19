#quesion 800
using ProgressMeter
function IsPrime(num)
    num <= 1 && return false
    for i in 2:isqrt(num)
        num % i == 0 && return false
    end
    return true
end

function HybirdIntegers(num)
    result = nothing
    for i in 2:isqrt(num)
        if IsPrime(i)
            for j in (i+1):isqrt(num)  # 确保 i != j
                if IsPrime(j) && (i^j * j^i) == num
                    result = (num, i, j)
                    break  # 找到一对就退出内层循环
                end
            end
        end
        if result !== nothing
            break  # 找到结果就退出外层循环
        end
    end
    return result
end

function findHI(num)
    progress = Progress(num, desc="Processing: $num")
    for i in 1:num
        result = HybirdIntegers(i)
        if result !== nothing
            println(result)
        end
        # 更新进度条
        next!(progress)
    end
end

@timev findHI(800^2)
