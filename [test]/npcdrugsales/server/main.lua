ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local selling = false
	local success = false
	local copscalled = false
	local notintrested = false
	local notintrested2 = false


  RegisterNetEvent('drugs:trigger')
  AddEventHandler('drugs:trigger', function()
	selling = true
	    if selling == true then
			TriggerEvent('pass_or_fail')
			TriggerClientEvent('esx:showNotification', source, '~y~Вы предлагаете наркотики...')
 	end
end)

RegisterServerEvent('fetchjob')
AddEventHandler('fetchjob', function()
    local xPlayer  = ESX.GetPlayerFromId(source)
    TriggerClientEvent('getjob', source, xPlayer.job.name)
end)


  RegisterNetEvent('drugs:sell')
  AddEventHandler('drugs:sell', function()
  	local xPlayer = ESX.GetPlayerFromId(source)
	local meth = xPlayer.getInventoryItem('meth_pooch').count
	local coke 	  = xPlayer.getInventoryItem('coke_pooch').count
	local weed = xPlayer.getInventoryItem('weed_pooch').count
	local opium = xPlayer.getInventoryItem('opium_pooch').count
	local paymentc = math.random (500,600)
	local paymentw = math.random (150,376)
	local paymentm = math.random (100,453)
	local paymento = math.random (150,350)


		if coke >= 1 and success == true then
			TriggerClientEvent('esx:showNotification', source, '~y~Вы продали кокаин на ~r~$'.. paymentc)

			TriggerClientEvent("animation", source)
			xPlayer.removeInventoryItem('coke_pooch', 1)
  			xPlayer.addAccountMoney('black_money', paymentc)
  			selling = false
  		elseif weed >= 1 and success == true then
			TriggerClientEvent('esx:showNotification', source, '~y~Вы продали марихуанну на ~r~$'.. paymentc)

			TriggerClientEvent("animation", source)
			--TriggerClientEvent("test", source)
  			xPlayer.removeInventoryItem('weed_pooch', 1)
  			xPlayer.addAccountMoney('black_money', paymentw)
  			selling = false
  		  elseif meth >= 1 and success == true then
			TriggerClientEvent('esx:showNotification', source, '~y~Вы продали метамфетамин на ~r~$'.. paymentc)

			TriggerClientEvent("animation", source)
  			xPlayer.removeInventoryItem('meth_pooch', 1)
  			xPlayer.addAccountMoney('black_money', paymentm)
  			selling = false
  			elseif opium >= 1 and success == true then
			TriggerClientEvent('esx:showNotification', source, '~y~Вы продали опиум на ~r~$'.. paymento)

			TriggerClientEvent("animation", source)
			xPlayer.removeInventoryItem('opium_pooch', 1)
  			xPlayer.addAccountMoney('black_money', paymento)
  			selling = false
			elseif selling == true and success == false and notintrested == true then
			TriggerClientEvent('esx:showNotification', source, '~к~Не интересно!')

			elseif selling == true and success == false and notinterested2 == true then
			TriggerClientEvent('esx:showNotification', source, '~y~Прохожие узнали что вы, ~b~полицейский~s~!')

			TriggerClientEvent("notifyc", source)
  			selling = false
  			elseif meth < 1 and coke < 1 and weed < 1 and opium < 1 then
			TriggerClientEvent('esx:showNotification', source, '~y~У вас нет готовых к продаже, ~b~наркотиков~s~!')
			elseif copscalled == true and success == false then
			TriggerClientEvent('esx:showNotification', source, '~y~Прохожий куда то звонит, ~b~будьте осторожней~s~!')
			TriggerClientEvent("notifyc", source)
  			selling = false
  		end
end)

RegisterNetEvent('pass_or_fail')
AddEventHandler('pass_or_fail', function()

  		local percent = math.random(1, 11)
		local _source = source
	    local xPlayer  = ESX.GetPlayerFromId(_source)
		local xPlayers = ESX.GetPlayers()

  		for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' or xPlayer.job.name == 'fbi' then
		    success = false
			notinterested2 = true
			copscalled = true
		elseif percent == 7 or percent == 8 or percent == 9 then
  			success = false
  			notintrested = true
  		elseif percent ~= 8 and percent ~= 9 and percent ~= 10 and percent ~= 7 then
  			success = true
  			notintrested = false
  		else
  			notintrested = false
  			success = false
  			copscalled = true
  		end
		end
end)

RegisterNetEvent('sell_dis')
AddEventHandler('sell_dis', function()
	    TriggerClientEvent('esx:showNotification', source, '~y~Вы слишком долеко ~b~отошли~s~!')
end)

RegisterNetEvent('checkD')
AddEventHandler('checkD', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local meth = xPlayer.getInventoryItem('meth_pooch').count
	local coke 	  = xPlayer.getInventoryItem('coke_pooch').count
	local weed = xPlayer.getInventoryItem('weed_pooch').count
	local opium = xPlayer.getInventoryItem('opium_pooch').count

	if meth >= 1 or coke >= 1 or weed >= 1 or opium >= 1 then
		TriggerClientEvent("checkR", source, true)
	else
		TriggerClientEvent("checkR", source, false)
	end

end)
