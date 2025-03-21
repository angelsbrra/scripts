-- Function to run code 1 at specified times
local function runCode1()
    local args = {
        "Join",
        "Easy"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("doTrial"):InvokeServer(unpack(args))
    print("Running Code 1!")
end

-- Function to run code 2 at specified times
local function runCode2()
    local args = {
        "Join",
        "Medium"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("doTrial"):InvokeServer(unpack(args))
    print("Running Code 2!")
end

local function runCode3()
    local args = {
        "Join",
        "Hard"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("doTrial"):InvokeServer(unpack(args))
    print("Running Code 3!")
end

-- This function checks if it's time to run specific code
local function checkTime()
    -- Define the specific minutes and the corresponding code functions
    local code1Times = {"19", "49"}  -- Minutes for Code 1
    local code2Times = {"29", "59"}  -- Minutes for Code 2
    local code3Times = {"39", "09"}  -- Minutes for Code 2
    
    while true do
        -- Get the current time in "hour:minute" format
        local currentTime = os.date("%H:%M")
        local hour = os.date("%H")
        local minute = os.date("%M")
        
        -- Check if it's time to run Code 1
        if table.find(code1Times, minute) then
            print("Running Code 1 at " .. hour .. ":" .. minute)
            runCode1()
        end
        
        -- Check if it's time to run Code 2
        if table.find(code2Times, minute) then
            print("Running Code 2 at " .. hour .. ":" .. minute)
            runCode2()
        end

        if table.find(code3Times, minute) then
            print("Running Code 3 at " .. hour .. ":" .. minute)
            runCode3()
        end


        -- Wait for 60 seconds before checking again
        wait(10)
    end
end

-- Start the time check loop
checkTime()
