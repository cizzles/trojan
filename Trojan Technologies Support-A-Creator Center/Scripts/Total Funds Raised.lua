--[[
TROJAN TECHNOLOGIES
Trojan.lua
Vanilla
1.0.0
cizzles
]]--

--> PRESET; DO NOT CONFIGURE ANYTHING IN THIS SCRIPT

local DataStoreService = game:GetService("DataStoreService")
local MarketplaceService = game:GetService("MarketplaceService")
local GroupService = game:GetService("GroupService")
local UserService = game:GetService("UserService")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RemoteEvent = Instance.new("RemoteEvent")
RemoteEvent.Parent = ReplicatedStorage
RemoteEvent.Name = "FundsEvent"
local FundsEvent = ReplicatedStorage:WaitForChild("FundsEvent")

local PlaceID = game.PlaceId
local PlaceInfo = MarketplaceService:GetProductInfo(PlaceID)

game.Players.PlayerAdded:Connect(function(Player)
	
	local Funds = Player:WaitForChild("PlayerGui"):WaitForChild("Trojan Support-A-Creator"):WaitForChild("Background"):WaitForChild("Total_Funds_Raised")

	local fundsData = DataStoreService:GetDataStore("Funds")
	local storeKey = 0
	local serverFunds = 0
		
	if PlaceInfo.Creator.CreatorType == "Group" then
		local Group = GroupService:GetGroupInfoAsync(PlaceInfo.Creator.CreatorTargetId)
		storeKey = Group.Owner.Id
		return storeKey
	elseif PlaceInfo.Creator.CreatorType == "User" then
		local success, result = pcall(function()
			return UserService:GetUserInfosByUserIdsAsync({(PlaceInfo.Creator.CreatorTargetId)})
		end)
		
		if success then
			for _, userInfo in ipairs(result) do
				storeKey = userInfo.Id
				return storeKey
			end
		end
	end
	
	local function getFunds()
		local success, totalFunds = pcall(function()
			return fundsData:GetAsync(tostring(storeKey))
		end)
			
		Funds.Text = string.format("Total Funds Raised: %d Robux", totalFunds)
		return totalFunds
	end
	
	local function setFunds()	
		
		local function currentFunds()
			if getFunds() then
				local currentFunds = (getFunds()) + serverFunds
				serverFunds = 0
				return currentFunds
			end
		end

		local setSuccess, errorMessage = pcall(function()
			fundsData:SetAsync(tostring(storeKey), (currentFunds()))
		end)

		if not setSuccess then
			warn(errorMessage)
		end
	end
	
	local function fundsEvent(newFunds)
		serverFunds = newFunds
		setFunds()
		return serverFunds
	end
	
	setFunds()
	
	FundsEvent.OnServerEvent:Connect(fundsEvent)
	
end)

--> Copyright 2020-2021 Trojan Technologies. © All rights reserved.
