AddEventHandler('discord:server:command', function(author, command, playerId, args)
    if command == 'revive' then 
        TriggerClientEvent('hospital:server:Revive', playerId)
    elseif command == 'tele' then 
        print(json.encode(args))
        TriggerClientEvent('discord:client:tele', playerId, args, author)
    elseif command == 'slay' then 
        TriggerClientEvent('discord:client:slay', playerId, author)
    elseif command == 'teleto' then 
        if args ~= nil then 
            TriggerClientEvent('discord:client:teleto', playerId, args, author)
        end
        print(playerId, args)
    elseif command == 'kick' then 
        DropPlayer(playerId, ("Bạn đã bị kick bởi admin: %s"):format(author));
    end
end)

AddEventHandler('discord:server:checkPosName', function(posName, cb)
    if config.TelePosition[posName] then 
        cb(true)
    else
        local validPos = {}
        for k, v in pairs(config.TelePosition) do
            table.insert(validPos, k)
        end
        cb(validPos)
    end
end)