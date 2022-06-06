function on_draw()
	origin = myHero.origin
	mouse_pos = game.mouse_pos
	
	-- spell drawings
	if menu:get_value(xxxx) == 1 then
	renderer:draw_circle(origin.x, origin.y, origin.z, aarange, raa, gaa, baa, aaa) -- Q + RGB A
	end
	if menu:get_value(xxxx) == 1 then
	renderer:draw_circle(origin.x, origin.y, origin.z, qrange, rq, gq, bq, aq) -- Q + RGB A
	end
	if menu:get_value(xxxx) == 1 then
	renderer:draw_circle(origin.x, origin.y, origin.z, wrange, rw, gw, bw, aw) -- W + RGB A
	end
	if menu:get_value(xxxx) == 1 then
	renderer:draw_circle(origin.x, origin.y, origin.z, erange, re, ge, be, ae) -- E + RGB A
	end
	if menu:get_value(xxxx) == 1 then
	renderer:draw_circle(origin.x, origin.y, origin.z, rrange, rr, gr, br, ar) -- R + RGB A
	end
	
	-- target search circle
	if menu:get_value(xxxx) == 1 then
	renderer:draw_circle(mouse_pos.x, mouse_pos.y, mouse_pos.z, searchrange, rt, gt, bt, at) -- R + RGB A
	end
	
	-- line from mouse pos to targer
--	if Eureka(target) ~= nil return end
--		targetd = game:world_to_screen(target.x, target.y, target.z)
--		renderer:draw_line(mouse.x, mouse.y, targetd.x, targetd.y, 2, 255, 255, 255, 255)
--	end
end

local function Eureka()
	
end

-- 1. ENEMY PLAYERS ( NOT LUX W )
local function GetEnemyHeroes()
	players = game.players
	
	for _, hero in ipairs(players) do
	    dist = myHero:distance_to(player.origin)
	
	    if dist < myHero.attack_range and myHero.object_id ~= player.object_id then
	        console:log(myHero.object_name)
	        console:log(tostring(myHero.health))
	        console:log(tostring(myHero.is_targetable))
	    end
	end
end

client:set_event_callback("on_draw", on_draw)
client:set_event_callback("on_tick", on_tick)

-- 1. ENEMY PLAYERS ( NOT LUX W )
end
--[[ MISSCLICK PLUGIN CODE 10%
local function GetEnemyHeroes()
	local _EnemyHeroes = {}
	players = game.players	
	for i, unit in ipairs(players) do
		if unit and unit.is_enemy then
			table.insert(_EnemyHeroes, unit)
		end
	end	
	return _EnemyHeroes
end
-- 2. ENEMY MINIONS (??ALL collision spells??)
minions = game.minions
for _, minion in ipairs(minions) do
    dist = minion:distance_to(player.origin)
    if dist < player.attack_range then
        console:log(minion.object_name)
        console:log(tostring(minion.health))
        console:log(tostring(minion.is_targetable))
        if minion.is_targetable then
            --renderer
        end
    end
end
-- 3. ENEMY PETS (??ALL collision spells??)
pets = game.pets
for _, minion in ipairs(pets) do
    dist = minion:distance_to(player.origin)
    if dist < player.attack_range then
        console:log(minion.object_name)
        console:log(tostring(minion.health))
        console:log(tostring(minion.is_targetable))
        if minion.is_targetable then
            --renderer
        end
    end
end
-- 4. JUNGLE PLANTS (??ALL collision spells??)
jungle_plants = game.jungle_plants
for _, minion in ipairs(jungle_plants) do
    dist = minion:distance_to(player.origin)
    if dist < player.attack_range then
        console:log(minion.object_name)
        console:log(tostring(minion.health))
        console:log(tostring(minion.is_targetable))
    end
end
-- 5. ENEMY TURRETS (Ezreal W)
turrets= game.turrets
for _, minion in ipairs(turrets) do
    dist = minion:distance_to(player.origin)
    if dist < player.attack_range then
        console:log(minion.object_name)
        console:log(tostring(minion.health))
        console:log(tostring(minion.is_targetable))
    end
end
-- 6. ENEMY INHIBS (Ezreal W)
inhibs = game.inhibs
for _, minion in ipairs(inhibs) do
    dist = minion:distance_to(player.origin)
    if dist < player.attack_range then
        console:log(minion.object_name)
        console:log(tostring(minion.health))
        console:log(tostring(minion.is_targetable))
    end
end
-- 7. ALLY PLAYERS ( LUX W )
allies = game.players
for _, minion in ipairs(allies) do
    dist = minion:distance_to(player.origin)
    if dist < player.attack_range then
        console:log(minion.object_name)
        console:log(tostring(minion.health))
        console:log(tostring(minion.is_targetable))
    end
end
--]]
