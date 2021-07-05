QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

banks = {}
Citizen.CreateThread(function()
    local ready = 0
    local buis = 0
    local cur = 0
    local sav = 0
    local gang = 0

    QBCore.Functions.ExecuteSql(true, "SELECT * FROM `banks`", function(bankssql)
        for k, v in pairs(bankssql) do
            local coords = json.decode(v.coords)
            if v.moneyBags ~= nil then
                moneyBags = json.decode(v.moneyBags)
            else
                moneyBags = nil
            end
            banks[tonumber(v.id)] = { ['x'] = coords.x, ['y'] = coords.y, ['z'] = coords.z, ['bankOpen'] = v.bankOpen, ['bankCooldown'] = v.bankCooldown, ['bankType'] = v.bankType, ['moneyBags'] = moneyBags }
        end
        ready = ready + 1
    end)

    QBCore.Functions.ExecuteSql(true, "SELECT * FROM `bank_accounts` WHERE `account_type` = 'Business'", function(accts)
        buis = #accts
        if accts[1] ~= nil then
            for k, v in pairs(accts) do
                local acctType = v.business
                if businessAccounts[acctType] == nil then
                    businessAccounts[acctType] = {}
                end
                businessAccounts[acctType][tonumber(v.businessid)] = generateBusinessAccount(tonumber(v.account_number), tonumber(v.sort_code), tonumber(v.businessid))
                while businessAccounts[acctType][tonumber(v.businessid)] == nil do Wait(0) end
            end
        end
        ready = ready + 1
    end)

    QBCore.Functions.ExecuteSql(true, "SELECT * FROM `bank_accounts` WHERE `account_type` = 'Savings'", function(savings)
        sav = #savings
        if savings[1] ~= nil then
            for k, v in pairs(savings) do
                savingsAccounts[v.citizenid] = generateSavings(v.citizenid)
            end
        end
        ready = ready + 1
    end)

    QBCore.Functions.ExecuteSql(true, "SELECT * FROM `bank_accounts` WHERE `account_type` = 'Gang'", function(gangs)
        gang = #gangs
        if gangs[1] ~= nil then
            for k, v in pairs(gangs) do
                gangAccounts[v.gangid] = loadGangAccount(v.gangid)
            end
        end
        ready = ready + 1
    end)

    repeat Wait(0) until ready == 5
    local totalAccounts = (buis + cur + sav + gang)
end)

exports('business', function(acctType, bid)
    if businessAccounts[acctType] then
        if businessAccounts[acctType][tonumber(bid)] then
            return businessAccounts[acctType][tonumber(bid)]
        end
    end
end)

RegisterServerEvent('qb-banking:server:modifyBank')
AddEventHandler('qb-banking:server:modifyBank', function(bank, k, v)
    if banks[tonumber(bank)] then
        banks[tonumber(bank)][k] = v
        TriggerClientEvent('qb-banking:client:syncBanks', -1, banks)
    end
end)

exports('modifyBank', function(bank, k, v)
    TriggerEvent('qb-banking:server:modifyBank', bank, k, v)
end)

exports('registerAccount', function(cid)
    local _cid = tonumber(cid)
    currentAccounts[_cid] = generateCurrent(_cid)
end)

exports('current', function(cid)
    if currentAccounts[cid] then
        return currentAccounts[cid]
    end
end)

exports('debitcard', function(cardnumber)
    if bankCards[tonumber(cardnumber)] then
        return bankCards[tonumber(cardnumber)]
    else
        return false
    end
end)

exports('savings', function(cid)
    if savingsAccounts[cid] then
        return savingsAccounts[cid]
    end
end)

exports('gang', function(gid)
    if gangAccounts[cid] then
        return gangAccounts[cid]
    end
end)

QBCore.Functions.CreateCallback('qb-banking:server:requestBanks', function(source, cb)
    repeat Wait(0) until banks ~= nil
    cb(banks)
end)

QBCore.Functions.CreateCallback('qb-banking:server:checkMoneyBagCount', function(source, cb)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    cb(xPlayer.Functions.GetItemByName('moneybag').count)
end)

function checkAccountExists(acct, sc)
    local success
    local cid
    local processed = false
    QBCore.Functions.ExecuteSql(true, "SELECT * FROM `bank_accounts` WHERE `account_number` = '" .. acct .. "' AND `sort_code` = '" .. sc .. "'", function(exists)
        if exists[1] ~= nil then 
            success = true
            cid = exists[1].character_id
            actype = exists[1].account_type
        else
            success = false
            cid = false
            actype = false
        end
        processed = true
    end)
    repeat Wait(0) until processed == true
    return success, cid, actype
