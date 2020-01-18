DiscordWebhookSystemInfos = 'https://discordapp.com/api/webhooks/666449062253297664/KNmVtibnvYMSVaMxN0GE_qRe-G1yiPB4CbUpjx4GJO5uLfK41QNRC37u1bzaJR_zcCt8'
DiscordWebhookKillinglogs = 'https://discordapp.com/api/webhooks/666449062253297664/KNmVtibnvYMSVaMxN0GE_qRe-G1yiPB4CbUpjx4GJO5uLfK41QNRC37u1bzaJR_zcCt8'
DiscordWebhookChat = 'https://discordapp.com/api/webhooks/666449062253297664/KNmVtibnvYMSVaMxN0GE_qRe-G1yiPB4CbUpjx4GJO5uLfK41QNRC37u1bzaJR_zcCt8'

SystemAvatar = 'https://wiki.fivem.net/w/images/d/db/FiveM-Wiki.png'

UserAvatar = 'https://lh3.ggpht.com/iNJVvoCwrvffM2cVq8Gvg0u-U5kWc7TjXf-UcbMr4VB7KIlOgRGX3Xv7o7nDqFXytg=w300'

SystemName = 'Тревор'


--[[ Special Commands formatting
		 *YOUR_TEXT*			--> Make Text Italics in Discord
		**YOUR_TEXT**			--> Make Text Bold in Discord
	   ***YOUR_TEXT***			--> Make Text Italics & Bold in Discord
		__YOUR_TEXT__			--> Underline Text in Discord
	   __*YOUR_TEXT*__			--> Underline Text and make it Italics in Discord
	  __**YOUR_TEXT**__			--> Underline Text and make it Bold in Discord
	 __***YOUR_TEXT***__		--> Underline Text and make it Italics & Bold in Discord
		~~YOUR_TEXT~~			--> Strikethrough Text in Discord
]]
-- Use 'USERNAME_NEEDED_HERE' without the quotes if you need a Users Name in a special command
-- Use 'USERID_NEEDED_HERE' without the quotes if you need a Users ID in a special command


-- These special commands will be printed differently in discord, depending on what you set it to
SpecialCommands = {
				   {'/ooc', '**[OOC]:**'},
                                   -- {'/twt', '**[TWITTER]:**'},
				   {'/news', '**[ANNONCE PUBLICITAIRE]:**'},
				   {'/report', '**[REPORT]:**'},
				   {'/911', '**[911]: (CALLER ID: [ USERNAME_NEEDED_HERE | USERID_NEEDED_HERE ])**'},
				  }

						
-- These blacklisted commands will not be printed in discord
BlacklistedCommands = {
					   '/AnyCommand',
					   '/AnyCommand2',
					  }

-- These Commands will use their own webhook
OwnWebhookCommands = {
					  {'/AnotherCommand', 'WEBHOOK_LINK_HERE'},
					  {'/AnotherCommand2', 'WEBHOOK_LINK_HERE'},
					 }

-- These Commands will be sent as TTS messages
TTSCommands = {
			   '/Whatever',
			   '/Whatever2',
			  }

