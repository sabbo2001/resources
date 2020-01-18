---- Made BY TheStonedRaider for DOJSRC
----
ConfigSellPos = {}
Config = {}
Config.Locale = 'ru'
--- Alarm / refresh timer 
Config.smashtimer = 4000    ------ In MS how long it takes to smash and rob each cabinet
Config.alarmchance = 25  --------- 0 - %100 Насколько вероятно, сработает сигнализация для КАЖДОГО сломанного шкафа
Config.resettimer = 240 ----------- В минутах, как долго, пока магазин не будет пополнен после ограбления.
Config.RequiredCopsSell = 4 -- количество копов для ограбления

-- police 
Config.sendpolicealert = true     ---   give blip for "police" job when alarm is triggerd 

Config.AIpoliceon = true   ------- Sets you as wanted when alarm is tripped 

Config.Policeamount = 3    ------- если на сервере меньше «настоящей» полиции, он вызовет AI Police / set perp требуемый

Config.Wantedlevel = 2     ------- разыскиваемый уровень дается при тревоге

Config.policecontrol = true ------   Отключить требуемый уровень --- отключает полицию, когда вы не грабите магазин

Config.policereset = 5 		----- Через несколько минут, как долго полиция отозвана
 --Selling 
ConfigSellPos.x,ConfigSellPos.y,ConfigSellPos.z =  707.39,-965.23,30.41         ------ Coords of sell circle
Config.SellPrice = 5000        ----------- Price for 10 Jewles
Config.mopolicemomoney = true ------ If police are online you will get more money
Config.Copextra = 500 ------ How much $ more is added per police online

Config.SellBlip = true  ---- Is a blip placed at the sell location

Config.Blip = 77 ---  Sell Blip style
Config.Colour = 1 ---  Sell Blip Colour
Config.ShowshopBlip = true ----- show a blip at the shop....
