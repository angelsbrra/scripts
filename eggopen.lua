while true do 
local args = {
	"500KWorld",
	"Multi"
}
game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("openEssence"):InvokeServer(unpack(args))
wait(4)
end
