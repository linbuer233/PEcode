
function C()
    abc = []

    for i = 1:9
        for j = 0:9
            for k = 0:9
                num = i * 100000 + j * 10000 + k * 1000 + k * 100 + j * 10 + i
                for qi = 1:999
                    qj = num / qi
                    # println((num, qi, qj))
                    if qj > 999 || qj < 100
                        continue
                    end
                    if convert(Int64, floor(qj)) == qj
                        push!(abc, (num, qi, qj))
                        break
                    end
                end
            end
        end
    end
    abc
end

@show @time C()
