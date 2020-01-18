ESX = nil
local playersProcessingCannabis = {}
local playersProcessingCokePooch = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_drugs:sellDrug')
AddEventHandler('esx_drugs:sellDrug', function(itemName, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = Config.DrugDealerItems[itemName]
	local xItem = xPlayer.getInventoryItem(itemName)

	if not price then
		print(('esx_drugs: %s attempted to sell an invalid drug!'):format(xPlayer.identifier))
		return
	end

	if xItem.count < amount then
		TriggerClientEvent('esx:showNotification', source, _U('dealer_notenough'))
		return
	end

	price = ESX.Math.Round(price * amount)

	if Config.GiveBlack then
		xPlayer.addAccountMoney('black_money', price)
	else
		xPlayer.addMoney(price)
	end

	xPlayer.removeInventoryItem(xItem.name, amount)

	TriggerClientEvent('esx:showNotification', source, _U('dealer_sold', amount, xItem.label, ESX.Math.GroupDigits(price)))
end)

ESX.RegisterServerCallback('esx_drugs:buyLicense', function(source, cb, licenseName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local license = Config.LicensePrices[licenseName]

	if license == nil then
		print(('esx_drugs: %s attempted to buy an invalid license!'):format(xPlayer.identifier))
		cb(false)
	end

	if xPlayer.getMoney() >= license.price then
		xPlayer.removeMoney(license.price)

		TriggerEvent('esx_license:addLicense', source, licenseName, function()
			cb(true)
		end)
	else
		cb(false)
	end
end)

RegisterServerEvent('esx_drugs:pickedUpCannabis')
AddEventHandler('esx_drugs:pickedUpCannabis', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('cannabis')

	if xItem.weight ~= -1 and (xItem.count + 1) > xItem.weight then
		TriggerClientEvent('esx:showNotification', _source, _U('weed_inventoryfull'))
		pNotify(_U('weed_inventoryfull'), 'success', 7000)
	else
		xPlayer.addInventoryItem(xItem.name, 1)
	end
end)


RegisterServerEvent('esx_drugs:pickedUpCokePooch')
AddEventHandler('esx_drugs:pickedUpCokePooch', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('coke_pooch')

	if xItem.weight ~= -1 and (xItem.count + 1) > xItem.weight then
		TriggerClientEvent('esx:showNotification', _source, _U('coke_inventoryfull'))
		pNotify(_U('coke_inventoryfull'), 'success', 7000)
	else
		xPlayer.addInventoryItem(xItem.name, 1)
	end
end)

ESX.RegisterServerCallback('esx_drugs:canPickUp', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem(item)

	if xItem.weight ~= -1 and xItem.count >= xItem.weight then
		cb(false)
	else
		cb(true)
	end
end)

RegisterServerEvent('esx_drugs:processCokePooch')
AddEventHandler('esx_drugs:processCokePooch', function()
	if not playersProcessingCokePooch[source] then
		local _source = source

		playersProcessingCokePooch[_source] = ESX.SetTimeout(Config.Delays.CokeProcessing, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xCokePooch, xCoke = xPlayer.getInventoryItem('coke_pooch'), xPlayer.getInventoryItem('coke')

		
			if xCoke.weight ~= -1 and (xCoke.count + 1) >= xCoke.weight then
				
				TriggerClientEvent('esx:showNotification', _source, _U('coke_processingfull'))
				

			elseif xCokePooch.count < 5 then
				TriggerClientEvent('esx:showNotification', _source, _U('coke_processingenough'))
			else
				xPlayer.removeInventoryItem('coke_pooch', 5)
				xPlayer.addInventoryItem('coke', 1)

				TriggerClientEvent('esx:showNotification', _source, _U('coke_processed'))
			end
			
		

			playersProcessingCokePooch[_source] = nil
		end)
	else
		print(('esx_drugs: %s attempted to exploit weed processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

RegisterServerEvent('esx_drugs:processCannabis')
AddEventHandler('esx_drugs:processCannabis', function()
	if not playersProcessingCannabis[source] then
		local _source = source

		playersProcessingCannabis[_source] = ESX.SetTimeout(Config.Delays.WeedProcessing, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xCannabis, xMarijuana = xPlayer.getInventoryItem('cannabis'), xPlayer.getInventoryItem('marijuana')

		
			if xMarijuana.weight ~= -1 and (xMarijuana.count + 1) >= xMarijuana.weight then
				
				TriggerClientEvent('esx:showNotification', _source, _U('weed_processingfull'))
				

			elseif xCannabis.count < 3 then
				TriggerClientEvent('esx:showNotification', _source, _U('weed_processingenough'))
			else
				xPlayer.removeInventoryItem('cannabis', 3)
				xPlayer.addInventoryItem('marijuana', 1)

				TriggerClientEvent('esx:showNotification', _source, _U('weed_processed'))
			end
			
		

			playersProcessingCannabis[_source] = nil
		end)
	else
		print(('esx_drugs: %s attempted to exploit weed processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

function CancelProcessing(playerID)
	if playersProcessingCannabis[playerID] then
		ESX.ClearTimeout(playersProcessingCannabis[playerID])
		playersProcessingCannabis[playerID] = nil
	end
end

RegisterServerEvent('esx_drugs:cancelProcessing')
AddEventHandler('esx_drugs:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('esx:playerDropped', function(playerID, reason)
	CancelProcessing(playerID)
end)

RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
	CancelProcessing(source)
end)
