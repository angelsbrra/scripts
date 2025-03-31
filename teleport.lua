local TweenService = game:GetService("TweenService")

local function findHumanoidRootPart(parent)
    for _, child in ipairs(parent:GetDescendants()) do
        if child.Name == "HumanoidRootPart" then
            return child
        end
    end
    return nil
end


local function tweenPlayerToSpawn(player, spawnLocation)
    if player and spawnLocation then
        local humanoidRootPart = findHumanoidRootPart(player)
        if humanoidRootPart then
            local goalCFrame = spawnLocation.CFrame
            local tweenInfo = TweenInfo.new(
                1, 
                Enum.EasingStyle.Sine,
                Enum.EasingDirection.Out,
                0,
                false,
                0
            )

            local tweenGoal = { CFrame = goalCFrame }
            local tween = TweenService:Create(humanoidRootPart, tweenInfo, tweenGoal)
            
            tween:Play()
        end
    end
end

local function handleTeleportAndUpdate()
    while true do
        local hardRoom = workspace.Maps.TimeTrialHub.Rooms.Hard
        local mediumRoom = workspace.Maps.TimeTrialHub.Rooms.Medium
        local easyRoom = workspace.Maps.TimeTrialHub.Rooms.Easy

                if #hardRoom:GetChildren() > 0 then
            local spawnPart = workspace.Maps.TimeTrialHub.WaitingRooms.Hard.Spawn
            tweenPlayerToSpawn(game.Workspace:FindFirstChild("USERNAME"), spawnPart)
            
            local targetRootPart = findHumanoidRootPart(hardRoom)
            local angelRootPart = findHumanoidRootPart(game.Workspace:FindFirstChild("USERNAME"))
            if targetRootPart and angelRootPart then
                local goalCFrame = targetRootPart.CFrame
                local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
                local tweenGoal = { CFrame = goalCFrame }
                local tween = TweenService:Create(angelRootPart, tweenInfo, tweenGoal)
                tween:Play()

                if targetRootPart.BillboardGui.Label.Text:match("^0 /") then
                    targetRootPart.Parent:Destroy()
                end
                
                
            else
                warn("One of the HumanoidRootParts does not exist.")
            end
        end
        if #mediumRoom:GetChildren() > 0 then
            local spawnPart = workspace.Maps.TimeTrialHub.WaitingRooms.Medium.Spawn
            tweenPlayerToSpawn(game.Workspace:FindFirstChild("USERNAME"), spawnPart)
            
            local targetRootPart = findHumanoidRootPart(mediumRoom)
            local angelRootPart = findHumanoidRootPart(game.Workspace:FindFirstChild("USERNAME"))
            if targetRootPart and angelRootPart then
                local goalCFrame = targetRootPart.CFrame
                local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
                local tweenGoal = { CFrame = goalCFrame }
                local tween = TweenService:Create(angelRootPart, tweenInfo, tweenGoal)
                tween:Play()

                if targetRootPart.BillboardGui.Label.Text:match("^0 /") then
                    targetRootPart.Parent:Destroy()
                end
                
                
            else
                warn("One of the HumanoidRootParts does not exist.")
            end
        end

        if #easyRoom:GetChildren() > 0 then
            local spawnPart = workspace.Maps.TimeTrialHub.WaitingRooms.Easy.Spawn
            tweenPlayerToSpawn(game.Workspace:FindFirstChild("USERNAME"), spawnPart)
            
            local targetRootPart = findHumanoidRootPart(easyRoom)
            local angelRootPart = findHumanoidRootPart(game.Workspace:FindFirstChild("USERNAME"))
            if targetRootPart and angelRootPart then
                local goalCFrame = targetRootPart.CFrame
                local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
                local tweenGoal = { CFrame = goalCFrame }
                local tween = TweenService:Create(angelRootPart, tweenInfo, tweenGoal)
                tween:Play()

                if targetRootPart.BillboardGui.Label.Text:match("^0 /") then
                    targetRootPart.Parent:Destroy()
                end
                
                
            else
                warn("One of the HumanoidRootParts does not exist.")
            end
        end
        
        wait(0.5)
    end
end

handleTeleportAndUpdate()
