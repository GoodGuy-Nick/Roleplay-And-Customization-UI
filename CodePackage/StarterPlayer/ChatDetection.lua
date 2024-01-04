print("ChatDetection.lua")

local UserInputService = game:GetService("UserInputService")
local Client = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local isTyping = ReplicatedStorage:WaitForChild("isTyping")


local typing = false
UserInputService.InputBegan:Connect(function(input, gameprocessed)
	if input.KeyCode == Enum.KeyCode.Left or input.KeyCode == Enum.KeyCode.Right or input.KeyCode == Enum.KeyCode.Tab then return end
	if typing == true and input.KeyCode == Enum.KeyCode.Return and gameprocessed == true then
		
		typing = false
		isTyping:FireServer(false)
		return
	end
	if input.UserInputType == Enum.UserInputType.Keyboard and gameprocessed == true then
		if typing == false then
			typing = true
			isTyping:FireServer(true)
		end
	elseif input.UserInputType == Enum.UserInputType.Keyboard and gameprocessed == false then
		if typing == true then
			typing = false
			isTyping:FireServer(false)
		end
	end
end)
