--Truck
Config	=	{}

 -- Предел, единица может быть любым, что вы хотите. Первоначально граммы (в среднем люди могут держать 25 кг)
Config.weight = 25000

-- Default weight for an item:
	-- weight == 0 : The item do not affect character inventory weight
	-- weight > 0 : The item cost place on inventory
	-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 0



-- If true, ignore rest of file
Config.WeightSqlBased = true

-- I Prefer to edit weight on the config.lua and I have switched Config.WeightSqlBased to false:

Config.localWeight = {
	bread = 125,
	water = 330,
}

Config.VehicleLimit ={
    [0]=50000,
    [1]=80000,
    [2]=90000,
    [3]=50000,
    [4]=50000,
    [5]=30000,
    [6]=30000,
    [7]=30000,
    [8]=10000,
    [9]=30000,
    [10]=150000,
    [11]=80000,
    [12]=80000,
    [13]=0,
    [14]=90000,
    [15]=100000,
    [16]=100000,
    [17]=50000,
    [18]=50000,
    [19]=50000,
    [20]=150000,

}
