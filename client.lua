RegisterNetEvent("vMenu:SetBlackout")
AddEventHandler("vMenu:SetBlackout", function(toggle)
    SetBlackout(toggle)
end)

RegisterNetEvent("vMenu:SetWeather")
AddEventHandler("vMenu:SetWeather", function(weatherType)
    SetWeatherTypeNowPersist(weatherType)
    SetWeatherTypeOverTime(weatherType, 15.0)
    SetOverrideWeather(weatherType)
end)

RegisterNetEvent("vMenu:SetTime")
AddEventHandler("vMenu:SetTime", function(hour, minute)
    NetworkOverrideClockTime(hour, minute, 0)
end)

