-- Basically spam emotes + orbwalker at certain delays

desync = menu:add_category("Desync exploit test")
enable = menu:add_checkbox("Enable", desync, 0)
hotkey = menu:add_keybinder("Hotkey", desync, 0x20)

local function on_tick()
if menu:get_value(enable) == 1 and game:is_key_down(menu:get_value(hotkey)) then
	if game.local_player.champ_name ~= "Velkoz" then
		game:send_emote(EMOTE_TAUNT)
	else
	if game.local_player.champ_name ~= "Yasuo" then
		game:send_emote(EMOTE_DANCE)
	end
end

client:set_event_callback("on_tick", on_tick)