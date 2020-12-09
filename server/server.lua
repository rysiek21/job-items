ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("job_items:giveWeapon")
AddEventHandler("job_items:giveWeapon", function(weapon, ammo)
    local haveThisWeapon = false
    local PlayerSrc = source
    local xPlayer = ESX.GetPlayerFromId(source)
    for k,v in ipairs(xPlayer.getLoadout()) do
        if v.name == weapon then
            haveThisWeapon = true
        end
    end
    if haveThisWeapon == false then
        xPlayer.addWeapon(weapon, ammo)
    end
end)
RegisterServerEvent("job_items:giveItem")
AddEventHandler("job_items:giveItem", function(item, count)
    local haveThisItem = false
    local PlayerSrc = source
    local xPlayer = ESX.GetPlayerFromId(source)
    for k,v in ipairs(xPlayer.getInventory()) do
        if v.name == item and v.count > 0 then
            haveThisItem = true
        end
    end
    if haveThisItem == false then
        xPlayer.addInventoryItem(item, count)
    end
end)