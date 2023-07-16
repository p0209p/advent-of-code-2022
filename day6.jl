function marker_start_location(filename::String,message_length::Int64)
    try line = readlines(filename)
        line = line[1]
        start = 1
        stop = message_length
        while stop <= length(line)
            if length(unique(line[start:stop])) == message_length
                println("Marker location: "*string(stop))
                break
            else 
                start = start + 1
                stop = stop + 1
            end
        end
    catch msg
        print("Error: ",msg)
    end
end

marker_start_location("tuning_characters.txt",4)

# Part 2
marker_start_location("tuning_characters.txt",14)
