-- test
fix = menu:add_category("Spell block bug fix")
enable = menu:add_checkbox("Enable", fix, 0)
hotkey = menu:add_keybinder("Hotkey which runs keyup", fix, 0x20)

console:log("F5 for analysis")
for i = 0, 65 do
	if spellbook:get_spell_slot(i).spell_data.spell_name ~= "" then
		console:log(tostring((i) .. " " .. spellbook:get_spell_slot(i).spell_data.spell_name .. " " .. game:is_key_down(i)))
	end
end

function on_tick()
	if menu:get_value(enable) == 1 and game:is_key_down(menu:get_value(hotkey)) then
		spellbook:key_up_int(0x51) -- Q
		spellbook:key_up_int(0x57) -- W
		spellbook:key_up_int(0x45) -- E
		spellbook:key_up_int(0x52) -- R
		console:log("Fixed internal Q/W/E/R")
		for i = 0, 65 do
			if spellbook:get_spell_slot(i).spell_data.spell_name ~= "" then
				spellbook:key_up(i)
				console:log("Fixed external spells")
			end
		end
	end
end

client:set_event_callback("on_tick", on_tick)
