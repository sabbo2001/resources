

ESX               				= nil
local PlayerData                = {}

local Aresztuje					= false		-- Оставьте False, иначе он будет арестован в начале сценария
local Aresztowany				= false		-- Оставьте False, иначе вы будете арестованы в начале сценария
 
local SekcjaAnimacji			= 'mp_arrest_paired'	-- Название анимации ареста
local AnimAresztuje 			= 'cop_p2_back_left'	-- Анимация ареста
local AnimeArrested			= 'crook_p2_back_left'	-- Задержанный Анимация
local OstatnioAresztowany		= 0						-- Mozna sie domyslec ;)


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

RegisterNetEvent('esx_ruski_areszt:aresztowany')
AddEventHandler('esx_ruski_areszt:aresztowany', function(target)
	Aresztowany = true

	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	--снимаем розыск при аресте
	if GetPlayerWantedLevel(targetPed) ~= 0 then
						SetPlayerWantedLevel(targetPed, 0, false)
						SetPlayerWantedLevelNow(targetPed, false)
	end

	RequestAnimDict(SekcjaAnimacji)
	while not HasAnimDictLoaded(SekcjaAnimacji) do
		Citizen.Wait(10)
	end
	AttachEntityToEntity(GetPlayerPed(-1), targetPed, 11816, -0.1, 0.45, 0.0, 0.0, 0.0, 20.0, false, false, false, false, 20, false)
	TaskPlayAnim(playerPed, SekcjaAnimacji, AnimeArrested, 8.0, -8.0, 5500, 33, 0, false, false, false)
	Citizen.Wait(950)
	DetachEntity(GetPlayerPed(-1), true, false)
	Aresztowany = false
end)

RegisterNetEvent('esx_ruski_areszt:aresztuj')
AddEventHandler('esx_ruski_areszt:aresztuj', function()
	local playerPed = GetPlayerPed(-1)
	RequestAnimDict(SekcjaAnimacji)
	while not HasAnimDictLoaded(SekcjaAnimacji) do
		Citizen.Wait(10)
	end
	TaskPlayAnim(playerPed, SekcjaAnimacji, AnimAresztuje, 8.0, -8.0, 5500, 33, 0, false, false, false)
	Citizen.Wait(3000)
	Aresztuje = false
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		--Правай кнопка мыши + shift + E производит арест игрока
		if IsControlPressed(0, 21) and IsControlPressed(0, 38) and IsControlPressed(0, 25) and not Aresztuje and GetGameTimer() - OstatnioAresztowany > 10 * 1000 and (PlayerData.job.name == 'police' or PlayerData.job.name == 'fbi') then	-- Mozesz tutaj zmienic przyciski
			Citizen.Wait(10)
				local closestPlayer, distance = ESX.Game.GetClosestPlayer()

				if distance ~= -1 and distance <= Config.ArrestDistance and not Aresztuje and not Aresztowany and not IsPedInAnyVehicle(GetPlayerPed(-1)) and not IsPedInAnyVehicle(GetPlayerPed(closestPlayer)) and not IsPedDeadOrDying(GetPlayerPed(closestPlayer)) and (PlayerData.job.name ~= 'police' or PlayerData.job.name ~= 'fbi') then
					Aresztuje = true
					OstatnioAresztowany = GetGameTimer()

					ESX.ShowNotification("Арест игрока ~b~ID:~r~ " .. GetPlayerServerId(closestPlayer) .. "")						-- Уведомляем
					TriggerServerEvent('esx_ruski_areszt:startAreszt', GetPlayerServerId(closestPlayer))									-- Запускает функции для анимации (все функции выше ^^^)

					Citizen.Wait(2100)																									-- Czeka 2.1 Sekund
					TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'cuffseffect', 0.7)									-- Дает эффект зубрежки (Вы загружаете файл .ogg в InteractSound и устанавливаете имя "cuffseffect.ogg")

					Citizen.Wait(3100)																									-- Ожидание 3,1 секунды
					ESX.ShowNotification("Игрок ~b~ID: " .. GetPlayerServerId(closestPlayer) .. " ~r~арестован")					-- Уведомление тому кто производит арест
					TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(closestPlayer))									-- Zakuwa Poprzez Prace esx_policejob, Mozna zmienic Funkcje na jaka kolwiek inna.
			else
				
				end

		end
	end
end)