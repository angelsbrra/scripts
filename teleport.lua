-- Services
local TweenService = game:GetService("TweenService")

-- Function to search for the HumanoidRootPart inside any parent
local function findHumanoidRootPart(parent)
    for _, child in ipairs(parent:GetDescendants()) do
        if child.Name == "HumanoidRootPart" then
            return child
        end
    end
    return nil
end

-- Function to tween the player to the correct spawn location (with very fast, constant speed)
local function tweenPlayerToSpawn(player, spawnLocation)
    if player and spawnLocation then
        local humanoidRootPart = findHumanoidRootPart(player)
        if humanoidRootPart then
            -- Calculate the distance and direction for tweening
            local goalCFrame = spawnLocation.CFrame
            local tweenInfo = TweenInfo.new(
                1,  -- Time to complete the tween (very fast)
                Enum.EasingStyle.Sine,  -- Use Linear easing for constant speed
                Enum.EasingDirection.Out, -- This doesn't matter for linear, but good practice
                0,  -- Repeat count (0 means no repeat)
                false,  -- Reverses the tween after completion
                0  -- Delay before the tween starts
            )

            -- Create the tween for the CFrame property
            local tweenGoal = { CFrame = goalCFrame }
            local tween = TweenService:Create(humanoidRootPart, tweenInfo, tweenGoal)
            
            -- Play the tween
            tween:Play()
        end
    end
end

-- Function to handle teleporting (now with tweening) and updating the HumanoidRootPart
local function handleTeleportAndUpdate()
    while true do
        -- Check if there are children in Medium or Easy rooms
        local hardRoom = workspace.Maps.TimeTrialHub.Rooms.Hard
        local mediumRoom = workspace.Maps.TimeTrialHub.Rooms.Medium
        local easyRoom = workspace.Maps.TimeTrialHub.Rooms.Easy

        -- Tween to Medium Spawn if Medium Room has children
                if #hardRoom:GetChildren() > 0 then
            local spawnPart = workspace.Maps.TimeTrialHub.WaitingRooms.Hard.Spawn
            tweenPlayerToSpawn(game.Workspace:FindFirstChild("Shadowman07659"), spawnPart)
            
            -- Find and update the HumanoidRootPart for Shadowman07659
            local targetRootPart = findHumanoidRootPart(hardRoom)
            local angelRootPart = findHumanoidRootPart(game.Workspace:FindFirstChild("Shadowman07659"))
            if targetRootPart and angelRootPart then
                -- Smoothly transition the HumanoidRootPart to match the targetRootPart
                local goalCFrame = targetRootPart.CFrame
                local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0) -- Faster speed
                local tweenGoal = { CFrame = goalCFrame }
                local tween = TweenService:Create(angelRootPart, tweenInfo, tweenGoal)
                tween:Play()

                -- Check if the angelRootPart is close to the targetRootPart and destroy the parent
                if targetRootPart.BillboardGui.Label.Text:match("^0 /") then
                    targetRootPart.Parent:Destroy()
                end
                
                
            else
                warn("One of the HumanoidRootParts does not exist.")
            end
        end
        if #mediumRoom:GetChildren() > 0 then
            local spawnPart = workspace.Maps.TimeTrialHub.WaitingRooms.Medium.Spawn
            tweenPlayerToSpawn(game.Workspace:FindFirstChild("Shadowman07659"), spawnPart)
            
            -- Find and update the HumanoidRootPart for Shadowman07659
            local targetRootPart = findHumanoidRootPart(mediumRoom)
            local angelRootPart = findHumanoidRootPart(game.Workspace:FindFirstChild("Shadowman07659"))
            if targetRootPart and angelRootPart then
                -- Smoothly transition the HumanoidRootPart to match the targetRootPart
                local goalCFrame = targetRootPart.CFrame
                local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0) -- Faster speed
                local tweenGoal = { CFrame = goalCFrame }
                local tween = TweenService:Create(angelRootPart, tweenInfo, tweenGoal)
                tween:Play()

                -- Check if the angelRootPart is close to the targetRootPart and destroy the parent
                if targetRootPart.BillboardGui.Label.Text:match("^0 /") then
                    targetRootPart.Parent:Destroy()
                end
                
                
            else
                warn("One of the HumanoidRootParts does not exist.")
            end
        end

        -- Tween to Easy Spawn if Easy Room has children
        if #easyRoom:GetChildren() > 0 then
            local spawnPart = workspace.Maps.TimeTrialHub.WaitingRooms.Easy.Spawn
            tweenPlayerToSpawn(game.Workspace:FindFirstChild("Shadowman07659"), spawnPart)
            
            -- Find and update the HumanoidRootPart for Shadowman07659
            local targetRootPart = findHumanoidRootPart(easyRoom)
            local angelRootPart = findHumanoidRootPart(game.Workspace:FindFirstChild("Shadowman07659"))
            if targetRootPart and angelRootPart then
                -- Smoothly transition the HumanoidRootPart to match the targetRootPart
                local goalCFrame = targetRootPart.CFrame
                local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0) -- Faster speed
                local tweenGoal = { CFrame = goalCFrame }
                local tween = TweenService:Create(angelRootPart, tweenInfo, tweenGoal)
                tween:Play()

                -- Check if the angelRootPart is close to the targetRootPart and destroy the parent
                if targetRootPart.BillboardGui.Label.Text:match("^0 /") then
                    targetRootPart.Parent:Destroy()
                end
                
                
            else
                warn("One of the HumanoidRootParts does not exist.")
            end
        end
        
        -- Wait a short time before checking again (you can adjust the wait time as needed)
        wait(0.5)
    end
end

-- Start the tween and update loop
handleTeleportAndUpdate()
