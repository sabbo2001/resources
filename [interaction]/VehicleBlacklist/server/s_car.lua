ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("s_IsCarDriveable")

-- Only allow users with police job to drive blacklisted vehicle.
AddEventHandler("s_IsCarDriveable", function()
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  TriggerEvent('es:getPlayerFromId', _source, function(user)
    if user then
          if xPlayer.job.name ~= 'police' or 'fbi' or 'ambulance' or 'militar' then --you can add more jobs here by doing (~= 'police' or 'mechanic' or 'ambulance' then) ETC
            TriggerClientEvent("c_Driveable", _source)
          else
      	     TriggerClientEvent("c_Undriveable", _source)
          end
      end
    end)
end)
