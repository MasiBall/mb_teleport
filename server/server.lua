local serverconfig = {
	Teleport1 = {
        Position = vector3(-2090.63, 2638.05, 2.1),
        TargetPosition = vector3(-2081.01, 2607.76, 2.1),
        Heading = 15.65,
        TargetHeading = 105.28,
        hidden = false,
        oneWay = false
	},
    TeleportTestXD = {
        Position = vector3(-2138.26, 2811.21, 32.79),
        TargetPosition = vector3(-2333.35, 2665.69, 2.78),
        Heading = 196.66,
        TargetHeading = 153.99,
        hidden = true,
        oneWay = true
	}
}

RegisterServerEvent('mb_teleport:server:sendLocations')
AddEventHandler('mb_teleport:server:sendLocations', function()
    TriggerClientEvent('mb_teleport:client:receiveLocations', source, serverconfig)
end)