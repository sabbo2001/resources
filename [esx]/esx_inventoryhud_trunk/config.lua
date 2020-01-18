Config = {}

Config.CheckOwnership = false -- If true, Only owner of vehicle can store items in trunk.
Config.AllowPolice = true -- If true, police will be able to search players' trunks.

Config.Locale = 'ru'

Config.OpenKey = 170

-- Предел, единица может быть любым, что вы хотите. Первоначально граммы (в среднем люди могут держать 25 кг)
Config.weight = 25000
Config.DefaultWeight = 1
-- Default weight for an item:
-- weight == 1 : The item do not affect character inventory weight
-- weight > 1 : The item cost place on inventory
-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.localWeight = {
    coke_pooch = 1000,
	code_pooch = 1000,
    opium_pooch = 1000,
    meth_pooch = 1000,
    weed_pooch = 1000,
	amfa_pooch = 1000,
	morf_pooch = 500,
    bulletproof = 10000,
    clip = 10000,
    bandage = 10000,
    medikit = 20000,
    nitro = 20000,
    lockpick = 10000,
    repairkit = 20000,
    fixkit = 20000,
    WEAPON_MICROSMG =25000,
    WEAPON_HEAVYSHOTGUN = 25000,
    WEAPON_ASSAULTRIFLE = 25000,
    WEAPON_SPECIALCARBINE = 25000,
    WEAPON_COMBATPDW = 25000,
    WEAPON_COMPACTRIFLE = 25000,
    WEAPON_MARKSMANRIFLE_MK2 = 25000,
    WEAPON_PISTOL = 25000,
    WEAPON_COMBATPISTOL = 25000,
    WEAPON_APPISTOL = 25000,
    WEAPON_SNSPISTOL = 25000,
    WEAPON_HEAVYPISTOL = 25000,
    WEAPON_VINTAGEPISTOL = 25000,
    WEAPON_MARKSMANPISTOL = 25000,
    WEAPON_MACHINEPISTOL = 25000
}

Config.VehicleLimit = {
    [0] = 100000, --Compact
    [1] = 100000, --Sedan
    [2] = 500000, --SUV
    [3] = 40000, --Coupes
    [4] = 30000, --Muscle
    [5] = 100000, --Sports Classics
    [6] = 60000, --Sports
    [7] = 50000, --Super
    [8] = 2000, --Motorcycles
    [9] = 100000, --Off-road
    [10] = 5000000, --Industrial
    [11] = 5000000, --Utility
    [12] = 1000000, --Vans
    [13] = 0, --Cycles
    [14] = 100000, --Boats
    [15] = 100000, --Helicopters
    [16] = 0, --Planes
    [17] = 100000, --Service
    [18] = 100000, --Emergency
    [19] = 0, --Military
    [20] = 100000, --Commercial
    [21] = 0 --Trains
}

Config.VehiclePlate = {
    taxi = "TAXI",
    cop = "LSPD",
    ambulance = "EMS0",
    mechanic = "FITT"
}
