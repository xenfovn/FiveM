QBCore.Commands = {}
QBCore.Commands.List = {}

QBCore.Commands.Add = function(name, help, arguments, argsrequired, callback, permission) -- [name] = command name (ex. /givemoney), [help] = help text, [arguments] = arguments that need to be passed (ex. {{name="id", help="ID of a player"}, {name="amount", help="amount of money"}}), [argsrequired] = set arguments required (true or false), [callback] = function(source, args) callback, [permission] = rank or job of a player
	QBCore.Commands.List[name:lower()] = {
		name = name:lower(),
		permission = permission ~= nil and permission:lower() or "user",
		help = help,
		arguments = arguments,
		argsrequired = argsrequired,
		callback = callback,
	}
end

QBCore.Commands.Refresh = function(source)
	local Player = QBCore.Functions.GetPlayer(tonumber(source))
	if Player ~= nil then
		for command, info in pairs(QBCore.Commands.List) do
			if QBCore.Functions.HasPermission(source, "god") or QBCore.Functions.HasPermission(source, QBCore.Commands.List[command].permission) then
				TriggerClientEvent('chat:addSuggestion', source, "/"..command, info.help, info.arguments)
			end
		end
	end
end

QBCore.Commands.Add("tp", "TP To Player or Coords (Admin Only)", {{name="id/x", help="ID of player or X position"}, {name="y", help="Y position"}, {name="z", help="Z position"}}, false, function(source, args)
	if (args[1] ~= nil and (args[2] == nil and args[3] == nil)) then
		local player = GetPlayerPed(source)
		local target = GetPlayerPed(tonumber(args[1]))
		if target ~= 0 then
			local coords = GetEntityCoords(target)
			TriggerClientEvent('QBCore:Command:TeleportToPlayer', source, coords)
		else
			TriggerClientEvent('QBCore:Notify', source, "Player Not Online", "error")
		end
	else
		if args[1] ~= nil and args[2] ~= nil and args[3] ~= nil then
			local player = GetPlayerPed(source)
			local x = tonumber(args[1])
			local y = tonumber(args[2])
			local z = tonumber(args[3])
			if (x ~= 0) and (y ~= 0) and (z ~= 0) then
				TriggerClientEvent('QBCore:Command:TeleportToCoords', source, x, y, z)
			else
				TriggerClientEvent('QBCore:Notify', source, "Incorrect Format", "error")
			end
		else
			TriggerClientEvent('QBCore:Notify', source, "Not every argument has been entered (x, y, z)", "error")
		end
	end
end, "admin")

QBCore.Commands.Add("addpermission", "Give Player Permissions (God Only)", {{name="id", help="ID of player"}, {name="permission", help="Permission level"}}, true, function(source, args)
	local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
	local permission = tostring(args[2]):lower()
	if Player ~= nil then
		QBCore.Functions.AddPermission(Player.PlayerData.source, permission)
	else
		TriggerClientEvent('QBCore:Notify', source, "Player Not Online", "error")	
	end
end, "god")

QBCore.Commands.Add("removepermission", "Remove Players Permissions (God Only)", {{name="id", help="ID of player"}}, true, function(source, args)
	local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
	if Player ~= nil then
		QBCore.Functions.RemovePermission(Player.PlayerData.source)
	else
		TriggerClientEvent('QBCore:Notify', source, "Player Not Online", "error")	
	end
end, "god")

QBCore.Commands.Add("car", "Spawn Vehicle (Admin Only)", {{name="model", help="Model name of the vehicle"}}, true, function(source, args)
	TriggerClientEvent('QBCore:Command:SpawnVehicle', source, args[1])
end, "admin")

QBCore.Commands.Add("debug", "Toggle Debug Mode (Admin Only)", {}, false, function(source, args)
	TriggerClientEvent('koil-debug:toggle', source)
end, "admin")

QBCore.Commands.Add("dv", "Delete Vehicle (Admin Only)", {}, false, function(source, args)
	TriggerClientEvent('QBCore:Command:DeleteVehicle', source)
end, "admin")

QBCore.Commands.Add("tpm", "TP To Marker (Admin Only)", {}, false, function(source, args)
	TriggerClientEvent('QBCore:Command:GoToMarker', source)
end, "admin")

QBCore.Commands.Add("givemoney", "Give A Player Money (Admin Only)", {{name="id", help="Player ID"},{name="moneytype", help="Type of money (cash, bank, crypto)"}, {name="amount", help="Amount of money"}}, true, function(source, args)
	local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
	if Player ~= nil then
		Player.Functions.AddMoney(tostring(args[2]), tonumber(args[3]))
	else
		TriggerClientEvent('QBCore:Notify', source, "Player Not Online", "error")
	end
end, "admin")

QBCore.Commands.Add("setmoney", "Set Players Money Amount (Admin Only)", {{name="id", help="Player ID"},{name="moneytype", help="Type of money (cash, bank, crypto)"}, {name="amount", help="Amount of money"}}, true, function(source, args)
	local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
	if Player ~= nil then
		Player.Functions.SetMoney(tostring(args[2]), tonumber(args[3]))
	else
		TriggerClientEvent('QBCore:Notify', source, "Player Not Online", "error")
	end
end, "admin")

