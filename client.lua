local taxiVeh
local isTaxi = false
local Active = false


local sub_b0b5 = { 
    [0] = "MP_Plane_Passenger_1",
    [1] = "MP_Plane_Passenger_2",
    [2] = "MP_Plane_Passenger_3",
    [3] = "MP_Plane_Passenger_4",
    [4] = "MP_Plane_Passenger_5",
    [5] = "MP_Plane_Passenger_6",
    [6] = "MP_Plane_Passenger_7"
}

function sub_b747(ped, a_1)
    if a_1 == 0 then
        SetPedComponentVariation(ped, 0, 21, 0, 0)
        SetPedComponentVariation(ped, 1, 0, 0, 0)
        SetPedComponentVariation(ped, 2, 9, 0, 0)
        SetPedComponentVariation(ped, 3, 1, 0, 0)
        SetPedComponentVariation(ped, 4, 9, 0, 0)
        SetPedComponentVariation(ped, 5, 0, 0, 0)
        SetPedComponentVariation(ped, 6, 4, 8, 0)
        SetPedComponentVariation(ped, 7, 0, 0, 0)
        SetPedComponentVariation(ped, 8, 15, 0, 0)
        SetPedComponentVariation(ped, 9, 0, 0, 0)
        SetPedComponentVariation(ped, 10, 0, 0, 0)
        SetPedComponentVariation(ped, 11, 10, 0, 0)
        ClearPedProp(ped, 0)
        ClearPedProp(ped, 1)
        ClearPedProp(ped, 2)
        ClearPedProp(ped, 3)
        ClearPedProp(ped, 4)
        ClearPedProp(ped, 5)
        ClearPedProp(ped, 6)
        ClearPedProp(ped, 7)
        ClearPedProp(ped, 8)
    elseif a_1 == 1 then
        SetPedComponentVariation(ped, 0, 13, 0, 0)
        SetPedComponentVariation(ped, 1, 0, 0, 0)
        SetPedComponentVariation(ped, 2, 5, 4, 0)
        SetPedComponentVariation(ped, 3, 1, 0, 0)
        SetPedComponentVariation(ped, 4, 10, 0, 0)
        SetPedComponentVariation(ped, 5, 0, 0, 0)
        SetPedComponentVariation(ped, 6, 10, 0, 0)
        SetPedComponentVariation(ped, 7, 11, 2, 0)
        SetPedComponentVariation(ped, 8, 13, 6, 0)
        SetPedComponentVariation(ped, 9, 0, 0, 0)
        SetPedComponentVariation(ped, 10, 0, 0, 0)
        SetPedComponentVariation(ped, 11, 10, 0, 0)
        ClearPedProp(ped, 0)
        ClearPedProp(ped, 1)
        ClearPedProp(ped, 2)
        ClearPedProp(ped, 3)
        ClearPedProp(ped, 4)
        ClearPedProp(ped, 5)
        ClearPedProp(ped, 6)
        ClearPedProp(ped, 7)
        ClearPedProp(ped, 8)
    elseif a_1 == 2 then
        SetPedComponentVariation(ped, 0, 15, 0, 0)
        SetPedComponentVariation(ped, 1, 0, 0, 0)
        SetPedComponentVariation(ped, 2, 1, 4, 0)
        SetPedComponentVariation(ped, 3, 1, 0, 0)
        SetPedComponentVariation(ped, 4, 0, 1, 0)
        SetPedComponentVariation(ped, 5, 0, 0, 0)
        SetPedComponentVariation(ped, 6, 1, 7, 0)
        SetPedComponentVariation(ped, 7, 0, 0, 0)
        SetPedComponentVariation(ped, 8, 2, 9, 0)
        SetPedComponentVariation(ped, 9, 0, 0, 0)
        SetPedComponentVariation(ped, 10, 0, 0, 0)
        SetPedComponentVariation(ped, 11, 6, 0, 0)
        ClearPedProp(ped, 0)
        ClearPedProp(ped, 1)
        ClearPedProp(ped, 2)
        ClearPedProp(ped, 3)
        ClearPedProp(ped, 4)
        ClearPedProp(ped, 5)
        ClearPedProp(ped, 6)
        ClearPedProp(ped, 7)
        ClearPedProp(ped, 8)
    elseif a_1 == 3 then
        SetPedComponentVariation(ped, 0, 14, 0, 0)
        SetPedComponentVariation(ped, 1, 0, 0, 0)
        SetPedComponentVariation(ped, 2, 5, 3, 0)
        SetPedComponentVariation(ped, 3, 3, 0, 0)
        SetPedComponentVariation(ped, 4, 1, 6, 0)
        SetPedComponentVariation(ped, 5, 0, 0, 0)
        SetPedComponentVariation(ped, 6, 11, 5, 0)
        SetPedComponentVariation(ped, 7, 0, 0, 0)
        SetPedComponentVariation(ped, 8, 2, 0, 0)
        SetPedComponentVariation(ped, 9, 0, 0, 0)
        SetPedComponentVariation(ped, 10, 0, 0, 0)
        SetPedComponentVariation(ped, 11, 3, 12, 0)
        ClearPedProp(ped, 0)
        ClearPedProp(ped, 1)
        ClearPedProp(ped, 2)
        ClearPedProp(ped, 3)
        ClearPedProp(ped, 4)
        ClearPedProp(ped, 5)
        ClearPedProp(ped, 6)
        ClearPedProp(ped, 7)
        ClearPedProp(ped, 8)
    elseif a_1 == 4 then
        SetPedComponentVariation(ped, 0, 18, 0, 0)
        SetPedComponentVariation(ped, 1, 0, 0, 0)
        SetPedComponentVariation(ped, 2, 15, 3, 0)
        SetPedComponentVariation(ped, 3, 15, 0, 0)
        SetPedComponentVariation(ped, 4, 2, 5, 0)
        SetPedComponentVariation(ped, 5, 0, 0, 0)
        SetPedComponentVariation(ped, 6, 4, 6, 0)
        SetPedComponentVariation(ped, 7, 4, 0, 0)
        SetPedComponentVariation(ped, 8, 3, 0, 0)
        SetPedComponentVariation(ped, 9, 0, 0, 0)
        SetPedComponentVariation(ped, 10, 0, 0, 0)
        SetPedComponentVariation(ped, 11, 4, 0, 0)
        ClearPedProp(ped, 0)
        ClearPedProp(ped, 1)
        ClearPedProp(ped, 2)
        ClearPedProp(ped, 3)
        ClearPedProp(ped, 4)
        ClearPedProp(ped, 5)
        ClearPedProp(ped, 6)
        ClearPedProp(ped, 7)
        ClearPedProp(ped, 8)
    elseif a_1 == 5 then
        SetPedComponentVariation(ped, 0, 27, 0, 0)
        SetPedComponentVariation(ped, 1, 0, 0, 0)
        SetPedComponentVariation(ped, 2, 7, 3, 0)
        SetPedComponentVariation(ped, 3, 11, 0, 0)
        SetPedComponentVariation(ped, 4, 4, 8, 0)
        SetPedComponentVariation(ped, 5, 0, 0, 0)
        SetPedComponentVariation(ped, 6, 13, 14, 0)
        SetPedComponentVariation(ped, 7, 5, 3, 0)
        SetPedComponentVariation(ped, 8, 3, 0, 0)
        SetPedComponentVariation(ped, 9, 0, 0, 0)
        SetPedComponentVariation(ped, 10, 0, 0, 0)
        SetPedComponentVariation(ped, 11, 2, 7, 0)
        ClearPedProp(ped, 0)
        ClearPedProp(ped, 1)
        ClearPedProp(ped, 2)
        ClearPedProp(ped, 3)
        ClearPedProp(ped, 4)
        ClearPedProp(ped, 5)
        ClearPedProp(ped, 6)
        ClearPedProp(ped, 7)
        ClearPedProp(ped, 8)
    elseif a_1 == 6 then
        SetPedComponentVariation(ped, 0, 16, 0, 0)
        SetPedComponentVariation(ped, 1, 0, 0, 0)
        SetPedComponentVariation(ped, 2, 15, 1, 0)
        SetPedComponentVariation(ped, 3, 3, 0, 0)
        SetPedComponentVariation(ped, 4, 5, 6, 0)
        SetPedComponentVariation(ped, 5, 0, 0, 0)
        SetPedComponentVariation(ped, 6, 2, 8, 0)
        SetPedComponentVariation(ped, 7, 0, 0, 0)
        SetPedComponentVariation(ped, 8, 2, 0, 0)
        SetPedComponentVariation(ped, 9, 0, 0, 0)
        SetPedComponentVariation(ped, 10, 0, 0, 0)
        SetPedComponentVariation(ped, 11, 3, 7, 0)
        ClearPedProp(ped, 0)
        ClearPedProp(ped, 1)
        ClearPedProp(ped, 2)
        ClearPedProp(ped, 3)
        ClearPedProp(ped, 4)
        ClearPedProp(ped, 5)
        ClearPedProp(ped, 6)
        ClearPedProp(ped, 7)
        ClearPedProp(ped, 8)
    end
