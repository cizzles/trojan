--[[
TROJAN TECHNOLOGIES
Trojan.lua
Vanilla
1.0.0
cizzles
]]--

--> PRESET; DO NOT CONFIGURE ANYTHING IN THIS SCRIPT

local ReplicatedFirst = game:GetService("ReplicatedFirst")

if script.Parent == ReplicatedFirst then
	local Main = script:WaitForChild("Trojan Studio Error"):Clone()
	Main.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
end

--> Copyright 2020-2021 Trojan Technologies. © All rights reserved.
