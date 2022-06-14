local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    RequestModel(`g_m_m_armboss_01`)
      while not HasModelLoaded(`g_m_m_armboss_01`) do
      Wait(1)
    end
      MethLabsKeyPed = CreatePed(2, `g_m_m_armboss_01`, Config.PedLoc, false, false)
      SetPedFleeAttributes(MethLabsKeyPed, 0, 0)
      SetPedDiesWhenInjured(MethLabsKeyPed, false)
      TaskStartScenarioInPlace(MethLabsKeyPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
      SetPedKeepTask(MethLabsKeyPed, true)
      SetBlockingOfNonTemporaryEvents(MethLabsKeyPed, true)
      SetEntityInvincible(MethLabsKeyPed, true)
      FreezeEntityPosition(MethLabsKeyPed, true)

    exports['qb-target']:AddBoxZone("MethLabsKeyPed", Config.PedTargetLoc, 1, 1, {
        name="MethLabsKeyPed",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
                event = "mt-methlabs:client:PedirMissao",
                icon = "fas fa-box",
                label = "Talk to this guy",
            },
        },
        distance = 1.5
    })
        
    exports['qb-target']:AddBoxZone("MethLabsKeyBox", Config.PackageLoc, 1.5, 1.5, {
        name="MethLabsKeyBox",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
                event = "mt-methlabs:client:AbrirCaixa",
                icon = "fas fa-box",
                label = "Search Boxes",
                item = "meth_jobrecive",
            },
        },
        distance = 1.5
    })
end)

RegisterNetEvent('mt-methlabs:client:PedirMissao', function()
    QBCore.Functions.Progressbar('name_here', 'TALKING TO BOSS...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'misscarsteal4@actor',
        anim = 'actor_berating_loop',
        flags = 16,
    }, {}, {}, function()
        ClearPedTasks(PlayerPedId())

        Wait(5000)

        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = 'Important Thins',
            subject = nil,
            message = 'Hey, my boss talked to you now and say to me that you are loking for something. <br> A send to you a location on your map, just go to there and claim the key taht is at bag.',
        })

        SetNewWaypoint(Config.PackageLoc)

        Wait(5000)

        SpawnGuards()
        TriggerServerEvent('QBCore:Server:AddItem', "meth_jobrecive", 1)
    end)
end)

-- Guardas

yatchGuards = {
    ['npcguards'] = {}
}

function loadModel(model)
    if type(model) == 'number' then
        model = model
    else
        model = GetHashKey(model)
    end
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
end

function SpawnGuards()
    local ped = PlayerPedId()

    SetPedRelationshipGroupHash(ped, `PLAYER`)
    AddRelationshipGroup('npcguards')

    for k, v in pairs(Config['yatchGuards']['npcguards']) do
        loadModel(v['model'])
        yatchGuards['npcguards'][k] = CreatePed(26, GetHashKey(v['model']), v['coords'], v['heading'], true, true)
        NetworkRegisterEntityAsNetworked(yatchGuards['npcguards'][k])
        networkID = NetworkGetNetworkIdFromEntity(yatchGuards['npcguards'][k])
        SetNetworkIdCanMigrate(networkID, true)
        SetNetworkIdExistsOnAllMachines(networkID, true)
        SetPedRandomComponentVariation(yatchGuards['npcguards'][k], 0)
        SetPedRandomProps(yatchGuards['npcguards'][k])
        SetEntityAsMissionEntity(yatchGuards['npcguards'][k])
        SetEntityVisible(yatchGuards['npcguards'][k], true)
        SetPedRelationshipGroupHash(yatchGuards['npcguards'][k], `npcguards`)
        SetPedAccuracy(yatchGuards['npcguards'][k], 75)
        SetPedArmour(yatchGuards['npcguards'][k], 100)
        SetPedCanSwitchWeapon(yatchGuards['npcguards'][k], true)
        SetPedDropsWeaponsWhenDead(yatchGuards['npcguards'][k], false)
        SetPedFleeAttributes(yatchGuards['npcguards'][k], 0, false)
        GiveWeaponToPed(yatchGuards['npcguards'][k], `WEAPON_PISTOL`, 255, false, false)
        TaskGoToEntity(yatchGuards['npcguards'][k], PlayerPedId(), -1, 1.0, 10.0, 1073741824.0, 0)
        local random = math.random(1, 2)
        if random == 2 then
            TaskGuardCurrentPosition(yatchGuards['npcguards'][k], 10.0, 10.0, 1)
        end
    end

    SetRelationshipBetweenGroups(0, `npcguards`, `npcguards`)
    SetRelationshipBetweenGroups(5, `npcguards`, `PLAYER`)
    SetRelationshipBetweenGroups(5, `PLAYER`, `npcguards`)
end

RegisterNetEvent('mt-methlabs:client:AbrirCaixa', function()
    QBCore.Functions.Progressbar('name_here', 'SEARCHING BOXES...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_ped',
        flags = 16,
    }, {}, {}, function()
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('mt-methlabs:server:DarChaves')
    end)
end)

