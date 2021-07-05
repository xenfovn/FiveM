----------------CODERC-SLO--------------------------
-----------------GOLD RUSH---------------------------

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }

-------------------core
QBCore = nil 
--------------------------------------------------------LOCAL
local PlayerData                = {}
local menuIsShowed 				 = false
local hasAlreadyEnteredMarker 	 = false
local hasAlreadyEnteredMarkerr 	 = false
local lastZone 					 = nil
local isInJoblistingMarker 		 = false
local isInJoblistingMarkerr 		 = false
local bet = 0
local wtrakcie = false
local model = "prop_bucket_02a"
local bagModel = "prop_bucket_02a"
local bagspawned = nil
local maitem = false
local tekst = 0
local stopControls = false
local showPro                 	= false
local boxowocow 				= nil
local owoce						= nil
local soki                      = nil
local dajdoAuta = true
local coordsVisible = false

----------------------COORD auto
local ClosestBerth = 1
--coord spawn vehicle------------------
local sellX4AU = -681.62  
local sellY4AU = -172.68
local sellZ4AU = 37.82
local model1 = 'faggio2' --model
local delXAU = -666.55  --del auto 
local delYAU = -174.93
local delZAU = 37.68
local canve = '~g~[E]~w~ Bãi đậu xe'
local textgar = '~g~[E]~w~ Lấy Xe ~r~(Chỉ dành cho Nghề Làm Vàng) ~w~'


------------------------------------------------CORE----------------------------

Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(200)
    end
	
	while QBCore.Functions.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = QBCore.Functions.GetPlayerData()
end)

--onload player
RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        PlayerData = QBCore.Functions.GetPlayerData()
    end)
end)

--setjob
RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)
--------------------------------------------------------------------------------

----TEXT 3D-------------------------------------------------------------------
function hintToDisplay(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function DrawText3D2(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 10)
end
---------------------------------------------END TEXT-----------------------------------------------------------------

---------------------------------------------text sulla l'acqua-------------------------------------------------------
Citizen.CreateThread(function()
    while true do
    Citizen.Wait(10)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        if (GetDistanceBetweenCoords(coords, -173.72, 3049.86, 19.37, true) < 20.0)  then
           
            DrawText3D2(-173.72, 3049.86, 19.37, "~g~[E]~w~ Thu thập sỏi")
           
            DrawText3D2(-178.4, 3044.73, 19.36, "~g~[E]~w~ Thu thập sỏi")
          
            DrawText3D2(-182.63, 3038.37, 19.29, "~g~[E]~w~ Thu thập sỏi")
         
        end
    end
end)
----------------------------------------------------------------------------------------------------------------------

-------------------------------------------------PRESSIONE E per raccogliere la sabbia---------------------------------
Citizen.CreateThread(function()
    while true do
    Citizen.Wait(15)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        if(GetDistanceBetweenCoords(coords, -173.72, 3049.86, 19.37, true) < 2.0) or (GetDistanceBetweenCoords(coords, -178.4, 3044.73, 19.36, true) < 2.0) or (GetDistanceBetweenCoords(coords, -182.63, 3038.37, 19.29, true) < 2.0) then
            local coords      = GetEntityCoords(GetPlayerPed(-1))
            local isInMarker  = false
            local currentZone = nil
            local zaplata = 0
            if IsControlJustReleased(0, Keys['E']) then
                if wtrakcie == false then
                    zbieranie()
                end
            end
        end 
    end 
end)

---------------------inizio la raccolta--------------------------------------------------------------------------------
function zbieranie()
    TriggerServerEvent('smerfikcraft:zlomiarzzbier2fpg')
    wtrakcie = true
end

------------------------------------------genero il model--------------------------------------------------------------
RegisterNetEvent('wiadro:postawfpg')
AddEventHandler('wiadro:postawfpg', function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)
    if maitem == false then
        QBCore.Functions.SpawnObject(model, {
            x = x,
            y = y,
            z = z
        }, function(obj)
            SetEntityHeading(obj, GetEntityHeading(playerPed))
            PlaceObjectOnGroundProperly(obj)
            Citizen.Wait(10000)
            DeleteObject(obj)
        end)
    end
end)

--------------------------------------------blocco il player-----------------------------------------------------------
RegisterNetEvent('smerfik:zamrozcrft222fpg')
AddEventHandler('smerfik:zamrozcrft222fpg', function()
    playerPed = PlayerPedId()
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(playerPed, true)
end)

