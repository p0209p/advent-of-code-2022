# A Rock B Paper C Scissor
# X Rock Y Paper Z Scissor

# Loss
# A Z
# B X
# C Y
# Draw
# A X
# B Y
# C Z
# Win
# A Y
# B Z
# C X

# Part 1

function myscore(x::Char)
    if x == 'X'
        return 1
    elseif x == 'Y'
        return 2
    else 
        return 3
    end
end

function matchscore(x::String)
    if x == "A Z" || x == "B X" || x == "C Y"
        return 0
    elseif x == "A X" || x == "B Y" || x == "C Z"
        return 3
    else
        return 6
    end
end

function total_score(filename::String)
    try lines = readlines(filename)
        my_choice = map(x -> x[3], lines)
        my_scores = map(x -> myscore(x), my_choice)
        match_scores = map(x -> matchscore(x), lines)
        println("Total score: "*string(sum(my_scores .+ match_scores)))
    catch msg
        print("Error:", msg)
    end
end

total_score("rock_paper_scissor.txt")

# Part 2 

function myscore_p2(x::String)
    if x == "A X" || x == "C Y" || x == "B Z"
        return 3
    elseif x == "C X" || x == "B Y" || x == "A Z"
        return 2
    else 
        return 1
    end
end

function matchscore_p2(x::Char)
    if x == 'X'
        return 0
    elseif x == 'Y'
        return 3
    else
        return 6
    end
end

function total_score_p2(filename::String)
    try lines = readlines(filename)
        my_scores = map(x -> myscore_p2(x), lines)
        match_results = map(x -> x[3], lines)
        match_scores = map(x -> matchscore_p2(x), match_results)
        println("Total score (Part 2): "*string(sum(my_scores .+ match_scores)))
    catch msg
        print("Error:", msg)
    end
end


total_score_p2("rock_paper_scissor.txt")
