QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

-- Code

QBCore.Functions.CreateCallback('qb-taxi:server:HasMoney', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local CitizenId = Player.PlayerData.citizenid

    -- if Player.PlayerData.money.cash >= Config.BailPrice then
    --     Bail[CitizenId] = "cash"
    --     Player.Functions.RemoveMoney('cash', Config.BailPrice)
    --     cb(true)
    -- else
        if Player.PlayerData.money.bank >= Config.BailPrice then
        Bail[CitizenId] = "bank"
        Player.Functions.RemoveMoney('bank', Config.BailPrice)
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-taxi:server:CheckBail', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local CitizenId = Player.PlayerData.citizenid

    if Bail[CitizenId] ~= nil then
        Player.Functions.AddMoney(Bail[CitizenId], Config.BailPrice)
        Bail[CitizenId] = nil
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('qb-taxi:server:NpcPay')
AddEventHandler('qb-taxi:server:NpcPay', function(Payment)
    local fooikansasah = math.random(1, 5)
    local r1, r2 = math.random(1, 5), math.random(1, 5)

    if fooikansasah == r1 or fooikansasah == r2 then
        Payment = Payment + math.random(10, 20)
    end

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddMoney('cash', Payment)

    local chance = math.random(1, 100)
    if chance < 26 then
        Player.Functions.AddItem("cryptostick", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["cryptostick"], "add")
    end
end)

