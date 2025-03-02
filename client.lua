local taxiVeh
local isTaxi = false
local Active = false

local sub_b0b5 = { 
    "MP_Plane_Passenger_1", "MP_Plane_Passenger_2", "MP_Plane_Passenger_3", 
    "MP_Plane_Passenger_4", "MP_Plane_Passenger_5", "MP_Plane_Passenger_6", "MP_Plane_Passenger_7"
}


local function applyPedVariations(ped, variations)
    for _, v in ipairs(variations) do
        if v[1] ~= 2 then
            SetPedComponentVariation(ped, v[1], v[2], 0, 0) 
        else
            SetPedComponentVariation(ped, v[1], v[2], 1, 1) 
        end
    end
    for i = 0, 8 do
        ClearPedProp(ped, i)
    end
end


local function setPedOutfit(ped, outfitType)
    local outfits = {
        [0] = {{0, 21}, {2, 9}, {3, 1}, {4, 9}, {6, 4}, {8, 15}, {11, 10}},
        [1] = {{0, 13}, {2, 5}, {3, 1}, {4, 10}, {6, 10}, {7, 11}, {8, 13}, {11, 10}},
        [2] = {{0, 15}, {2, 1}, {3, 1}, {4, 0}, {6, 1}, {8, 2}, {11, 6}},
        [3] = {{0, 14}, {2, 5}, {3, 3}, {4, 1}, {6, 11}, {8, 2}, {11, 3}},
        [4] = {{0, 18}, {2, 15}, {3, 15}, {4, 2}, {6, 4}, {7, 4}, {8, 3}, {11, 4}},
        [5] = {{0, 27}, {2, 7}, {3, 11}, {4, 4}, {6, 13}, {7, 5}, {8, 3}, {11, 2}},
        [6] = {{0, 16}, {2, 15}, {3, 3}, {4, 5}, {6, 2}, {8, 2}, {11, 3}}
    }

    local selectedOutfit = outfits[outfitType] or outfits[0]
    applyPedVariations(ped, selectedOutfit)
end

RegisterNetEvent('cs:introCinematic:start', function()
    local plyrId = PlayerPedId()
    local gender = IsPedModel(plyrId, "mp_m_freemode_01")
    
    PrepareMusicEvent("FM_INTRO_START")
    TriggerMusicEvent("FM_INTRO_START")

    local cutsceneType = gender and 31 or 103
    RequestCutsceneWithPlaybackList("MP_INTRO_CONCAT", cutsceneType, 8)

    while not HasCutsceneLoaded() do Wait(10) end
    
    local entityModel = GetEntityModel(plyrId)
    local cutsceneEntity = gender and 'MP_Male_Character' or 'MP_Female_Character'
    
    RegisterEntityForCutscene(0, cutsceneEntity, 3, entityModel, 0)
    RegisterEntityForCutscene(plyrId, cutsceneEntity, 0, 0, 0)
    SetCutsceneEntityStreamingFlags(cutsceneEntity, 0, 1)
    
    local oppositeGenderEntity = RegisterEntityForCutscene(0, gender and "MP_Female_Character" or "MP_Male_Character", 3, 0, 64)
    NetworkSetEntityInvisibleToNetwork(oppositeGenderEntity, true)

    local ped = {}
    for i = 0, 6 do
        local isFemale = (i % 2 == 1) 
        local model = isFemale and `mp_f_freemode_01` or `mp_m_freemode_01`
        RequestModel(model)
        while not HasModelLoaded(model) do Wait(10) end
        ped[i] = CreatePed(26, model, -1117.7778, -1557.6249, 3.3819, 0.0, false, false)
        SetEntityAsMissionEntity(ped[i], true, true)
        setPedOutfit(ped[i], i)
        RegisterEntityForCutscene(ped[i], sub_b0b5[i], 0, 0, 64)
    end
    
    NewLoadSceneStartSphere(-1212.79, -1673.52, 7, 1000, 0)
    SetWeatherTypeNow("EXTRASUNNY")
    StartCutscene(4)

    Wait(34520) -- Cutscene duration

    for i = 0, 6 do
        DeleteEntity(ped[i])
    end

    PrepareMusicEvent("AC_STOP")
    TriggerMusicEvent("AC_STOP")
    StopCutsceneImmediately()

    DoScreenFadeOut(250)
    Wait(2500)

    ClearPedWetness(plyrId)

    if CodeStudio.useTaxi then
        CreateTaxi(CodeStudio.TaxiSpawn)
    else
        SetEntityCoords(plyrId, CodeStudio.SpawnPedLoc)
        DoScreenFadeIn(250)
    end
end)


