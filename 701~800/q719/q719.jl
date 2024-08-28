# doing
function C1(num)
    psnum, aa = C(num)
    a1 = nothing
    a2 = []
    for i in psnum
        sqnum = sqrt(i)
        a = 1
        for j in 1:12
            if sqnum % 10^j == sqnum
                a = j
                break
            end
        end
        # println(sqnum, "\t", a)
        b = 1
        for j in 1:12
            if i % 10^j == i
                b = j - 1
                break
            end
        end
        a1 = []
        for ii in b:-1:0
            # println("ii:\t", ii)
            temp = (i - i % 10^ii) / 10^ii
            push!(a1, temp)
            i = (i - temp * 10^ii)
            # println(i)
        end
        sum1 = 0
        if sum(a1) == sqnum
            push!(a2, sqnum^2)
            continue
        end
        #
        for ii in 1:length(a1)
            if (ii + a - 1) > length(a1)
                break
            end
            tempa = a
            temps = 0
            for j in a1[ii:ii+a-1]
                temps = temps + j * 10^(tempa - 1)
                tempa -= 1
            end
            sum1 = 0
            for j in a1[1:ii-1]
                sum1 = sum1 + j
            end
            for j in a1[ii+a:length(a1)]
                sum1 = sum1 + j
            end
            sum1 = sum1 + temps
            # println("sum1:\t", sum1)
            if sum1 == sqnum
                push!(a2, sqnum^2)
                break
            end
        end
        ##
    end
    return sum(a2), a2
end

function C2(num)
    a, b = C(num)
    a2 = []
    for i in a
        sqnum = sqrt(i)
        a = 1
        for j in 1:12
            if sqnum % 10^j == sqnum
                a = j
                break
            end
        end
        # println(sqnum, "\t", a)
        b = 1
        for j in 1:12
            if i % 10^j == i
                b = j - 1
                break
            end
        end
        a1 = []
        for ii in b:-1:0
            # println("ii:\t", ii)
            temp = (i - i % 10^ii) / 10^ii
            push!(a1, temp)
            i = (i - temp * 10^ii)
            # println(i)
        end
        for ii in 1:length(a1)
            if (ii + a - 1) > length(a1)
                break
            end
            if length(a1) == 4
                ab1 = a1[1] * 10 + a1[2]
                ab2 = a1[3] * 10 + a1[4]
                if ab1 + ab2 == sqnum
                    push!(a2, sqnum^2)
                    break
                end
            end
            tempa = a
            temps = 0
            for j in a1[ii:ii+a-1]
                temps = temps + j * 10^(tempa - 1)
                tempa -= 1
            end
            sum1 = 0
            for j in a1[1:ii-1]
                sum1 = sum1 + j
            end
            for j in a1[ii+a:length(a1)]
                sum1 = sum1 + j
            end
            sum1 = sum1 + temps
            # println("sum1:\t", sum1)
            if sum1 == sqnum
                push!(a2, sqnum^2)
                break
            end

        end
    end
end
function C(num)
    a = []
    for i in 1:num
        sqrtnum = sqrt(i)
        if floor(Int, sqrtnum) == sqrtnum
            push!(a, i)
        end
    end
    a
end

# println(C1(10^4))
# println(C(10^4))

function is_s_number(n::Int)
    # 计算平方根
    root = sqrt(n)
    # 检查平方根是否为整数
    if root % 1 != 0
        return false
    end

    # 将数字转换为字符串
    str_root = string(root)
    str_n = string(n)
    # 长度至少为2，因为需要分割成至少两部分
    if length(str_n) < 2
        return false
    end

    # 检查所有可能的分割组合
    for i in 1:(length(str_n)-1)
        for j in (i+1):(length(str_n))
            # 根据分割点分割字符串
            part1 = str_n[1:i-1]
            part2 = str_n[i:j-1]
            part3 = str_n[j:end]
            # println(part1, "\t", part2, "\t", part3)
            try
                # 若分割后可以转换为整数，则将分割后的字符串转换为整数
                part1 = parse(Int, part1)
            catch
                part1 = 0
            end
            try
                # 若分割后可以转换为整数，则将分割后的字符串转换为整数
                part2 = parse(Int, part2)
            catch
                part2 = 0
            end
            try
                # 若分割后可以转换为整数，则将分割后的字符串转换为整数
                part3 = parse(Int, part3)
            catch
                part3 = 0
            end
            # 将分割后的字符串转换为整数并求和
            if part1 + part2 + part3 == root
                return true
            end
        end
    end

    # 如果没有找到符合条件的分割，则不是S-数
    return false
end

# 计算 10^4 以内的 S-数之和
# global sum_of_s_numbers = 0
# a = []
# for i in C(10^6)
#     square = i
#     if is_s_number(square)
#         push!(a, square)
#         global sum_of_s_numbers += square
#     end
# end

# println("Sum of S-numbers within 10^4 is: ", sum_of_s_numbers)
# println(a)
# [1.0, 81.0, 100.0, 1296.0, 6724.0, 8281.0, 9801.0, 10000.0]
# [81, 100, 1296, 2025, 3025, 6724, 8281, 9801, 10000]

function g(n, s)
    println(n, "\t\t\t", s)
    n ≤ s && return n == s
    for i in 1:ndigits(n)-1
        println("=====", i, "===", n % 10^i, "====", s - n ÷ 10^i)
        println("-----\t", n, "\t\t\t", s)
        g(n % 10^i, s - n ÷ 10^i) && return true
    end
    false
end
function T(N)
    a = []
    for n in 2:isqrt(N)
        println("################################")
        if g(n^2, n)
            push!(a, n^2)
        end
    end
    sum(a)
end


# T(N) = sum(n^2 for n in 2:isqrt(N) if g(n^2, n))

@show @time T(10^2)