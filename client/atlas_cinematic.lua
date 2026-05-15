local cinematicSuppressed = false

local function pushCinematicState()
    sendUIMessage({
        cinematic = cinematicSuppressed,
    })
end

RegisterNetEvent('atlas_hud:client:suppressVehicleGauges', function(state)
    cinematicSuppressed = state == true
    pushCinematicState()
end)

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    pushCinematicState()
end)
