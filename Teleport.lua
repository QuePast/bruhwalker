-- Testing script for Desync exploit
-- Basically spam emotes + orbwalker at 40/40 click/tick delays 

desync = menu:add_category("Desync exploit test")
enable = menu:add_checkbox("Enable", desync, 1)
hotkey = menu:add_keybinder("Hotkey", desync, 0x20)
emote1 = menu:add_checkbox("EMOTE_JOKE", desync, 0)
emote2 = menu:add_checkbox("EMOTE_TAUNT", desync, 0)
emote3 = menu:add_checkbox("EMOTE_DANCE", desync, 0)
emote4 = menu:add_checkbox("EMOTE_LAUGH", desync, 0)
recall = menu:add_checkbox("RECALL", desync, 0)
custommenu = menu:add_checkbox("Enable custom value", desync, 0)
customspell = menu:add_slider("Value 0-63", desync, 0, 63, 0)

--xd
console:log(tostring("0 " .. spellbook:get_spell_slot(0).spell_data.spell_name))
console:log(tostring("1 " .. spellbook:get_spell_slot(1).spell_data.spell_name))
console:log(tostring("2 " .. spellbook:get_spell_slot(2).spell_data.spell_name))
console:log(tostring("3 " .. spellbook:get_spell_slot(3).spell_data.spell_name))
console:log(tostring("4 " .. spellbook:get_spell_slot(4).spell_data.spell_name))
console:log(tostring("5 " .. spellbook:get_spell_slot(5).spell_data.spell_name))
console:log(tostring("6 " .. spellbook:get_spell_slot(6).spell_data.spell_name))
console:log(tostring("7 " .. spellbook:get_spell_slot(7).spell_data.spell_name))
console:log(tostring("8 " .. spellbook:get_spell_slot(8).spell_data.spell_name))
console:log(tostring("9 " .. spellbook:get_spell_slot(9).spell_data.spell_name))
console:log(tostring("10 " ..spellbook:get_spell_slot(10).spell_data.spell_name))
console:log(tostring("11 " ..spellbook:get_spell_slot(11).spell_data.spell_name))
console:log(tostring("12 " ..spellbook:get_spell_slot(12).spell_data.spell_name))
console:log(tostring("13 " ..spellbook:get_spell_slot(13).spell_data.spell_name))
console:log(tostring("14 " ..spellbook:get_spell_slot(14).spell_data.spell_name))
console:log(tostring("15 " ..spellbook:get_spell_slot(15).spell_data.spell_name))
console:log(tostring("16 " ..spellbook:get_spell_slot(16).spell_data.spell_name))
console:log(tostring("17 " ..spellbook:get_spell_slot(17).spell_data.spell_name))
console:log(tostring("18 " ..spellbook:get_spell_slot(18).spell_data.spell_name))
console:log(tostring("19 " ..spellbook:get_spell_slot(19).spell_data.spell_name))
console:log(tostring("20 " ..spellbook:get_spell_slot(20).spell_data.spell_name))
console:log(tostring("21 " ..spellbook:get_spell_slot(21).spell_data.spell_name))
console:log(tostring("22 " ..spellbook:get_spell_slot(22).spell_data.spell_name))
console:log(tostring("23 " ..spellbook:get_spell_slot(23).spell_data.spell_name))
console:log(tostring("24 " ..spellbook:get_spell_slot(24).spell_data.spell_name))
console:log(tostring("25 " ..spellbook:get_spell_slot(25).spell_data.spell_name))
console:log(tostring("26 " ..spellbook:get_spell_slot(26).spell_data.spell_name))
console:log(tostring("27 " ..spellbook:get_spell_slot(27).spell_data.spell_name))
console:log(tostring("28 " ..spellbook:get_spell_slot(28).spell_data.spell_name))
console:log(tostring("29 " ..spellbook:get_spell_slot(29).spell_data.spell_name))
console:log(tostring("30 " ..spellbook:get_spell_slot(30).spell_data.spell_name))
console:log(tostring("31 " ..spellbook:get_spell_slot(31).spell_data.spell_name))
console:log(tostring("32 " ..spellbook:get_spell_slot(32).spell_data.spell_name))
console:log(tostring("32 " ..spellbook:get_spell_slot(32).spell_data.spell_name))
console:log(tostring("33 " ..spellbook:get_spell_slot(33).spell_data.spell_name))
console:log(tostring("34 " ..spellbook:get_spell_slot(34).spell_data.spell_name))
console:log(tostring("35 " ..spellbook:get_spell_slot(35).spell_data.spell_name))
console:log(tostring("36 " ..spellbook:get_spell_slot(36).spell_data.spell_name))
console:log(tostring("37 " ..spellbook:get_spell_slot(37).spell_data.spell_name))
console:log(tostring("38 " ..spellbook:get_spell_slot(38).spell_data.spell_name))
console:log(tostring("39 " ..spellbook:get_spell_slot(39).spell_data.spell_name))
console:log(tostring("40 " ..spellbook:get_spell_slot(40).spell_data.spell_name))
console:log(tostring("41 " ..spellbook:get_spell_slot(41).spell_data.spell_name))
console:log(tostring("42 " ..spellbook:get_spell_slot(42).spell_data.spell_name))
console:log(tostring("43 " ..spellbook:get_spell_slot(43).spell_data.spell_name))
console:log(tostring("44 " ..spellbook:get_spell_slot(44).spell_data.spell_name))
console:log(tostring("45 " ..spellbook:get_spell_slot(45).spell_data.spell_name))
console:log(tostring("46 " ..spellbook:get_spell_slot(46).spell_data.spell_name))
console:log(tostring("47 " ..spellbook:get_spell_slot(47).spell_data.spell_name))
console:log(tostring("48 " ..spellbook:get_spell_slot(48).spell_data.spell_name))
console:log(tostring("49 " ..spellbook:get_spell_slot(49).spell_data.spell_name))
console:log(tostring("50 " ..spellbook:get_spell_slot(50).spell_data.spell_name))
console:log(tostring("51 " ..spellbook:get_spell_slot(51).spell_data.spell_name))
console:log(tostring("52 " ..spellbook:get_spell_slot(52).spell_data.spell_name))
console:log(tostring("53 " ..spellbook:get_spell_slot(53).spell_data.spell_name))
console:log(tostring("54 " ..spellbook:get_spell_slot(54).spell_data.spell_name))
console:log(tostring("55 " ..spellbook:get_spell_slot(55).spell_data.spell_name))
console:log(tostring("56 " ..spellbook:get_spell_slot(56).spell_data.spell_name))
console:log(tostring("57 " ..spellbook:get_spell_slot(57).spell_data.spell_name))
console:log(tostring("58 " ..spellbook:get_spell_slot(58).spell_data.spell_name))
console:log(tostring("59 " ..spellbook:get_spell_slot(59).spell_data.spell_name))
console:log(tostring("60 " ..spellbook:get_spell_slot(60).spell_data.spell_name))
console:log(tostring("61 " ..spellbook:get_spell_slot(61).spell_data.spell_name))
console:log(tostring("62 " ..spellbook:get_spell_slot(62).spell_data.spell_name))

local function on_tick()
	if menu:get_value(enable) == 1 and game:is_key_down(menu:get_value(hotkey)) then
		if menu:get_value(emote1) == 1 then
			game:send_emote(EMOTE_JOKE)
		end
		if menu:get_value(emote2) == 1 then
			game:send_emote(EMOTE_TAUNT)
		end
		if menu:get_value(emote3) == 1 then
			game:send_emote(EMOTE_DANCE)
		end
		if menu:get_value(emote4) == 1 then
			game:send_emote(EMOTE_LAUGH)
		end
		if menu:get_value(recall) == 1 then
			spellbook:key_down_int(0x42)
			spellbook:key_up_int(0x42)
		end
		if menu:get_value(custommenu) == 1  then
			spellbook:cast_spell_minimap(menu:get_value(customspell), 0.25, 100,100,100)
		end
	end
end

client:set_event_callback("on_tick", on_tick)
