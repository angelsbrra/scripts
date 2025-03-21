local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.IgnoreGuiInset = true -- Ensures it covers the entire screen without UI gaps

local frame = Instance.new("Frame", gui)

frame.Size = UDim2.new(1, 0, 1, 0) -- Full-screen
frame.BackgroundColor3 = Color3.new(0, 0, 0) -- Black color
frame.Visible = true -- Hidden by default

-- Toggle when player presses "B"
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.B and not gameProcessed then
        frame.Visible = not frame.Visible
    end
end)
