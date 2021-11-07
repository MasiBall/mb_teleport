local teleports = {}
local sleep = 0

RegisterNetEvent('mb_teleport:client:receiveLocations')
AddEventHandler('mb_teleport:client:receiveLocations', function(fetchserver)
    teleports = fetchserver
end)

Citizen.CreateThread(function()
    while positions == {} do
        TriggerServerEvent('mb_teleport:server:sendLocations')
        print('DEBUG: Positions sent')
        Wait(2500)
    end
end)

Citizen.CreateThread(function()
    while true do
        sleep = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        for k,v in pairs(teleports) do
            local Position, TargetPos, Heading, hidden = v.Position, v.TargetPosition, v.Heading, v.hidden

            local distance = #(playerCoords - Position)
            local distancetotarget = #(playerCoords - TargetPos)

            if distance < Config.MarkerDrawDistance then
                if not hidden then
                    DrawMarker(Config.MarkerType, Position, 0, 0, 0, 0, 0, 0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                    sleep = 0
                    if distance < Config.MarkerSize.x then
                        DisplayHelpNotification('Press ~INPUT_PICKUP~ to teleport')
                        if IsControlJustReleased(0, Config.KeyToTeleport) then
                            if IsPedInAnyVehicle(player, false) then
                                local playerVeh = GetVehiclePedIsUsing(playerPed)
                                SetEntityCoords(playerVeh, Position)
                                SetEntityHeading(playerVeh, Heading)
                                FreezeEntityPosition(playerVeh, true)
                                Wait(100)
                                FreezeEntityPosition(playerVeh, false)
                            else
                                DoScreenFadeOut(1000)
                                Wait(2000)
                                SetEntityCoords(playerPed, Position)
                                SetEntityHeading(playerPed, Heading)
                                FreezeEntityPosition(playerPed, true)
                                DoScreenFadeIn(1000)
                                Wait(2000)
                                FreezeEntityPosition(playerPed, false)
                            end
                        end
                    end
                else
                    if distance < Config.MarkerSize.x then
                        sleep = 0
                        if IsControlJustReleased(0, Config.KeyToTeleport) then
                            if IsPedInAnyVehicle(player, false) then
                                local playerVeh = GetVehiclePedIsUsing(playerPed)
                                SetEntityCoords(playerVeh, Position)
                                SetEntityHeading(playerVeh, Heading)
                                FreezeEntityPosition(playerVeh, true)
                                Wait(100)
                                FreezeEntityPosition(playerVeh, false)
                            else
                                DoScreenFadeOut(1000)
                                Wait(2000)
                                SetEntityCoords(playerPed, Position)
                                SetEntityHeading(playerPed, Heading)
                                FreezeEntityPosition(playerPed, true)
                                DoScreenFadeIn(1000)
                                Wait(2000)
                                FreezeEntityPosition(playerPed, false)
                            end
                        end
                    end
                end
            end

            if distancetotarget < Config.MarkerDrawDistance then
                if not hidden then
                    DrawMarker(Config.MarkerType, TargetPos, 0, 0, 0, 0, 0, 0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                    sleep = 0
                    if distance < Config.MarkerSize.x then
                        DisplayHelpNotification('Press ~INPUT_PICKUP~ to teleport')
                        if IsControlJustReleased(0, Config.KeyToTeleport) then
                            if IsPedInAnyVehicle(player, false) then
                                local playerVeh = GetVehiclePedIsUsing(playerPed)
                                SetEntityCoords(playerVeh, TargetPos)
                                SetEntityHeading(playerVeh, Heading)
                                FreezeEntityPosition(playerVeh, true)
                                Wait(100)
                                FreezeEntityPosition(playerVeh, false)
                            else
                                DoScreenFadeOut(1000)
                                Wait(2000)
                                SetEntityCoords(playerPed, TargetPos)
                                SetEntityHeading(playerPed, Heading)
                                FreezeEntityPosition(playerPed, true)
                                DoScreenFadeIn(1000)
                                Wait(2000)
                                FreezeEntityPosition(playerPed, false)
                            end
                        end
                    end
                else
                    if distance < Config.MarkerSize.x then
                        sleep = 0
                        if IsControlJustReleased(0, Config.KeyToTeleport) then
                            if IsPedInAnyVehicle(player, false) then
                                local playerVeh = GetVehiclePedIsUsing(playerPed)
                                SetEntityCoords(playerVeh, TargetPos)
                                SetEntityHeading(playerVeh, Heading)
                                FreezeEntityPosition(playerVeh, true)
                                Wait(100)
                                FreezeEntityPosition(playerVeh, false)
                            else
                                DoScreenFadeOut(1000)
                                Wait(2000)
                                SetEntityCoords(playerPed, TargetPos)
                                SetEntityHeading(playerPed, Heading)
                                FreezeEntityPosition(playerPed, true)
                                DoScreenFadeIn(1000)
                                Wait(2000)
                                FreezeEntityPosition(playerPed, false)
                            end
                        end
                    end
                end
            end
        end
        if sleep ~= 0 then
            Citizen.Wait(sleep)
        end
    end
end)