--[[
AIMBOT AUTOCAST PLUGIN
  1. Check all targets(enemy champs) in range and calculate prediction for all of them if hitchance 80%+ then autocast spell
  2. If they are retards = low clicks per minute(anti script detector), low KDA. Then lower autocast %% to 60%
  3. If they are living gods == cheaters with evade only cast at 95%+
  V2 -- For circular spells also output enemy count
CREDITS: Benwalker aka stoneb2 
--]]
local pred = _G.Prediction

local function GetDistanceSqr(p1, p2)
	return (p1.x - p2.x) *  (p1.x - p2.x) + ((p1.z or p1.y) - (p2.z or p2.y)) * ((p1.z or p1.y) - (p2.z or p2.y)) 
end

local function GetDistance(p1, p2)
	return math.sqrt(GetDistanceSqr(p1, p2))
end

local input = {
  qspeed = 2000,
  qrange = 1150,
  qdelay = 0.25,
  qwidth = 60,
  qcollision = {"minion", "wind_wall"},
  type = "linear",
  hitbox = true,
}

local function GetEnemyHeroes()
local _EnemyHeroes = {}
players = game.players
	for i, unit in ipairs(players) do
		if GetDistance(!!!!!qrange!!!!!, unit) <= range and unit.is_valid and unit.is_enemy then
			table.insert(_EnemyHeroes, unit)
		end
	end	
	return _EnemyHeroes
end

local function getdynamichitchance(unit) -- ±15%
	-- Ben script detector reworked
	
	--GetCheaters() -- goes to cheater plugin
	
	if cheater.list[game.local_player.champ_name] then
	console:log(game.local_player.champ_name .. " is supported") else
	console:log(game.local_player.champ_name .. " is not supported")
	return
	
	if unit.name == cheater_list[i] = true then
		return 0.15
	else
		return 0 
	end
end

local function on_tick()
	if not spellbook:can_cast(SLOT_Q) or not pred:is_loaded() then return end
		for _, unit in ipairs(game.players) do
			if unit.is_valid and unit.is_enemy then
				local output = pred:get_prediction(input, unit)
				local inv = pred:get_invisible_duration(unit)
				local getdynamichitchance(unit)
				if output.hit_chance > (0.8 + getdynamichitchance()) and inv < 0.125 then
					local p = output.cast_pos
					spellbook:cast_spell(SLOT_Q, 0.25, p.x, p.y, p.z)
					console:log("Casting spell") -- Final output
				end
			end
		end
	end
end

client:set_event_callback("on_tick", on_tick)
client:set_event_callback("on_new_path", on_new_path)
