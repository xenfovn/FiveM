QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

QBCore.Functions.CreateUseableItem('radio', function(source)
    TriggerClientEvent('Radio.Set', source, true)
	TriggerClientEvent('Radio.Toggle', source)
end)