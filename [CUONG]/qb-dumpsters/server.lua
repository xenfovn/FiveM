--5q-dumpsters--
QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('dumpster:startcarTimer')
AddEventHandler('dumpster:startcarTimer', function(car)
    startTimer(source, car)
end)

RegisterServerEvent('dumpster:server:rewarditem')
AddEventHandler('dumpster:server:rewarditem', function(listKey)
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)
    local Chance = math.random(1, 100)
                if Chance ~=nil then
                    local item = Config.Items[math.random(1, #Config.Items)]
                    Player.Functions.AddItem(item, math.random(1, 2))
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
                    TriggerClientEvent('QBCore:Notify', source, 'You found something!')
                    Citizen.Wait(500)
                else 
                TriggerClientEvent('QBCore:Notify', source, 'You found nothing!')
    end    
end)

function startTimer(id, object)
    local timer = 10 * 600000

    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
            TriggerClientEvent('dumpster:removecar', id, object)
        end
    end
end