end




RegisterNetEvent('cs:introCinematic:start', function()
    local plyrId = PlayerPedId() -- PLAYER ID
    local gender = IsPedMale(plyrId)
    PrepareMusicEvent("FM_INTRO_START") --FM_INTRO_START
    TriggerMusicEvent("FM_INTRO_START") --FM_INTRO_START
    -----------------------------------------------
    if gender then
        RequestCutsceneWithPlaybackList("MP_INTRO_CONCAT", 31, 8)
    else	
        RequestCutsceneWithPlaybackList("MP_INTRO_CONCAT", 103, 8)
    end
    while not HasCutsceneLoaded() do Wait(10) end --- waiting for the cutscene to load
    if gender then
        RegisterEntityForCutscene(0, 'MP_Male_Character', 3, GetEntityModel(PlayerPedId()), 0)
        RegisterEntityForCutscene(PlayerPedId(), 'MP_Male_Character', 0, 0, 0)
        SetCutsceneEntityStreamingFlags('MP_Male_Character', 0, 1) 
        local female = RegisterEntityForCutscene(0,"MP_Female_Character",3,0,64) 
        NetworkSetEntityInvisibleToNetwork(female, true)
    else
        RegisterEntityForCutscene(0, 'MP_Female_Character', 3, GetEntityModel(PlayerPedId()), 0)
        RegisterEntityForCutscene(PlayerPedId(), 'MP_Female_Character', 0, 0, 0)
        SetCutsceneEntityStreamingFlags('MP_Female_Character', 0, 1) 
        local male = RegisterEntityForCutscene(0,"MP_Male_Character",3,0,64) 
        NetworkSetEntityInvisibleToNetwork(male, true)
    end
    local ped = {}
    for v_3=0, 6, 1 do
        if v_3 == 1 or v_3 == 2 or v_3 == 4 or v_3 == 6 then
            ped[v_3] = CreatePed(26, `mp_f_freemode_01`, -1117.77783203125, -1557.6248779296875, 3.3819, 0.0, 0, 0)
        else
            ped[v_3] = CreatePed(26, `mp_m_freemode_01`, -1117.77783203125, -1557.6248779296875, 3.3819, 0.0, 0, 0)
        end
        if not IsEntityDead(ped[v_3]) then
                sub_b747(ped[v_3], v_3)
            FinalizeHeadBlend(ped[v_3])
            RegisterEntityForCutscene(ped[v_3], sub_b0b5[v_3], 0, 0, 64)
        end
    end
     
    NewLoadSceneStartSphere(-1212.79, -1673.52, 7, 1000, 0) ----- avoid texture bugs
    -----------------------------------------------
    SetWeatherTypeNow("EXTRASUNNY") ---- SUN TIME
    StartCutscene(4) --- START the custscene

    Wait(34520) --- custscene time
    for v_3=0, 6, 1 do
        DeleteEntity(ped[v_3])
    end
    PrepareMusicEvent("AC_STOP")
    TriggerMusicEvent("AC_STOP")
    StopCutsceneImmediately()
    DoScreenFadeOut(250)
    Wait(2500)
    if CodeStudio.useTaxi then
        CreateTaxi(CodeStudio.TaxiSpawn)
    else
        DoScreenFadeIn(250)
        SetEntityCoords(plyrId, CodeStudio.SpawnPedLoc)
    end
end) 




