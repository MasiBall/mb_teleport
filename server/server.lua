local serverconfig = {
	Teleport = {
        Position = vector3(-2108.47, 2704.27, 2.8),
        TargetPosition = vector3(-2085.38, 2701.86, 2.8),
        Heading = 174.78,
        TargetHeading = 87.02,
        hidden = false,
        oneWay = false
	},
    Teleport2 = {
        Position = vector3(-2084.87, 2705.19, 2.8),
        TargetPosition = vector3(-2107.78, 2709.03, 2.8),
        Heading = 196.66,
        TargetHeading = 153.99,
        hidden = true,
        oneWay = false
	},
    Teleport3 = {
        Position = vector3(-2084.77, 2708.76, 2.8),
        TargetPosition = vector3(-2107.02, 2712.26, 2.8),
        Heading = 196.66,
        TargetHeading = 153.99,
        hidden = false,
        oneWay = true
	}
}

RegisterServerEvent('mb_teleport:server:sendLocations')
AddEventHandler('mb_teleport:server:sendLocations', function()
    TriggerClientEvent('mb_teleport:client:receiveLocations', source, serverconfig)
end)