QBCore.Commands.Add("setjob", "Set A Players Job (Admin Only)", {{name="id", help="Player ID"}, {name="job", help="Job name"}, {name="grade", help="Grade"}}, true, function(source, args)
	local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
	if (args[1] == nil) or (args[2] == nil) or (args[3] == nil) then
		TriggerClientEvent('QBCore:Notify', source, "All Arguments Must Be Filled", "error")
	elseif Player == nil then
		TriggerClientEvent('QBCore:Notify', source, "Player Not Online", "error")
	else
		Player.Functions.SetJob(tostring(args[2]), tonumber(args[3]))
	end
end, "admin")


QBCore.Commands.Add("job", "Check Your Job", {}, false, function(source, args)
	local Player = QBCore.Functions.GetPlayer(source)
	TriggerClientEvent('QBCore:Notify', source, "Job: "..Player.PlayerData.job.label.. " Grade: "..Player.PlayerData.job.grade.name)
end)

QBCore.Commands.Add("setgang", "Set A Players Gang (Admin Only)", {{name="id", help="Player ID"}, {name="job", help="Name of a gang"}}, true, function(source, args)
	local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
	if Player ~= nil then
		Player.Functions.SetGang(tostring(args[2]))
	else
		TriggerClientEvent('QBCore:Notify', source, "Player Not Online", "error")
	end
end, "admin")

QBCore.Commands.Add("gang", "Check Your Gang", {}, false, function(source, args)
	local Player = QBCore.Functions.GetPlayer(source)

	if Player.PlayerData.gang.name ~= "geen" then
		TriggerClientEvent('QBCore:Notify', source, "Gang: "..Player.PlayerData.gang.label)
	else
		TriggerClientEvent('QBCore:Notify', source, "No Gang Affiliation", "error")
	end
end)

QBCore.Commands.Add("clearinv", "Clear Players Inventory (Admin Only)", {{name="id", help="Player ID"}}, false, function(source, args)
	local playerId = args[1] ~= nil and args[1] or source 
	local Player = QBCore.Functions.GetPlayer(tonumber(playerId))
	if Player ~= nil then
		Player.Functions.ClearInventory()
	else
		TriggerClientEvent('QBCore:Notify', source, "Player Not Online", "error")
	end
end, "admin")

--[[ QBCore.Commands.Add("ooc", "OOC Chat Message", {}, false, function(source, args)
	local message = table.concat(args, " ")
	TriggerClientEvent("QBCore:Client:LocalOutOfCharacter", -1, source, GetPlayerName(source), message)
	local Players = QBCore.Functions.GetPlayers()
	local Player = QBCore.Functions.GetPlayer(source)

	for k, v in pairs(QBCore.Functions.GetPlayers()) do
		if QBCore.Functions.HasPermission(v, "admin") then
			if QBCore.Functions.IsOptin(v) then
				TriggerClientEvent('chatMessage', v, "OOC " .. GetPlayerName(source), "normal", message)
				TriggerEvent("qb-log:server:CreateLog", "ooc", "OOC", "white", "**"..GetPlayerName(source).."** (CitizenID: "..Player.PlayerData.citizenid.." | ID: "..source..") **Message:** " ..message, false)
			end
		end
	end
end) ]]

--[[ QBCore.Commands.Add("addrep", "Add Reputation to a Player", {{name="id", help="ID of player"}, {name="type", help="dealer/crafting/atcrafting"}, {name="amount", help="Amount of Rep"}}, false, function(source, args)

        
	local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))

   if Player ~= nil then 
	if args[1] ~= nil and args[2] ~= nil and args[3] ~= nil then
		local x = tonumber(args[1])
		local y = args[2]
		local z = tonumber(args[3])

		if y == "dealer" then
			local newrep = Player.PlayerData.metadata["dealerrep"] + z
			Player.Functions.SetMetaData("dealerrep", newrep)
			TriggerClientEvent('chatMessage', Player, "SYSTEM", "error", "Added Rep")
		end
		if y == "crafting" then
			local newrep = Player.PlayerData.metadata["craftingrep"] + z
			Player.Functions.SetMetaData("craftingrep", newrep)
			TriggerClientEvent('chatMessage', Player, "SYSTEM", "error", "Added Rep")
		end
		if y == "atcrafting" then
			local newrep  = Player.PlayerData.metadata["attachmentcraftingrep"]  + z
			Player.Functions.SetMetaData("attachmentcraftingrep", newrep)
			TriggerClientEvent('chatMessage', Player, "SYSTEM", "error", "Added Rep")
		end
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Not every argument has been entered.")
	end
  else 
   TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Player not Online")
end
end, "admin") -- change allowed role here  ]]