end

RegisterServerEvent('qb-banking:createNewCard')
AddEventHandler('qb-banking:createNewCard', function()
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)

    if xPlayer ~= nil then
        local cid = xPlayer.PlayerData.citizenid
        if (cid) then
            currentAccounts[cid].generateNewCard()
        end
    end

    TriggerEvent('qb-log:server:createLog', 'banking', 'Banking', "Tạo thẻ mới **[" .. xPlayer.PlayerData.citizenid .. "]**", src)
end)

RegisterServerEvent('qb-base:itemUsed')
AddEventHandler('qb-base:itemUsed', function(_src, data)
    if data.item == "moneybag" then
        TriggerClientEvent('qb-banking:client:usedMoneyBag', _src, data)
    end
end)

RegisterServerEvent('qb-banking:server:unpackMoneyBag')
AddEventHandler('qb-banking:server:unpackMoneyBag', function(item)
    local _src = source
    if item ~= nil then
        local xPlayer = QBCore.Functions.GetPlayer(_src)
        local xPlayerCID = xPlayer.PlayerData.citizenid
        local decode = json.decode(item.metapublic)
        --_char:Inventories():Remove().Item(item, 1)
        --_char:Cash().Add(tonumber(decode.amount))
        --TriggerClientEvent('pw:notification:SendAlert', _src, {type = "success", text = "The cashier has counted your money bag and gave you $"..decode.amount.." cash.", length = 5000})
    end
end)

function getCharacterName(cid)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local name = player.PlayerData.name
end

