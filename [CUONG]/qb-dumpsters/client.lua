QBCore = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if QBCore == nil then
            TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            Citizen.Wait(200)
        end
    end
end)

local searched = {3423423424}
local canSearch = true
local dumpsters = {218085040, 666561306, -58485588, -206690185, 1511880420, 682791951}
local searchTime = 8000

--[[Citizen.CreateThread(function()
    local objects= {
        `prop_snow_dumpster_01`,
        `prop_dumpster_4a`,
        `prop_cs_dumpster_01a`,
        `p_dumpster_t`,
        `prop_dumpster_3a`,
        `prop_dumpster_4b`,
        `prop_dumpster_01a`,
        `prop_dumpster_02b`,
        `prop_dumpster_02a`
    }
    exports['bt-target']:AddTargetModel(objects, {
        options = {
            {
                event = "dumpster:search",
                icon = "fas fa-dumpster",
                label = "Search Dumpster",
                job = {"all"}
            },
        },
        distance = 1.8
    })
end)

RegisterNetEvent("dumpster:search")
AddEventHandler("dumpster:search", function()
	if canSearch then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local dumpsterFound = false

            for i = 1, #dumpsters do
                local dumpster = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, dumpsters[i], false, false, false)
                local dumpPos = GetEntityCoords(dumpster)
                local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dumpPos.x, dumpPos.y, dumpPos.z, true)


                if dist < 1.8 then
                   -- DrawText3Ds(dumpPos.x, dumpPos.y, dumpPos.z + 1.0, 'Press [~g~E~w~] to search the Dumpster')
                   -- if IsControlJustReleased(0, 38) then
                        for i = 1, #searched do
                            if searched[i] == dumpster then
                                dumpsterFound = true
                            end
                            if i == #searched and dumpsterFound then
                                QBCore.Functions.Notify('This Dumpster has already been searched', 'error')
                            elseif i == #searched and not dumpsterFound then
                                QBCore.Functions.Notify('You start to search the Dumpster')
                                   startSearching(searchTime, 'amb@prop_human_bum_bin@base', 'base', 'dumpster:server:rewarditem')
                                TriggerServerEvent('dumpster:startdumpsterTimer', dumpster)
                                table.insert(searched, dumpster)
                                Citizen.Wait(1000)
                            --    ClearPedTasks(playerPed)
                           --     FreezeEntityPosition(playerPed, false)
                    end
                end
            end
        end
    end
end)]] ----FOR BT-TARGET

Citizen.CreateThread(function()
    while true do
        local wait = 1000
        if canSearch then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local dumpsterFound = false
            wait = 250
            for i = 1, #dumpsters do
                local dumpster = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, dumpsters[i], false, false, false)
                local dumpPos = GetEntityCoords(dumpster)
                local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dumpPos.x, dumpPos.y, dumpPos.z, true)
                local playerPed = PlayerPedId()


                if dist < 1.8 then
                    wait = 4
                    DrawText3Ds(dumpPos.x, dumpPos.y, dumpPos.z + 1.0, 'Press [~g~E~w~] Search for dumpster')
                    if IsControlJustReleased(0, 54) then
                        for i = 1, #searched do
                            if searched[i] == dumpster then
                                dumpsterFound = true
                            end
                            if i == #searched and dumpsterFound then
                                QBCore.Functions.Notify('This waste bin has already been searched', 'error')
                            elseif i == #searched and not dumpsterFound then
                                QBCore.Functions.Notify('You start searching the Trash Can')
                                   startSearching(searchTime, 'amb@prop_human_bum_bin@base', 'base', 'sbop:server:rewarditem')
                                TriggerServerEvent('Og:startdumpsterTimer', dumpster)
                                table.insert(searched, dumpster)
                                Citizen.Wait(1000)
                            end
                        end
                    end
                end
            end
        end
        Citizen.Wait(wait)
    end
end)

RegisterNetEvent('dumpster:removedumpster')
AddEventHandler('dumpster:removedumpster', function(object)
    for i = 1, #searched do
        if searched[i] == object then
            table.remove(searched, i)
        end
    end
end)

-- Functions

function startSearching(time, dict, anim, cb)
    local animDict = dict
    local animation = anim
    local ped = PlayerPedId()


    canSearch = false

    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(0)
    end
    QBCore.Functions.Progressbar("reful_boat", "Searching The dumpster..", 8000)
        TaskPlayAnim(ped, animDict, animation, 8.0, 8.0, time, 1, 1, 0, 0, 0)
    FreezeEntityPosition(ped, true)

    Wait(time)
    ClearPedTasks(ped)
    FreezeEntityPosition(ped, false)
    canSearch = true
    TriggerServerEvent(cb)
end

--comment out section below for bt-target--

function DrawText3Ds(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local factor = #text / 460
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	
	SetTextScale(0.3, 0.3)
	SetTextFont(6)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 160)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	DrawRect(_x,_y + 0.0115, 0.02 + factor, 0.027, 28, 28, 28, 95)
end