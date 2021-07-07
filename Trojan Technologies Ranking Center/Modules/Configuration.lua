--[[
TROJAN TECHNOLOGIES
Trojan.lua
Vanilla
1.0.0
cizzles
]]--

--> CONFIGURE CENTER BELOW
	--> Read the Trojan Technologies Setup Guides on our Wiki or create a ticket in our communications server for assistance
		--> Trojan Technologies Wiki Setup Guides: https://github.com/cizzles/trojan/wiki/Setup-Guides
		--> Trojan Technologies Communications Server: https://discord.gg/cGrcnEe

local Configuration = {
	--> MAIN CONFIG	URATION
		--> MODE
			Mode = "Custom",
			--> Type "Default" in between the parentheses if you want to only customize parameters that don't have "Default" in between the parentheses
			--> Type "Custom" in between the parentheses if you want to customize all parameters
			--> MORE [COMMUNITY-DESIGNED] MODES COMING SOON!

		--> RANK GAME PASSES
			Game_Pass_Ranking = "Default",
			--> If you want to have the Default (Enabled) enabled, type "Default" in between the parentheses
			--> If don't have the Badge Ranking Add-On enabled, type "Enabled" in between the parentheses
			--> If you do have the Badge Ranking Add-On enabled, type "Disabled" in between the parentheses
	
			One_Time_Ranking = "Default",
			--> If you want to have the Default (Disabled) enabled, type "Default" in between the parentheses
			--> If you have the Ranking Bot Add-On enabled, type "Enabled" in between the parentheses if you want players to only be able to get ranked one-time
			--> If you don't have Ranking Bot Add-On enabled, type "Disabled" in between the parentheses
				--> Or if you don't want players to only be able to get ranked one-time, type "Disabled" in between the parentheses and see below

			Unlimited_Ranking = "Default",
			--> If you want to have the Default (Disabled) enabled, type "Default" in between the parentheses
			--> If you have the Ranking Bot Add-On enabled, type "Enabled" in between the parentheses if you want players to be able to get ranked unlimited times
			--> If you don't have Ranking Bot Add-On enabled, type "Disabled" in between the parentheses
				--> Or if you don't want players to be able to get ranked unlimited times, type "Disabled" in between the parentheses and see above

			Game_Passes = {
			--> MAXIMUM OF 20 RANKS
				--> DEFAULT RANKS
					--> If you want to have a Default (Paid [Game Pass]) rank, type "Default" in between the parentheses
					--> You can replace {"Default", 0, 0}; with:
						--> {"Default", RoleID, GamePassID};
							--> You can find the Game Pass ID in its URL 
							--> You can find the Role ID (Rank ID) in the Group Admin "Roles" Tab 

				--> PAID [GAME PASS] RANKS
					--> If you want to have a Paid [Game Pass] rank, type "Paid" in between the parentheses
					--> You can replace {"Default", 0, 0}; with:
						--> {"Paid", RoleID, GamePassID};
							--> You can find the Game Pass ID in its URL 
							--> You can find the Role ID (Rank ID) in the Group Admin "Roles" Tab 

				--> FREE RANKS
					--> If you want to have a Free rank, type "Free" in between the parentheses
					--> You can replace {"Default", 0, 0}; with:
						--> {"Free", RoleID, 0};
							--> You can find the Role ID (Rank ID) in the Group Admin "Roles" Tab 
		
				--> T-SHIRT RANKS
					--> If you want to have a Paid T-Shirt rank, type "T-Shirt" in between the parentheses
					--> You can replace {"Default", 0, 0}; with:
						--> {"T-Shirt", RoleID, AssetID};
							--> You can find the Asset ID in the T-Shirt's URL 
							--> You can find the Role ID (Rank ID) in the Group Admin "Roles" Tab 
		
				--> BADGE RANKS
					--> You must have Badge Ranking Enabled in the Add-On Configuration for this to work:
						--> If you want to have a Badge rank, type "Badge" in between the parentheses
						--> You can replace {"Default", 0, 0}; with:
							--> {"Badge", RoleID, TotalBadges};
								--> Set the Total Badges to the number of total badges you want a player to have before being ranked
								--> You can find the Role ID (Rank ID) in the Group Admin "Roles" Tab
				
									{"Default", 1, 9750998};
									{"Default", 1, 9751011};
									{"Default", 1, 9751071};
									{"Default", 1, 9751100};
		
							   	 	--> LIMIT = 20 RANKS <--
			},
	
			Teleport_After_Purchase = 0000000000,
			--> Replace 0000000000 with a Place ID if you want to teleport someone to a place after they have been ranked (after they have purchased a rank or have gotten a free or badge rank)
				--> You can find a Place ID in the URL of the Place's "Play" Page
	
		--> ADMIN
			Group_Admin = 0,
			--> Replace 0 with a Role ID (Rank ID); All roles = (equal) to that Role ID will have Admin
				--> You can find the Role ID (Rank ID) in the Group Admin "Roles" Tab 
	
			Group_Admins = 0,
			--> Replace 0 with a Role ID (Rank ID); All roles >= (greater than or equal to) that Role ID will have Admin
				--> You can find the Role ID (Rank ID) in the Group Admin "Roles" Tab 
	
			User_Admins = {0000000000, 0000000000},
			--> Replace 0000000000 with a User ID you want to have Admin
			--> Each User ID should be seperated by a comma
				--> You can find a User ID in the URL on the User's Profile
	
		--> RULES
			Center_Rules = "Default",
			--> If you want to have the Default (No Center Rules) enabled, type "Default" in between the parentheses
			--> Replace "Default" with your center rules if you want rules for your center that must be accepted on player join 
				--> Strings in Lua can contain C-like escape sequences (newline, backslash, double quote, single quote, etc.), see below for more information:
					--> https://www.lua.org/pil/2.4.html
	
			Rank_Rules = "Default",
			--> If you want to have the Default (No Rank Rules) enabled, type "Default" in between the parentheses
			--> Replace "Default" with your rank rules if you want rules for your ranks that must be accepted before purchasing or getting a rank 
				--> Strings in Lua can contain C-like escape sequences (newline, backslash, double quote, single quote, etc.), see below for more information:
					--> https://www.lua.org/pil/2.4.html
	
	--> OPTIONAL CONFIGURATION
		--> UI CUSTOMIZATION
			Theme = "Dark",
			--> If you want to have the Default (Light) theme enabled, type "Default" in between the parentheses
			--> If you want to have Light theme enabled, type "Light" in between the parentheses
			--> If you want to have Dark theme enabled, type "Dark" in between the parentheses
		--> MORE [COMMUNITY-DESIGNED] THEMES COMING SOON!
		
			Color = "Hot pink",
			--> If you want to have the Default (Trojan Main) color enabled, type "Default" in between the parentheses
			--> You can replace "Default" with a Roblox Brick Color Name of your choice to change the main color of the game
				--> Roblox Brick Color Names: https://developer.roblox.com/en-us/articles/BrickColor-Codes
	
			Primary_Font = "Default",
			--> If you want to have the Default (SourceSansBold) font enabled, type "Default" in between the parentheses
			--> You can replace "Default" with a Roblox Font Name of your choice to change the primary font of the game
				--> Roblox Fonts: https://developer.roblox.com/en-us/api-reference/enum/Font

			Secondary_Font = "Default",
			--> If you want to have the Default (SourceSans) font enabled, type "Default" in between the parentheses
			--> You can replace "Default" with a Roblox Font Name of your choice to change the secondary font of the game
				--> Roblox Fonts: https://developer.roblox.com/en-us/api-reference/enum/Font

			Button_Image = 0000000000,
			--> Replace 0000000000 with a Decal ID (Roblox Asset ID) if you want that to be the button image of the game
				--> You can find a Decal ID (Roblox Asset ID) in the URL of the decal's webpage
	
			Background_Image = 0000000000,
			--> Replace 0000000000 with a Decal ID (Roblox Asset ID) if you want that to be the background image of the game
				--> You can find a Decal ID (Roblox Asset ID) in the URL of the decal's webpage

		--> WHITELIST
			Whitelist = {0000000000, 0000000000},
			--> Replace 0000000000 with a User ID you want to whitelist (allow) into your game; all other users will be banned 
			--> Each User ID should be seperated by a comma
				--> You can find a User ID in the URL on the user's profile
	
			Group_Whitelist = 0,
			--> Replace 0 with a Role ID (Rank ID); All roles = (equal) to that Role ID will be whitelisted (allowed) into your game; all other roles will be banned
			--> You can find the Role ID (Rank ID) in the Group Admin "Roles" Tab 
	
			Group_Whitelists = 0,
			--> Replace 0 with a Role ID (Rank ID); All roles >= (greater than or equal to) that Role ID will be whitelisted (allowed) into your game; all other roles will be banned
			--> You can find the Role ID (Rank ID) in the Group Admin "Roles" Tab 
	
			Groups_Whitelist = {0000000, 0000000},
			--> Replace 0000000 with a Group ID you want to whitelist (allow) into your game; all other groups will be banned 
			--> Each Group ID should be seperated by a comma
				--> You can find a Group ID in the URL on the group's about page
	
		--> BLACKLIST
			Blacklist = {0000000000, 0000000000},
			--> Replace 0000000000 with a User ID you want to blacklist (ban) from your game
			--> Each User ID should be seperated by a comma
				--> You can find a User ID in the URL on the user's profile
	
			Group_Blacklist = 0,
			--> Replace 0 with a Role ID (Rank ID); All roles = (equal) to that Role ID will be blacklisted (banned) from your game
			--> You can find the Role ID (Rank ID) in the Group Admin "Roles" Tab 
				--> This blacklist is for a role in your own group
	
			Group_Blacklists = 0,
			--> Replace 0 with a Role ID (Rank ID); All roles >= (greater than or equal to) that Role ID will be blacklisted (banned) from your game
			--> You can find the Role ID (Rank ID) in the Group Admin "Roles" Tab 
				--> This blacklist is for roles in your own group
	
			Groups_Blacklist = {0000000, 0000000},
			--> Replace 0000000 with a Group ID you want to blacklist (ban) from your game
			--> Each Group ID should be seperated by a comma
				--> You can find a Group ID in the URL on the group's about page
		
		--> MUSIC
			Music = "Default",
			--> If you want to have the Default (Enabled) enabled, type "Default" in between the parentheses
			--> If you want to have Music enabled, type "Enabled" in between the parentheses
			--> If you want to have Music disabled, type "Disabled" in between the parentheses
	
			Custom_Music = "Default",
			--> If you want to have the Default (Disabled) enabled, type "Default" in between the parentheses
			--> If you want to have Custom Music enabled, tyoe "Enabled" in between the parentheses
			--> If you want to have Custom Music disabled, type "Disabled" in between the parentheses

			Audio_IDs = {0000000, 0000000},
			--> If you have the Custom Music enabled then you can replace 0000000 with an Audio ID you want to be played in your game
				--> Each Audio ID should be seperated by a comma
					--> You can find an Audio ID in the Audio's URL
	
	--> ADD-ON CONFIGURATION
		--> RANKING BOT
			Ranking_Bot = "Default",
			--> If you want to have the Default (Disabled) enabled, type "Default" in between the parentheses
			--> If you have the Ranking Bot Add-On, type "Enabled" in between the parentheses
			--> If don't you have the Ranking Bot Add-On, type "Disabled" in between the parentheses
	
		--> BADGE RANKING
			Badge_Ranking = "Default",
			--> If you want to have the Default (Disabled) enabled, type "Default" in between the parentheses
			--> If you have the Ranking Bot Add-On, type "Enabled" in between the parentheses
			--> If don't you have the Ranking Bot Add-On, type "Disabled" in between the parentheses
	
		--> LOGGING
				--> USE THE LOGGING ADD-ON AT YOUR OWN RISK; YOU MAY HAVE YOUR SERVER, WORKSPACE, ACCOUNT, ETC. BE BANNED OR DELETED IF ABUSED!
				Logging = "Default",
				--> If you want to have the Default (Disabled) enabled, type "Default" in between the parentheses
				--> If you have the Logging Add-On, type "Enabled" in between the parentheses
				--> If don't you have the Logging Add-On, type "Disabled" in between the parentheses

			--> DISCORD WEBHOOK LOGGING
				Discord = "Default",
				--> If you want to have the Default (Disabled) enabled, type "Default" in between the parentheses
				--> If you have the Logging Add-On enabled, type "Enabled" in between the parentheses
				--> If don't you have the Logging Add-On enabled, type "Disabled" in between the parentheses

				Discord_Webhook_Token = "Token",
				--> If you have Discord enabled, create a Discord Webhook in your Discord Server and enter your Discord Webhook's URL into the web address bar and press enter, then, copy and paste the token on-screen where it says "Token" in between the parentheses
	
			--> TRELLO BOARD & TRELLO LOGGING
				Trello = "Default",
				--> If you want to have the Default (Disabled) enabled, type "Default" in between the parentheses
				--> If you have the Logging Add-On enabled, type "Enabled" in between the parentheses
				--> If you don't have the Logging Add-On enabled, type "Disabled" in between the parentheses

				Trello_Board_Name = "Board Name",
				--> Replace "Board Name" with your Trello Board's name
	
				Trello_Token = "Token",
				--> If you have Trello enabled, generate a Trello Token and copy and paste the token where it says "Token" in between the parentheses
	
				Trello_Blacklist = "Default",
				--> If you want to have the Default (Disabled) enabled, type "Default" in between the parentheses
				--> If you have Trello enabled and want to enable Trello Blacklists, type "Enabled" in between the parentheses
				--> If you don't have Trello enabled and/or don't want to enable Trello Blacklists, type "Disabled" in between the parentheses

				Trello_Whitelist = "Default",
				--> If you want to have the Default (Disabled) enabled, type "Default" in between the parentheses
				--> If you have Trello enabled and want to enable Trello Whitelists, type "Enabled" in between the parentheses
				--> If you don't have Trello enabled and/or don't want to enable Trello Whitelists, type "Disabled" in between the parentheses

				Trello_Admins = "Default",
				--> If you want to have the Default (Disabled) enabled, type "Default" in between the parentheses
				--> If you have Trello enabled and want to enable Trello Admins, type "Enabled" in between the parentheses
				--> If you don't have Trello enabled and/or don't want to enable Trello Admins, type "Disabled" in between the parentheses

				Trello_Music = "Default",
				--> If you want to have the Default (Disabled) enabled, type "Default" in between the parentheses
				--> If you have Trello enabled and want to enable Trello Music, type "Enabled" in between the parentheses
				--> If you don't have Trello enabled and/or don't want to enable Trello Music, type "Disabled" in between the parentheses
	
				Trello_Logging = "Default",
				--> If you want to have the Default (Disabled) enabled, type "Default" in between the parentheses
				--> If you have Trello enabled and want to enable Trello Logging, type "Enabled" in between the parentheses
				--> If you don't have Trello enabled and/or don't want to enable Trello Logging, type "Disabled" in between the parentheses
	
			--> SLACK LOGGING
				Slack = "Default",
				--> If you want to have the Default (Disabled) enabled, type "Default" in between the parentheses
				--> If you have the Webhook Logging Add-On enabled, type "Enabled" in between the parentheses
				--> If don't you have the Webhook Logging Add-On enabled, type "Disabled" in between the parentheses

				--> If you have Slack Webhook Logging enabled, create a Slack Incoming Webhook App for your Slack Workspace and add a new webhook to your Slack Workspace a and copy and paste the different IDs in the Slack Webhook URL in between the parentheses as follows:
					--> Example: 
						--> Slack Webhook URL: 
						--> https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX
							--> Slack_ID_1 = "T00000000",
							--> Slack_ID_2 = "B00000000",
							--> Slack_ID_3 = "XXXXXXXXXXXXXXXXXXXXXXXX",
	
				Slack_ID_1 = "FirstID",
				--> If you have Slack Webhook Logging enabled, copy and paste the First ID in your Slack Webhook URL in between the parentheses where it says "FirstID"
	
				Slack_ID_2 = "SecondID",
				--> If you have Slack Webhook Logging enabled, copy and paste the Second ID in your Slack Webhook URL in between the parentheses where it says "SecondID"
	
				Slack_ID_3 = "ThirdID",
				--> If you have Slack Webhook Logging enabled, copy and paste the Third ID in your Slack Webhook URL in between the parentheses where it says "ThirdID"
	
			--> SENTRY LOGGING
				Sentry = "Default",
				--> If you want to have the Default (Disabled) enabled, type "Default" in between the parentheses
				--> If you have the Webhook Logging Add-On enabled, type "Enabled" in between the parentheses
				--> If don't you have the Webhook Logging Add-On enabled, type "Disabled" in between the parentheses

				Data_Source_Name = "DSN",
				--> If you have Sentry Logging enabled, create a Sentry Project and go to your Project Settings and get the "Client Keys DSN" the (Deprecated DSN) and copy and paste the DSN in between the parentheses

}

return Configuration

--> Copyright 2020-2021 Trojan Technologies. © All rights reserved.
