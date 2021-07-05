----------------CODERC-SLO--------------------------
-----------------GOLD RUSH---------------------------
QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)


-------------------------------------------------CREO IL SECCHIO E PRENDO LA SABBIA----------------------------------------
RegisterServerEvent('smerfikcraft:zlomiarzzbier2fpg')
AddEventHandler('smerfikcraft:zlomiarzzbier2fpg', function()
   
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    --local Item = xPlayer.Functions.GetItemByName('orangea')

    --if Item == nil then
  
        TriggerClientEvent('wiadro:postawfpg', _source)
        TriggerClientEvent('smerfik:zamrozcrft222fpg', _source)
        TriggerClientEvent('zacznijtekst22fpg', _source)
        TriggerClientEvent('smerfik:craftanimacja222fpg', _source)
        TriggerClientEvent('smerfik:tekstjab22fpg', _source)
        Citizen.Wait(10000)
        ---------------------------------------
        local ilosc = math.random(1,1)
        xPlayer.Functions.AddItem('gravel', ilosc)
        -----------------------------------------

		TriggerClientEvent("inventory:client:ItemBox", _source, QBCore.Shared.Items['gravel'], "add")
        TriggerClientEvent('smerfik:odmrozcrft222fpg', _source)
        --TriggerClientEvent("QBCore:Notify", _source, 'Collected'.. ilosc .. ' milk', "success", 7000)
        TriggerClientEvent('smerfik:resetg', _source)
         TriggerClientEvent('smerfik:zdejmijznaczek22fpg', _source)
  -- else
  --[[
        if Item.amount < 50 then
          TriggerClientEvent('wiadro:postawfpg', _source)
          TriggerClientEvent('smerfik:zamrozcrft222fp', _source)
          TriggerClientEvent('zacznijtekst22fp', _source)
          TriggerClientEvent('smerfik:craftanimacja222fp', _source)
          TriggerClientEvent('smerfik:tekstjab22fp', _source)
          Citizen.Wait(10000)
          ----------------------------------------
         -- local ilosc = math.random(10,10)
         -- xPlayer.Functions.AddItem('milk', ilosc)
          ----------------------------------------

		  --TriggerClientEvent("inventory:client:ItemBox", _source, QBCore.Shared.Items['milk'], "add")
          TriggerClientEvent('smerfik:odmrozcrft222fp', _source)
          -- TriggerClientEvent("QBCore:Notify", _source, 'Collected'.. ilosc .. ' milk', "success", 7000)
          TriggerClientEvent('smerfik:reset', _source)
        else 

        TriggerClientEvent('smerfik:zdejmijznaczek22fpg', _source)
        TriggerClientEvent("QBCore:Notify", _source, 'You dont have orangea!', "error", 7000)
       
         end]]--

   -- end

end)
--------------------------------------------------END CREO SECCHIO E SABBIA-------------------------------------------------------------

-----------------------------------------------------------------AD GOLD---------------------------------------------------------------
RegisterServerEvent('tost:addgold')
AddEventHandler('tost:addgold', function()

    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local Item = xPlayer.Functions.GetItemByName('gravel')

    if Item == nil then
  
       -- TriggerClientEvent('wiadro:postaw', _source)
       
        ---------------------------------------
        local ilosc = math.random(1,6)
        xPlayer.Functions.AddItem('rawgold', ilosc)
        -----------------------------------------
        TriggerClientEvent("inventory:client:ItemBox", _source, QBCore.Shared.Items['rawgold'], "add")

        xPlayer.Functions.RemoveItem('gravel', 1)----
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['gravel'], "remove")
		
   else
        if Item.amount > 50 then
           --- if Item.amount > 50 then // defualt lỗi
        
          ----------------------------------------
          local ilosc = math.random(1,6)
          xPlayer.Functions.AddItem('rawgold', ilosc)
          ----------------------------------------

		  TriggerClientEvent("inventory:client:ItemBox", _source, QBCore.Shared.Items['rawgold'], "add")
           xPlayer.Functions.RemoveItem('gravel', 1)----
          TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['gravel'], "remove")
          
        else 

        TriggerClientEvent('smerfik:zdejmijznaczek22fp', _source)
        TriggerClientEvent("QBCore:Notify", _source, 'Bạn không còn chỗ trống trong kho của bạn được tính vào xe tải của bạn!', "error", 7000)
       
         end

    end

