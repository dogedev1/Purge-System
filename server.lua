RegisterCommand("blackout", function(source, args, rawCommand)
    local toggle = args[1] == "true"
    TriggerClientEvent("vMenu:SetBlackout", -1, toggle)
end, true)

RegisterCommand("weather", function(source, args, rawCommand)
    local weatherType = args[1]
    TriggerClientEvent("vMenu:SetWeather", -1, weatherType)
end, true)

RegisterCommand("time", function(source, args, rawCommand)
    local hour = tonumber(args[1])
    local minute = tonumber(args[2]) or 0
    TriggerClientEvent("vMenu:SetTime", -1, hour, minute)
end, true)

RegisterCommand("purge", function(source, args, rawCommand)
    if args[1] == "on" then
        ExecuteCommand("blackout true")
        ExecuteCommand("weather halloween")
        ExecuteCommand("time 0 0")
        TriggerClientEvent('ox_lib:notify', -1, {
            title = 'System',
            description = "The purge has begun! Seek shelter, trust no-one.",
            type = 'success',
            position = 'center-right'
        })
        TriggerClientEvent('InteractSound_CL:PlayOnAll', -1, 'purge', 0.8)
    elseif args[1] == "off" then
        ExecuteCommand("blackout false")
        ExecuteCommand("weather clear")
        ExecuteCommand("time 12 0")
        TriggerClientEvent('ox_lib:notify', -1, {
            title = 'System',
            description = "The purge even has ended! Congrats to those still alive.",
            type = 'success',
            position = 'center-right'
        })
    else
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'System',
            description = "Invalid command! Use /purge on or /purge off.",
            type = 'error',
            position = 'center-right'
        })
    end
end, true)