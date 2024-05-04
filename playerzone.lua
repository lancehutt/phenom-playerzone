local QBCore = exports['qb-core']:GetCoreObject()

local safeZoneCenter = vector3(1705.64, 3758.1, 34.34)
local safeZoneRadius = 10.0 

function enforceSafeZone(playerPed, safeZoneCenter, safeZoneRadius)
    local playerCoords = GetEntityCoords(playerPed)
    local dist = #(playerCoords - safeZoneCenter)

    if dist > safeZoneRadius then        
        SetEntityCoords(playerPed, safeZoneCenter.x, safeZoneCenter.y, safeZoneCenter.z)
        QBCore.Functions.Notify(playerPed, "You left the designated area, teleporting you back!", "error")
    end
end


CreateThread(function()
    while true do
        Wait(10000) 
        local playerPed = PlayerPedId()

        if playerPed then
            enforceSafeZone(playerPed, safeZoneCenter, safeZoneRadius)
        end
    end
end)