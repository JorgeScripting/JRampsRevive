local markerPos = vector3(-941.28, -791.71, 15.95)
local HasAlreadyGotMessage = false

Citizen.CreateThread(function()
    local ped = PlayerPedId()
    while true do
        local ped = PlayerPedId()
        Wait(0)
        local playerCoords = GetEntityCoords(ped)
        local distance = #(playerCoords - markerPos)
        local isInMarker = false
        if distance < 100.0 then
            DrawMarker(27, markerPos.x, markerPos.y, markerPos.z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0, 155, 0, 255, 100, false, true, 2, nil, nil, false)
            if distance < 2.0 and IsControlJustReleased (0, 38) then
                isInMarker = true
            else 
                HasAlreadyGotMessage = false
            end
        else
            Citizen.Wait(2000)
        end

        if isInMarker and not HasAlreadyGotMessage then
            HasAlreadyGotMessage = true
            local playerPos = GetEntityCoords(ped, true)
            --exports["taskbar"]:taskBar(2500,"Reviving...")
            TriggerEvent('esx_ambulancejob:revive', GetPlayerServerId(closestPlayer))
            -- if reviving switch out the line above with this line TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(closestPlayer))
            --exports['mythic_notify']:SendAlert('inform', 'Revived')
            print("SCDevelopment Discord.gg/mfF4GAjHEW")
            Wait(1000)
            AddArmourToPed(ped, 100)
            RequestNamedPtfxAsset('scr_indep_fireworks')
            for i = 1, 7 do
            UseParticleFxAsset('scr_indep_fireworks')
            StartNetworkedParticleFxNonLoopedAtCoord('scr_indep_firework_starburst', -941.44, -791.55, 14.90, 0.0, 0.0, 0.0, 1.0, false, false, false)
            end
        end
    end
end)
