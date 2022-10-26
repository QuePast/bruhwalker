downloadfps = menu:add_category("FPS Downloader")
hz = menu:add_slider("Critical value", downloadfps, 60, 240, 144, "Set the value under which you dont want to go. Preferably monitor refresh rate or in-game frame cap if its lower")

local function on_tick()
	local fps = game.fps
	local fpsmin = menu:get_value(hz) * 0.95	-- reduced fpsmin in case user have locked fps
	local quality = menu:get_value_string("circle quality", "settings")
	local tick = menu:get_value_string("tick", "settings")

	if fps >= fpsmin then

		quality = math.floor(math.min(125, quality + 10))
		tick = math.floor(math.min(150, math.max(20, tick - 5)))
		--console:clear()
		--console:log("YOUR PC IS HIGH END")
	elseif fps < fpsmin then
		
		quality = math.floor(math.max(25, quality - 10))
		tick = math.floor(math.max(20, (math.min(150, tick + 5))))
		--console:clear()
		--console:log("BALANCING FPS")
	end

	--console:log("Quality: ".. tostring(quality))
	--console:log("Tick:     ".. tostring(tick))

	menu:set_value_string(quality, "circle quality", "settings")
	menu:set_value_string(tick, "tick", "settings")	
end

client:set_event_callback("on_tick", on_tick)
