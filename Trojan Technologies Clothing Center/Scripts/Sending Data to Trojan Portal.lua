--[[
TROJAN TECHNOLOGIES
Trojan.lua
Vanilla
1.0.0
cizzles
]]--

--> PRESET; DO NOT CONFIGURE ANYTHING IN THIS SCRIPT

local Config = require(script.Parent.Parent.Modules.Configuration)
local Info = require(script.Parent.Parent.Modules.Information)

local Portal = Info.Portal
local TeleportService = game:GetService("TeleportService")

local TPData = {
	versionname = Info.Version_Name;
	v = Info.V;
	centertype = Info.Center_Type;
	package = Info.Package;
	addons = Info.Add_Ons;
	mode = Config.Mode;
	clothing = Config.Clothing;
	teleportafterpurchase = Config.Teleport_After_Purchase;
	groupadmin = Config	.Group_Admin;
	groupadmins = Config.Group_Admins;
	useradmins = Config.User_Admins;
	centerrules = Config.Center_Rules;
	theme = Config.Theme;
	color = Config.Color;
	primaryfont = Config.Primary_Font;
	secondaryfont = Config.Secondary_Font;
	buttonimage = Config.Button_Image;
	backgroundimage = Config.Background_Image;
	whitelist = Config.Whitelist;
	groupwhitelist = Config.Group_Whitelist;
	groupwhitelists = Config.Group_Whitelists;
	groupswhitelist = Config.Groups_Whitelist;
	blacklist = Config.Blacklist;
	groupblacklist = Config.Group_Blacklist;
	groupblacklists = Config.Group_Blacklists;
	groupsblacklist = Config.Groups_Blacklist;
	music = Config.Music;
	custommusic = Config.Custom_Music;
	audioids = Config.Audio_IDs;
	ranking = Config.Ranking;
	ranks = Config.Ranks;
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

game.Players.PlayerAdded:Connect(function(Player)
	local TeleportData = TeleportService:GetLocalPlayerTeleportData()
	if TeleportData == nil then
		while true do
			local Success, Error = pcall(function()
				TeleportService:Teleport(Portal, Player, TPData)
			end)
			if Success then
				break
			end
			wait()
		end
	else
		Player:Kick("You have been sent with Old Teleport Data. Error Code: TTODEVV100")	
	end
end)

--> Copyright 2020-2021 Trojan Technologies. © All rights reserved.
