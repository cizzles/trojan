--[[
TROJAN TECHNOLOGIES
Trojan.lua
Vanilla
1.0.0
cizzles
]]--

--> PRESET; DO NOT CONFIGURE ANYTHING IN THIS SCRIPT

local Completed = false

local GamePasses = false
local Assets = false
local Bundles = false
local Premium = false

local TeleportService = game:GetService("TeleportService")
local MarketplaceService = game:GetService("MarketplaceService")
local MessagingService = game:GetService("MessagingService")
local GroupService = game:GetService("GroupService")
local UserService = game:GetService("UserService")
local Players = game:GetService("Players")

local ReplicatedFirst = game:GetService("ReplicatedFirst")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Config = require(ReplicatedStorage:WaitForChild("Configuration"))
local Info = require(ReplicatedStorage:WaitForChild("Information"))

local FundsEvent = ReplicatedStorage:WaitForChild("FundsEvent")

local PlaceID = game.PlaceId
local PlaceInfo = MarketplaceService:GetProductInfo(PlaceID)

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
	local Funds = Background:WaitForChild("Total_Funds_Raised")
	
	local GamePassFrame = Background:WaitForChild("Game_Passes")
	local GamePassTextBox = GamePassFrame:WaitForChild("Enter_ID_Box")
	local GamePassWarning = GamePassFrame:WaitForChild("Warning")
	
	local AssetFrame = Background:WaitForChild("Assets")
	local AssetTextBox = AssetFrame:WaitForChild("Enter_ID_Box")
	local AssetWarning = AssetFrame:WaitForChild("Warning")
	
	local BundleFrame = Background:WaitForChild("Bundles")
	local BundleTextBox = BundleFrame:WaitForChild("Enter_ID_Box")
	local BundleWarning = BundleFrame:WaitForChild("Warning")
	
	local PremiumFrame = Background:WaitForChild("Premium")
	local PremiumTextButton = PremiumFrame:WaitForChild("Buy_Premium")
	
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
		AssetTextBox.Font = newFont
		AssetWarning.Font = newFont
		BundleTextBox.Font = newFont
		BundleWarning.Font = newFont
		PremiumTextButton.Font = newFont
		Funds.Font = newFont
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
				Funds.TextColor3 = Color3.fromRGB(255, 255, 255)
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
	
		if Package == 1127843735 then	
			Assets = true
		elseif Package == 1127843948 then	
			GamePasses = true
			Assets = true
		elseif Package == 1127843431 then
			Assets = true
			GamePasses = true
			Bundles = true
		elseif Package == 1127826822 then
			Assets = true
			GamePasses = true
			Bundles = true
			Premium = true
		else
			warn("Package is Invalid")
		end
	
	Completed = true
	
else
	warn("Configuration Module does not Exist")
end

if Completed == true and script.Parent == ReplicatedFirst then
	
	local totalFunds = 0
	
	local Main = script:WaitForChild("Trojan Support-A-Creator Center"):Clone()
	Main.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
	
	local Background = Main:WaitForChild("Background")
	
	local GamePassFrame = Background:WaitForChild("GamePasses")
	local GamePassTextBox = GamePassFrame:WaitForChild("Enter_ID_Box")
	
	local AssetFrame = Background:WaitForChild("Assets")
	local AssetTextBox = AssetFrame:WaitForChild("Enter_ID_Box")
	
	local BundleFrame = Background:WaitForChild("Bundles")
	local BundleTextBox = BundleFrame:WaitForChild("Enter_ID_Box")
	
	local PremiumFrame = Background:WaitForChild("Premium")
	local PremiumTextButton = PremiumFrame:WaitForChild("Buy_Premium")
	
	if Assets == true then
		AssetFrame.Visible = true
		
		repeat wait() until Players.LocalPlayer

		AssetTextBox.FocusLost:connect(function()pcall(function()
				local isPurchased = false
				MarketplaceService:PromptPurchase(Players.LocalPlayer, tonumber(AssetTextBox.Text))
				MarketplaceService.PromptPurchaseFinished(Players.LocalPlayer, tonumber(AssetTextBox.Text), isPurchased)
				if isPurchased == true then
					local Info = MarketplaceService:GetProductInfo(tonumber(AssetTextBox.Text), 0)
					local Price = Info.PriceInRobux
					FundsEvent:FireServer((Price)*0.4)
				end	
			end)
		end)
	end
	
	if GamePasses == true then	
		GamePassFrame.Visible = true
		
		repeat wait() until Players.LocalPlayer

		GamePassTextBox.FocusLost:Connect(function()pcall(function()
				local isPurchased = false
				MarketplaceService:PromptGamePassPurchase(Players.LocalPlayer, tonumber(GamePassTextBox.Text))
				MarketplaceService.PromptGamePassPurchaseFinished(Players.LocalPlayer, tonumber(GamePassTextBox.Text), isPurchased)
				if isPurchased == true then
					local Info = MarketplaceService:GetProductInfo(tonumber(GamePassTextBox.Text), 2)
					local Price = Info.PriceInRobux
					FundsEvent:FireServer((Price)*0.4)
				end	
			end)	
		end)
	end	
	
	if Bundles == true then
		BundleFrame.Visible = true

		repeat wait() until Players.LocalPlayer

		BundleTextBox.FocusLost:Connect(function()pcall(function()
				local isPurchased = false
				MarketplaceService:PromptBundlePurchase(Players.LocalPlayer, tonumber(BundleTextBox.Text))
				MarketplaceService.PromptBundlePurchaseFinished(Players.LocalPlayer, tonumber(BundleTextBox.Text), isPurchased)
				if isPurchased == true then
					local Info = MarketplaceService:GetProductInfo(tonumber(BundleTextBox.Text), 4)
					local Price = Info.PriceInRobux
					FundsEvent:FireServer((Price)*0.4)
				end	
			end)
		end)		
		
	end
	
	if Premium == true then
		PremiumFrame.Visible = true

		repeat wait() until Players.LocalPlayer

		PremiumTextButton.Activated:Connect(function()pcall(function()
				MarketplaceService:PromptPremiumPurchase(Players.LocalPlayer)
			end)
		end)
	end
end

--> Copyright 2020-2021 Trojan Technologies. © All rights reserved.
