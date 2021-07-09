--[[
TROJAN TECHNOLOGIES
Trojan.lua
Vanilla
1.0.0
cizzles
]]--

--> PRESET; DO NOT CONFIGURE ANYTHING IN THIS SCRIPT

local Completed = false

local GP = false
local I = false

local TeleportService = game:GetService("TeleportService")
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GroupService = game:GetService("GroupService")
local UserService = game:GetService("UserService")

local Config = require(ReplicatedStorage:WaitForChild("Configuration"))
local Info = require(ReplicatedStorage:WaitForChild("Information"))

local PlaceID = game.PlaceId
local PlaceInfo = ReplicatedFirst:GetProductInfo(PlaceID)

if Config then
	
	local Mode = Config.Mode
	local Theme = Config.Theme
	local Color = Config.Color
	local PrimaryFont = Config.Primary_Font
	local SecondaryFont = Config.Secondary_Font
	
	local Center = script:WaitForChild("Trojan Support-A-Creator Center")
	
	local Background = Center:WaitForChild("Background")
	local Title = Background:WaitForChild("Title")
	local HowTo = Background:WaitForChild("How_To")
	local StepOne = Background:WaitForChild("Step_1")
	local StepTwo = Background:WaitForChild("Step_2")
	local Example = Background:WaitForChild("Example")
	local StepThree = Background:WaitForChild("Step_3")
	local StepFour = Background:WaitForChild("Step_4")
	
	local GamePassTextBox = Background:WaitForChild("Game_Passes_Only"):WaitForChild("Enter_ID_Box")
	local GamePassWarning = Background:WaitForChild("Game_Passes_Only"):WaitForChild("Warning")
	local ItemTextBox = Background:WaitForChild("Items_Only"):WaitForChild("Enter_ID_Box")
	local ItemWarning = Background:WaitForChild("Items_Only"):WaitForChild("Warning")

	if PlaceInfo.Creator.CreatorType == "Group" then
		local Group = GroupService:GetGroupInfoAsync(PlaceInfo.Creator.CreatorTargetId)
		Title.Text = string.format("SUPPORT %s", string.upper(Group.Name))
	elseif PlaceInfo.Creator.CreatorType == "User" then
		local success, result = pcall(function()
			return UserService:GetUserInfosByUserIdsAsync({(PlaceInfo.Creator.CreatorTargetId)})
		end)
		if success then
			for _, userInfo in ipairs(result) do
				Title.Text = string.format("SUPPORT %s", string.upper(userInfo.DisplayName))
			end
		end
	end
	
	if PrimaryFont ~= "Default" then
		local newFont = Enum.Font[PrimaryFont]
		Title.Font = newFont
		HowTo.Font = newFont
		GamePassTextBox.Font = newFont
		GamePassWarning.Font = newFont
		ItemTextBox.Font = newFont
		ItemWarning.Font = newFont
	end
	
	if SecondaryFont ~= "Default" then
		local newFont = Enum.Font[SecondaryFont]
		StepOne.Font = newFont
		StepTwo.Font = newFont
		Example.Font = newFont
		StepThree.Font = newFont
		StepFour.Font = newFont
	end	
	
	if Mode ~= "Default" then
		if Theme ~= "Default" or Theme ~= "Light" then
			if Color ~= "Default" then
				local newColor = BrickColor.new(Color).Color
				Title.TextColor3 = newColor
				StepFour.TextColor3 = newColor
			end
			if Theme == "Dark" then
				Background.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
				HowTo.TextColor3 = Color3.fromRGB(255, 255, 255)
				StepOne.TextColor3 = Color3.fromRGB(255, 255, 255)
				StepTwo.TextColor3 = Color3.fromRGB(255, 255, 255)
				StepThree.TextColor3 = Color3.fromRGB(255, 255, 255)
			end
		end
	elseif Mode == "Default" or Theme == "Light" then
		if Color ~= "Default" then	
			local newColor = BrickColor.new(Color).Color
			Title.TextColor3 = newColor
			StepFour.TextColor3 = newColor
		end	
	end
	
	local Package = Info.Package
	local AddOns = Info.AddOns
	
		if Package == 1127843431 then
			GP = true	
		elseif Package == 1127843735 then	
			I = true
		elseif Package == 1127843948 then	
			GP = true
			I = true
		else
			warn("Package is Invalid")
		end
	
	Completed = true
	
else
	warn("Configuration Module does not Exist")
end

if Completed == true and script.Parent == ReplicatedFirst then
	
	local Main = script:WaitForChild("Trojan Support-A-Creator Center"):Clone()
	Main.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
	
	if I == true and GP == true then
		local Item = Main:WaitForChild("Background"):WaitForChild("Items_Only")
		local GamePass = Main:WaitForChild("Background"):WaitForChild("Game_Passes_Only")
		
		Item.Visible = true
		GamePass.Visible = true
		
		local ItemBox = Item:WaitForChild("Enter_ID_Box")
		local GamePassBox = GamePass:WaitForChild("Enter_ID_Box")

		repeat wait() until game.Players.LocalPlayer

		Item:WaitForChild("Enter_ID_Box").FocusLost:connect(function()pcall(function()
				MarketplaceService:PromptPurchase(game.Players.LocalPlayer, tonumber(ItemBox.Text))
			end)
		end)
		
		GamePass:WaitForChild("Enter_ID_Box").FocusLost:connect(function()pcall(function()		
				MarketplaceService:PromptGamePassPurchase(game.Players.LocalPlayer, tonumber(GamePassBox.Text))
			end)	
		end)
	elseif I == true and GP == false then
		local Item = Main:WaitForChild("Background"):WaitForChild("Items_Only")
		
		Item.Visible = true
		
		local ItemBox = Item:WaitForChild("Enter_ID_Box")
	
		repeat wait() until game.Players.LocalPlayer

		Item:WaitForChild("Enter_ID_Box").FocusLost:connect(function()pcall(function()
				MarketplaceService:PromptPurchase(game.Players.LocalPlayer, tonumber(ItemBox.Text))
			end)
		end)
	elseif I == false and GP == true then	
		local GamePass = Main:WaitForChild("Background"):WaitForChild("Game_Passes_Only")
		
		GamePass.Visible = true
		
		local GamePassBox = GamePass:WaitForChild("Enter_ID_Box")

		repeat wait() until game.Players.LocalPlayer

		GamePass:WaitForChild("Enter_ID_Box").FocusLost:connect(function()pcall(function()		
				MarketplaceService:PromptGamePassPurchase(game.Players.LocalPlayer, tonumber(GamePass.Text))
			end)	
		end)
	end	
end

--> Copyright 2020-2021 Trojan Technologies. © All rights reserved.
