function C(year, weekidx)
    a = []
    # 判断是否为闰年
    week = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    if (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
        # println(year)
        month[2] = 29
    end
    for (ii, i) in enumerate(month)
        for j = 1:i
            # println(year, "\t", ii, "\t", j, "\t:", week[weekidx])
            if j == 1 && week[weekidx] == "Sun"
                # println(year, "\t", ii, "\t", j, "\t:", week[weekidx])
                push!(a, (year, ii))
            end
            weekidx += 1
            if weekidx == 8
                weekidx = 1
            end
        end
    end
    return length(a), weekidx
end

@time begin
    a = []
    local weekidx = 2
    for i = 1901:2000
        b, weekidx = C(i, weekidx)
        # weekidx += 1
        if weekidx == 8
            weekidx = 1
        end
        push!(a, b)
    end
    println(sum(a))
end
