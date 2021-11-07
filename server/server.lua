local serverconfig = {
	Teleport1 = {
        Position = vector3(-2090.63, 2638.05, 3.08),
        TargetPosition = vector3(-2076.13, 2609.69, 7.11),
        Heading = 15.65,
        TargetHeading = 209.17,
        hidden = false
	},
    TeleportTestXD = {
        Position = vector3(243.25885009766,-123.7186279297,123.357490539551),
        TargetPosition = vector3(123.25885009766,-432.7186279297,34.357490539551),
        Heading = 160,
        TargetHeading = 209.17,
        hidden = true
	}
}

RegisterServerEvent('mb_teleport:server:sendLocations')
AddEventHandler('mb_teleport:server:sendLocations', function()
    TriggerClientEvent('mb_teleport:client:sendLocations', source, serverconfig)
end)