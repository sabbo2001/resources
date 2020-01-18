Config 					= {}

Config.Locale 			= 'ru'
Config.DrawDistance 	= 100
Config.Size         = {x = 1.0, y = 1.0, z = 1.0}
Config.Color        = {r = 76, g = 209, b = 55}
Config.Type         	= 29
Config.Blip 			= true

Config.taxRate = 0.90  --65% of the dirty you will get back in clean

Config.enableTimer = true -- Enable ONLY IF you want a timer on the money washing. Keep in mind the Player does not have to stay at the wash for it to actually wash the money.
local second = 1000
local minute = 60 * second
local hour = 60 * minute

Config.timer = 5 * second -- Time it takes to wash money. The * amount will determine if its hours, second, or minutes.

--[[ 
Ниже приведены зоны для отмывания. Вы можете установить несколько зон, просто следуйте приведенному ниже формату.
Невыполнение этого условия приведет к разрыву скрипта.
Установите для задания значение «любой», если вы хотите, чтобы кто-либо использовал это местоположение. В противном случае установите требуемую работу, которую вы хотите использовать для местоположения
Любая работа, которой не разрешено использовать местоположение, не увидит маркер или не получит всплывающее окно для его использования.

	
	EXAMPLE LOCATION!!! JUST COPY THIS AND PASTE TO ADD MORE LOCATIONS!
		
	{
		Pos = {
			{x = 1090.84 , y = -2233.43 , z = 31.5}
		},
		
		Jobs = {
			--'any', -- SET THE 'any' TAG TO ALLOW ALL JOBS INCLUDING POLICE TO USE THE LOCATION
			--'miner',
			--'cardealer'
		}
	},
	
]]


Config.Zones = {
	
	{
		Blips = {
			{x = 262.51, y = 208.77, z = 110.29},
		},

		Pos = { 
			{x = 262.51, y = 208.77, z = 110.29},
		},
		
		Jobs = {
			--'any', - установите «любой», чтобы разрешить местоположение для любого игрока независимо от работы
			'cartel'
		}
	},
	
	--[[{
		Pos = {
			{x = 1090.84 , y = -2233.43 , z = 31.5}
		},
		
		Jobs = {
			--'miner',
			'cardealer'
		}
	},]]
}
