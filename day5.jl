using Scanf

function top_crates(filename::String)
    try lines = readlines(filename)
        initial_crate_loc = findfirst(==(""), lines) - 2 
        crates = [[] for _ = 1:initial_crate_loc]
        for i = 1:initial_crate_loc
            j = 2
            while j <= length(lines[i])
                push!(crates[i], lines[i][j])
                j += 4
            end
        end
        no_of_crate_columns = length(crates[end])
        tmp = [[] for _ = 1:no_of_crate_columns]
        for i = 1:no_of_crate_columns
            for j = 1:initial_crate_loc
                push!(tmp[i], crates[j][i])
            end
        end
        crates = tmp
        for i = 1:no_of_crate_columns
            crates[i] = crates[i][end:-1:1]
            while crates[i][end] == ' '
                pop!(crates[i])
            end
        end
        for i = initial_crate_loc+1:length(lines)
            _,no_crates_to_move,from,to = @scanf(lines[i],"move %d from %d to %d",Int,Int,Int)
            for _ = 1:no_crates_to_move
                push!(crates[to], pop!(crates[from]))
            end
        end
        str = "The top crates are: "
        for i in eachindex(crates)
            str = str * string(crates[i][end])
        end
        println(str)
    catch msg
        print("Error: ",msg)
    end
end

top_crates("supply_stacks.txt")


# Part 2

function top_crates_p2(filename::String)
    try lines = readlines(filename)
        initial_crate_loc = findfirst(==(""), lines) - 2 
        crates = [[] for _ = 1:initial_crate_loc]
        for i = 1:initial_crate_loc
            j = 2
            while j <= length(lines[i])
                push!(crates[i], lines[i][j])
                j += 4
            end
        end
        no_of_crate_columns = length(crates[end])
        tmp = [[] for _ = 1:no_of_crate_columns]
        for i = 1:no_of_crate_columns
            for j = 1:initial_crate_loc
                push!(tmp[i], crates[j][i])
            end
        end
        crates = tmp
        for i = 1:no_of_crate_columns
            crates[i] = crates[i][end:-1:1]
            while crates[i][end] == ' '
                pop!(crates[i])
            end
        end
        for i = initial_crate_loc+1:length(lines)
            _,no_crates_to_move,from,to = @scanf(lines[i],"move %d from %d to %d",Int,Int,Int)
            tmp = []
            for _ = 1:no_crates_to_move
                push!(tmp, pop!(crates[from]))
            end
            tmp = tmp[end:-1:1]
            for j = 1:no_crates_to_move
                push!(crates[to], tmp[j])
            end
        end
        str = "The top crates are (Part 2): "
        for i in eachindex(crates)
            str = str * string(crates[i][end])
        end
        println(str)
    catch msg
        print("Error: ",msg)
    end
end

top_crates_p2("supply_stacks.txt")
