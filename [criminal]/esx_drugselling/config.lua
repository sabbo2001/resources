GuTu = {}

GuTu.FR = {
	['press'] = 'Press ~r~E ~w~pour vendre de la drogue.',
    ['process'] = 'Deal en cours.',
	['meth'] = ' pochons de meth',
	['coke'] = ' pochons de coke',
	['weed'] = ' pochons de weed',
	['opium'] = ' pochons de opium',
	['done'] = 'Vous avez vendu x',
	['for'] = ' pour $',
	['no'] = 'La personne n\'est pas interessé!',
	['cops1'] = 'Vous ne pouvez pas vendre de drogues. ~r~',
	['cops2'] = ' ~s~policiers en ville.',
	['dist'] = 'Vous etes trop loin!'
}
GuTu.EN = {
    ['press'] = 'Press ~r~E ~w~to sell drugs.',
    ['process'] = 'Deal in progress.',
	['meth'] = ' meth pouches',
	['coke'] = ' coke pouches',
	['weed'] = ' weed pouches',
	['opium'] = ' opium pouches',
	['done'] = 'You sold x',
	['for'] = ' for $',
	['no'] = 'The person is not interested!',
	['cops1'] = 'You cannot sell drugs. ~r~',
	['cops2'] = ' ~s~police online.',
	['dist'] = 'You are too far!'
}

GuTu.RU = {
	['press'] = 'Нажмите ~r~E ~w~чтобы предложить наркотики.',
	['process'] = 'Сделка в процессе.',
	['meth'] = ' пакет мета',
	['coke'] = ' пакет кокаина',
	['weed'] = ' пакет конопли',
	['opium'] = ' пакет опиума',
	['done'] = 'Ты продал x',
	['for'] = ' на сумму $',
	['no'] = 'Не интересует',
	['cops1'] = 'Вы не можете продавать наркотики. ~r~',
	['cops2'] = ' когда менее ~s~ полицейских онлайн.',
	['dist'] = 'Ты слишком далеко!'
}

GuTu.Text = GuTu.RU

GuTu.CokePrice = math.random (400,500)
GuTu.WeedPrice = math.random (200,300)
GuTu.MethPrice = math.random (300,400)
GuTu.OpiumPrice = math.random (100,200)

GuTu.CopsNeeds = 0
