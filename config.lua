Config = {}

Config.Locations = {
    {id = "lspd", job = "police", x = 451.85, y = -982.9, z = 30.0},
    {id = "ems", job = "ambulance", x = 336.84, y = -575.52, z = 42.8}
}

Config.Items = {
    {
        id = "lspd",
        items = {
            {label = "GPS", value = "gps", data = {type = "item", count = 1}},
            {label = "Kajdanki", value = "handcuffs", data = {type = "item", count = 1}},
            {label = "Pistol", value = "WEAPON_PISTOL", data = {type = "weapon", count = 60}},
            {label = "Paralizator", value = "WEAPON_STUNGUN", data = {type = "weapon", count = 60}},
            {label = "Pałka", value = "WEAPON_NIGHTSTICK", data = {type = "weapon", count = 60}},
            {label = "Latarka", value = "WEAPON_FLASHLIGHT", data = {type = "weapon", count = 60}}
        }
    },
    {
        id = "ems",
        items = {
            {label = "Apteczka", value = "firstaidkit", data = {type = "item", count = 1}},
            {label = "bandage", value = "bandage", data = {type = "item", count = 4}},
            {label = "Paralizator", value = "WEAPON_STUNGUN", data = {type = "weapon", count = 1}}
        }
    }
}