--------------------------------------------sblocco il player----------------------------------------------------------
RegisterNetEvent('smerfik:odmrozcrft222fpg')
AddEventHandler('smerfik:odmrozcrft222fpg', function()
    playerPed = PlayerPedId()
    FreezeEntityPosition(playerPed, false)
    ClearPedTasks(PlayerPedId())
    TriggerEvent('podlacz:propa22fpg')
    maitem = true
    Citizen.Wait(500)
    wtrakcie = false
end)

--------------richiamo animazione--------------------------------------------------------------------------------------
RegisterNetEvent('smerfik:craftanimacja222fpg')
AddEventHandler('smerfik:craftanimacja222fpg', function()
   
    --TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
    animacjazbierania()
    Citizen.Wait(2000)
end)
-----------------------------------------------------------------------------------------------------------------------

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(10)
    end
end

--------------------------------------------------fine creazione oggetto e animazione------------------------------------

----------------------------------------------------PROCESSA ORO GREZZO-------------------------------------------------
local conteggio2 = 0
Citizen.CreateThread(function()
    while true do
        Wait(5)
        local coords  = GetEntityCoords(GetPlayerPed(-1))
        if (GetDistanceBetweenCoords(coords, 283.45, 2847.5, 43.64, true) < 5.0) then
            local coords      = GetEntityCoords(PlayerPedId())
            local zaplata = 0
            local hasBagd = false
            local s1d = false
            local hasBagdfb = false
		    local s1dfb = false
			if(GetDistanceBetweenCoords(coords, 283.45, 2847.5, 43.64, true) < 3.0) then
				DrawText3D2(283.45, 2847.5, 43.64, '~y~[E] ~b~Quá trình vàng thô')
				DrawMarker(27, 283.45, 2847.5, 43.64-0.97, 0, 0, 0, 0, 0, 0, 0.90, 0.90, 0.90, 255, 255, 255, 200, 0, 0, 0, 0)
								
                if IsControlJustReleased(0, Keys['E']) then
                    if conteggio2 == 0 then
                        conteggio2 = 1
                    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
                        hasBagd = result
                        s1d = true
                end, 'rawgold')
                while(not s1d) do
                        Citizen.Wait(100)
                    end
                    
                if (hasBagd) then
                    if stopControls == false then
                        skup()
                    end
                else
                    QBCore.Functions.Notify('Bạn không có vàng thô.', 'error')
                    conteggio2=0
                end
                end
            end
            end
        end
    end
end)

function skup()
    stopControls = true
    TriggerServerEvent('smerfikcraft:skup22fpg')
	FreezeEntityPosition(PlayerPedId(), false)
	wtrakcie = false
end


RegisterNetEvent('tp:milkingfpg')
AddEventHandler('tp:milkingfpg', function(source)
	print("FUCK")
	 SellKurczaki2fb()
                
end)
function SellKurczaki2fb()
    -- local
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local inventory = QBCore.Functions.GetPlayerData().inventory
    local count = 0
    ----
    if(count == 0) then
    QBCore.Functions.Progressbar("search_register", "Chế biến..", 5000, false, true, {disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                        disableInventory = true,
                    }, {}, {}, {}, function()end, function()
                        
                    end)
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.9, -0.98))
    prop8 = CreateObject(GetHashKey('hei_prop_heist_box'), x, y, z,  true,  true, true)
    
    SetEntityHeading(prop8, GetEntityHeading(GetPlayerPed(-1)))
    
    
    
    LoadDict2('amb@medic@standing@tendtodead@idle_a')
    TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
    Citizen.Wait(5000)
    LoadDict2('amb@medic@standing@tendtodead@exit')
    TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
    ClearPedTasks(GetPlayerPed(-1))
    DeleteEntity(prop8)
   
    ClearPedTasksImmediately(PlayerPedId())
    TriggerServerEvent("smerfikcraft:lingotto")
    else
    
    
    end
    conteggio2=0
end

---------------------------------FINE PROCESSO ORO GREZZO------------------------------------------------------------------------------


---------------------------------VENDITA ORO IN LINGOTTI-------------------------------------------------------------------------------

