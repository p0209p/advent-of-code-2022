function character_to_priority(x::Char)
    if islowercase(x)
        return Int64(x) - 96
    else
        return Int64(x) - 38
    end
end

function total_priorities(filename::String)
    try lines = readlines(filename)
        common_items = []
        for i in eachindex(lines)
            line = lines[i]
            l = cld(length(line),2)
            compartment1 = line[1:l]
            compartment2 = line[l+1:end]
            if !isempty(intersect(compartment1, compartment2))
                push!(common_items, intersect(compartment1, compartment2)[1])
            end
        end
        println("Sum of priorities: "*string(sum(map(x -> character_to_priority(x), common_items))))
    catch msg
        print("Error:", msg)
    end
end

total_priorities("rusksack_contents.txt")

# Part 2

function total_priorities_p2(filename::String)
    try lines = readlines(filename)
        common_items = []
        i = 1
        while i <= length(lines) - 2
            if !isempty(intersect(lines[i], lines[i+1], lines[i+2]))
                push!(common_items, intersect(lines[i], lines[i+1], lines[i+2])[1])
            end
            i = i + 3
        end
        print("Sum of priorities (Part 2): "*string(sum(map(x -> character_to_priority(x), common_items))))
    catch msg
        print("Error:", msg)
    end
end


total_priorities_p2("rusksack_contents.txt")
