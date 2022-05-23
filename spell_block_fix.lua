-- test
fixcat = menu:add_category("Spell block bug fix")
anal = menu:add_checkbox("Run analysis", fixcat, 0) -- fake button
fix = menu:add_checkbox("Run fix", fixcat, 0) -- fake button

function on_tick()
	local size = 65
	if menu:get_value(anal) == 1 then
		for i = -1, size do
			if spellbook:get_spell_slot(i).spell_data.spell_name ~= "" then -- returns permapressed spells
				console:log(tostring(i) .. ". " .. spellbook:get_spell_slot(i).spell_data.spell_name)
			end
		end
		menu:set_value(anal, 0)			
	end
		
	if menu:get_value(fix) == 1 then
		spellbook:key_up_int(0x51) -- Q
		spellbook:key_up_int(0x57) -- W
		spellbook:key_up_int(0x45) -- E
		spellbook:key_up_int(0x52) -- R
		spellbook:key_up_int(0x01) -- Left click
		spellbook:key_up_int(0x20) -- Spacebar
		spellbook:key_up_int(0x43) -- C
		spellbook:key_up_int(0x56) -- V
		spellbook:key_up_int(0x58) -- X
		console:log("Fixed internal Q/W/E/R/M1/Space/C/V/X")
		--for i = -1, size do
		--		spellbook:key_up(i)
		--end
		spellbook:key_up(0x51)
		spellbook:key_up(0x57)
		spellbook:key_up(0x45)
		spellbook:key_up(0x52)
		console:log("Fixed external")
		menu:set_value(fix, 0)
	end
end

client:set_event_callback("on_tick", on_tick)