local sellX = -661.0
local sellY = -219.58
local sellZ = 37.73
local conteggio3 = 0
Citizen.CreateThread(function()
    while true do
    Citizen.Wait(7)
	local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
    local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, sellX, sellY, sellZ)
	
	if dist <= 20.0 then
	DrawMarker(27, sellX, sellY, sellZ-0.96, 0, 0, 0, 0, 0, 0, 1.20, 1.20, 1.20, 255, 255, 255, 200, 0, 0, 0, 0)
	else
	Citizen.Wait(1000)
	end
	local hasBagd7 = false
	local s1d7 = false
	if dist <= 2.0 then
	DrawText3D2(sellX, sellY, sellZ+0.1, "~y~[E] ~b~Bán vàng thỏi")
        if IsControlJustPressed(0, Keys['E']) then 
            if conteggio3 == 0 then
                conteggio3 = 1
		QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
					hasBagd7 = result
					s1d7 = true
			end, 'refinedgold')
			while(not s1d7) do
					Citizen.Wait(100)
				end
            if (hasBagd7) then
               -- TriggerServerEvent('gold:lingotti')
		SellKurczaki2()
		else
        QBCore.Functions.Notify('Bạn không có vàng thỏi', 'error')
        conteggio3 = 0
		end
        end	
    end
	end
	
end
end)


function SellKurczaki2()
    -- local
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local inventory = QBCore.Functions.GetPlayerData().inventory
    local count = 0
    ----
    if(count == 0) then
    QBCore.Functions.Progressbar("search_register", "Bán hàng..", 5000, false, true, {disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                        disableInventory = true,
                    }, {}, {}, {}, function()end, function()
                        
                    end)
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.9, -0.98))
    prop = CreateObject(GetHashKey('v_ret_ps_bag_02'), x, y, z,  true,  true, true)
    
    SetEntityHeading(prop, GetEntityHeading(GetPlayerPed(-1)))
    
    
    
    LoadDict2('amb@prop_human_parking_meter@male@idle_a')
    TaskPlayAnim(GetPlayerPed(-1), 'amb@prop_human_parking_meter@male@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
    Citizen.Wait(5000)
    LoadDict2('amb@prop_human_parking_meter@male@exit')
    TaskPlayAnim(GetPlayerPed(-1), 'amb@prop_human_parking_meter@male@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
    ClearPedTasks(GetPlayerPed(-1))
    DeleteEntity(prop)
   
    TriggerServerEvent('gold:lingotti')
    conteggio3 = 0
    else
    
    
    end
end
------------------------------------------------FINE VENDITA LINGOTTI----------------------------------------------------------------------------


-------------------------------------------animazione-----------------------------------------------------
function LoadDict2(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end


----------------------------------------------CREO IL SECCHIO E LO TRASPORTO----------------------------------------
RegisterNetEvent('podlacz:propa22fpg')
AddEventHandler('podlacz:propa22fpg', function()
   
   local ad = "anim@heists@box_carry@"
	local anim = "idle"
	local player = PlayerPedId()
   

	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			TaskPlayAnim( player, ad, "exit", 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
			ClearPedSecondaryTask(player)
		else
			usunpropboxowocowx()
			SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)
			boxowocow = CreateObject(GetHashKey("prop_bucket_02a"), 0, 0, 0, true, true, false) -- creates object
			--owoce = CreateObject(GetHashKey("apa_mp_h_acc_fruitbowl_01"), 0, 0, 0, true, true, false) -- creates object
			AttachEntityToEntity(boxowocow, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 60309), 0.025, -0.20, 0.355, -75.0, 470.0, 0.0, true, true, false, true, 1, true)
			--AttachEntityToEntity(owoce, boxowocow, GetPedBoneIndex(GetPlayerPed(-1), 28422), 0.0, 0.0, 0.1, 0, 0, 0, true, true, false, true, 1, true)
			Citizen.Wait(50)
            TaskPlayAnim( player, ad, anim, 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
            QBCore.Functions.Notify('Bạn có sỏi, mang nó đến máy.', 'success', 8000)
		end
	end

    Citizen.Wait(10000)
end)
------------------------------------------END CARICO SECCHIO DI SABBIA-----------------------------------------------

--------------------- elimino il prop---------------
function usunpropboxowocowx()
    DeleteEntity(boxowocow)
    DeleteEntity(owoce)
    DeleteEntity(soki)
    DetachEntity(boxowocow, 1, 1)
    
    DetachEntity(owoce, 1, 1)
end
-------------------END ELIMINO PROP----------------

---------------------------animazione mi inchino---------------------------------------------------------------------
RegisterNetEvent('smerfik:resetg')
AddEventHandler('smerfik:resetg', function()
	coordsVisible=true
end)
---------------------------END MI INCHINO animazione ----------------------------------------------------------------

function animacjazbierania()
	local ad = "amb@medic@standing@tendtodead@base"
	local anim = "base"
	local player = PlayerPedId()


	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			TaskPlayAnim( player, ad, "exit", 8.0, 8.0, 1.0, 1, 1, 0, 0, 0 )
			ClearPedSecondaryTask(player)
		else
			SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)
			Citizen.Wait(50)
			TaskPlayAnim( player, ad, anim, 8.0, 8.0, 1.0, 1, 1, 0, 0, 0 )
		end
    end
    
end
---------------------------------------------------end mi inchino animazione-----------------------------------------

----------------------------------------------metto sabbia nel macchinario-------------------------------------------
local sellXas = -169.61
local sellYas = 3037.32
local sellZas = 20.79
local conteggio = 0
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(7)
	    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, sellXas, sellYas, sellZas)
	
	    if dist <= 20.0 then
	        DrawMarker(27, sellXas, sellYas, sellZas-0.96, 0, 0, 0, 0, 0, 0, 2.20, 2.20, 2.20, 255, 255, 255, 200, 0, 0, 0, 0)
            DrawMarker(20, sellXas, sellYas, sellZas + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.2, 0.2, 15, 255, 55, 255, true, false, false, true, false, false, false)
	    else
	        Citizen.Wait(1000)
	    end
	    local hasBagd7g = false
	    local s1d7g = false
	    if dist <= 1.0 then
	        DrawText3D2(sellXas, sellYas, sellZas+0.1, "~y~[E] ~b~Tải sỏi")
		         if IsControlJustPressed(0, Keys['E']) then 
if conteggio == 0 then
    conteggio = 1
                 QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
					hasBagd7g = result
					s1d7g = true
			end, 'gravel')
			while(not s1d7g) do
					Citizen.Wait(100)
				end
            if (hasBagd7g) then
                --TriggerServerEvent("tost:addgold")
                QBCore.Functions.Notify('Bạn đã nạp sỏi vào máy', 'success') --success
                        LoadDict2('anim@heists@narcotics@trash')
                        TaskPlayAnim(GetPlayerPed(-1), 'anim@heists@narcotics@trash', "throw_a", 3.0, -8, -1, 63, 0, 0, 0, 0 )
                        Citizen.Wait(900)
                        ClearPedTasks(GetPlayerPed(-1))
                        DeleteEntity(boxowocow)
                        DeleteEntity(owoce)
                        DeleteEntity(soki)
                        DetachEntity(boxowocow, 1, 1)
                        DetachEntity(owoce, 1, 1)
                        maitem = false
                        --------------------------------------Processo la sabbia
                        QBCore.Functions.Progressbar("search_register", " quá trình xử lí..", 10000, false, true, {disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                        disableInventory = true,
                        }, {}, {}, {}, function()end, function()
                        end)
                        Citizen.Wait(10000)
		                --------------------------------------mi da l'oro
                        TriggerServerEvent("tost:addgold")
                        conteggio = 0
		             else
                    QBCore.Functions.Notify('Bạn không có sỏi .', 'error')
                    conteggio = 0
		         end

		     end	
        end
        
    end
	
    end
