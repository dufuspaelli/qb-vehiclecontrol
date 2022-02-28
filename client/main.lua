RegisterNUICallback("cb", function(data, cb)
    print(data.value)
    cb('{"ok":true}')
    local car = GetVehiclePedIsIn(PlayerPedId(), false)
    if data.type == "door" then 
        local open = GetVehicleDoorAngleRatio(car, data.value)
        if open == 0.0 then 
            print("open door")
            SetVehicleDoorOpen(car, data.value, false, true)
        else 
            print("close door")
            SetVehicleDoorShut(car, data.value,true)
        end
    end

    if data.type == "seat" then 
        SetSeat(car, data.value)
    end

    if data.type == "engine" then 

        local driver = GetPedInVehicleSeat(car, -1)

        if driver == PlayerPedId() then 
            print(data.value)
            SetVehicleEngineOn(car, data.value, false, true)
        end

    end
    --return
   -- hackStatus(data.success)
end)

RegisterNUICallback("close", function(data, cb)
    SetNuiFocus(false)

    --return
   -- hackStatus(data.success)
end)

RegisterCommand('carcontrol', function()
    
    local inCar = IsPedInAnyVehicle(PlayerPedId(),false)
    local car = GetVehiclePedIsIn(PlayerPedId(), false)
    local engineStatus = GetIsVehicleEngineRunning(car)
    --print(engineStatus)
   -- print(inCar)
    if not inCar then return else 
        SendNUIMessage({action = 'toggle', engine = engineStatus or false})
        SetNuiFocus(true,true)
    end

end)

RegisterCommand('seat', function(source, args, rawCommand)

    local car = GetVehiclePedIsIn(PlayerPedId(), false)
    
    local seat = tonumber(args[1])
    print(car)
    SetSeat(car,seat)

end)

function SetSeat(car,value) 
    local free = IsVehicleSeatFree(car, value)
    print(value)
    if free then 
        print(car)
        SetPedIntoVehicle(PlayerPedId(), car, value)
    end
end

RegisterKeyMapping("carcontrol", "Change seats, close/open doors and toggle engine.", "keyboard", "G" )