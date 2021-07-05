--[[ Citizen.CreateThread(function()
    while true do
        local player = GetPlayerPed(-1)

        Citizen.Wait(5*1000)
        
        SetDiscordAppId('833636509172105239') -- ID developer application --
            -- Big picture --
        SetDiscordRichPresenceAsset("qbus")
            -- Text of big picture --
        SetDiscordRichPresenceAssetText("LOS SANTOS CITY ROLEPLAY")
            -- # --
            -- Small picture --
        SetDiscordRichPresenceAssetSmall("small")
            -- Text of small picture --
        SetDiscordRichPresenceAssetSmallText("discord.gg/mydiscord")
    end
end) ]]


  
local sec = 1000
Citizen.CreateThread(function()
	while true do
		SetDiscordAppId('833636509172105239')
		SetDiscordRichPresenceAsset('qbus')
		SetDiscordRichPresenceAssetText('qbus')
		SetDiscordRichPresenceAssetSmall('LOS SANTOS CITY')
		SetDiscordRichPresenceAssetSmallText('ROLEPLAY')
		Citizen.Wait(60*sec)
	end
end)
Citizen.CreateThread(function()
	while QBCore == nil do TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end) Citizen.Wait(0) end
	QBCore.Functions.GetPlayerData().job == nil do Citizen.Wait(10) end
	if QBCore.Functions.GetPlayerData().job then
		Citizen.CreateThread(function()
			while true do
				local pName = GetPlayerName(PlayerId())
				local job = QBCore.Functions.GetPlayerData().job.name
				SetRichPresence(GetPlayerName(PlayerId()).." is roleplaying as a "..QBCore.Functions.GetPlayerData().job.name.." with "..GetNumberOfPlayers()-1.." other player(s).")
				Citizen.Wait(15*sec)
			end
		end)
	end
end)