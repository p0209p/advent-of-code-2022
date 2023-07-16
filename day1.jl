function max_calorie_counter(filename::String)
    try lines = readlines(filename)
        calorie_counts = []
        for i in eachindex(lines)
            line = lines[i]
            if !isempty(line) && !contains(line, " ")
                start = i
                while !isempty(line) 
                    i += 1
                    line = lines[i]
                end
                calories = sum(parse.(Int64,lines[start:i-1]))
                push!(calorie_counts, calories)
            end
        end
        println("Max calories: "*string(maximum(calorie_counts))*" "*"elf which has the max calories: "*string(argmax(calorie_counts)))
        calorie_counts = sort(calorie_counts)
        println("Total calories carried by the top 3 Elfs with most calories: "*string(sum(calorie_counts[end-2:end])))
    catch msg
        println("File not found!")
    end
end

max_calorie_counter("calorie_counts.txt")
