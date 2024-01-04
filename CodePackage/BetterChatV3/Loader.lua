-- Author: @Jumpathy
-- Name: loader.lua
-- Description: Better chat loader

local inDevelopment = false
local configuration = require(script.Parent)
local toRequire = inDevelopment and  game:GetService("ServerScriptService"):WaitForChild("MainModule") or BETTERCHAT_ID
local addons = script.Parent.Parent:WaitForChild("Addons")

if game:GetService("Chat").LoadDefaultChat == true then return end
require(toRequire)(configuration,addons)

