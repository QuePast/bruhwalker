local name = "Riot Cryptor"

namechanger = menu:add_category("Name Changer")
set = menu:add_checkbox("Set name", namechanger, 0)
reset = menu:add_checkbox("Reset name", namechanger, 0)

local function on_tick()
	if menu:get_value(set) == 1 then
		for _, player in ipairs(game.players) do
			player:set_name(name)
			menu:set_value(set, 0)
		end
	end
	
	if menu:get_value(reset) == 1 then
		for _, player in ipairs(game.players) do
			player:restore_name()
			menu:set_value(reset, 0)
		end
	end
end

client:set_event_callback("on_tick", on_tick)
