CodeStudio = {}

CodeStudio.ServerType = 'QB'

CodeStudio.Taxi = `dynasty`                                     --Taxi Model
CodeStudio.TaxiPlate = 'CS5M'                              --Taxi Number Plate
CodeStudio.TaxiModded = true
CodeStudio.TaxiSpawn = vector4(-1058.48, -2713.28, 20.17, 240.05)       --Taxi First Spawn Location   
CodeStudio.TaxiDestination = vector4(-1087.01, -271.25, 37.32, 26.0)         --Taxi Destination Lcoation 
CodeStudio.SkipToNearestLoc = vector4(-1198.92, -304.74, 37.47, 284.08)       --Taxi Skip Nearest Location to destination



CodeStudio.WelcomeMessage = 'Welocome To My Server'
CodeStudio.ReachedMessage = "We've reached our destination"


if CodeStudio.ServerType == "QB" then 
    QBCore = exports['qb-core']:GetCoreObject()
elseif CodeStudio.ServerType == "ESX" then 
    ESX = exports['es_extended']:getSharedObject()
end


function Notify(msg, state)
    if CodeStudio.ServerType == "QB" then 
        QBCore.Functions.Notify(msg, state)
    elseif CodeStudio.ServerType == "ESX" then 
        ESX.ShowNotification(msg, false, true, nil)
    end
end



function GetGender()
    if CodeStudio.ServerType == "ESX" then 
        local PlayerData = ESX.GetPlayerData()
        local Gender = PlayerData.sex
        if Gender == 'm' then 
            return 0
        else
            return 1
        end
    elseif CodeStudio.ServerType == "QB" then
        local PlayerData = QBCore.Functions.GetPlayerData()
        local Gender = PlayerData.charinfo.gender
        return Gender
    else
        --YOU CAN ADD YOUR CUSTOM EVENTS HERE
    end
end



