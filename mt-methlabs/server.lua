local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mt-methlabs:server:DarChaves', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'meth_jobrecive'
    local item2 = 'meth_key'
    local quantity = 1

    Player.Functions.RemoveItem(item, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")

    Player.Functions.AddItem(item2, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item2], "add")
end)

RegisterNetEvent('mt-methlabs:server:ComprarAcido1', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'hydrochloric_acid'
    local quantity = 1
    local price = 100

    Player.Functions.RemoveMoney('bank', price)

    Player.Functions.AddItem(item, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
end)

RegisterNetEvent('mt-methlabs:server:ComprarAcido2', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'sodium_hydroxide'
    local quantity = 1
    local price = 100

    Player.Functions.RemoveMoney('bank', price)
    
    Player.Functions.AddItem(item, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
end)

RegisterNetEvent('mt-methlabs:server:ComprarAcido3', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'sulfuric_acid'
    local quantity = 1
    local price = 100

    Player.Functions.RemoveMoney('bank', price)
    
    Player.Functions.AddItem(item, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
end)

RegisterNetEvent('mt-methlabs:server:ComprarSacosVazios', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'meth_epmty_baggies'
    local quantity = 1
    local price = 10

    Player.Functions.RemoveMoney('bank', price)
    
    Player.Functions.AddItem(item, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
end)

RegisterNetEvent('mt-methlabs:server:FazerMeta', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local hydrochloric_acid = Player.Functions.GetItemByName('hydrochloric_acid')
    local sodium_hydroxide = Player.Functions.GetItemByName('sodium_hydroxide')
    local sulfuric_acid = Player.Functions.GetItemByName('sulfuric_acid')

    if hydrochloric_acid ~= nil and sodium_hydroxide ~= nil and sulfuric_acid ~= nil then

        if hydrochloric_acid.amount >= 1 and sodium_hydroxide.amount >= 1 and sulfuric_acid.amount >= 1 then

            Player.Functions.RemoveItem('hydrochloric_acid', 1)
            Player.Functions.RemoveItem('sodium_hydroxide', 1)
            Player.Functions.RemoveItem('sulfuric_acid', 1)

            Player.Functions.AddItem('meth', 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['meth'], "add")
        end
    end
end)

RegisterNetEvent('mt-methlabs:server:EmpacotarMeta', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local meth = Player.Functions.GetItemByName('meth')
    local meth_epmty_baggies = Player.Functions.GetItemByName('meth_epmty_baggies')

    if meth ~= nil and meth_epmty_baggies ~= nil then
        if meth.amount >= 5 and meth_epmty_baggies.amount >= 10 then

            Player.Functions.RemoveItem('meth', 5)
            Player.Functions.RemoveItem('meth_epmty_baggies', 10)

            Player.Functions.AddItem('meth_baggies', 10)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['meth_baggies'], "add")
        end
    else
        QBCore.Functions.Notify('TextHere', 'error', 7500)
    end
end)

RegisterNetEvent('mt-methlabs:server:primeiroitem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem('meth_jobrecive', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['meth_jobrecive'], "add")
end)