function GetDistanceSqr(unit, p2)
    p2 = p2 or local_player.origin
    p2x, p2y, p2z = p2.x, p2.y, p2.z
    p1 = unit.origin
    p1x, p1y, p1z = p1.x, p1.y, p1.z
    local dx = p1x - p2x
    local dz = (p1z or p1y) - (p2z or p2y)
    return dx*dx + dz*dz
end

-- VECTOR MATH COPYPASTA
--Counts minions within range
function ml.GetMinionCount(pos, range)
	count = 0
    local enemies_in_range = {}
	minions = game.minions
	for i, minion in ipairs(minions) do
	Range = range * range
		if minion.is_enemy and ml.IsValid(minion) and ml.GetDistanceSqr(minion, pos) < Range then
            table.insert(enemies_in_range, minion)
			count = count + 1
		end
	end
	return enemies_in_range, count
end

--Returns closest minion
function ml.GetClosestMinion(pos, range)
    local enemyMinions, _ = ml.GetMinionCount(pos, range)
    local closestMinion = nil
    local closestMinionDistance = 9999 
    for i, minion in pairs(enemyMinions) do
        if minion then
            if minion:distance_to(mousepos) < 300 then
                local minionDistanceToMouse = minion:distance_to(mousepos)
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
	
	-- line from mouse pos to target
	if Eureka() ~= nil then
		targetd = game:world_to_screen(target.x, target.y, target.z)
		renderer:draw_line(mouse_pos.x, mouse_pos.y, targetd.x, targetd.y, 2, 255, 255, 255, 255)
		renderer:draw_circle(target.x, target.y, target.z, target.bounding_radius, 255, 255, 255, 255) 
	end
end

function Eureka(target)
	--V1
	target = selector:find_target(300, mode_cursor)
	if target.is_valid then
		return target
	end
	console:log(tostring(target))
	--[[
	--V2
	target = ml.GetClosestMinion(pos, 300)
	console:log(tostring(target))
	--]]
end

console:log("AIO TS plugin loaded")
client:set_event_callback("on_draw", on_draw)
--client:set_event_callback("on_tick", on_tick)
