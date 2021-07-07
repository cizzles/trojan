--[[
TROJAN TECHNOLOGIES
Trojan.lua
Vanilla
1.0.0
cizzles
]]--

--> PRESET; DO NOT CONFIGURE ANYTHING IN THIS SCRIPT

while true do
	local Success, Error = pcall(function()
		game:GetService("StarterGui"):SetCore("TopbarEnabled", false)
		game:GetService("StarterGui"):SetCore('ResetButtonCallback', false)
		game:GetService("TeleportService").CustomizedTeleportUI = true
	end)
	if Success then
		break
	end
	wait()
end

--> Copyright 2020-2021 Trojan Technologies. © All rights reserved.
