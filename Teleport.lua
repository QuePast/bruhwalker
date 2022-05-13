-- Testing script for Desync exploit
-- Basically spamming emotes + orbwalker at 40/40 click/tick delays make you teleport
-- If casting recall was internal it could be pretty big
-- Working for Velkoz, Yasuo + possibly all recalls

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

local size = 63
for i = 0, size do
	if spellbook:get_spell_slot(i).spell_data.spell_name ~= "" then
		console:log(tostring((i) .. " " .. spellbook:get_spell_slot(i).spell_data.spell_name))
	end
end

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
			spellbook:cast_spell(0x13)
		end
		if menu:get_value(custommenu) == 1  then
			spellbook:cast_spell_minimap(menu:get_value(customspell), 0.25, 100,100,100)
		end
	end
end

client:set_event_callback("on_tick", on_tick)
