-- test
fixcat = menu:add_category("Spell block bug fix")
anal = menu:add_checkbox("Run analysis", fixcat, 0) -- fake button
fix = menu:add_checkbox("Run fix", fixcat, 0) -- fake button

function on_tick()
	if menu:get_value(anal) == 1 then
		for i = 0, 65 do
			if spellbook:get_spell_slot(i).spell_data.spell_name ~= "" then -- ++ and game:is_key_down(i)
				console:log(tostring((i) .. " " .. spellbook:get_spell_slot(i).spell_data.spell_name .. " " .. game:is_key_down(i)))
			end
		end
	menu:set_value(anal, 0)			
	end
		
	if menu:get_value(fix) == 1 then
		spellbook:key_up_int(0x51) -- Q
		spellbook:key_up_int(0x57) -- W
		spellbook:key_up_int(0x45) -- E
		spellbook:key_up_int(0x52) -- R
		console:log("Fixed internal Q/W/E/R")
		for i = 0, 65 do
			if spellbook:get_spell_slot(i).spell_data.spell_name ~= "" then -- ++ and game:is_key_down(i)
				spellbook:key_up(i)
				console:log("Fixed external spells")
			end
		end
	menu:set_value(fix, 0)
	end
end

client:set_event_callback("on_tick", on_tick)