end)
------------------------------------------------------------FINE CARICAMENTO SABBIA------------------------------------------------------------------


RegisterNetEvent('sprzedawanie:jablekanim22fpg')
AddEventHandler('sprzedawanie:jablekanim22fpg', function()
	local playerPed = PlayerPedId()
	local lib, anim = 'mini@repair', 'fixing_a_ped'
	FreezeEntityPosition(playerPed, true)
	Citizen.Wait(500)
	RequestAnimDict(lib, function()
		TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
	end)
end)




RegisterNetEvent('tp:misc-jobs:unlockControlsfpg')
AddEventHandler('tp:misc-jobs:unlockControlsfpg', function(source)
    print("unlocking controls")
    stopControls = false

end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if stopControls == true then
            DisableControlAction(0, Keys['E'], true)
        end
    end
end)

RegisterNetEvent('odlacz:propa3fpg')
AddEventHandler('odlacz:propa3fpg', function()
    DetachEntity(boxowocow, 1, 1)
    
    DetachEntity(owoce, 1, 1)
    DeleteObject(boxowocow)
  
    DeleteEntity(owoce)
    ClearPedSecondaryTask(PlayerPedId())
end)

RegisterNetEvent('odlacz:propa2fpg')
AddEventHandler('odlacz:propa2fpg', function()
    DeleteObject(boxowocow)
  
    DeleteEntity(owoce)
    maitem = false
    FreezeEntityPosition(PlayerPedId(), false)
    stopControls = false
end)

