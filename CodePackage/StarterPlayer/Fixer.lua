wait()


local Teleports = workspace

local Teleporters = workspace:WaitForChild("Teleporters")

if Teleporters then
	
	repeat wait() until game.Players.LocalPlayer.Character
	
	game.Players.LocalPlayer.CharacterAdded:Connect(function()
		for i,part in pairs(Teleporters:GetChildren()) do
			local ProximityPrompt = part:FindFirstChildOfClass("ProximityPrompt")
			if ProximityPrompt then
				print("FOUND A PROXIMITY PROMPT TO DESTROY")
				ProximityPrompt:Destroy()
			end
		end
		script.Loaded.Value = true
	end)
	
end
