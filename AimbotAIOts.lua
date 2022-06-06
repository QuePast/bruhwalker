function on_tick()
	Eureka()
end

function on_draw()
	mouse_pos = game.mouse_pos
	
	-- target search circle
	renderer:draw_circle(mouse_pos.x, mouse_pos.y, mouse_pos.z, 300, 255, 255, 255, 255) -- Q + RGB A
	
	-- line from mouse pos to target
	if Eureka() ~= nil then
		targetd = game:world_to_screen(target.x, target.y, target.z)
		renderer:draw_line(mouse_pos.x, mouse_pos.y, targetd.x, targetd.y, 2, 255, 255, 255, 255)
		renderer:draw_circle(target.x, target.y, target.z, target.bounding_radius, 255, 255, 255, 255) 
	end
end

local function Eureka(target)
	--V1
	target = selector:find_target(300, mode_cursor)
	if target.is_valid then
		return target
	end
	console:log(tostring(target))
	
	--V2
	--[[
	mouse_pos = game.mouse_pos
	minions = game.minions

	for _, v in ipairs(minions) do
		if gameobject:distance_to(mouse_pos) < 300 then
			
	end
	console:log(tostring(target))
	--]]
end

console:log("AIO TS plugin loaded")
client:set_event_callback("on_draw", on_draw)
client:set_event_callback("on_tick", on_tick)
