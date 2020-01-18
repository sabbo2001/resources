function getIdentity(source, callback)
  local identifier = GetPlayerIdentifiers(source)[1]
    MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = @identifier",
  {
    ['@identifier'] = identifier
  },
  function(result)
    if result[1]['firstname'] ~= nil then
      local data = {
        identifier  = result[1]['identifier'],
        firstname  = result[1]['firstname'],
        lastname  = result[1]['lastname'],
        dateofbirth  = result[1]['dateofbirth'],
        sex      = result[1]['sex'],
        height    = result[1]['height'],
		    email    = result[1]['email']
      }

      callback(data)
    else
      local data = {
        identifier   = '',
        firstname   = '',
        lastname   = '',
        dateofbirth = '',
        sex     = '',
        height     = '',
        email     = ''
      }
      callback(data)
    end
  end)
end

--===============================================
--==     Get The Player's Identification       ==
--===============================================
function getCharacters(source, callback)
  local identifier = GetPlayerIdentifiers(source)[1]
    MySQL.Async.fetchAll("SELECT * FROM `characters` WHERE `identifier` = @identifier",
  {
    ['@identifier'] = identifier
  },
  function(result)
    if result[1] and result[2] and result[3] then
      local data = {
        identifier    = result[1]['identifier'],
        firstname1    = result[1]['firstname'],
        lastname1    = result[1]['lastname'],
        dateofbirth1  = result[1]['dateofbirth'],
        sex1      = result[1]['sex'],
        height1      = result[1]['height'],
        email1      = result[1]['email'],
        firstname2    = result[2]['firstname'],
        lastname2    = result[2]['lastname'],
        dateofbirth2  = result[2]['dateofbirth'],
        sex2      = result[2]['sex'],
        height2      = result[2]['height'],
		    email2      = result[2]['email'],
        firstname3    = result[3]['firstname'],
        lastname3    = result[3]['lastname'],
        dateofbirth3  = result[3]['dateofbirth'],
        sex3      = result[3]['sex'],
        height3      = result[3]['height'],
        email3      = result[3]['email']
      }

      callback(data)
    elseif result[1] and result[2] and not result[3] then
      local data = {
        identifier    = result[1]['identifier'],
        firstname1    = result[1]['firstname'],
        lastname1    = result[1]['lastname'],
        dateofbirth1  = result[1]['dateofbirth'],
        sex1      = result[1]['sex'],
        height1      = result[1]['height'],
		email1      = result[1]['email'],
        firstname2    = result[2]['firstname'],
        lastname2    = result[2]['lastname'],
        dateofbirth2  = result[2]['dateofbirth'],
        sex2      = result[2]['sex'],
        height2      = result[2]['height'],
		email2      = result[2]['email'],
        firstname3    = '',
        lastname3    = '',
        dateofbirth3  = '',
        sex3      = '',
        height3      = '',
		email3      = '',
      }

      callback(data)
    elseif result[1] and not result[2] and not result[3] then
      local data = {
        identifier    = result[1]['identifier'],
        firstname1    = result[1]['firstname'],
        lastname1    = result[1]['lastname'],
        dateofbirth1  = result[1]['dateofbirth'],
        sex1      = result[1]['sex'],
        height1      = result[1]['height'],
		    email1      = result[1]['email'],
        firstname2    = '',
        lastname2    = '',
        dateofbirth2  = '',
        sex2      = '',
        height2      = '',
		    email2      = '',
        firstname3    = '',
        lastname3    = '',
        dateofbirth3  = '',
        sex3      = '',
        height3      = '',
		    email3      = ''
      }

      callback(data)
    else
      local data = {
        identifier    = '',
        firstname1    = '',
        lastname1    = '',
        dateofbirth1  = '',
        sex1      = '',
        height1      = '',
		email1      = '',
        firstname2    = '',
        lastname2    = '',
        dateofbirth2  = '',
        sex2      = '',
        height2      = '',
		email2      = '',
        firstname3    = '',
        lastname3    = '',
        dateofbirth3  = '',
        sex3      = '',
        height3    = '',
		    email3      = ''
      }

      callback(data)
    end
  end)
end