function CreateTaxiPed(vehicle)
	local model = GetHashKey("a_m_y_stlat_01")
	if DoesEntityExist(vehicle) then
		if IsModelValid(model) then
			RequestModel(model)
			while not HasModelLoaded(model) do
				Wait(1)
			end
			taxiPed = CreatePedInsideVehicle(vehicle, 26, model, -1, true, false)
			SetAmbientVoiceName(ped, "A_M_M_EASTSA_02_LATINO_FULL_01")	
			SetBlockingOfNonTemporaryEvents(ped, true)
			SetEntityAsMissionEntity(ped, true, true)
			SetModelAsNoLongerNeeded(model)
		end
	end
end



function CreateTaxi(x, y, z)
	local taxiModel = CodeStudio.Taxi
	if IsModelValid(taxiModel) then
		if IsThisModelACar(taxiModel) then
			RequestModel(taxiModel)
			while not HasModelLoaded(taxiModel) do
				Wait(1)
			end
			if not DoesEntityExist(taxiVeh) then
                PlaySoundFrontend(-1, "Text_Arrive_Tone", "Phone_SoundSet_Default", 1)
                -- Wait(2000)
                taxiVeh = CreateVehicle(taxiModel, x, y, z, CodeStudio.TaxiSpawn.w, true, false)
                SetVehicleNumberPlateText(taxiVeh, CodeStudio.TaxiPlate)
                SetEntityAsMissionEntity(taxiVeh, true, true)
                SetVehicleEngineOn(taxiVeh, true, true, false)
                if CodeStudio.TaxiModded then
                    SetVehicleColours(taxiVeh, 0,88)
                    SetVehicleModKit(taxiVeh, 0)
                    SetVehicleMod(taxiVeh,10,1,0)
                end
                SetVehicleOnGroundProperly(taxiVeh)
                CreateTaxiPed(taxiVeh)
                local blip = AddBlipForEntity(taxiVeh)
                SetBlipSprite(blip, 198)
                SetBlipFlashes(blip, true)
                SetBlipFlashTimer(blip, 5000)
                SetModelAsNoLongerNeeded(taxiModel)
                SetHornEnabled(taxiVeh, true)
                StartVehicleHorn(taxiVeh, 1000, GetHashKey("NORMAL"), false)
                SetPedIntoVehicle(PlayerPedId(), taxiVeh, 2)
                if IsPedInVehicle(PlayerPedId(), taxiVeh, 1) then
                    DoScreenFadeIn(250)
                    Notify(CodeStudio.WelcomeMessage)
                    SetVehicleDoorsLocked(taxiVeh, 4)
                    TaskVehicleDriveToCoord(taxiPed, taxiVeh, CodeStudio.TaxiDestination.x, CodeStudio.TaxiDestination.y, CodeStudio.TaxiDestination.z, CodeStudio.TaxiDestination.w, 0, GetEntityModel(taxiVeh), 524604, 10.0)
                    SetPedKeepTask(taxiPed, true)
                    Active = true
                    print(Active)
                    Wait(10000)
                    isTaxi = true
                end
			end
		end
	end	
