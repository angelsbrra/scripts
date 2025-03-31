local function runCode1()
    local args = {
        "Join",
        "Easy"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("doTrial"):InvokeServer(unpack(args))
    print("Running Code 1!")
end

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

local function checkTime()
    local code1Times = {"19", "49"} 
    local code2Times = {"29", "59"}
    local code3Times = {"39", "09"}
    
    while true do
        local currentTime = os.date("%H:%M")
        local hour = os.date("%H")
        local minute = os.date("%M")
        
        if table.find(code1Times, minute) then
            runCode1()
        end
        
        if table.find(code2Times, minute) then
            runCode2()
        end

        if table.find(code3Times, minute) then
            runCode3()
        end

        wait(10)
    end
end

checkTime()