--===============================================
--==    Установить идентификацию игрока        ==
--===============================================
function setIdentity(identifier, data, callback)
  MySQL.Async.execute("UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height, `email` = @email WHERE identifier = @identifier",
    {
      ['@identifier']   = identifier,
      ['@firstname']    = data.firstname,
      ['@lastname']     = data.lastname,
      ['@dateofbirth']  = data.dateofbirth,
      ['@sex']        	= data.sex,
      ['@height']       = data.height,
	  ['@email']       	= data.email
    },
  function(done)
    if callback then
      callback(true)
    end
  end)

  MySQL.Async.execute(
    'INSERT INTO characters (identifier, firstname, lastname, dateofbirth, sex, height, email) VALUES (@identifier, @firstname, @lastname, @dateofbirth, @sex, @height, @email)',
    {
      ['@identifier'] 	= identifier,
      ['@firstname']  	= data.firstname,
      ['@lastname']   	= data.lastname,
      ['@dateofbirth'] 	= data.dateofbirth,
      ['@sex']    		= data.sex,
      ['@height']   	= data.height,
	  ['@email']       	= data.email
    })
end

--===============================================
--==  Update The Player's Identification       ==
--===============================================
function updateIdentity(identifier, data, callback)
  MySQL.Async.execute("UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height, `email` = @email WHERE identifier = @identifier",
    {
      ['@identifier']   = identifier,
      ['@firstname']    = data.firstname,
      ['@lastname']     = data.lastname,
      ['@dateofbirth']  = data.dateofbirth,
      ['@sex']        	= data.sex,
      ['@height']       = data.height,
	  ['@email']       	= data.email
    },
  function(done)
    if callback then
      callback(true)
    end
  end)
end

--===============================================
--==  Delete The Player's Identification       ==
--===============================================
function deleteIdentity(identifier, data, callback)
  MySQL.Async.execute("DELETE FROM `characters` WHERE identifier = @identifier AND firstname = @firstname AND lastname = @lastname AND dateofbirth = @dateofbirth AND sex = @sex AND height = @height AND email = @email",
    {
      ['@identifier']   = identifier,
      ['@firstname']    = data.firstname,
      ['@lastname']     = data.lastname,
      ['@dateofbirth']  = data.dateofbirth,
      ['@sex']        	= data.sex,
      ['@height']       = data.height,
	  ['@email']       	= data.email
    },
  function(done)
    if callback then
      callback(true)
    end
  end)
end

--===============================================
--==       Server Event Set Identity           ==
--===============================================
RegisterServerEvent('esx_identity:setIdentity')
AddEventHandler('esx_identity:setIdentity', function(data)
  local identifier = GetPlayerIdentifiers(source)[1]
    setIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)
    if callback == true then
      print('Профиль успешно создан для игрока ' .. identifier)
    else
      print('Не удалось установить личность.')
    end
  end)
end)

--===============================================
--==       Player Loaded Event Handler         ==
--===============================================
AddEventHandler('es:playerLoaded', function(source)
  getIdentity(source, function(data)
    if data.firstname == '' then
      TriggerClientEvent('esx_identity:showRegisterIdentity', source)
    else
      print('Персонаж успешно загружен для ' .. data.firstname .. ' ' .. data.lastname)
    end
  end)
end)

--===================================================================
--==                         MAIN COMMANDS                         ==
--===================================================================

--===============================================
--==      /charlist - Show Your Characters     ==
--===============================================
TriggerEvent('es:addGroupCommand', 'idhelp', "user", function(source, args, user)
  TriggerClientEvent('chatMessage', source, 'IDHelp', {255, 0, 0}, "Команды")
  TriggerClientEvent('chatMessage', source, 'IDHelp', {255, 0, 0}, "/register - Зарегистрировать нового персонажа")
  TriggerClientEvent('chatMessage', source, 'IDHelp', {255, 0, 0}, "/charlist - Список ваших персонажей")
  TriggerClientEvent('chatMessage', source, 'IDHelp', {255, 0, 0}, "/charselect 1,2,3 - Сменить текущего персонажа")
  TriggerClientEvent('chatMessage', source, 'IDHelp', {255, 0, 0}, "/delchar 1,2,3 - Удалить персонажа")
end, function(source, args, user)
  TriggerClientEvent('chatMessage', source, "IDHelp", {255, 0, 0}, "Недостаточно прав!")
end, {help = "Список ваших персонажей"})


