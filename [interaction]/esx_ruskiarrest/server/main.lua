ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_ruski_areszt:startAreszt')
AddEventHandler('esx_ruski_areszt:startAreszt', function(target)
	local targetPlayer = ESX.GetPlayerFromId(target)
	TriggerClientEvent('esx_ruski_areszt:aresztowany', targetPlayer.source, source)
	TriggerClientEvent('esx_ruski_areszt:aresztuj', source)
        TriggerClientEvent('esx:showNotification', targetPlayer.source, '~r~�� ���� ���������')
        TriggerClientEvent('esx_ruski_areszt:arrest', source)
end)