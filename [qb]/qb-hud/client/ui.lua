local speed = 0.0
local seatbeltOn = false
local cruiseOn = false

local bleedingPercentage = 0

local stress = 0
local StressGain = 0
local IsGaining = false

local hunger = 100
local thirst = 100

function CalculateTimeToDisplay()
	hour = GetClockHours()
    minute = GetClockMinutes()
    
    local obj = {}
    
	if minute <= 9 then
		minute = "0" .. minute
    end
    
	if hour <= 9 then
		hour = "0" .. hour
    end
    
    obj.hour = hour
    obj.minute = minute

    return obj
end

local toggleHud = true

RegisterNetEvent('qb-hud:toggleHud')
AddEventHandler('qb-hud:toggleHud', function(toggleHud1)
    toggleHud = toggleHud1
end)

Citizen.CreateThread(function()
    Citizen.Wait(500)
    while true do 
        if QBCore ~= nil and isLoggedIn then
            speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.4
            local pos = GetEntityCoords(GetPlayerPed(-1))
            local time = CalculateTimeToDisplay()
            local street1, street2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
            local current_zone = GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z))
            local fuel = exports['LegacyFuel']:GetFuel(GetVehiclePedIsIn(GetPlayerPed(-1)))
            local engine = GetVehicleEngineHealth(GetVehiclePedIsIn(GetPlayerPed(-1)))
            local stamina = (100 - GetPlayerSprintStaminaRemaining(PlayerId()))
            local inwater = IsPedSwimmingUnderWater(GetPlayerPed(-1))
            local oxygen = GetPlayerUnderwaterTimeRemaining(PlayerId())
            SendNUIMessage({
                action = "hudtick",
                show = IsPauseMenuActive(),
                health = GetEntityHealth(GetPlayerPed(-1)),
                armor = GetPedArmour(GetPlayerPed(-1)),
                thirst = thirst,
                hunger = hunger,
                stress = stress,
                street1 = GetStreetNameFromHashKey(street1),
                street2 = GetStreetNameFromHashKey(street2),
                area_zone = current_zone,
                speed = math.ceil(speed),
                fuel = fuel,
                time = time,
                engine = engine,
                stamina = stamina,
                inwater = inwater,
                oxygen = oxygen,
                togglehud = toggleHud
                
            })
            Citizen.Wait(500)
        else
            Citizen.Wait(1000)
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        if QBCore ~= nil and isLoggedIn and PSHud.Show then
            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
                if speed >= FXStress.MinimumSpeed then
                    TriggerServerEvent('qb-hud:Server:GainStress', math.random(1, 2))
                end
            end
        end
        Citizen.Wait(20000)
    end
end)


local radarActive = false
Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(1000)
        TriggerEvent("hud:client:SetMoney")
        if IsPedInAnyVehicle(PlayerPedId()) and isLoggedIn then
            DisplayRadar(true)
            SendNUIMessage({
                action = "car",
                show = true,
            })
            radarActive = true
        else
            DisplayRadar(false)
            SendNUIMessage({
                action = "car",
                show = false,
            })
            seatbeltOn = false
            cruiseOn = false

            SendNUIMessage({
                action = "seatbelt",
                seatbelt = seatbeltOn,
            })

            SendNUIMessage({
                action = "cruise",
                cruise = cruiseOn,
            })
            radarActive = false
        end
    end
end)


RegisterNetEvent("seatbelt:client:ToggleSeatbelt")
AddEventHandler("seatbelt:client:ToggleSeatbelt", function(toggle)
    if toggle == nil then
        seatbeltOn = not seatbeltOn
        SendNUIMessage({
            action = "seatbelt",
            seatbelt = seatbeltOn,
        })
    else
        seatbeltOn = toggle
        SendNUIMessage({
            action = "seatbelt",
            seatbelt = toggle,
        })
    end
end)

RegisterNetEvent('qb-hud:client:ToggleHarness')
AddEventHandler('qb-hud:client:ToggleHarness', function(toggle)
    SendNUIMessage({
        action = "harness",
        toggle = toggle
    })
end)

RegisterNetEvent('qb-hud:client:UpdateNitrous')
AddEventHandler('qb-hud:client:UpdateNitrous', function(toggle, level, IsActive)
    SendNUIMessage({
        action = "nitrous",
        toggle = toggle,
        level = level,
        active = IsActive
    })
end)

RegisterNetEvent('qb-hud:client:UpdateDrivingMeters')
AddEventHandler('qb-hud:client:UpdateDrivingMeters', function(toggle, amount)
    SendNUIMessage({
        action = "UpdateDrivingMeters",
        amount = amount,
        toggle = toggle,
    })
end)

local LastHeading = nil
local Rotating = "left"
local toggleCompass = false

