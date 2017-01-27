package.path = package.path .. ";data/scripts/lib/?.lua"

function execute(sender, commandName, ...)
    local args = {...}

    local str = ""
    local x = args[1]
    local y = args[2]

    if x ~= nil and y ~= nil then
    	Server():broadcastChatMessage("", 0, string.format("Setting home sector to sector (%s, %s)!", x, y))
    	Player():setHomeSectorCoordinates(x, y)
    else
    	Server():broadcastChatMessage("", 0, "Please provide the x and y coordinates for the sector you'd like to set as home.")
    end

    return 0, "", ""
end

function getDescription()
    return "Set your home sector to a specific sector or the current sector"
end

function getHelp()
    return "Set your home sector to the sector given. If nothing is passed into the command when called it will set your home sector to your current sector. Usage: /setHomeSector [x y]"
end
