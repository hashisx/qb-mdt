------------------------CREDITS------------------------
--------        Script made by Deltarix        --------
--   Copyright 2021 Deltarix. All rights reserved    --
-------------------------------------------------------

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function Open()
    QBCore.Functions.TriggerCallback('drx_mdt:profiles', function(drxProfiles)
        QBCore.Functions.TriggerCallback('drx_mdt:characterProfiles', function(charProfiles)
            QBCore.Functions.TriggerCallback('drx_mdt:characterInfo', function(playerInfo)
                QBCore.Functions.TriggerCallback('drx_mdt:fetchDispatch', function(drxDispatches)
                    QBCore.Functions.TriggerCallback('drx_mdt:fetchWarrants', function(drxWarrants)
                        SetNuiFocus(true, true)
                        SendNUIMessage({
                            -- users
                            identifier = 'test',
                            vrpcharname = playerInfo[1].firstname.. ' ' ..playerInfo[1].lastname,
                            phonenumber = playerInfo[1].phone,
                            dateofbirth = playerInfo[1].birthdate,
                            -- drx_mdt_dispatch
                            drxDispatches = drxDispatches,
                            -- drx_mdt_warrants
                            drxWarrants = drxWarrants,
                            -- mdt_profiles
                            drxProfiles = drxProfiles,
                            -- char profiles
                            identifier = 'test',
                            charname = 'josh',
                            policegroup = 'boss',
                            rank = '4',
                            badgenumber = 'test',
                            duty = 'on',
                            image = '',
                            open = true,
                        })
                    end)
                end)
            end)
        end)
    end)
end

function Close()
    SetNuiFocus(false, false)
    SendNUIMessage({
        close = true
    })
end