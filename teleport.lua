-- Basically spam emotes + orbwalker at 40/40 click/tick delays 

desync = menu:add_category("Desync exploit test")
enable = menu:add_checkbox("Enable", desync, 0)
hotkey = menu:add_keybinder("Hotkey", desync, 0x20)
emote1 = menu:add_checkbox("EMOTE_JOKE", desync, 0)
emote2 = menu:add_checkbox("EMOTE_TAUNT", desync, 0)
emote3 = menu:add_checkbox("EMOTE_DANCE", desync, 0)
emote4 = menu:add_checkbox("EMOTE_LAUGH", desync, 0)
recall = menu:add_checkbox("RECALL", desync, 0)

console:log(tostring(spellbook:get_spell_slot(1)))
console:log(tostring(spellbook:get_spell_slot(2)))
console:log(tostring(spellbook:get_spell_slot(3)))
console:log(tostring(spellbook:get_spell_slot(4)))
console:log(tostring(spellbook:get_spell_slot(5)))
console:log(tostring(spellbook:get_spell_slot(6)))

local function on_tick()
	if menu:get_value(enable) == 1 and game:is_key_down(menu:get_value(hotkey)) then
		if menu:get_value(emote1) == 1
			game:send_emote(EMOTE_JOKE)
		end
		if menu:get_value(emote2) == 1
			game:send_emote(EMOTE_TAUNT)
		end
		if menu:get_value(emote3) == 1
			game:send_emote(EMOTE_DANCE)
		end
		if menu:get_value(emote4) == 1
			game:send_emote(EMOTE_LAUGH)
		end
--		if menu:get_value(recall) == 1
--			spellbook:start_charged_spell(recall)
--		end
		end
	end
end

client:set_event_callback("on_tick", on_tick)
