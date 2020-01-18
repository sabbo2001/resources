Citizen.CreateThread(function()
	while true do
		SetDiscordAppId(586963108854235137) --Discord app id
		SetDiscordRichPresenceAsset('logo_name') --Big picture asset name
        SetDiscordRichPresenceAssetText('Imperial Roleplay') --Big picture hover text
        SetDiscordRichPresenceAssetSmall('logo_name') --Small picture asset name
        SetDiscordRichPresenceAssetSmallText('Imperial Roleplay') --Small picture hover text
		Citizen.Wait(1500) --How often should this script check for updated assets? (in MS)
	end
end)


--No Need to mess with anything pass this point!
Citizen.CreateThread(function()
	while true do
		-- local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
		-- if VehName == "NULL" then VehName = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))) end
		-- local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
		-- local StreetHash = GetStreetNameAtCoord(x, y, z)
		local pId = GetPlayerServerId(PlayerId())
		local pName = GetPlayerName(PlayerId())
		Citizen.Wait(10000)
		SetRichPresence("ID: "..pId.." | "..pName.." Rolünü yapıyor ")
		-- if StreetHash ~= nil then
			-- StreetName = GetStreetNameFromHashKey(StreetHash)
			-- if IsPedOnFoot(PlayerPedId()) and not IsEntityInWater(PlayerPedId()) then
				-- if IsPedSprinting(PlayerPedId()) then
					-- SetRichPresence("ID: "..pId.." | "..pName.." Hızlı Yürüyor "..StreetName)
				-- elseif IsPedRunning(PlayerPedId()) then
					-- SetRichPresence("ID: "..pId.." | "..pName.." Koşuyor "..StreetName)
				-- elseif IsPedWalking(PlayerPedId()) then
					-- SetRichPresence("ID: "..pId.." | "..pName.." Yürüyor "..StreetName)
				-- elseif IsPedStill(PlayerPedId()) then
					-- SetRichPresence("ID: "..pId.." | "..pName.." Ayakta Duruyor "..StreetName)
				-- end
			-- elseif GetVehiclePedIsUsing(PlayerPedId()) ~= nil and not IsPedInAnyHeli(PlayerPedId()) and not IsPedInAnyPlane(PlayerPedId()) and not IsPedOnFoot(PlayerPedId()) and not IsPedInAnySub(PlayerPedId()) and not IsPedInAnyBoat(PlayerPedId()) then
				-- local MPH = math.ceil(GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId())) * 2.236936)
				-- if MPH > 50 then
					-- SetRichPresence("ID: "..pId.." | "..pName.." Hızlanıyor "..StreetName.." at "..MPH.."Mille Seyrediyor "..VehName)
				-- elseif MPH <= 50 and MPH > 0 then
					-- SetRichPresence("ID: "..pId.." | "..pName.." Yolda Gidiyor "..StreetName.." at "..MPH.."Mille Seyrediyor "..VehName)
				-- elseif MPH == 0 then
					-- SetRichPresence("ID: "..pId.." | "..pName.." Arabayı Park Etti "..StreetName.." Bulunuyor "..VehName)
				-- end
			-- elseif IsPedInAnyHeli(PlayerPedId()) or IsPedInAnyPlane(PlayerPedId()) then
				-- if IsEntityInAir(GetVehiclePedIsUsing(PlayerPedId())) or GetEntityHeightAboveGround(GetVehiclePedIsUsing(PlayerPedId())) > 5.0 then
					-- SetRichPresence("ID: "..pId.." | "..pName.." Uçuyor "..StreetName.." Bulunuyor "..VehName)
				-- else
					-- SetRichPresence("ID: "..pId.." | "..pName.." İndi "..StreetName.." Bulunuyor "..VehName)
				-- end
			-- elseif IsEntityInWater(PlayerPedId()) then
				-- SetRichPresence("ID: "..pId.." | "..pName.."Yüzüyor")
			-- elseif IsPedInAnyBoat(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
				-- SetRichPresence("ID: "..pId.." | "..pName.." Yelenli ile Yolda "..VehName)
			-- elseif IsPedInAnySub(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
				-- SetRichPresence("ID: "..pId.." | "..pName.." Denizaltın'da")
			-- end
		-- end
	end
end)