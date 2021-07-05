QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('RoutePizza:Payment')
AddEventHandler('RoutePizza:Payment', function()
	local _source = source
	local Player = QBCore.Functions.GetPlayer(_source)
    Player.Functions.AddMoney("cash", 40, "sold-pizza")
    TriggerClientEvent("QBCore:Notify", _source, "Bạn kiếm được 40$", "success")
end)

RegisterServerEvent('RoutePizza:TakeDeposit')
AddEventHandler('RoutePizza:TakeDeposit', function()
	local _source = source
	local Player = QBCore.Functions.GetPlayer(_source)
    Player.Functions.RemoveMoney("bank", 500, "pizza-deposit")
    TriggerClientEvent("QBCore:Notify", _source, "Bạn vừa đặt cọc 500$", "error")
end)

RegisterServerEvent('RoutePizza:ReturnDeposit')
AddEventHandler('RoutePizza:ReturnDeposit', function(info)
	local _source = source
    local Player = QBCore.Functions.GetPlayer(_source)
    
    if info == 'cancel' then
        Player.Functions.AddMoney("bank", 0, "pizza-return-vehicle")
        TriggerClientEvent("QBCore:Notify", _source, "bạn đã trả xe và nhận lại tiền cọc", "success")
    elseif info == 'end' then
        Player.Functions.AddMoney("cash", 500, "pizza-return-vehicle")
        TriggerClientEvent("QBCore:Notify", _source, "bạn đã trả xe và nhận lại tiền cọc", "success")
    end
end)
