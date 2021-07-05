------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------CBRP_Offical--------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------
QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('QBCore:Server:reward')
AddEventHandler('QBCore:Server:reward', function(Weight)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)

    if Weight >= 1 then
       xPlayer.Functions.AddItem('meat', 1)
       TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['meat'], "add")
    elseif Weight >= 9 then
        xPlayer.Functions.AddItem('meat', 1)
       TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['meat'], "add")
    elseif Weight >= 15 then
        xPlayer.Functions.AddItem('meat', 1)
       TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['meat'], "add")
    end

    
	xPlayer.Functions.AddItem('leather', math.random(1, 1))
       TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['leather'], "add")
        
end)
---------------------------------------------------------HUNTING PRICE-------------------------------------------------------------------------
RegisterServerEvent('QBCore:Server:sellhunt')
AddEventHandler('QBCore:Server:sellhunt', function()

			
                  local _source = source
                  local xPlayer = QBCore.Functions.GetPlayer(source)
                  local ItemA = xPlayer.Functions.GetItemByName('meat')
                  local MeatPrice = 20
                  local MeatQuantity = ItemA.amount
                  if MeatQuantity > 0  then
                      xPlayer.Functions.AddMoney("cash", MeatQuantity * MeatPrice, "sold-pawn-items")
                         TriggerClientEvent('QBCore:Notify', source, 'Bạn đã bán thịt', "success")  
                      xPlayer.Functions.RemoveItem("meat", MeatQuantity)
                      TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['meat'], "remove")
                  else
                      TriggerClientEvent('QBCore:Notify', source, 'bạn không có thịt', "error")  
                  end
                      
                  
end)

RegisterServerEvent('QBCore:Server:sellhunt')
AddEventHandler('QBCore:Server:sellhunt', function()

    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local ItemB = xPlayer.Functions.GetItemByName('leather')
    local LeatherPrice = 20
    local LeatherQuantity = ItemBox.amount
    --[[ local LeatherQuantity = ItemB.amount ]]
    
    if LeatherQuantity > 0 then
        xPlayer.Functions.AddMoney("cash", LeatherQuantity * LeatherPrice, "sold-pawn-items")
		TriggerClientEvent('QBCore:Notify', source, 'Bạn đãn bán da', "success")  
        xPlayer.Functions.RemoveItem("leather", LeatherQuantity)
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['leather'], "remove")
    else
        TriggerClientEvent('QBCore:Notify', source, 'Bạn không có da', "error")  
    end
        
end)