end



Citizen.CreateThread(function()
    local sleep = 200
    while true do
        if Active then
            local dist = #(GetEntityCoords(PlayerPedId()) - vector3(CodeStudio.TaxiDestination.x, CodeStudio.TaxiDestination.y, CodeStudio.TaxiDestination.z))
            if dist <= 10 then
                local player = PlayerPedId()
                local vehicle = GetVehiclePedIsIn(player,false)
                ClearPedTasks(player)
                SetVehicleForwardSpeed(vehicle,19.0)
                Wait(200)
                SetVehicleForwardSpeed(vehicle,15.0)
                Wait(200)
                SetVehicleForwardSpeed(vehicle,11.0)
                Wait(200)
                SetVehicleForwardSpeed(vehicle,6.0)
                Wait(200)
                SetVehicleForwardSpeed(vehicle,0.0)
                Notify(CodeStudio.ReachedMessage)
                SetVehicleDoorsLocked(vehicle, 1)
                SetPedKeepTask(taxiPed, false)
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
                    local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
                    isTaxi = false
                    sleep = 200
                    DoScreenFadeOut(2500)
                    Wait(3000)
                    SetEntityCoords(vehicle, vector3(CodeStudio.SkipToNearestLoc.x, CodeStudio.SkipToNearestLoc.y, CodeStudio.SkipToNearestLoc.z))
                    SetEntityHeading(vehicle, CodeStudio.SkipToNearestLoc.w)
                    DoScreenFadeIn(250)
                end
            end
        end
        Wait(sleep)
    end
end)

function DeleteTaxi(vehicle, driver)
	if DoesEntityExist(vehicle) then
		if IsPedInVehicle(PlayerPedId(), vehicle, false) then
			TaskLeaveVehicle(PlayerPedId(), vehicle, 0)
			Wait(2000)			
		end
		local blip = GetBlipFromEntity(vehicle)
		if DoesBlipExist(blip) then
			RemoveBlip(blip)
		end
		DeleteEntity(driver)
		DeleteEntity(vehicle)
	end
	if not DoesEntityExist(vehicle) and DoesEntityExist(driver) then
		DeleteEntity(driver)
	end
end


function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end