RegisterNUICallback('getInfoPerson', function(data, cb)
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local heading = GetEntityHeading(GetPlayerPed(-1))

    local x = tonumber(string.format("%.2f", tonumber(pos.x)))
    local y = tonumber(string.format("%.2f", tonumber(pos.y)))
    local z = tonumber(string.format("%.2f", tonumber(pos.z)))
    local h = tonumber(string.format("%.2f", tonumber(heading)))

    SendNUIMessage({
        player_info = {
            pos_x = x,
            pos_y = y,
            pos_z = z,
            heading = h
        }
    })
    cb('ok')
end)

RegisterNUICallback('createProp', function(data, cb)
    if IsModelValid(data.prop) then
        TriggerServerEvent('lg: insertProp', data)
    else
        print("Wrong Name Prop Object: " .. data.prop)
        Wait(1000)
        SendNUIMessage({
            backToCreate = true
        })
    end
    
    cb('ok')
end)

RegisterNUICallback('updateProp', function(data, cb)
    if(IsEntityAnObject(ObjectsSpawnned[data.id].object)) then
        local x = tonumber(string.format("%.2f", tonumber(data.pos_x)))*1.0
        local y = tonumber(string.format("%.2f", tonumber(data.pos_y)))*1.0
        local z = tonumber(string.format("%.2f", tonumber(data.pos_z)))*1.0
        local heading = tonumber(string.format("%.2f", tonumber(data.heading)))*1.0

        SetEntityCoords(ObjectsSpawnned[data.id].object, x, y, z)
        SetEntityHeading(ObjectsSpawnned[data.id].object, heading)
    else
        ObjectsSpawnned[data.id].object = getOldObject(data.id)

        if IsEntityAnObject(ObjectsSpawnned[data.id].object) then
            local x = tonumber(string.format("%.2f", tonumber(data.pos_x)))*1.0
            local y = tonumber(string.format("%.2f", tonumber(data.pos_y)))*1.0
            local z = tonumber(string.format("%.2f", tonumber(data.pos_z)))*1.0
            local heading = tonumber(string.format("%.2f", tonumber(data.heading)))*1.0
    
            SetEntityCoords(ObjectsSpawnned[data.id].object, x, y, z)
            SetEntityHeading(ObjectsSpawnned[data.id].object, heading)
        end
    end
    
    cb('ok')
end)

RegisterNUICallback('recreateProp', function(data, cb)
    removeObject(data.id)
    newObject(data)

    cb('ok')
end)

RegisterNUICallback('savaUpdateProp', function(data, cb)
    TriggerServerEvent('lg: saveUpdateProp', data)
    
    cb('ok')
end)

RegisterNUICallback('teleportToProp', function(data, cb)    
    SetEntityCoords(GetPlayerPed(-1), tonumber(data.pos_x)*1.0, tonumber(data.pos_y)*1.0, tonumber(data.pos_z)*1.0)
    
    cb('ok')
end)

RegisterNUICallback('changeStatus', function(data, cb)
    TriggerServerEvent('lg: changeStatus', data)
    
    cb('ok')
end)


RegisterNUICallback('deleteProp', function(data, cb)
   removeObject(data.id)

    TriggerServerEvent('lg: deleteProp', data)
    cb('ok')
end)

RegisterNUICallback('disableMouse', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    openned = false
    cb('ok')
end)