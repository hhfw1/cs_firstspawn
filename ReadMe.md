# CodeStudio Intro Cutscene Start with AI Taxi | Standalone

If you need support I now have a discord available, it helps me keep track of issues and give better support.

https://discord.gg/ESwSKregtt

1. Event to Trigger the cutscene 
```lua 
TriggerEvent('cs:introCinematic:start')
```

# qb-clothing

1. On top of qb-clothing/client/main.lua add
```lua 
    newCreate = false
```

2. Replace This: 
```lua
    RegisterNetEvent('qb-clothes:client:CreateFirstCharacter')
    AddEventHandler('qb-clothes:client:CreateFirstCharacter', function()
        QBCore.Functions.GetPlayerData(function(pData)
            local skin = "mp_m_freemode_01"
            openMenu({
                {menu = "character", label = "Character", selected = true},
                {menu = "clothing", label = "Features", selected = false},
                {menu = "accessoires", label = "Accessories", selected = false}
            })

            if pData.charinfo.gender == 1 then
                skin = "mp_f_freemode_01"
            end

            ChangeToSkinNoUpdate(skin)
            SendNUIMessage({
                action = "ResetValues",
            })
        end)
    end)
```

With This: 
```lua
    RegisterNetEvent('qb-clothes:client:CreateFirstCharacter')
    AddEventHandler('qb-clothes:client:CreateFirstCharacter', function()
        newCreate = true
        QBCore.Functions.GetPlayerData(function(pData)
            local skin = "mp_m_freemode_01"
            openMenu({
                {menu = "character", label = "Character", selected = true},
                {menu = "clothing", label = "Features", selected = false},
                {menu = "accessoires", label = "Accessories", selected = false}
            })

            if pData.charinfo.gender == 1 then
                skin = "mp_f_freemode_01"
            end

            ChangeToSkinNoUpdate(skin)
            SendNUIMessage({
                action = "ResetValues",
            })
        end)
    end)
```


3. Replace This: 
```lua
    local function SaveSkin()
        local model = GetEntityModel(PlayerPedId())
        local clothing = json.encode(skinData)
        TriggerServerEvent("qb-clothing:saveSkin", model, clothing)
    end
```

With This: 
```lua
    local function SaveSkin()
        local model = GetEntityModel(PlayerPedId())
        local clothing = json.encode(skinData)
        TriggerServerEvent("qb-clothing:saveSkin", model, clothing)
        if newCreate then
            newCreate = false
            TriggerEvent('cs:introCinematic:start')
        end
    end
```



# illenium-appearance/fivem-appearance

1. On top of illenium-appearance/client/framework/qb/main.lua add
```lua 
    newCreate = false
```

2. Go here illenium-appearance/client/framework/qb/main.lua
Replace This: 
```lua
    RegisterNetEvent("qb-clothes:client:CreateFirstCharacter", function()
        QBCore.Functions.GetPlayerData(function(pd)
            PlayerData = pd
            setClientParams()
            InitializeCharacter(Framework.GetGender(true))
        end)
    end)
```

With This: 
```lua
    RegisterNetEvent("qb-clothes:client:CreateFirstCharacter", function()
        newCreate = true
        QBCore.Functions.GetPlayerData(function(pd)
            PlayerData = pd
            setClientParams()
            InitializeCharacter(Framework.GetGender(true))
        end)
    end)
```

3. Go here illenium-appearance/game/nui.lua
Replace This: 
```lua
    RegisterNUICallback("appearance_save", function(appearance, cb)
        cb(1)
        client.wearClothes(appearance, "head")
        client.wearClothes(appearance, "body")
        client.wearClothes(appearance, "bottom")
        client.exitPlayerCustomization(appearance)
    end)
```

With This: 
```lua
    RegisterNUICallback("appearance_save", function(appearance, cb)
        cb(1)
        client.wearClothes(appearance, "head")
        client.wearClothes(appearance, "body")
        client.wearClothes(appearance, "bottom")
        client.exitPlayerCustomization(appearance)
        if newCreate then
            newCreate = false
            TriggerEvent('cs:introCinematic:start')
        end
    end)
```