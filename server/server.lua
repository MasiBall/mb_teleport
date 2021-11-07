RegisterServerEvent('mb_teleport:server:sendLocations')
AddEventHandler('mb_teleport:server:sendLocations', function()
    TriggerClientEvent('mb_teleport:client:sendLocations', source, locationtable)
end)