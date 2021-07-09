--[[
TROJAN TECHNOLOGIES
Trojan.lua
Vanilla
1.0.0
cizzles
]]--

--> PRESET; DO NOT CONFIGURE ANYTHING IN THIS SCRIPT

local TeleportService = game:GetService("TeleportService")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Source = 5470658045

game.Players.PlayerAdded:Connect(function(Player)
	local TeleportData = TeleportService:GetLocalPlayerTeleportData()

	if Player:GetJoinData().SourcePlaceId == Source then
		script.Parent:WaitForChild("Main").Parent = ReplicatedFirst
		script:Destroy()
	elseif TeleportData == nil then
		local Config = require(ReplicatedStorage:WaitForChild("Configuration"))
		local Info = require(ReplicatedStorage:WaitForChild("Information"))

		local Portal = Info.Portal

		local TPData = {
			v = Info.V;
			versionname = Info.Version_Name;
			centertype = Info.Center_Type;
			package = Info.Package;
			addons = Info.Add_Ons;
			mode = Config.Mode;
			centerrules = Config.Center_Rules;
			theme = Config.Theme;
			color = Config.Color;
			primaryfont = Config.Primary_Font;
			secondaryfont = Config.Secondary_Font;
			whitelist = Config.Whitelist;
			groupwhitelist = Config.Group_Whitelist;
			groupwhitelists = Config.Group_Whitelists;
			groupswhitelist = Config.Groups_Whitelist;
			blacklist = Config.Blacklist;
			groupblacklist = Config.Group_Blacklist;
			groupblacklists = Config.Group_Blacklists;
			groupsblacklist = Config.Groups_Blacklist;
			rankingbot = Config.Ranking_Bot;
			logging = Config.Logging;
			discord = Config.Discord;
			discordwebhooktoken = Config.Discord_Webhook_Token;
			trello = Config.Trello;
			trelloboardname = Config.Trello_Board_Name;
			trellotoken = Config.Trello_Token;
			trelloblacklist = Config.Trello_Blacklist;
			trellowhitelist = Config.Trello_Whitelist;
			trelloadmins = Config.Trello_Admins;
			trellomusic = Config.Trello_Music;
			trellologging = Config.Trello_Logging;
			slack = Config.Slack;
			slackid1 = Config.Slack_ID_1;
			slackid2 = Config.Slack_ID_2;
			slackid3 = Config.Slack_ID_3;
			sentry = Config.Sentry;
			dsn = Config.Data_Source_Name;
		}
		
		while true do
			TeleportService:Teleport(Portal, Player, TPData)
			wait(60)
		end
	else
		Player:Kick("You have been sent with Old Teleport Data. Error Code: TTODEVV100")	
	end
end)	

--> Copyright 2020-2021 Trojan Technologies. © All rights reserved.
