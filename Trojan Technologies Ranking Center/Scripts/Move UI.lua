--[[
TROJAN TECHNOLOGIES
Trojan.lua
Vanilla
1.0.0
cizzles
]]--

--> PRESET; DO NOT CONFIGURE ANYTHING IN THIS SCRIPT

local RunService = game:GetService("RunService")
local ReplicatedFirst = game:GetService("ReplicatedFirst")

script.Parent.Disabling.Parent = ReplicatedFirst

script.Parent.Loading.Parent = ReplicatedFirst

if RunService:IsStudio() or RunService:IsRunMode() then
	script.Parent:WaitForChild("Error").Parent = ReplicatedFirst	
end

--> Copyright 2020-2021 Trojan Technologies. © All rights reserved.
