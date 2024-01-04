-- Gameloader
-- Change your 'CODEPACKAGE_ID' with your respective codepackage ID.

local module = {}

warn("GameLoader is going...")
local InsertService = game:GetService("InsertService")
local CodePackage =  InsertService:LoadAsset(CODEPACKAGE_ID) -- latest as of 11/17/2023
CodePackage = CodePackage.CodePackage
CodePackage.Parent = game:GetService("ServerScriptService")
CodePackage.Server.Disabled = false
CodePackage.Main.Client.Disabled = false

if CodePackage:FindFirstChild("BetterChatV3") then  game:GetService("Chat").LoadDefaultChat = false; game:GetService("Chat").BubbleChatEnabled = false; CodePackage.BetterChatV3.Config.Loader.Disabled = false; warn("Better chat is enabled.") end
if not game:GetService("StarterGui"):FindFirstChild("Main") then CodePackage.Main.Parent = game:GetService("StarterGui") end
CodePackage.Credit.Disabled = false


for i, v in pairs(CodePackage.StarterCharacter:GetChildren()) do
	v.Parent = game:GetService("StarterPlayer").StarterCharacterScripts
	v.Disabled = false
end
for i, v in pairs(CodePackage.StarterPlayer:GetChildren()) do
	v.Parent = game:GetService("StarterPlayer").StarterPlayerScripts
	v.Disabled = false
end

for i, v in pairs(CodePackage.StarterPack:GetChildren()) do
	v.Parent = game:GetService("StarterPack")
end



return module
