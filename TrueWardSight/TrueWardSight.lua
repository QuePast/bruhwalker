--[[
Dev notes
--V1 DONE
--V2 bush support when outside of the bush -- DONE
--V3 bush support when inside of the bush -- DONE
--add blue trinket support	-- DONE
--suck width from menu	-- DONE
--fix the bug with flooring quality
--only enemy wards
--When holding trinket key show the 
--V4 Performance optimization
--V5 Merging visible points
--]]

local library = require "MapLibrary"
local map = library:New(SUMMONER_RIFT_MAP_ID)
local myHero = game.local_player


function distance(x1 ,y1 ,x2 ,y2)
  local dx = x1 - x2
  local dy = y1 - y2
  return math.sqrt ( dx * dx + dy * dy )
end

function CircleToPolygon(center, radius, steps)
	local result = {}
	for i = 0, steps - 1 do
		local phi = 2 * math.pi / steps * (i + 0.5)
		local cx = center.x + radius * math.cos(phi)
		local cy = center.z + radius * math.sin(phi)
		
		a,b = map:IntersectsWall(center.x, center.z, cx, cy)
		c,d = map:IntersectsBush(center.x, center.z, cx, cy)
		
		if bush == true then
			if a or b then
				table.insert(result, vec3.new(a, center.y, b))
			else
				table.insert(result, vec3.new(cx, center.y, cy))
			end
		end

		if bush == false or bush == nil then
			if (a or b) and (c or d) then
				alfa = distance(center.x, center.z, a ,b)
				beta = distance(center.x, center.z, c ,d)
				if alfa < beta then  
					table.insert(result, vec3.new(a, center.y, b))
				elseif alfa > beta then
					table.insert(result, vec3.new(c, center.y, d))
				end
			elseif (a or b) and not (c or d) then
				table.insert(result, vec3.new(a, center.y, b))
				--console:log("wall")
			elseif (c or d) and not (a or b) then
				table.insert(result, vec3.new(c, center.y, d))
				--console:log("bush")
			else
				table.insert(result, vec3.new(cx, center.y, cy))
				--console:log("no collision")
			end
		end
	end
	return result
end

function DrawPolygon(polygon)
	local size = #polygon
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
		bush = map:IsBush(v.origin.x, v.origin.z)
		if v.champ_name == "BlueTrinket" then
			points = CircleToPolygon(v.origin, 500 , quality)
		else
		points = CircleToPolygon(v.origin, 900 , quality)
		end
		DrawPolygon(points)
	end
	menuvalue = menu:get_value_string("circle quality", "settings")
end

console:log("True ward loaded")
client:set_event_callback("on_draw", on_draw)
