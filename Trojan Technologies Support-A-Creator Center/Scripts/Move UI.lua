--[[
TROJAN TECHNOLOGIES
Trojan.lua
Vanilla
1.0.0
cizzles
]]--

--> PRESET; DO NOT CONFIGURE ANYTHING IN THIS SCRIPT

local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedFirst = game:GetService("ReplicatedFirst")

script.Parent.Parent:WaitForChild("Modules"):WaitForChild("Configuration").Parent = ReplicatedStorage
script.Parent.Parent:WaitForChild("Modules"):WaitForChild("Information").Parent = ReplicatedStorage

script.Parent:WaitForChild("Disabling").Parent = ReplicatedFirst

script.Parent:WaitForChild("Loading").Parent = ReplicatedFirst

if RunService:IsStudio() or RunService:IsRunMode() then
	script.Parent:WaitForChild("Error").Parent = ReplicatedFirst	
end

script:Destroy()

--> Copyright 2020-2021 Trojan Technologies. © All rights reserved.