RegisterServerEvent('qb-banking:initiateTransfer')
AddEventHandler('qb-banking:initiateTransfer', function(data)
    --[[
    local _src = source
    local _startChar = QBCore.Functions.GetPlayer(_src)
    while _startChar == nil do Wait(0) end

    local checkAccount, cid, acType = checkAccountExists(data.account, data.sortcode)
    while checkAccount == nil do Wait(0) end

    if (checkAccount) then 
        local receiptName = getCharacterName(cid)
        while receiptName == nil do Wait(0) end

        if receiptName ~= false or receiptName ~= nil then 
            local userOnline = exports.qb-base:checkOnline(cid)
            
            if userOnline ~= false then
                -- User is online so we can do a straght transfer 
                local _targetUser = exports.qb-base:Source(userOnline)
                if acType == "Current" then
                    local targetBank = _targetUser:Bank().Add(data.amount, 'Bank Transfer from '.._startChar.GetName())
                    while targetBank == nil do Wait(0) end
                    local bank = _startChar:Bank().Remove(data.amount, 'Bank Transfer to '..receiptName)
                    TriggerClientEvent('pw:notification:SendAlert', _src, {type = "inform", text = "You have sent a bank transfer to "..receiptName..' for the amount of $'..data.amount, length = 5000})
                    TriggerClientEvent('pw:notification:SendAlert', userOnline, {type = "inform", text = "You have received a bank transfer from ".._startChar.GetName()..' for the amount of $'..data.amount, length = 5000})
                    TriggerClientEvent('qb-banking:openBankScreen', _src)
                    TriggerClientEvent('qb-banking:successAlert', _src, 'You have sent a bank transfer to '..receiptName..' for the amount of $'..data.amount)
                else
                    local targetBank = savingsAccounts[cid].AddMoney(data.amount, 'Bank Transfer from '.._startChar.GetName())
                    while targetBank == nil do Wait(0) end
                    local bank = _startChar:Bank().Remove(data.amount, 'Bank Transfer to '..receiptName)
                    TriggerClientEvent('pw:notification:SendAlert', _src, {type = "inform", text = "You have sent a bank transfer to "..receiptName..' for the amount of $'..data.amount, length = 5000})
                    TriggerClientEvent('pw:notification:SendAlert', userOnline, {type = "inform", text = "You have received a bank transfer from ".._startChar.GetName()..' for the amount of $'..data.amount, length = 5000})
                    TriggerClientEvent('qb-banking:openBankScreen', _src)
                    TriggerClientEvent('qb-banking:successAlert', _src, 'You have sent a bank transfer to '..receiptName..' for the amount of $'..data.amount)
                end
                
            else
                -- User is not online so we need to manually adjust thier bank balance.
                    MySQL.Async.fetchScalar("SELECT `amount` FROM `bank_accounts` WHERE `account_number` = @an AND `sort_code` = @sc AND `character_id` = @cid", {
                        ['@an'] = data.account,
                        ['@sc'] = data.sortcode,
                        ['@cid'] = cid
                    }, function(currentBalance)
                        if currentBalance ~= nil then
                            local newBalance = currentBalance + data.amount
                            if newBalance ~= currentBalance then
                                MySQL.Async.execute("UPDATE `bank_accounts` SET `amount` = @newBalance WHERE `account_number` = @an AND `sort_code` = @sc AND `character_id` = @cid", {
                                    ['@an'] = data.account,
                                    ['@sc'] = data.sortcode,
                                    ['@cid'] = cid,
                                    ['@newBalance'] = newBalance
                                }, function(rowsChanged)
                                    if rowsChanged == 1 then
                                        local time = os.date("%Y-%m-%d %H:%M:%S")
                                        MySQL.Async.insert("INSERT INTO `bank_statements` (`account`, `character_id`, `account_number`, `sort_code`, `deposited`, `withdraw`, `balance`, `date`, `type`) VALUES (@accountty, @cid, @account, @sortcode, @deposited, @withdraw, @balance, @date, @type)", {
                                            ['@accountty'] = acType,
                                            ['@cid'] = cid,
                                            ['@account'] = data.account,
                                            ['@sortcode'] = data.sortcode,
                                            ['@deposited'] = data.amount,
                                            ['@withdraw'] = nil,
                                            ['@balance'] = newBalance,
                                            ['@date'] = time,
                                            ['@type'] = 'Bank Transfer from '.._startChar.GetName()
                                        }, function(statementUpdated)
                                            if statementUpdated > 0 then 
                                                local bank = _startChar:Bank().Remove(data.amount, 'Bank Transfer to '..receiptName)
                                                TriggerClientEvent('pw:notification:SendAlert', _src, {type = "inform", text = "You have sent a bank transfer to "..receiptName..' for the amount of $'..data.amount, length = 5000})
                                                TriggerClientEvent('qb-banking:openBankScreen', _src)
                                                TriggerClientEvent('qb-banking:successAlert', _src, 'You have sent a bank transfer to '..receiptName..' for the amount of $'..data.amount)
                                            end
                                        end)
                                    end
                                end)
                            end
                        end
                    end)
            end
        end
    else
        -- Send error to client that account details do no exist.
        TriggerClientEvent('qb-banking:transferError', _src, 'The account details entered could not be located.')
    end
]]
end)

function format_int(number)
    local i, j, minus, int, fraction = tostring(number):find('([-]?)(%d+)([.]?%d*)')
    int = int:reverse():gsub("(%d%d%d)", "%1,")
    return minus .. int:reverse():gsub("^,", "") .. fraction
end

QBCore.Functions.CreateCallback('qb-banking:getBankingInformation', function(source, cb)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    while xPlayer == nil do Wait(0) end
        if (xPlayer) then
            local banking = {
                    ['name'] = xPlayer.PlayerData.charinfo.firstname .. ' ' .. xPlayer.PlayerData.charinfo.lastname,
                    ['bankbalance'] = '$'.. format_int(xPlayer.PlayerData.money['bank']),
                    ['cash'] = '$'.. format_int(xPlayer.PlayerData.money['cash']),
                    ['accountinfo'] = xPlayer.PlayerData.charinfo.account,
                }
                
                if savingsAccounts[xPlayer.PlayerData.citizenid] then
                    local cid = xPlayer.PlayerData.citizenid
                    banking['savings'] = {
                        ['amount'] = savingsAccounts[cid].GetBalance(),
                        ['details'] = savingsAccounts[cid].getAccount(),
                        ['statement'] = savingsAccounts[cid].getStatement(),
                    }
                end

                cb(banking)
        else
            cb(nil)
        end
end)

