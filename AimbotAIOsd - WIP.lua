-- Deleted not needed stuff
-- Preparation for HVH WAR
-- CREDITS TO BEN AKA STONEB2
local_player = game.local_player

waypoints = menu:add_category("Script Detector")
--cheater_limit = menu:add_slider("Cheater Clicks per Second Limit", waypoints, 5, 50, 10, "The number of clicks per second to be labeled by the code as a scripter")
--time_limit_slider = menu:add_slider("Average Time Length", waypoints, 1, 20, 5, "Time interval to collect waypoints. Works best at 5 seconds, do not recommend changing.")
waypoint_draw = menu:add_checkbox("Draw Clicks per Second Below Champions", waypoints, 1)

cheater_list = {}
for i, player in ipairs(game.players) do
    cheater_list[player.object_id] = false
end

tracker = {}
for i, player in ipairs(game.players) do
    tracker[player.object_id] = {
        path = {},
        time = {}
    }
end

averages = {}
local function on_new_path(obj, path)
	if obj.is_valid and obj.is_enemy then
		for i, player in ipairs(game.players) do
			table.insert(tracker[obj.object_id].path, path)
			table.insert(tracker[obj.object_id].time, game.game_time)
		end
	end
end

local function on_tick()
	for i, player in pairs(tracker) do
		for j, time in pairs(player) do
			for k, actual_time in pairs(time) do
				if type(actual_time) == "number" then
					if actual_time <= game.game_time - 5 then
						table.remove(tracker[i].path, k)
						table.remove(tracker[i].time, k)
					end
				end
			end
		end
	end
	for i, player in pairs(tracker) do
		averages[i] = #player.time / 5
		if averages[i] > 10 and not cheater_list[i] and i ~= local_player.object_id then
			cheater_list[i] = true
			champ_name = game:get_object(i).champ_name
			console:log(tostring(champ_name) .. " is scripting, moving to high hitchance only list!</font>")
		end
	end
end

local function on_draw()
	if menu:get_value(waypoint_draw) == 1 then
		for i, player in ipairs(game.players) do
			if player.is_visible and player.is_alive then
				if averages[player.object_id] then
					if player.object_id == local_player.object_id then
						x, y = game:world_to_screen_2(player.origin.x, player.origin.y, player.origin.z).x, game:world_to_screen_2(player.origin.x, player.origin.y, player.origin.z - 25).y
					else
						x, y = game:world_to_screen_2(player.origin.x, player.origin.y, player.origin.z).x, game:world_to_screen_2(player.origin.x, player.origin.y, player.origin.z).y
					end
				renderer:draw_text_centered(x, y, tostring(averages[player.object_id]), 255, 255, 255, 255)
				end
			end
		end
	end
end

client:set_event_callback("on_new_path", on_new_path)
client:set_event_callback("on_draw", on_draw)
client:set_event_callback("on_tick", on_tick)