CreateThread(function()
    RequestModel(`a_m_m_indian_01`)
      while not HasModelLoaded(`a_m_m_indian_01`) do
      Wait(1)
    end
      MethLabsShopPed = CreatePed(2, `a_m_m_indian_01`, Config.ShopPedLoc, false, false)
      SetPedFleeAttributes(MethLabsShopPed, 0, 0)
      SetPedDiesWhenInjured(MethLabsShopPed, false)
      TaskStartScenarioInPlace(MethLabsShopPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
      SetPedKeepTask(MethLabsShopPed, true)
      SetBlockingOfNonTemporaryEvents(MethLabsShopPed, true)
      SetEntityInvincible(MethLabsShopPed, true)
      FreezeEntityPosition(MethLabsShopPed, true)

    exports['qb-target']:AddBoxZone("MethLabsShopPed", Config.ShopPedTargetLoc, 1, 1, {
        name="MethLabsShopPed",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
                event = "mt-methlabs:client:Loja",
                icon = "fas fa-mask",
                label = "Talk to this guy",
            },
        },
        distance = 1.5
    })
end)

RegisterNetEvent('mt-methlabs:client:Loja', function()
    exports['qb-menu']:openMenu({
        {
            header = "Meth Market",
            isMenuHeader = true,
        },
        {
            header = "< Close Menu",
            txt = "",
            params = {
                event = "qb-menu:closeMenu",
            }
        },
        {
            header = "Buy Hydrochloric Acid",
            txt = "Price: 100$ per 1",
            params = {
                event = "mt-methlabs:client:ComprarAcido1",
            }
        },
        {
            header = "Buy Sodium Hydroxide",
            txt = "Price: 100$ per 1",
            params = {
                event = "mt-methlabs:client:ComprarAcido2",
            }
        },
        {
            header = "Buy Sulfuric Acid",
            txt = "Price: 100$ per 1",
            params = {
                event = "mt-methlabs:client:ComprarAcido3",
            }
        },
        {
            header = "Buy Empty Bags",
            txt = "Price: 5$ per 1",
            params = {
                event = "mt-methlabs:client:ComprarSacosVazios",
            }
        },
    })
end)

RegisterNetEvent('mt-methlabs:client:ComprarAcido1', function()
    TriggerServerEvent('mt-methlabs:server:ComprarAcido1')
    TriggerEvent('mt-methlabs:client:Loja')
end)

RegisterNetEvent('mt-methlabs:client:ComprarAcido2', function()
    TriggerServerEvent('mt-methlabs:server:ComprarAcido2')
    TriggerEvent('mt-methlabs:client:Loja')
end)

RegisterNetEvent('mt-methlabs:client:ComprarAcido3', function()
    TriggerServerEvent('mt-methlabs:server:ComprarAcido3')
    TriggerEvent('mt-methlabs:client:Loja')
end)

RegisterNetEvent('mt-methlabs:client:ComprarSacosVazios', function()
    TriggerServerEvent('mt-methlabs:server:ComprarSacosVazios')
    TriggerEvent('mt-methlabs:client:Loja')
end)

RegisterNetEvent('mt-methlabs:client:EntrarLab', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    SetEntityCoords(ped, Config.LabsExitLoc)
end)

RegisterNetEvent('mt-methlabs:client:SairLab', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    SetEntityCoords(ped, Config.LabsEntranceLoc)
end)

CreateThread(function ()
    exports['qb-target']:AddBoxZone("EntradaLab", Config.LabsEntranceLoc, 1, 1, {
        name = "EntradaLab",
        heading = 0,
        debugPoly = false,
    }, {
        options = {
            {
                type = "Client",
                event = "mt-methlabs:client:EntrarLab",
                icon = "fas fa-door-open",
                label = "Get In",
                item = "meth_key",
            },
        },
        distance = 2.5
    })

    exports['qb-target']:AddBoxZone("SaidaLab", Config.LabsExitLoc, 1, 1, {
        name = "SaidaLab",
        heading = 0,
        debugPoly = false,
    }, {
        options = {
            {
                type = "Client",
                event = "mt-methlabs:client:SairLab",
                icon = "fas fa-door-open",
                label = "Get Out",
            },
        },
        distance = 2.5
    })

    exports['qb-target']:AddBoxZone("MesaProcessoMeta", vector3(986.79, -140.47, -49.0), 3, 1, { -- Labs process table
        name = "MesaProcessoMeta",
        heading = 270,
        debugPoly = false,
    }, {
        options = {
            {
                type = "Client",
                event = "mt-methlabs:client:MenuProcesso",
                icon = "fas fa-box",
                label = "Use Table",
            },
        },
        distance = 2.5
    })
end)

RegisterNetEvent('mt-methlabs:client:MenuProcesso', function()
    exports['qb-menu']:openMenu({
        {
            header = "METH",
            isMenuHeader = true,
        },
        {
            header = "< Close Menu",
            txt = "",
            params = {
                event = "qb-menu:closeMenu",
            }
        },
        {
            header = "Make Meth",
            txt = "Requerided: <br> 1x Hydrochloric Acid <br> 1x Sodium Hydroxide <br> 1x Sulfuric Acid",
            params = {
                event = "mt-methlabs:client:FazerMeta",
            }
        },
        {
            header = "Pack Meth",
            txt = "Requerided: <br> 10x Empty Baggies <br> 5x Meth",
            params = {
                event = "mt-methlabs:client:EmpacotarMeta",
            }
        },
    })
end)

RegisterNetEvent('mt-methlabs:client:FazerMeta', function()
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 5000, false)
    QBCore.Functions.Progressbar('name_here', 'MAKIMG SOME METH...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('mt-methlabs:server:FazerMeta')
    end)
end)

RegisterNetEvent('mt-methlabs:client:EmpacotarMeta', function()
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 5000, false)
    QBCore.Functions.Progressbar('name_here', 'PACKING SOME METH...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('mt-methlabs:server:EmpacotarMeta')
    end)
end)
