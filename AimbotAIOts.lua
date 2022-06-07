local function GetDistanceSqr(p1, p2)
	return (p1.x - p2.x) *  (p1.x - p2.x) + ((p1.z or p1.y) - (p2.z or p2.y)) * ((p1.z or p1.y) - (p2.z or p2.y)) 
end

local function GetDistance(p1, p2)
	return math.sqrt(GetDistanceSqr(p1, p2))
end

--Counts minions within range
function GetMinionCount(pos, range)
	count = 0
	local enemies_in_range = {}
	minions = game.minions
	for i, minion in ipairs(minions) do
		Range = range * range
		if minion.is_enemy and minion.is_valid and GetDistanceSqr(minion, pos) < Range then
			table.insert(enemies_in_range, minion)
			count = count + 1
		end
	end
	return enemies_in_range, count
end

--Returns closest minion
function GetClosestMinion(pos, range)
	local enemyMinions, _ = GetMinionCount(pos, range)
	local closestMinion = nil
	local closestMinionDistance = 9999 
	for i, minion in pairs(enemyMinions) do
		if minion then
			if minion:distance_to(mouse_pos) < 300 then
				local minionDistanceToMouse = minion:distance_to(mouse_pos)
				if minionDistanceToMouse < closestMinionDistance then
					closestMinion = minion
					closestMinionDistance = minionDistanceToMouse
				end
			end
		end
	end
	return closestMinion
end

function on_draw()
	mouse_pos = game.mouse_pos
	-- target search circle
	renderer:draw_circle(mouse_pos.x, mouse_pos.y, mouse_pos.z, 300, 255, 255, 255, 255)
	
	screen_pos = game:world_to_screen(mouse_pos.x, mouse_pos.y, mouse_pos.z)
	target = selector:find_target_minion(1000) -- REWORK TO EUREKA AIMBOT TARGET SELECTOR
	-- target = Eureka()
	if target.is_valid and GetDistance(target.origin, mouse_pos) <= 300 then
		target_pos = game:world_to_screen(target.origin.x, target.origin.y, target.origin.z)
		renderer:draw_circle(target.origin.x, target.origin.y, target.origin.z, target.bounding_radius, 255, 255, 255, 255)
		renderer:draw_line(screen_pos.x, screen_pos.y, target_pos.x, target_pos.y, 1, 255, 255, 255, 255)
	end
end

function Eureka(target)
	target = GetClosestMinion(mouse_pos, 300)
	console:log(tostring(target))
	--]]
end

console:log("AIO TS plugin loaded")
client:set_event_callback("on_draw", on_draw)
--client:set_event_callback("on_tick", on_tick)
