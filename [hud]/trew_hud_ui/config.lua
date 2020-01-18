Config = {}

Config.Locale = 'ru'

Config.serverLogo = 'https://i.imgur.com/AcgDL9f.png'

Config.font = {
	name 	= 'Open Sans',
	url 	= 'https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800&display=swap&subset=cyrillic'
}

Config.date = {
	format	 	= 'withWeekdayAndHours',
	AmPm		= false
}

Config.voice = {

	levels = {
		default = 5.0,
		shout = 12.0,
		whisper = 1.0,
		current = 0
	},
	
	keys = {
		distance 	= 'Y',--капслок
	}
}


Config.vehicle = {
	speedUnit = 'KM/H',
	maxSpeed = 240,

	keys = {
		seatbelt 	= 'B',
		cruiser		= 'CAPS',
		signalLeft	= 'LEFT',
		signalRight	= 'RIGHT',
		signalBoth	= 'DOWN',
	}
}

Config.ui = {
	showServerLogo		= false,
	showJob		 		= true,
	showWalletMoney 	= true,
	showBankMoney 		= true,
	showBlackMoney 		= true,
	showSocietyMoney	= true,
	showDate 			= true,
	showLocation 		= false,
        
	showVoice	 		= true,
	showHealth			= true,
	showArmor	 		= true,
	showStamina	 		= true,
	showHunger 			= true,
	showThirst	 		= true,
	showMinimap			= true,
	showWeapons			= true,	
}