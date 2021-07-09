--[[
TROJAN TECHNOLOGIES
Trojan.lua
Vanilla
1.0.0
cizzles
]]--

--> PRESET; DO NOT CONFIGURE ANYTHING IN THIS SCRIPT

local Accept = script.Parent.Parent:WaitForChild("Accept")
local Rules = script.Parent.Parent.Parent.Parent:WaitForChild("Center Rules")

Accept.Activated:Connect(function()
	Accept:WaitForChild("Image").ImageColor3 = Color3.fromRGB(0, 0, 0)
	Rules:Destroy()
end)

Accept.MouseEnter:Connect(function()
	Accept:WaitForChild("Image").ImageColor3 = Color3.fromRGB(0, 0, 0)
end)

Accept.MouseLeave:Connect(function()
	Accept:WaitForChild("Image").ImageColor3 = Color3.fromRGB(0, 117, 82)
end)

--> Copyright 2020-2021 Trojan Technologies. © All rights reserved.	
