# doing
function C(num)
    a1 = nothing
    a2 = []
    for i in 1:num
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
            if ii + a - 1 > length(a1)
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
        ###
        for ii in 1:length(a1)
            if ii + a - 1 > length(a1)
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
    end
    return sum(a2), a2
end

println(C(10^4))