-- DELETE PLAYER's ENTIRE REP 
--[[ QBCore.Commands.Add("deleterep", "Delete all Reputation to a Player", {{name="id", help="ID of player"}, {name="type", help="dealer/crafting/atcrafting"}}, false, function(source, args)

local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))

if Player ~= nil then 
if args[1] ~= nil and args[2] ~= nil then
	local x = tonumber(args[1])
	local y = args[2]

	if y == "dealer" then
		Player.Functions.SetMetaData("dealerrep", 0)
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", 'Cleared ALL Dealer-Rep of ID '..x..'')
	end
	if y == "crafting" then
		Player.Functions.SetMetaData("craftingrep", 0)
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", 'Cleared ALL Crafting-Rep of ID '..x..'')
	end
	if y == "atcrafting" then
		Player.Functions.SetMetaData("attachmentcraftingrep", 0)
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", 'Cleared ALL At-Rep of ID '..x..'')
	end
else
	TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Not every argument has been entered.")
end
else 
TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Player not Online")
end
end, "admin") -- change allowed role here  ]]

-- CHECK REP OF ANY ONLINE PLAYER (ADMIN ONLY)
--[[ QBCore.Commands.Add("checkrep", "Check Reputation of a Player", {{name="id", help="ID of player"}, {name="type", help="dealer/crafting/atcrafting"}}, false, function(source, args)

local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))

if Player ~= nil then 
if args[1] ~= nil and args[2] ~= nil then
	local x = tonumber(args[1])
	local y = args[2]

	if y == "dealer" then
		local newrep = Player.PlayerData.metadata["dealerrep"]
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", 'Current Dealer-Rep of ID '..x..' is '..newrep..'')
	end
	if y == "crafting" then
		local newrep = Player.PlayerData.metadata["craftingrep"] 
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", 'Current Crafting-Rep of ID '..x..' is '..newrep..'')
	end
	if y == "atcrafting" then
		local newrep  = Player.PlayerData.metadata["attachmentcraftingrep"] 
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", 'Current At-Rep of ID '..x..' is '..newrep..'')
	end
else
	TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Not every argument has been entered.")
end
else 
TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Player not Online")
end
end, "admin") -- change allowed role here  ]]

-- CHECK PLAYER OWN REPS (ALL IN ONE MESSAGE)
--[[ QBCore.Commands.Add("myrep", "Check Your Reputations", {}, false, function(source, args)

local Player = QBCore.Functions.GetPlayer(source)

if Player ~= nil then 

	local x = Player.PlayerData.metadata["dealerrep"] 
	local y = Player.PlayerData.metadata["craftingrep"] 
	local z = Player.PlayerData.metadata["attachmentcraftingrep"] 

	TriggerClientEvent('chatMessage', source, "SYSTEM", "error", 'Your Current Dealer-Rep '..x..'')
	TriggerClientEvent('chatMessage', source, "SYSTEM", "error", 'Your Current Crafting-Rep '..y..'')
	TriggerClientEvent('chatMessage', source, "SYSTEM", "error", 'Your Current Attachment-Rep '..z..'')

else 

TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Player not Online")
end
end)

-- GIVE YOUR REPUTATION TO OTHER PLAYERS

QBCore.Commands.Add("giverep", "Add Reputation to a Player", {{name="id", help="ID of player"}, {name="type", help="dealer/crafting/atcrafting"}, {name="amount", help="Amount of Rep"}}, false, function(source, args)

	local Self = QBCore.Functions.GetPlayer(source)
	local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))

   if Player ~= nil and Self ~= nil then 
	if args[1] ~= nil and args[2] ~= nil and args[3] ~= nil then
		local x = tonumber(args[1])
		local y = args[2]
		local z = tonumber(args[3])
	if z > 0 then  
		if y == "dealer" and Self.PlayerData.metadata["dealerrep"] >= z then
			local selfrep = Self.PlayerData.metadata["dealerrep"] - z
		  local newrep = Player.PlayerData.metadata["dealerrep"] + z
			Player.Functions.SetMetaData("dealerrep", newrep)
			Self.Functions.SetMetaData("dealerrep", selfrep)
			TriggerClientEvent('chatMessage', Player, "SYSTEM", "error", "You received some DEALER REP")
		end
		if y == "crafting" and Self.PlayerData.metadata["craftingrep"] >= z then
			local selfrep = Self.PlayerData.metadata["craftingrep"] - z
		  local newrep = Player.PlayerData.metadata["craftingrep"] + z
			Player.Functions.SetMetaData("craftingrep", newrep)
			Self.Functions.SetMetaData("craftingrep", selfrep)
			TriggerClientEvent('chatMessage', Player, "SYSTEM", "error", "You received some CRAFTING REP")
		end
		if y == "atcrafting" and Self.PlayerData.metadata["attachmentcraftingrep"] >= z then
			local selfrep = Self.PlayerData.metadata["attachmentcraftingrep"] - z
		  local newrep = Player.PlayerData.metadata["attachmentcraftingrep"] + z
			Player.Functions.SetMetaData("attachmentcraftingrep", newrep)
			Self.Functions.SetMetaData("attachmentcraftingrep", selfrep)
			TriggerClientEvent('chatMessage', Player, "SYSTEM", "error", "You received some ATTACHMENT CRAFTING REP")
		end
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Negative Values not Allowed.")
	end
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Not every argument has been entered.")
	end
  else 
   TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Player not Online")
end
end) ]]