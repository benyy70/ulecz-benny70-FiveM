--script-by-benny70--

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bread', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bread', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, ('Zjadłeś kromkę chleba!'))
end)

ESX.RegisterUsableItem('water', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('water', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, ('Wypiłeś butelkę wody!'))
end)

TriggerEvent('es:addGroupCommand', 'ulecz', 'admin', function(source, args, user)
	-- heal another player - don't heal source
	if args[1] then
		local target = tonumber(args[1])
		
		-- is the argument a number?
		if target ~= nil then
			
			-- is the number a valid player?
			if GetPlayerName(target) then
				print('^7[^1ORDYNATOR^7]: ' .. GetPlayerName(source) .. ' Został uleczony!')
				TriggerClientEvent('esx_basicneeds:healPlayer', target)
				TriggerClientEvent('chatMessage', target, "^7[^1ORDYNATOR^7]", {223, 66, 244}, "Zostałeś uleczony!")
			else
				TriggerClientEvent('chatMessage', source, "^7[^1ORDYNATOR^7]", {255, 0, 0}, "Nie znaleziono obywatela!")
			end
		else
			TriggerClientEvent('chatMessage', source, "^7[^1ORDYNATOR^7]", {255, 0, 0}, "Musisz podać numer buta obywatela!")
		end
	else
		-- heal source
		print('^7[^1ORDYNATOR^7]: ' .. GetPlayerName(source) .. ' Został uleczony!')
		TriggerClientEvent('esx_basicneeds:healPlayer', source)
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "^7[^1ORDYNATOR^7]", {255, 0, 0}, "Nie posiadasz permisji")
end, {help = "Heal a player, or yourself - restores thirst, hunger and health."})