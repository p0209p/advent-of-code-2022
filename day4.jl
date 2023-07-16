using Scanf

function in_range(filename::String)
    try lines = readlines(filename)
        count = 0
        for i in eachindex(lines)
            line = lines[i]
            _,a,b,c,d = @scanf(line,"%d-%d,%d-%d",Int,Int,Int,Int)
            if a >= c && b <= d || c >= a && d <= b
                count += 1
            end
        end
        println("Assignments where range overlap: "*string(count))
    catch msg
        print("Error: ",msg)
    end
end

in_range("camp_cleanup.txt")

# Part 2
function in_range_p2(filename::String)
    try lines = readlines(filename)
        count = 0
        for i in eachindex(lines)
            line = lines[i]
            _,a,b,c,d = @scanf(line,"%d-%d,%d-%d",Int,Int,Int,Int)
            if !isempty(intersect(collect(a:b),collect(c:d))) 
                count += 1
            end
        end
        print("Assignments where ranges intersect (Part 2):  "*string(count))
    catch msg
        print("Error: ",msg)
    end
end

in_range_p2("camp_cleanup.txt")
