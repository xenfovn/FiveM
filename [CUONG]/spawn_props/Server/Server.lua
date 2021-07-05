RegisterCommand('objects', function(source, args)

    -- place the administrator check here
    if user.permission_level == (2) then
    exports['ghmattimysql']:execute('SELECT * FROM props_spawn',
    {

    },function(result)
        TriggerClientEvent('lg: openPropMenu', source, result)
    end)
end)

CreateThread(function()
    exports['ghmattimysql']:execute("CREATE TABLE IF NOT EXISTS props_spawn( id int AUTO_INCREMENT, prop varchar(200), pos_x varchar(10), pos_y varchar(10), pos_z varchar(10), heading varchar(10), status int DEFAULT 1, PRIMARY KEY(id) )", {}, function() end)
end)

RegisterNetEvent('lg: insertProp')
AddEventHandler('lg: insertProp', function(data)
    local idJ = source

    local x = string.format("%.2f", tonumber(data.pos_x))
    local y = string.format("%.2f", tonumber(data.pos_y))
    local z = string.format("%.2f", tonumber(data.pos_z))
    local heading = string.format("%.2f", tonumber(data.heading))

    exports['ghmattimysql']:execute('INSERT INTO props_spawn (prop, pos_x, pos_y, pos_z, heading) VALUES (@prop, @pos_x, @pos_y, @pos_z, @heading)',
    {
        ['@prop'] = data.prop,
        ['@pos_x'] = x,
        ['@pos_y'] = y,
        ['@pos_z'] = z,
        ['@heading'] = heading
    },
    function(result)
        if result then
            data.id = result
            TriggerClientEvent('lg: updateProp', idJ, data)
            TriggerClientEvent('lg: createClientObject', -1, data)
        end        
    end) 
end)

RegisterNetEvent('lg: saveUpdateProp')
AddEventHandler('lg: saveUpdateProp', function(data)
    local idJ = source

    local x = string.format("%.2f", tonumber(data.pos_x))
    local y = string.format("%.2f", tonumber(data.pos_y))
    local z = string.format("%.2f", tonumber(data.pos_z))
    local heading = string.format("%.2f", tonumber(data.heading))

    exports['ghmattimysql']:execute('UPDATE props_spawn set prop = @prop, pos_x = @pos_x, pos_y = @pos_y, pos_z = @pos_z, heading = @heading WHERE id = @id',
    {
        ['@prop'] = data.prop,
        ['@pos_x'] = x,
        ['@pos_y'] = y,
        ['@pos_z'] = z,
        ['@heading'] = heading,
        ['@id'] = data.id
    },
    function(result)
        if result then
            TriggerClientEvent('lg: updateClientProp', -1, data)
        end        
    end) 
end)

RegisterNetEvent('lg: loadProps')
AddEventHandler('lg: loadProps', function()
    local idJ = source

    exports['ghmattimysql']:execute('SELECT * FROM props_spawn WHERE status = 1',
    {

    },function(result)
        TriggerClientEvent('lg: loadProps', idJ, result)
    end)
end)

RegisterNetEvent('lg: changeStatus')
AddEventHandler('lg: changeStatus', function(data)
    local idJ = source

    exports['ghmattimysql']:execute('UPDATE props_spawn set status = @status WHERE id = @id',
    {
        ['@status'] = data.status,
        ['@id'] = data.id
    },function(result)
        TriggerClientEvent('lg: changeStatus', idJ, data)
        if tonumber(data.status) == 0 then
            TriggerClientEvent('lg: disableClientProp', -1, data)
        else
            TriggerClientEvent('lg: createClientObject', -1, data)
        end
    end)
end)


RegisterNetEvent('lg: deleteProp')
AddEventHandler('lg: deleteProp', function(data)
    local idJ = source

    exports['ghmattimysql']:execute('DELETE FROM props_spawn WHERE id = @id',
    {
        ['@id'] = data.id
    },function(result)
        
    end)
end)