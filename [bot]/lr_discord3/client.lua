QBCore = nil 

Citizen.CreateThread(function()
    while QBCore == nil do
        Wait(1)
        TriggerEvent("QBCore:GetObject", function(obj) ESX = obj end)
    end
end)

RegisterNetEvent('discord:client:tele')
AddEventHandler('discord:client:tele', function(pos, discordName)
    local ped = PlayerPedId()
    print(type(pos.x))
    SetEntityCoords(ped, tonumber(pos.x), tonumber(pos.y), tonumber(pos.z), 0.0, 0.0, 0.0, false)
    QBCore:Notify("Bạn đã được dịch chuyển bởi "..discordName)
end)

RegisterNetEvent('discord:client:teleto')
AddEventHandler('discord:client:teleto', function(posName, discordName)
    if config.TelePosition[posName] then 
        local ped = PlayerPedId()
        SetEntityCoords(ped, config.TelePosition[posName].x, config.TelePosition[posName].y, config.TelePosition[posName].z, 0.0, 0.0, 0.0, false)
    end
end)

RegisterNetEvent('discord:client:slay')
AddEventHandler('discord:client:slay', function(discordName)
    local ped = PlayerPedId()
    SetEntityHealth(ped, 0)
    QBCore:Notify(("Bạn đã bị giết bởi admin: %s"):format(discordName))
end)

RegisterCommand('tele', function()
    local ped = PlayerPedId()
    local WaypointHandle = GetFirstBlipInfoId(8)
    if DoesBlipExist(WaypointHandle) then
        local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)
        for height = 1, 1000 do 
            SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
            local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)
            if foundGround then 
                SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
                break;
            end
            Wait(5)
        end
        QBCore:Notify("Teleported")
    else
        QBCore:Notify("Nhập điểm đến")
    end
end)

RegisterCommand('pos', function()
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    print(pedCoords)
end)