QBCore = nil

TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)

QBCore.Commands.Add("hoadon", "Tạo Hóa Đơn CHo Người CHơi", {{name="id", help="Player ID"},{name="ammount", help="Số Tiền"},{name="reason", help="Nội Dung"}}, false, function(source, args)
    Player = QBCore.Functions.GetPlayer(source)
    OtherPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
    if Player ~= nil then
        if OtherPlayer ~= nil then
            name = Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname
            playerId = tonumber(args[1])
            price = tonumber(args[2])
            citizenid = Player.PlayerData.citizenid
            
            table.remove(args, 1)
            table.remove(args, 1)
            local reason = table.concat(args, " ")


            TriggerClientEvent("billing:client:sendBillingMail", playerId, name, price, reason,citizenid)
        else
            TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Player is not online")
        end
    end
end)

RegisterNetEvent('billing:server:PayBill')
AddEventHandler('billing:server:PayBill',function(data)
    Player = QBCore.Functions.GetPlayer(source)
    OtherPlayer = QBCore.Functions.GetPlayerByCitizenId(data[2])
    if Player ~= nil then
       Balance = Player.PlayerData.money["bank"]
       
       --[[ if Balance - data[1] >= 0 then ]]
        if Balance - data[1] ~= nil then
            Player.Functions.RemoveMoney("bank",data[1],"paid-bill")
            if OtherPlayer ~= nil then
                OtherPlayer.Functions.AddMoney("bank",data[1],"recieved-bill")
                TriggerClientEvent("QBCore:Notify",OtherPlayer.PlayerData.source, "Bạn Nhận Được $"..data[1].." Từ "..Player.PlayerData.charinfo.firstname.. " ".. Player.PlayerData.charinfo.lastname , "Thành Công")
            end
        end
    end
end)
