local serverconfig = {
	Teleport1 = {
        Position = vector3(902.25885009766,-1672.7186279297,47.357490539551),
        TargetPosition = vector3(124.25885009766,-123.7186279297,12.357490539551),
        Heading = 160,
        hidden = false
	},
    TeleportTestXD = {
        Position = vector3(243.25885009766,-123.7186279297,123.357490539551),
        TargetPosition = vector3(123.25885009766,-432.7186279297,34.357490539551),
        Heading = 160,
        hidden = true
	}
}

RegisterServerEvent('mb_teleport:server:sendLocations')
AddEventHandler('mb_teleport:server:sendLocations', function()
    TriggerClientEvent('mb_teleport:client:sendLocations', source, serverconfig)
end)