-------------------------------------------BLIP---------------------------------------------------


Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            for k, v in pairs(Config.GoldPosition) do
                addBlip(v.coords, 365, Strings['raccoltasabbia'])

                
            end
            addBlip(Config.Process, 365, Strings['procsabbia'])
            addBlip(Config.Process1, 365, Strings['processogrezzo'])
            addBlip(Config.Process2, 365, Strings['selgol'])
            addBlip(Config.Process3, 365, Strings['carpik'])
            addBlip(Config.Process4, 365, Strings['carpr'])
            break
        end
end)

addBlip = function(coords, sprite, text)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipScale  (blip, 0.7)
    SetBlipColour (blip, 47)
    --SetBlipColour(blip, colour)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
end

------------------------------------------END BLIP-------------------------------------------------

---------------------------------UI----------------------------------------------------------------
local UI = {
    x =  0.000 ,	-- Base Screen Coords 	+ 	 x
    y = -0.001 ,	-- Base Screen Coords 	+ 	-y
}
----------------------------END UI-----------------------------------------------------------------

------------------VISUALIZZO TESTO SULLA TESTA-----------------------------------------------------
RegisterNetEvent('smerfik:tekstjab22fpg')
AddEventHandler('smerfik:tekstjab22fpg', function()
    while true do
        Citizen.Wait(1)
        if wtrakcie == true then
            drawTxt(UI.x + 0.9605, UI.y + 0.962, 1.0,0.98,0.4, "~y~[~w~".. tekst .. "%~y~]", 255, 255, 255, 255)
        end
    end
end)

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end
------------------------------END TESTO SULLA TESTA-----------------------------------------------

-----------------------ULTIMO RESET-----------------------------
RegisterNetEvent('smerfik:zdejmijznaczek22fpg')
AddEventHandler('smerfik:zdejmijznaczek22fpg', function()
    wtrakcie = false
end)
-----------------------END ULTIMO RESTE-------------------------

---------------------CREO TIMER SULLA TESTA---------------------
RegisterNetEvent('zacznijtekst22fpg')
AddEventHandler('zacznijtekst22fpg', function()
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(1500)
    tekst = 0
end)
-----------------------END TIMER-------------------------------

-----------------------LOAD ANIM-------------------------------
function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end
--------------------EN ANIM------------------------------------

