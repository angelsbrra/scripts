local uilibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiet1308/tvkhub/main/rac"))()
local windowz = uilibrary:CreateWindow("UI Library", "Game Name", true)

local Page1 = windowz:CreatePage("Page I")
local Section1 = Page1:CreateSection("Section Name")

local toggles = {}

local items = {
    "Curses",
    "Bonkais",
    "Marks",
    "SpiritualBeasts",
    "TrialRoll",
    "EssenceStones"
}

local doGacha = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("doGacha")

local function startGacha(item)
    toggles[item] = true
    task.spawn(function()
        while toggles[item] do
            doGacha:InvokeServer("Roll", item)
            task.wait()
        end
    end)
end

local function stopGacha(item)
    toggles[item] = false
end

for _, item in ipairs(items) do
    Section1:CreateToggle(item, {Toggled=false, Description=false}, function(Value)
        if Value then
            startGacha(item)
        else
            stopGacha(item)
        end
    end)
end
