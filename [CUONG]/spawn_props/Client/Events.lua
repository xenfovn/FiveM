ObjectsSpawnned = {}

local spawnned = false

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    if not spawnned then
        TriggerServerEvent('lg: loadProps')
    end

    spawnned = true
end)

RegisterNetEvent('lg: openPropMenu')
AddEventHandler('lg: openPropMenu', function(result)
    SendNUIMessage({
        list_props = result
    })
    SetNuiFocus(true, true)
    openned = true
end)

RegisterNetEvent('lg: createClientObject')
AddEventHandler('lg: createClientObject', function(data)
    newObject(data)
end)

RegisterNetEvent('lg: updateClientProp')
AddEventHandler('lg: updateClientProp', function(data)
    removeObject(data.id)
    newObject(data)
end)

RegisterNetEvent('lg: disableClientProp')
AddEventHandler('lg: disableClientProp', function(data)
   removeObject(data.id)
end)

RegisterNetEvent('lg: updateProp')
AddEventHandler('lg: updateProp', function(data)
    SendNUIMessage({
        element = data
    })
end)

RegisterNetEvent('lg: loadProps')
AddEventHandler('lg: loadProps', function(result)
    if result and #result > 0 then
        for i,k in pairs(result) do
            newObject(k)
        end
    end
end)

RegisterNetEvent('lg: changeStatus')
AddEventHandler('lg: changeStatus', function(data)
   SendNUIMessage({
       changeStatus = true,
       id = data.id,
       status = data.status
   })
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end

    TriggerServerEvent('lg: loadProps')
end)
    

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    
    for i,k in pairs(ObjectsSpawnned) do
        removeObject(i)
    end
end)
  
  