------------------------------------marker prendi auto ---------------------------------------------------------------
local CurrentDock = nil
local currentFuel
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        -----------------------------------------------LOCAL------------------------------------------------------

        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        ---local distanza marker 1----------------------
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, sellX4AU, sellY4AU, sellZ4AU)
        

        ---end local distanza marker 1------------------
       
        local vehicled = GetVehiclePedIsIn(GetPlayerPed(-1), true)
        local playerPeds = PlayerPedId()

        -------------------------------------------primo marker pavimento----------------------------------------

		if dist <= 20.0 then
			DrawMarker(25, sellX4AU, sellY4AU, sellZ4AU-0.96, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 200, 0, 0, 0, 0)
            DrawMarker(36, sellX4AUAU, sellY4AU, sellZ4AU + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.5, 0.5, 15, 255, 55, 255, true, false, false, true, false, false, false)
        end
                         

       
        -------------------------------------------fine marker pavimento-----------------------------------------
        --####################################################################################################---
        -------------------------------------------ingresso in marker 1--------------------------------------------
        if dist <= 1.0 then

            ---------------------------------------eseguo il controllo se sono in macchina----------------------
		    if GetPedInVehicleSeat(vehicled, -1) == GetPlayerPed(-1) then
              ----se sono in macchina non esegue nessuna funzione
            else
                ----se sono a piedi eseguo il codice---------------------------------------

                -------------creo il testo-------------------------------------------------
                DrawText3D2(sellX4AU, sellY4AU, sellZ4AU+0.1,''..textgar..' Model: '..model1..'')
                ---------------------------------------------------------------------------
                -------------creo il marker------------------------------------------------
                DrawMarker(20, CashoutPolicega.SpawnVehicle.x, CashoutPolicega.SpawnVehicle.y, CashoutPolicega.SpawnVehicle.z + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.1, 0.2, 15, 255, 55, 255, true, false, false, true, false, false, false)
                ---------------------------------------------------------------------------

                -----------pressione tasto E-----------------------------------------------
                if IsControlJustPressed(0, Keys['E']) then 

                -----------locali di controllo---------------------------------------------
                local hasBag4g = false
				local s1 = false
				-----------eseguo il controllo se ho la carta parking----------------------
				
                
                    ----notifica preparazione auto e benzina-------------------------------------------
                    QBCore.Functions.Notify('I\'m preparing your car, 100% fuel.', 'success',7000)
                    -----------------------------------------------------------------------------------

                     LoadDict2('amb@prop_human_parking_meter@male@idle_a')
                     TaskPlayAnim(GetPlayerPed(-1), 'amb@prop_human_parking_meter@male@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
                    ----------------------------------------------------------------------------------

                    ----creo la progress Bar----------------------------------------------------------
                    QBCore.Functions.Progressbar("search_register", "Đang Chờ Xe..", 5000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                        disableInventory = true,
                    }, {}, {}, {}, function()
                                    

                    LoadDict2('amb@prop_human_parking_meter@male@exit')
                    TaskPlayAnim(GetPlayerPed(-1), 'amb@prop_human_parking_meter@male@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
                    ClearPedTasks(GetPlayerPed(-1))
                        local timeLeft = 1000 * 1 / 1000
                
                        while timeLeft > 0 do
                            Citizen.Wait(1000)
                            timeLeft = timeLeft - 1
                           

                            -------------------------------terminato il timer creo l'auto------------------------------------------
                          TriggerServerEvent('cash-goldrush:server:truck', model1, ClosestBerth)
                            ------------------------------------------------------------------------------------------------------
                           
                        end
                        ----cancello animazione
                        
                    end, function()
                       
                    end)
                    ----------------fine progress Bar-----------------------------------------------------------------------------

                 
                
                ---------------------------------------------fine controllo card parking-------------------------------------------

                end	
                -----------------------------------------------fine pressione tasto-----------------------------------------------
              
                
            end
            -----------------------------------------------fine controllo se sono in  macchina---------------------------------------
		
		end	
        ---------------------------------------------------fine ingresso marker 1-------------------------------------------------------


    end
    -------fine while-------------------------------------------------------------------------------------------------
end)
-----------------------------------------------------------fine creazione prendi auto-------------------------------------------------

-----------------------------------------------GENERA AUTO----------------------------------------------
RegisterNetEvent('cash-goldrush:Auto')
AddEventHandler('cash-goldrush:Auto', function(boatModel, plate)
    DoScreenFadeOut(250)
    Citizen.Wait(250)
    QBCore.Functions.SpawnVehicle(boatModel, function(veh)
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        exports['LegacyFuel']:SetFuel(veh, 100)
        SetVehicleNumberPlateText(veh, plate)
        SetEntityHeading(veh, CashoutPolicega.SpawnVehicle.h)
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        SetVehicleEngineOn(veh, true, true)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
       
    end, CashoutPolicega.SpawnVehicle, true)
   SetTimeout(1000, function()
        DoScreenFadeIn(250)
    end)
end)
------------------------------------------END GENERA AUTO--------------------------------------------

-------------------------------------parcheggia auto-------------------------------------------------
Citizen.CreateThread(function()
    while true do
	Citizen.Wait(10)
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, delXAU, delYAU, delZAU)
        local ped = GetPlayerPed(-1)
        local vehicled = GetVehiclePedIsIn(GetPlayerPed(-1), true)
        local veh2 = GetVehiclePedIsIn(ped)

		if dist <= 25.0 then
        DrawMarker(36, delXAU, delYAU, delZAU, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0.5, 255, 0, 0, 255, false, false, false, true, false, false, false)
        DrawMarker(25, delXAU, delYAU, delZAU-0.97, 0, 0, 0, 0, 0, 0, 0.90, 0.90, 0.90, 255, 0, 0, 200, 0, 0, 0, 0)
		else
		Citizen.Wait(1500)
		end
		
		if dist <= 2.5 then
				
            if GetPedInVehicleSeat(vehicled, -1) == GetPlayerPed(-1) then
                DrawText3D2(delXAU, delYAU, delZAU, ''..canve..'')
                           
                if IsControlJustPressed(0, Keys['E']) then 
                     
                    QBCore.Functions.DeleteVehicle(veh2)
                  
                end	

            else
        
		    end		
		end
	end
end)
------------------------END PARCHEGGIA AUTO-------------------------------------------------------
