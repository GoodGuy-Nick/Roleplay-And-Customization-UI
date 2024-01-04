print("Hello world!")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AdvertisementsEvent = ReplicatedStorage:WaitForChild("Advertisements")
print("Got event for advertisements")

local TweenService = game:GetService("TweenService")

local Billboards = workspace:WaitForChild("Billboards")




AdvertisementsEvent.OnClientEvent:Connect(function(Billboard, billboardType, NewUI, OldUI, totalTime) -- Old UI is optional if its like a scroller
	--print("AdManager:", Billboard, billboardType, NewUI, OldUI, totalTime)
	local Billboard = workspace.Billboards:WaitForChild(Billboard,5)
	if not Billboard then return end
	local SurfaceGUI
	if billboardType == "MultiScrolling_Billboard" then
		SurfaceGUI = Billboard:FindFirstChild("MultiScrolling")
	else
		SurfaceGUI = Billboard:FindFirstChild("Scrolling")
	end

	local function UpdateUI()
		
		if billboardType == "Static_Billboard_Regular" or billboardType == "Static_Billboard_Banner" then
			--print("making")
			SurfaceGUI.SetIn.Image = "rbxassetid://" .. tostring(NewUI)
			SurfaceGUI.SetIn.Position = UDim2.new(0,0,0,0)
			SurfaceGUI.SetOut.Position = UDim2.new(1,0,0,0)
			
		elseif billboardType == "Scrolling_Billboard_Large" or billboardType == "Scrolling_Billboard_Regular" or billboardType == "Scrolling_Billboard_Short" or billboardType == "Scrolling_Billboard_Long" then
			
		
		SurfaceGUI.SetIn.Image = "rbxassetid://" .. tostring(NewUI)
		SurfaceGUI.SetOut.Image = "rbxassetid://" .. tostring(OldUI)
		local SetInGoal = {}
		local SetOutGoal = {}
		SetInGoal.Position = UDim2.new(0,0,0,0)
		SetOutGoal.Position = UDim2.new(1,0,0,0)
		local tweenInfo = TweenInfo.new(5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
		local tween1 = TweenService:Create(SurfaceGUI.SetIn, tweenInfo, SetInGoal)
		local tween2 = TweenService:Create(SurfaceGUI.SetOut, tweenInfo, SetOutGoal)
		--print("tweening it")
		tween1:Play()
		tween2:Play()
		wait(5)
		SurfaceGUI.SetIn.Position = UDim2.new(-1,0,0,0)
		SurfaceGUI.SetOut.Position = UDim2.new(0,0,0,0)
		SurfaceGUI.SetOut.Image = "rbxassetid://" .. tostring(NewUI)
		--print("finished")
			
			
		elseif billboardType == "MultiScrolling_Billboard" then
			local newUI = SurfaceGUI:FindFirstChild("Segment"):Clone()
			newUI.Name = "newSegment"
			newUI.Image = "rbxassetid://" .. tostring(NewUI)
			newUI.Parent = SurfaceGUI
			local Goal = {}
			Goal.Position = UDim2.new(1.1,0,0,0)
			local tweenInfo = TweenInfo.new(totalTime, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
			local tween1 = TweenService:Create(newUI, tweenInfo, Goal)
			tween1:Play()
			wait(totalTime)
			newUI:Destroy()
		end
	end

	if SurfaceGUI then
		UpdateUI()
	else
		--print("Making new GUI for billboard")
		local Clone 
		if billboardType == "MultiScrolling_Billboard" then
			Clone = script:FindFirstChild("MultiScrolling"):Clone()
		else
			Clone = script:FindFirstChild("Scrolling"):Clone()
		end
		Clone.Parent = Billboard
		Clone.Adornee = Billboard
		SurfaceGUI = Clone
		UpdateUI()
	end
	return
end)
