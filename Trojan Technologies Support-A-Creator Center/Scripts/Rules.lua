--[[
TROJAN TECHNOLOGIES
Trojan.lua
Vanilla
1.0.0
cizzles
]]--

--> PRESET; DO NOT CONFIGURE ANYTHING IN THIS SCRIPT

local ReplicatedFirst = game:GetService("ReplicatedFirst")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Config = require(ReplicatedStorage:WaitForChild("Configuration"))
local Info = require(ReplicatedStorage:WaitForChild("Information"))

if Config then
	
	local Mode = Config.Mode
	local CenterRules = Config.Center_Rules
	local Theme = Config.Theme
	local Color = Config.Color
	local PrimaryFont = Config.Primary_Font

	local CR = script:WaitForChild("Center Rules")

	local Background = CR:WaitForChild("Background")
	local Accept = Background:WaitForChild("Accept")
	local Rules = Background:WaitForChild("Rules")
	local Title = Background:WaitForChild("Title")

	if CenterRules == "Default" then
		script:Destroy()
	else
		if PrimaryFont ~= "Default" then
			local newFont = Enum.Font[PrimaryFont]
			Title.Font = newFont
			Rules.Font = newFont
			Accept.Font = newFont
		end	
		
		if Mode ~= "Default" then
			if Theme ~= "Default" or Theme ~= "Light" then
				if Color ~= "Default" then
					local newColor = BrickColor.new(Color).Color
					Title.TextColor3 = newColor
				end
				if Theme == "Dark" then
					Background.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
					Rules.TextColor3 = Color3.fromRGB(255, 255, 255)
				end
			end
		elseif Mode == "Default" or Theme == "Light" then
			if Color ~= "Default" then	
				local newColor = BrickColor.new(Color).Color
				Title.TextColor3 = newColor
			end	
		end
		local Main = CR:Clone()
		Main.Parent = ReplicatedFirst
	end
else
	warn("Configuration Module does not Exist")
end

--> Copyright 2020-2021 Trojan Technologies. © All rights reserved.	
