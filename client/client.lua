ESX = nil
local useDistance = 1
local e_key = 38
local Job = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

CreateThread(function()
	while true do
		Citizen.Wait(0)
        local pedCoords = GetEntityCoords(PlayerPedId())
        for i=1, #Config.Locations, 1 do
            if ESX.PlayerData.job.name == Config.Locations[i].job then
                DrawMarker(25, Config.Locations[i].x, Config.Locations[i].y, Config.Locations[i].z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 128, 0, 50, false, true, 2, nil, nil, false)
                if Vdist2(GetEntityCoords(PlayerPedId(), false), vector3(Config.Locations[i].x, Config.Locations[i].y, Config.Locations[i].z)) < useDistance then
                    alert("~r~Naciśnij ~INPUT_PICKUP~ aby użyć szafki")
                    if IsControlJustReleased(1, e_key) then
                        OpenMenu(Config.Locations[i].id)
                    end
                end
            end
        end
	end
end)

function alert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end

function OpenMenu(type)
    local elements = {}

    for i=1, #Config.Items, 1 do
        if Config.Items[i].id == type then
            for x=1, #Config.Items[i].items, 1 do
                table.insert(elements, Config.Items[i].items[x])
            end
        end
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'JobItemsMenu',
	{
	    title    = 'Przedmioty',
		align    = 'bottom-right',
		elements = elements
    }, function(data, menu)
        if data.current.data.type == "weapon" then
            TriggerServerEvent("job_items:giveWeapon", data.current.value, data.current.data.count)
        elseif data.current.data.type == "item" then
            TriggerServerEvent("job_items:giveItem", data.current.value, data.current.data.count)
        end
	end, function(data, menu)
		menu.close()
	end)
end

