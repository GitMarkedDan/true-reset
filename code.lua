local rf = game:GetService("ReplicatedFirst")
local thing = game:FindFirstChild("backup")
local stuff = getsenv(game.Players.LocalPlayer.PlayerScripts.CharacterScript)
if not thing then
    thing = Instance.new("Folder")
    thing.Name = "backup"
    thing.Parent = game
else
    if not reset then
        print("_G.truereset() has already be implemented! If you want to reset the backup made, type reset = true before the loadstring.")
        error("exit")
    else
        print("Overriding backup...")
    end
end
thing:ClearAllChildren()
for i,v in pairs(game:GetService("ReplicatedFirst"):GetChildren()) do
    v:Clone().Parent = thing
end
function trueresettemp()
    local stuff = getsenv(game.Players.LocalPlayer.PlayerScripts.CharacterScript)
    local lp = game.Players.LocalPlayer
    stuff.resetting = true
	wait()
	lp.PlayerScripts.CharacterScript.Disabled = true
	wait()
	if workspace:FindFirstChild("debris") then workspace.debris:ClearAllChildren() end
	if stuff.map then stuff.map:Destroy() end
	if stuff.vis then stuff.vis:Destroy() end
	if workspace.char then workspace.char:Destroy() end
	for i,v in pairs(workspace:GetChildren()) do
		if v:IsA("Model") then
			v:Destroy()
		end
	end
	rf:ClearAllChildren()
	for i,v in pairs(game.backup:GetChildren()) do
		local l = v:Clone()
		if l then 
			l.Parent = rf
		end
	end
	workspace.share.removeplam:FireServer()
	lp.PlayerGui.UI:Destroy()
	game.StarterGui.UI:Clone().Parent = lp.PlayerGui
	local l = lp.PlayerScripts.CharacterScript
	game.StarterPlayer.StarterPlayerScripts.CharacterScript:Clone().Parent = lp.PlayerScripts
	l:Destroy()
	wait()
	stuff.resetting = false
end
getgenv()._G.truereset = trueresettemp
getgenv().truereset = trueresettemp
stuff._G.truereset = trueresettemp
stuff.truereset = trueresettemp
print("True Reset has been added! Run _G.truereset() or truereset() to reset!")
