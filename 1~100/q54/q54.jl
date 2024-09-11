# H 红桃 
# C 草花 
# S 黑桃 
# D 方片  
# T=10 
struct Poker
    value::Char
    key::Char
end

function value2num(value, cardnum, cardvalues)
    value_new = []
    for i in value
        temp = findfirst(isequal(i), cardnum)
        push!(value_new, cardvalues[temp])
    end
    value_new = sort(value_new)
    De = []
    for i = 1:length(value_new)-1
        push!(De, (value_new[i+1] - value_new[i]))
    end
    return value_new, De
end

function cardclass(p, cardnum, cardvalues)
    """
    0单牌：牌面最大的一张牌。
    1对子：两张牌面一样的牌。
    2两对：两个不同的对子。
    3三条：三张牌面一样的牌。
    4顺子：五张牌的牌面是连续的。
    5同花：五张牌是同一花色。
    6葫芦：三条带一个对子。
    7四条：四张牌面一样的牌。
    8同花顺：五张牌的牌面是连续的且为同一花色。
    9皇家同花顺：同一花色的10、J、Q、K、A。
    """
    values_card = []
    keys = []
    for i in p
        push!(values_card, i.value)
        push!(keys, i.key)
    end
    value_count = Dict()
    key_count = Dict()
    for (i, j) in zip(values_card, keys)
        if haskey(value_count, i)
            value_count[i] += 1
        else
            value_count[i] = 1
        end
        if haskey(key_count, j)
            key_count[j] += 1
        else
            key_count[j] = 1
        end
    end
    # println("card", value_count)
    #  单牌 ,顺子,同花顺，皇家同花顺
    ############################
    va, de = value2num(values_card, cardnum, cardvalues)
    if key_count.count == 1
        return 5, va, keys, value_count, key_count
    end
    if value_count.count == 5
        if sum(de) / 4 == 1
            if key_count.count == 1
                # 皇家同花顺
                if va == [9, 10, 11, 12, 13]
                    return 9, va, keys, value_count, key_count
                end
                # 同花顺
                return 8, va, keys, value_count, key_count
            end
            # 同花 
            if key_count.count == 1
                return 5, va, keys, value_count, key_count
            end
            # 顺子
            return 4, va, keys, value_count, key_count
        end
        # 同花 
        if key_count.count == 1
            return 5, va, keys, value_count, key_count
        end
        # 单牌
        return 0, va, keys, value_count, key_count
    end
    ############################
    # 对子
    if value_count.count == 4
        # 同花 
        if key_count.count == 1
            return 5, va, keys, value_count, key_count
        end
        # 对子
        return 1, va, keys, value_count, key_count
    end
    # 两对,三条
    ############################
    if value_count.count == 3
        # 同花 
        if key_count.count == 1
            return 5, va, keys, value_count, key_count
        end
        # 两对
        if maximum(values(value_count)) == 2
            return 2, va, keys, value_count, key_count
        end
        # 三条
        if maximum(values(value_count)) == 3
            return 3, va, keys, value_count, key_count
        end
    end
    ############################
    if value_count.count == 2
        # 葫芦
        if maximum(values(value_count)) == 3
            return 6, va, keys, value_count, key_count
        end
        # 四条
        if maximum(values(value_count)) == 4
            return 7, va, keys, value_count, key_count
        end
        # 同花 
        if key_count.count == 1
            return 5, va, keys, value_count, key_count
        end
    end
end

function PD(p1, p2)
    cardnum = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']
    cardvalue = [i for i = 1:13]
    level1, va1, key1, vc1, kc1 = cardclass(p1, cardnum, cardvalue)
    level2, va2, key2, vc2, kc2 = cardclass(p2, cardnum, cardvalue)
    if level1 > level2
        return 1
    elseif level1 < level2
        return 0
    end
    if level1 == 0 || level1 == 4 || level1 == 8 || level1 == 5
        for i = length(va1):-1:1
            if va1[i] > va2[i]
                return 1
            end
            if va1[i] < va2[i]
                return 0
            end
        end
    end
    if level1 == 1 || level1 == 2 || level1 == 3 || level1 == 7 || level1 == 6
        p1max = []
        p2max = []
        for (k, v) in vc1
            if v > 1
                push!(p1max, cardvalue[findfirst(isequal(k), cardnum)])
            end
        end
        for (k, v) in vc2
            if v > 1
                push!(p2max, cardvalue[findfirst(isequal(k), cardnum)])
            end
        end
        p1max = sort(p1max)
        p2max = sort(p2max)
        index = 0
        while true
            try
                if p1max[end-index] > p2max[end-index]
                    return 1
                end
            catch
                return 0
            end
            index += 1
        end
    end
    return 0
end

@timev begin
    f = open("/Users/linziyang/Desktop/work/project/PEcode/1~100/q54/poker.txt", "r")
    global wincount = 0
    a1 = readlines(f)
    for ai in a1
        a = split(ai)
        p1 = [Poker(a[i][1], a[i][2]) for i = 1:5]
        p2 = [Poker(a[i][1], a[i][2]) for i = 6:10]
        cardnum = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']
        cardvalue = [i for i = 1:13]
        level1, va1, key1, vc1, kc1 = cardclass(p1, cardnum, cardvalue)
        level2, va2, key2, vc2, kc2 = cardclass(p2, cardnum, cardvalue)
        println(level1, va1, key1, vc1, kc1)
        println(level2, va2, key2, vc2, kc2)
        println(PD(p1, p2))
        println("\n\n")
        # Define the poker cards
        global wincount = wincount + PD(p1, p2)
    end
    close(f)
    println("wincount\t", wincount)
end