RegisterServerEvent('qb-banking:createBankCard')
AddEventHandler('qb-banking:createBankCard', function(pin)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local cid = xPlayer.PlayerData.citizenid
    local cardNumber = math.random(1000000000000000,9999999999999999)
    xPlayer.Functions.SetCreditCard(cardNumber)

    local info = {}
    local selectedCard = Config.cardTypes[math.random(1,#Config.cardTypes)]
    info.citizenid = cid
    info.name = xPlayer.PlayerData.charinfo.firstname .. ' ' .. xPlayer.PlayerData.charinfo.lastname
    info.cardNumber = cardNumber
    info.cardPin = tonumber(pin)
    info.cardActive = true
    info.cardType = selectedCard
    
    if selectedCard == "visa" then
        xPlayer.Functions.AddItem('visa', 1, nil, info)
    elseif selectedCard == "mastercard" then
        xPlayer.Functions.AddItem('mastercard', 1, nil, info)
    end

    TriggerClientEvent('qb-banking:openBankScreen', src)
    TriggerClientEvent('QBCore:Notify', src, 'Bạn đã đặt mua thẻ ATM thành công.', 'success')
    
    TriggerEvent('qb-log:server:createLog', 'banking', 'Banking', 'Đã đặt mua thành công thẻ ATM', src)
end)

RegisterServerEvent('qb-banking:doQuickDeposit')
AddEventHandler('qb-banking:doQuickDeposit', function(amount)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    while xPlayer == nil do Wait(0) end
    local currentCash = xPlayer.Functions.GetMoney('cash')

    if tonumber(amount) <= currentCash then
        local cash = xPlayer.Functions.RemoveMoney('cash', tonumber(amount), 'banking-quick-depo')
        local bank = xPlayer.Functions.AddMoney('bank', tonumber(amount), 'banking-quick-depo')
        if bank then
            TriggerClientEvent('qb-banking:openBankScreen', src)
            TriggerClientEvent('qb-banking:successAlert', src, 'Bạn đã thực hiện một khoản tiền gửi tiền mặt của $'..amount..' successfully.')
            TriggerEvent('qb-log:server:createLog', 'banking', 'Banking', 'Thực hiện một khoản tiền gửi tiền mặt của $'..amount..' successfully.', src)
        end
    end
end)

RegisterServerEvent('qb-banking:toggleCard')
AddEventHandler('qb-banking:toggleCard', function(toggle)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    
    while xPlayer == nil do Wait(0) end
        --_char:Bank():ToggleDebitCard(toggle)
end)

RegisterServerEvent('qb-banking:doQuickWithdraw')
AddEventHandler('qb-banking:doQuickWithdraw', function(amount, branch)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    while xPlayer == nil do Wait(0) end
    local currentCash = xPlayer.Functions.GetMoney('bank')
    
    if tonumber(amount) <= currentCash then
        local cash = xPlayer.Functions.RemoveMoney('bank', tonumber(amount), 'banking-quick-withdraw')
        local bank = xPlayer.Functions.AddMoney('cash', tonumber(amount), 'banking-quick-withdraw')
        if cash then 
            TriggerClientEvent('qb-banking:openBankScreen', src)
            TriggerClientEvent('qb-banking:successAlert', src, 'Bạn đã rút tiền mặt $'..amount..' successfully.')
            TriggerEvent('qb-log:server:createLog', 'banking', 'Banking', 'Rút tiền mặt $'..amount..' successfully.', src)
        end
    end
end)

RegisterServerEvent('qb-banking:updatePin')
AddEventHandler('qb-banking:updatePin', function(pin)
    if pin ~= nil then 
        local src = source
        local xPlayer = QBCore.Functions.GetPlayer(src)
        while xPlayer == nil do Wait(0) end

        --   _char:Bank().UpdateDebitCardPin(pin)
        TriggerClientEvent('qb-banking:openBankScreen', src)
        TriggerClientEvent('qb-banking:successAlert', src, 'Bạn đã cập nhật thành công mã PIN thẻ ATM của bạn.')
    end
end)

RegisterServerEvent('qb-banking:savingsDeposit')
AddEventHandler('qb-banking:savingsDeposit', function(amount)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    while xPlayer == nil do Wait(0) end
    local currentBank = xPlayer.Functions.GetMoney('bank')
    
    if tonumber(amount) <= currentBank then
        local bank = xPlayer.Functions.RemoveMoney('bank', tonumber(amount))
        local savings = savingsAccounts[xPlayer.PlayerData.citizenid].AddMoney(tonumber(amount), 'Tài khoản hiện tại để chuyển khoản tiết kiệm')
        while bank == nil do Wait(0) end
        while savings == nil do Wait(0) end
        TriggerClientEvent('qb-banking:openBankScreen', src)
        TriggerClientEvent('qb-banking:successAlert', src, 'Bạn đã thực hiện một khoản tiền gửi tiết kiệm của $'..tostring(amount)..' thành công.')
        TriggerEvent('qb-log:server:createLog', 'banking', 'Banking', 'thực hiện một khoản tiền gửi tiết kiệm của $'..tostring(amount)..' thành công..', src)
    end
end)

RegisterServerEvent('qb-banking:savingsWithdraw')
AddEventHandler('qb-banking:savingsWithdraw', function(amount)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    while xPlayer == nil do Wait(0) end
    local currentSavings = savingsAccounts[xPlayer.PlayerData.citizenid].GetBalance()
    
    if tonumber(amount) <= currentSavings then
        local savings = savingsAccounts[xPlayer.PlayerData.citizenid].RemoveMoney(tonumber(amount), 'Tiết kiệm chuyển khoản tài khoản hiện tại')
        local bank = xPlayer.Functions.AddMoney('bank', tonumber(amount), 'banking-quick-withdraw')
        while bank == nil do Wait(0) end
        while savings == nil do Wait(0) end
        TriggerClientEvent('qb-banking:openBankScreen', src)
        TriggerClientEvent('qb-banking:successAlert', src, 'Bạn đã rút tiền tiết kiệm$'..tostring(amount)..' thành công.')
        TriggerEvent('qb-log:server:createLog', 'banking', 'Banking', 'Rút tiền tiết kiệm $'..tostring(amount)..' thành công.', src)
    end
end)

RegisterServerEvent('qb-banking:createSavingsAccount')
AddEventHandler('qb-banking:createSavingsAccount', function()
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local success = createSavingsAccount(xPlayer.PlayerData.citizenid)
    
    repeat Wait(0) until success ~= nil
    TriggerClientEvent('qb-banking:openBankScreen', src)
    TriggerClientEvent('qb-banking:successAlert', src, 'Bạn đã mở thành công một tài khoản tiết kiệm.')
    TriggerEvent('qb-log:server:createLog', 'banking', 'Banking', "Tạo tài khoản tiết kiệm mới", src)
end)

QBCore.Commands.Add("givecash", "Give money to a person", {{name="id", help="Player ID"},{name="amount", help="Amount of money"}}, true, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    local TargetId = tonumber(args[1])
    local Target = QBCore.Functions.GetPlayer(TargetId)
    local amount = tonumber(args[2])
    
    if Target ~= nil then
      if amount ~= nil then
        if amount > 0 then
          if Player.PlayerData.money.cash >= amount and amount > 0 then
            if TargetId ~= source then
              TriggerClientEvent('qb-banking:client:CheckDistance', source, TargetId, amount)
            else
              TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "You can't give money to yourself.")     
            end
          else
            TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "You do not have enough money.")
          end
        else
          TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Quantity must be greater than 0.")
        end
      else
        TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Fill an amount.")
      end
    else
      TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Citizen is not in the city.")
    end    
  end)
  
  RegisterServerEvent('qb-banking:server:giveCash')
  AddEventHandler('qb-banking:server:giveCash', function(trgtId, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Target = QBCore.Functions.GetPlayer(trgtId)
  
    print(src)
    print(trgtId)
  
    if src ~= trgtId then
      Player.Functions.RemoveMoney('cash', amount, "Cash given to "..Player.PlayerData.citizenid)
      Target.Functions.AddMoney('cash', amount, "Cash received from "..Target.PlayerData.citizenid)
  
      TriggerEvent("qb-log:server:CreateLog", "qb-banking", "Give money", "blue", "**"..GetPlayerName(src) .. "** has $"..amount.." given to **" .. GetPlayerName(trgtId) .. "**")
      
      TriggerClientEvent('QBCore:Notify', trgtId, "You received $"..amount.." of "..Player.PlayerData.charinfo.firstname.."!", 'success')
      TriggerClientEvent('QBCore:Notify', src, "You gave $"..amount.." for "..Target.PlayerData.charinfo.firstname.."!", 'success')
    else
      -- TriggerEvent("qb-anticheat:server:banPlayer", "Cheating")
      TriggerEvent("qb-log:server:CreateLog", "anticheat", "Player banished! (Not really natural, this is a test, duuuhhh)", "red", "** @everyone " ..GetPlayerName(player).. "** has tried to **"..amount.."reveal oneself")  
    end
  end)