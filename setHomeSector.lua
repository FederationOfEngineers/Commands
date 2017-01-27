--- Place this file in the scripts/commands folder
package.path = package.path .. ";data/scripts/lib/?.lua"

function execute(sender, commandName, ...)
    local args = {...}

    local x = tonumber(args[1])
    local y = tonumber(args[2])

    if x ~= nil and y ~= nil then
	    if (x > 500 or x < -500) or (y > 500 or y < -500) then
	    	Server():broadcastChatMessage("", 2, "The coordinate values must be between -500 and 500")

	        return 0, "", ""
	    end

    	Server():broadcastChatMessage("", 1, string.format("Setting home sector to sector (%s, %s)!", x, y))
    	Player():setHomeSectorCoordinates(x, y)
        return 0, "", ""
    end

    Server():broadcastChatMessage("", 2, "The coordinate values provided are invalid")

    return 0, "", ""
end

function getDescription()
    return "Set your home sector to a specific sector"
end

function getHelp()
    return "Set your home sector to the sector given. Restrictions: x and y values must be between -500 and 500. Usage: /setHomeSector -10 -234"
end
