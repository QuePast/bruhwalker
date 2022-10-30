--V1 Done
--V2 bush support when outside of the bush
--V3 bush support when inside of the bush
-- add blue trinket support
-- fix the bug with flooring quality
--V4 Performance optimization
--V5 Merging visible points


local library = require "MapLibrary"
local map = library:New(SUMMONER_RIFT_MAP_ID)
local myHero = game.local_player

--[[
function ml.GetDistanceSqr(unit, p2)
    p2 = p2 or local_player.origin
    p2x, p2y, p2z = p2.x, p2.y, p2.z
    p1 = unit.origin
    p1x, p1y, p1z = p1.x, p1.y, p1.z
    local dx = p1x - p2x
    local dz = (p1z or p1y) - (p2z or p2y)
    return dx*dx + dz*dz
end
--]]

function CircleToPolygon(center, radius, steps)
	local result = {}
	local pos = center
	for i = 0, steps - 1 do
		local phi = 2 * math.pi / steps * (i + 0.5)
		local cx = center.x + radius * math.cos(phi)
		local cy = center.z + radius * math.sin(phi)
		
		local a,b = map:IntersectsWall(pos.x, pos.z, cx, cy)
		
		--[[
		--V2 bush support when outside of the bush
		
		local c,d = map:IntersectsBush(pos.x, pos.z, cx, cy)
		
		if a or b and c or d then
			if a,b distance_to > c,d then  
				table.insert(result, vec3.new(c, center.y, d)) INSERT BUSH INTERSECT
			elseif a,b distance_to <= c,d then
				table.insert(result, vec3.new(A, center.y, B)) INSERT WALL
		else
			table.insert(result, vec3.new(cx, center.y, cy))
		end
		
		--]]
		

		if a or b then
			table.insert(result, vec3.new(a, center.y, b))
		else
			table.insert(result, vec3.new(cx, center.y, cy))
		end
	end
	return result
end

function DrawPolygon(polygon, width)
	local size, w = #polygon, width
	local width = menu:get_value_string("circle thickness", "settings")
	if size < 3 then return end

	for i = 1, size do
		local p1, p2 = polygon[i], polygon[i % size + 1]
		local x = game:world_to_screen_2(p1.x, p1.y, p1.z)
		local y = game:world_to_screen_2(p2.x, p2.y, p2.z)

		renderer:draw_line(x.x, x.y, y.x, y.y, width, 255, 255, 255, 255)
	end
end

function on_draw()
	m = game.wards
	local quality = (math.floor(menu:get_value_string("circle quality", "settings")/2.5)*2)
	for _, v in ipairs(m) do
		local points = CircleToPolygon(v.origin, 900 , quality)
		DrawPolygon(points, 2)
	end
	menuvalue = menu:get_value_string("circle quality", "settings")
end

client:set_event_callback("on_draw", on_draw)