--===============================================
--==      /register - Open Registration        ==
--===============================================
TriggerEvent('es:addCommand', 'register', function(source, args, user)
  getCharacters(source, function(data)
    if data.firstname3 ~= '' then
      TriggerClientEvent('chatMessage', source, 'REGISTER', {255, 0, 0}, "Вы можете иметь не более 3 персонажей.")
    else
      TriggerClientEvent('esx_identity:showRegisterIdentity', source, {})
    end
  end)
end)

--===============================================
--==      /char - Show Active Character        ==
--===============================================
TriggerEvent('es:addGroupCommand', 'char', "user", function(source, args, user)
  getIdentity(source, function(data)
    if data.firstname == '' then
      TriggerClientEvent('chatMessage', source, 'CHAR', {255, 0, 0}, "У вас нет активного персонажа.")
    else
      TriggerClientEvent('chatMessage', source, 'CHAR', {255, 0, 0}, "Активный персонаж: " .. data.firstname .. " " .. data.lastname)
    end
  end)
end, function(source, args, user)
  TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Недостаточно прав!")
end, {help = "Список ваших активного персонажа"})

--===============================================
--==      /charlist - Show Your Characters     ==
--===============================================
TriggerEvent('es:addGroupCommand', 'charlist', "user", function(source, args, user)
  getCharacters(source, function(data)
    if data.firstname1 ~= '' then
      TriggerClientEvent('chatMessage', source, 'CHARLIST', {255, 0, 0}, "Character 1: " .. data.firstname1 .. " " .. data.lastname1)
      if data.firstname2 ~= '' then
        TriggerClientEvent('chatMessage', source, 'CHARLIST', {255, 0, 0}, "Character 2: " .. data.firstname2 .. " " .. data.lastname2)
        if data.firstname3 ~= '' then
          TriggerClientEvent('chatMessage', source, 'CHARLIST', {255, 0, 0}, "Character 3: " .. data.firstname3 .. " " .. data.lastname3)
        end
      end
    else
      TriggerClientEvent('chatMessage', source, 'CHARLIST', {255, 0, 0}, "У вас нет персонажей. Пожалуйста, используйте команду /register.")
    end
  end)
end, function(source, args, user)
  TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Недостаточно прав!")
end, {help = "Список ваших персонажей"})

--===============================================
--== /charselect 1,2,3 Select Your Active Char ==
--===============================================
TriggerEvent('es:addCommand', 'charselect', function(source, args, user)
  table.remove(args, 1)
  local charNumber = tonumber(table.concat(args, " "))
  getCharacters(source, function(data)
    if charNumber == 1 then
      local data = {
        identifier   = data.identifier,
        firstname  = data.firstname1,
        lastname  = data.lastname1,
        dateofbirth  = data.dateofbirth1,
        sex      = data.sex1,
        height    = data.height1,
		email    = data.email1
      }

      if data.firstname ~= '' then
        updateIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)
          if callback == true then
            TriggerClientEvent('chatMessage', source, "CHARSELECT", {255, 0, 0}, "Updated your active character to " .. data.firstname .. " " .. data.lastname .. "!")
          else
            TriggerClientEvent('chatMessage', source, "CHARSELECT", {255, 0, 0}, "Failed To Update Identity!")
          end
        end)
      else
        TriggerClientEvent('chatMessage', source, "CHARSELECT", {255, 0, 0}, "You don\'t have a character in slot 1!")
      end
    elseif charNumber == 2 then
      local data = {
        identifier   = data.identifier,
        firstname  = data.firstname2,
        lastname  = data.lastname2,
        dateofbirth  = data.dateofbirth2,
        sex      = data.sex2,
        height    = data.height2,
		email    = data.emai2
      }

      if data.firstname ~= '' then
        updateIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)

          if callback == true then
            TriggerClientEvent('chatMessage', source, "CHARSELECT", {255, 0, 0}, "Updated your active character to " .. data.firstname .. " " .. data.lastname .. "!")
          else
            TriggerClientEvent('chatMessage', source, "CHARSELECT", {255, 0, 0}, "Failed To Update Identity!")
          end
        end)
      else
        TriggerClientEvent('chatMessage', source, "CHARSELECT", {255, 0, 0}, "You don\'t have a character in slot 2!")
      end
    elseif charNumber == 3 then
      local data = {
        identifier   = data.identifier,
        firstname  = data.firstname3,
        lastname  = data.lastname3,
        dateofbirth  = data.dateofbirth3,
        sex      = data.sex3,
        height    = data.height3,
		email    = data.emai3
      }

      if data.firstname ~= '' then
        updateIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)
          if callback == true then
            TriggerClientEvent('chatMessage', source, "CHARSELECT", {255, 0, 0}, "Updated your active character to " .. data.firstname .. " " .. data.lastname .. "!")
          else
            TriggerClientEvent('chatMessage', source, "CHARSELECT", {255, 0, 0}, "Failed To Update Identity!")
          end
        end)
      else
        TriggerClientEvent('chatMessage', source, "CHARSELECT", {255, 0, 0}, "You don\'t have a character in slot 3!")
      end
    else
      TriggerClientEvent('chatMessage', source, "CHARSELECT", {255, 0, 0}, "Failed To Update Identity!")
    end
  end)