end)
--------------------------------------------------------------END ADD GOLD-------------------------------------------------

------------------------------------NOT USE
RegisterServerEvent('smerfik:pobierzjablka22fp') 
AddEventHandler('smerfik:pobierzjablka22fp', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
        xPlayer.removeMoney(3000)
end)

RegisterServerEvent('smerfik:pobierzjablka222fp') 
AddEventHandler('smerfik:pobierzjablka222fp', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addMoney(3000)
        TriggerClientEvent('esx:deleteVehicle', source)
end)
-------------------------------------------------------------

-----------------------------------------------Processa rawgold-----------------------------------------------------------------------
RegisterServerEvent('smerfikcraft:skup22fpg')
AddEventHandler('smerfikcraft:skup22fpg', function()
   
    --local jabka = xPlayer.getInventoryItem('milk').count

    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local Item = xPlayer.Functions.GetItemByName('rawgold')
    


    --if Item.amount >= 1 then
    if Item == nil then
        TriggerClientEvent('QBCore:Notify', source, 'Không Có Vàng Thô', "error")  
    else
        if Item.amount >= 1 then
           -- for i = 1, 2 do
          
        TriggerClientEvent('tp:milkingfpg', _source)
        TriggerClientEvent('odlacz:propa3fpg', _source)
      
       -- local price =  math.random(50, 200) 
        
             xPlayer.Functions.RemoveItem('rawgold', 1)----change this milkbotle
             TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['rawgold'], "remove")
       
             TriggerClientEvent('sprzedawanie:jablekanim22fpg', _source)
             
       
           

             TriggerClientEvent('odlacz:propa2fpg', _source)
             TriggerClientEvent('tp:misc-jobs:unlockControlsfpg', _source)
             
          --  end
        else
            TriggerClientEvent('QBCore:Notify', _source, 'Bạn không có vàng Thô.', "success")  
            TriggerClientEvent('tp:misc-jobs:unlockControlsfpg', _source)
        end
     end
end)
RegisterServerEvent('smerfikcraft:lingotto')
AddEventHandler('smerfikcraft:lingotto', function()
   
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    xPlayer.Functions.AddItem('refinedgold', 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refinedgold'], "add")


end)
--------------------------------------------------------------------------------------------------------------------------------

--------------VENDITA LINGOTTI ORO--------------------------------------------------------------------------------------------
RegisterServerEvent('gold:lingotti')
AddEventHandler('gold:lingotti', function()

    local xPlayer = QBCore.Functions.GetPlayer(source)
	local Item = xPlayer.Functions.GetItemByName('refinedgold')
   
	
	if Item == nil then
       TriggerClientEvent('QBCore:Notify', source, 'bạn không có thanh vàng', "error")  
	else
	 
        
		
		if Item.amount > 0 then
			--for i = 1, Item.amount do
            local reward = 0
            for i = 1, Item.amount do
                reward = 10
            end
			xPlayer.Functions.RemoveItem('refinedgold', 1)----change this
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['refinedgold'], "remove")
			xPlayer.Functions.AddMoney("cash", reward, "sold-pawn-items")
			TriggerClientEvent('QBCore:Notify', source, 'Bạn đã bán 1 thanh Vàng', "success")  
			--end
        end
		
		
     
	end

end)
-----------------------------END VENDITA LINGOTTI---------------------------------------------------------------------------------

---------------------------PRENDI AUTO ---------------------------------------------------------

-----RITIRA CAMMION LAVORO----------------------------------------
local prezzo = 10
---------PARKING CAR--------------------------------------
RegisterServerEvent('cash-goldrush:server:truck')
AddEventHandler('cash-goldrush:server:truck', function(boatModel, BerthId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local plate = "GOLD"..math.random(1111, 9999)
    
	TriggerClientEvent('cash-goldrush:Auto', src, boatModel, plate)
end)



---------------------------CONSEGNA AUTO-------------------------------------------------------
