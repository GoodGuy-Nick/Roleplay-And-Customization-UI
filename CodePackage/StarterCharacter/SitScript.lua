repeat wait() until game.Players.LocalPlayer
local player = script.Parent.Parent
local UserInputService = game:GetService("UserInputService")
local Client = game.Players.LocalPlayer

UserInputService.InputBegan:Connect(function(input, gameproc)
	if gameproc == false then
		if input.KeyCode == Enum.KeyCode.X then
			if Client.Character then
				if Client.Character.Humanoid.Sit == false then
					Client.Character.Humanoid.Sit = true
				else
					Client.Character.Humanoid.Sit = false
				end
			end
		end
	end
end)