RegisterNetEvent('qb-hud:toggleCompass')
AddEventHandler('qb-hud:toggleCompass', function(toggleCompass1)
    toggleCompass = toggleCompass1
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    isLoggedIn = true
    PlayerJob = QBCore.Functions.GetPlayerData().job

end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
            toggleCompass = true
        else
            toggleCompass = false
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if isLoggedIn and QBCore ~= nil and toggleCompass then
            local ped = GetPlayerPed(-1)
            local PlayerHeading = GetEntityHeading(ped)
            if LastHeading ~= nil then
                if PlayerHeading < LastHeading then
                    Rotating = "right"
                elseif PlayerHeading > LastHeading then
                    Rotating = "left"
                end
            end
            LastHeading = PlayerHeading
            SendNUIMessage({
                action = "UpdateCompass",
                heading = PlayerHeading,
                lookside = Rotating,
                toggle = toggleCompass
            })
            Citizen.Wait(50)
        else
            SendNUIMessage({
                action = "UpdateCompass",
                heading = 1,
                lookside = 1,
                toggle = toggleCompass
            })
            Citizen.Wait(1500)
        end
    end
end)

function GetDirectionText(heading)
    if ((heading >= 0 and heading < 45) or (heading >= 315 and heading < 360)) then
        return "Nord"
    elseif (heading >= 45 and heading < 135) then
        return "Sud"
    elseif (heading >=135 and heading < 225) then
        return "Est"
    elseif (heading >= 225 and heading < 315) then
        return "West"
    end
end


RegisterNetEvent("hud:client:UpdateNeeds")
AddEventHandler("hud:client:UpdateNeeds", function(newHunger, newThirst)
    hunger = newHunger
    thirst = newThirst
end)

RegisterNetEvent('hud:client:UpdateStress')
AddEventHandler('hud:client:UpdateStress', function(newStress)
    stress = newStress
end)

Citizen.CreateThread(function()
    while true do
        if not IsGaining then
            StressGain = math.ceil(StressGain)
            if StressGain > 0 then
                QBCore.Functions.Notify('Nivelul de stress ti-a crescut', "primary", 2000)
                TriggerServerEvent('qb-hud:Server:UpdateStress', StressGain)
                StressGain = 0
            end
        end

        Citizen.Wait(3000)
    end
end)

Citizen.CreateThread(function()
    while true do
        if QBCore ~= nil and isLoggedIn then
            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
                if speed >= FXStress.MinimumSpeed then
                    TriggerServerEvent('qb-hud:Server:GainStress', math.random(2, 4))
                end
            end
        end
        Citizen.Wait(20000)
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(6)
        local ped = GetPlayerPed(-1)

        if IsPedShooting(GetPlayerPed(-1)) then
            local StressChance = math.random(1, 40)
            local odd = math.random(1, 40)
            if StressChance == odd then
                local PlusStress = math.random(1, 3) / 100
                StressGain = StressGain + PlusStress
            end
            if not IsGaining then
                IsGaining = true
            end
        else
            if IsGaining then
                IsGaining = false
            end
        end
    end
end)

function GetShakeIntensity(stresslevel)
    local retval = 0.05
    for k, v in pairs(FXStress.Intensity["shake"]) do
        if stresslevel >= v.min and stresslevel < v.max then
            retval = v.intensity
            break
        end
    end
    return retval
end

function GetEffectInterval(stresslevel)
    local retval = 60000
    for k, v in pairs(FXStress.EffectInterval) do
        if stresslevel >= v.min and stresslevel < v.max then
            retval = v.timeout
            break
        end
    end
    return retval
end

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
        local Wait = GetEffectInterval(stress)
        if stress >= 100 then
            local ShakeIntensity = GetShakeIntensity(stress)
            local FallRepeat = math.random(2, 4)
            local RagdollTimeout = (FallRepeat * 1750)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
            SetFlash(0, 0, 500, 3000, 500)

            if not IsPedRagdoll(ped) and IsPedOnFoot(ped) and not IsPedSwimming(ped) then
                local player = PlayerPedId()
                SetPedToRagdollWithFall(player, RagdollTimeout, RagdollTimeout, 1, GetEntityForwardVector(player), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
            end

            Citizen.Wait(500)
            for i = 1, FallRepeat, 1 do
                Citizen.Wait(750)
                DoScreenFadeOut(200)
                Citizen.Wait(1000)
                DoScreenFadeIn(200)
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
                SetFlash(0, 0, 200, 750, 200)
            end
        elseif stress >= FXStress.MinimumStress then
            local ShakeIntensity = GetShakeIntensity(stress)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
            SetFlash(0, 0, 500, 2500, 500)
        end
        Citizen.Wait(Wait)
    end
end)