end)

--===============================================
--== /charselect 1,2,3 Select Your Active Char ==
--===============================================
TriggerEvent('es:addCommand', 'delchar', function(source, args, user)
  table.remove(args, 1)
  local charNumber = tonumber(table.concat(args, " "))
  getCharacters(source, function(data)
    if charNumber == 1 then
      local data = {
        identifier   = data.identifier,
        firstname  = data.firstname1,
        lastname  = data.lastname1,
        dateofbirth  = data.dateofbirth1,
        sex      = data.sex1,
        height    = data.height1,
        email    = data.email1
      }
      if data.firstname ~= '' then
        deleteIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)
          if callback == true then
          TriggerClientEvent('chatMessage', source, "DELCHAR", {255, 0, 0}, "You Have Deleted " .. data.firstname .. " " .. data.lastname .. "!")
          else
            TriggerClientEvent('chatMessage', source, "DELCHAR", {255, 0, 0}, "Failed To Delete Identity!")
          end
        end)
      else
        TriggerClientEvent('chatMessage', source, "DELCHAR", {255, 0, 0}, "You don\'t have a character in slot 1!")
      end
    elseif charNumber == 2 then
      local data = {
        identifier   = data.identifier,
        firstname  = data.firstname2,
        lastname  = data.lastname2,
        dateofbirth  = data.dateofbirth2,
        sex      = data.sex2,
        height    = data.height2,
		email    = data.email2
      }
      if data.firstname ~= '' then
        deleteIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)
          if callback == true then
            TriggerClientEvent('chatMessage', source, "DELCHAR", {255, 0, 0}, "You Have Deleted " .. data.firstname .. " " .. data.lastname .. "!")
          else
            TriggerClientEvent('chatMessage', source, "DELCHAR", {255, 0, 0}, "Failed To Delete Identity!")
          end
        end)
      else
        TriggerClientEvent('chatMessage', source, "DELCHAR", {255, 0, 0}, "You don\'t have a character in slot 2!")
      end
    elseif charNumber == 3 then
      local data = {
        identifier   = data.identifier,
        firstname  = data.firstname3,
        lastname  = data.lastname3,
        dateofbirth  = data.dateofbirth3,
        sex      = data.sex3,
        height    = data.height3,
		email    = data.email3
      }
      if data.firstname ~= '' then
        deleteIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)
          if callback == true then
            TriggerClientEvent('chatMessage', source, "DELCHAR", {255, 0, 0}, "You Have Deleted " .. data.firstname .. " " .. data.lastname .. "!")
          else
            TriggerClientEvent('chatMessage', source, "DELCHAR", {255, 0, 0}, "Failed To Delete Identity!")
          end
        end)
      else
        TriggerClientEvent('chatMessage', source, "DELCHAR", {255, 0, 0}, "You don\'t have a character in slot 3!")
      end
    else
      TriggerClientEvent('chatMessage', source, "DELCHAR", {255, 0, 0}, "Failed To Delete Identity!")
    end
  end)
end)
