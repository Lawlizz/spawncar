RegisterCommand("car", function(source, args, rawcommand)
    if args[1] == nil then
        print("Merci de précier quel modèle de véhicule")
        return
    end

    if not IsModelValid(args[1]) then
        print("Le modèle est invalid")
        return
    end

    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local heading = GetEntityCoords(ped)

    local vehicleName = args[1]
    local vehicleHash = GetHashKey(vehicleName)

    RequestModel(vehicleHash)
    while not HasModelLoaded(vehicleHash) do
        Citizen.Wait(10)
    end


    local veh = CreateVehicle(vehicleHash, pos.x, pos.y, pos.z, heading, false, false)

    SetVehicleEngineOn(veh, true, true, false)
    TaskWarpPedIntoVehicle(ped, veh, -1)



end, false)