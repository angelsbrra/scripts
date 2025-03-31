roll = true


local items = {
    -- "SpiritualBeasts",
    -- "TrialRoll",
    "EssenceStones",
	"Bonkais"
}

local doGacha = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("doGacha")

while roll do
    for _, item in ipairs(items) do
        doGacha:InvokeServer("Roll", item)
    end
    task.wait()
end