function createTaxiPed(vehicle)
    local model = GetHashKey("a_m_y_stlat_01")
    if DoesEntityExist(vehicle) and IsModelValid(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do Wait(1) end
        
        local taxiPed = CreatePedInsideVehicle(vehicle, 26, model, -1, true, false)
        SetAmbientVoiceName(taxiPed, "A_M_M_EASTSA_02_LATINO_FULL_01")
        SetBlockingOfNonTemporaryEvents(taxiPed, true)
        SetEntityAsMissionEntity(taxiPed, true, true)
        SetModelAsNoLongerNeeded(model)

        return taxiPed
    end
end

function CreateTaxi(x, y, z)
    local taxiModel = CodeStudio.Taxi
    if IsModelValid(taxiModel) and IsThisModelACar(taxiModel) then
        RequestModel(taxiModel)
        while not HasModelLoaded(taxiModel) do Wait(1) end

        taxiVeh = CreateVehicle(taxiModel, x, y, z, CodeStudio.TaxiSpawn.w, true, false)
        SetVehicleNumberPlateText(taxiVeh, CodeStudio.TaxiPlate)
        SetEntityAsMissionEntity(taxiVeh, true, true)
        SetVehicleEngineOn(taxiVeh, true, true, false)

        if CodeStudio.TaxiModded then
            SetVehicleColours(taxiVeh, 0, 88)
            SetVehicleModKit(taxiVeh, 0)
            SetVehicleMod(taxiVeh, 10, 1, 0)
        end

        SetVehicleOnGroundProperly(taxiVeh)
        local taxiPed = createTaxiPed(taxiVeh)
        local blip = AddBlipForEntity(taxiVeh)
        SetBlipSprite(blip, 198)
        SetBlipFlashes(blip, true)
        SetBlipFlashTimer(blip, 5000)
        SetHornEnabled(taxiVeh, true)
        StartVehicleHorn(taxiVeh, 1000, GetHashKey("NORMAL"), false)
        SetPedIntoVehicle(PlayerPedId(), taxiVeh, 2)

        -- YOU CAN ADD YOUR FUEL EVENT HERE FOR EXAMPLE: 
        --exports['cdn-fuel']:SetFuel(taxiVeh, 100)
        -- exports['LegacyFuel']:SetFuel(taxiVeh, 100)

        if IsPedInVehicle(PlayerPedId(), taxiVeh, 1) then
            DoScreenFadeIn(250)
            Notify(CodeStudio.WelcomeMessage)
            SetVehicleDoorsLocked(taxiVeh, 4)

            TaskVehicleDriveToCoord(taxiPed, taxiVeh, CodeStudio.TaxiDestination.x, CodeStudio.TaxiDestination.y, CodeStudio.TaxiDestination.z, 10.0, 0, GetEntityModel(taxiVeh), 524604, 10.0)
            SetPedKeepTask(taxiPed, true)

            Active = true
            isTaxi = true
            TaxiRunning(taxiPed)
        end
    end
end

function TaxiRunning(taxiPed)
    local sleep = 200
    while Active do
        local dist = #(GetEntityCoords(PlayerPedId()) - vector3(CodeStudio.TaxiDestination.x, CodeStudio.TaxiDestination.y, CodeStudio.TaxiDestination.z))
        if dist <= 10 then
            local player = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(player, false)

            for i = 19, 6, -4 do
                SetVehicleForwardSpeed(vehicle, i)
                Wait(200)
            end
            SetVehicleForwardSpeed(vehicle, 0.0)

            Notify(CodeStudio.ReachedMessage)
            SetVehicleDoorsLocked(vehicle, 1)

            TaskLeaveVehicle(player, vehicle, 0)
            Wait(2500)
            DeleteTaxi(vehicle, taxiPed)

            Active = false
            isTaxi = false
        end

        if isTaxi then
            sleep = 3
            DisplayHelpText('Press ~INPUT_FRONTEND_RRIGHT~ Skip Drive')

            if IsControlJustPressed(1, 194) then
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                isTaxi = false
                sleep = 200
                DoScreenFadeOut(2500)
                Wait(3000)
                SetEntityCoords(vehicle, vector3(CodeStudio.SkipToNearestLoc.x, CodeStudio.SkipToNearestLoc.y, CodeStudio.SkipToNearestLoc.z))
                SetEntityHeading(vehicle, CodeStudio.SkipToNearestLoc.w)
                DoScreenFadeIn(250)
            end
        end
        Wait(sleep)
    end
end


function DeleteTaxi(vehicle, driver)
    if DoesEntityExist(vehicle) and DoesEntityExist(driver) then
        if IsPedInVehicle(PlayerPedId(), vehicle, false) then
            TaskLeaveVehicle(PlayerPedId(), vehicle, 0)
            Wait(2000)
        end

        TaskVehicleDriveWander(driver, vehicle, 60.0, 524604)
        local blip = GetBlipFromEntity(vehicle)
        if DoesBlipExist(blip) then
            RemoveBlip(blip)
        end

        SetEntityAsNoLongerNeeded(vehicle)
        SetPedAsNoLongerNeeded(driver)

        Wait(5000)

        if DoesEntityExist(vehicle) then DeleteEntity(vehicle) end
        if DoesEntityExist(driver) then DeleteEntity(driver) end
    end
end


-- Display help text function
function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end


RegisterCommand('test_scene', function()
    TriggerEvent('cs:introCinematic:start')
end)