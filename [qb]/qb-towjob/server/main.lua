QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

local PaymentTax = 5
local Bail = {}

RegisterServerEvent('qb-tow:server:DoBail')
AddEventHandler('qb-tow:server:DoBail', function(bool, vehInfo)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if bool then
        -- if Player.PlayerData.money.cash >= Config.BailPrice then
        --     Bail[Player.PlayerData.citizenid] = Config.BailPrice
        --     Player.Functions.RemoveMoney('cash', Config.BailPrice, "tow-paid-bail")
        --     TriggerClientEvent('QBCore:Notify', src, 'You Have The Deposit of $1000,- paid', 'success')
        --     TriggerClientEvent('qb-tow:client:SpawnVehicle', src, vehInfo)
        -- else
        if Player.PlayerData.money.bank >= Config.BailPrice then
            Bail[Player.PlayerData.citizenid] = Config.BailPrice
            Player.Functions.RemoveMoney('bank', Config.BailPrice, "tow-paid-bail")
            TriggerClientEvent('QBCore:Notify', src, 'Bạn đã thanh toán tiền thuê xe $'..Config.BailPrice..' Paid', 'success')
            TriggerClientEvent('qb-tow:client:SpawnVehicle', src, vehInfo)
        else
            TriggerClientEvent('QBCore:Notify', src, 'Bạn không có đủ tiền mặt, tiền thuê là $'..Config.BailPrice..'', 'error')
        end
    else
        if Bail[Player.PlayerData.citizenid] ~= nil then
            Player.Functions.AddMoney('bank', Bail[Player.PlayerData.citizenid], "tow-bail-paid")
            Bail[Player.PlayerData.citizenid] = nil
            TriggerClientEvent('QBCore:Notify', src, 'Bạn đã trả lại $'..Config.BailPrice..' Từ tiền gửi', 'success')
        end
    end
end)

RegisterNetEvent('qb-tow:server:nano')
AddEventHandler('qb-tow:server:nano', function()
    local xPlayer = QBCore.Functions.GetPlayer(tonumber(source))

	xPlayer.Functions.AddItem("plastic", 1, false)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["plastic"], "add")
end)

RegisterNetEvent('qb-tow:server:11101110')
AddEventHandler('qb-tow:server:11101110', function(drops)
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)
    local drops = tonumber(drops)
    local bonus = 0
    local DropPrice = math.random(35, 40)
    if drops > 5 then 
        bonus = math.ceil((DropPrice / 10) * 5)
    elseif drops > 10 then
        bonus = math.ceil((DropPrice / 10) * 7)
    elseif drops > 15 then
        bonus = math.ceil((DropPrice / 10) * 10)
    elseif drops > 20 then
        bonus = math.ceil((DropPrice / 10) * 12)
    end
    local price = (DropPrice * drops) + bonus
    local taxAmount = math.ceil((price / 100) * PaymentTax)
    local payment = price - taxAmount

    Player.Functions.AddJobReputation(1)
    Player.Functions.AddMoney("bank", payment, "tow-salary")
    TriggerClientEvent('chatMessage', source, "JOB", "warning", "Bạn đã nhận được tiền lương của bạn là: $"..payment..", Tổng: $"..price.." (Và $"..bonus.." tiền thưởng) In $"..taxAmount.." Thuế ("..PaymentTax.."%)")
end)

QBCore.Commands.Add("npc", "Toggle Npc Job", {}, false, function(source, args)
	TriggerClientEvent("jobs:client:ToggleNpc", source)
end)

QBCore.Commands.Add("tow", "Place A Car On The Back Of Your Flatbed", {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "tow" then
        TriggerClientEvent("qb-tow:client:TowVehicle", source)
    end
end)