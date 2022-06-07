--[[
AIMBOT AUTOCAST PLUGIN
  1. Check all targets(enemy champs) in range and calculate prediction for all of them if hitchance 80%+ then autocast spell
  2. If they are retards = low clicks per minute(waypoints)(anti script detector), low KDA. Then lower autocast %% to 60%
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

waypoints = menu:add_category("Script Detector")
cheater_limit = menu:add_slider("Cheater Clicks per Second Limit", waypoints, 5, 50, 10, "The number of clicks per second to be labeled by the code as a scripter")
time_limit_slider = menu:add_slider("Average Time Length", waypoints, 1, 20, 5, "Time interval to collect waypoints. Works best at 5 seconds, do not recommend changing.")

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
    if obj.is_valid then
        for i, player in ipairs(game.players) do
            if player.object_id == obj.object_id then
                table.insert(tracker[obj.object_id].path, path)
                table.insert(tracker[obj.object_id].time, game.game_time)
            end
        end
    end
end

local function getdynamichitchance() --+ 20%
   for i, player in pairs(tracker) do
        for j, time in pairs(player) do
            for k, actual_time in pairs(time) do
                if type(actual_time) == "number" then
                    if actual_time <= game.game_time - menu:get_value(time_limit_slider) then
                        table.remove(tracker[i].path, k)
                        table.remove(tracker[i].time, k)
                    end
                end
            end
        end
    end
    for i, player in pairs(tracker) do
        averages[i] = #player.time / menu:get_value(time_limit_slider)
        if averages[i] > tonumber(menu:get_value(cheater_limit)) and not cheater_list[i] and i ~= local_player.object_id then
            cheater_list[i] = true
            champ_name = game:get_object(i).champ_name
            game:print_chat("<font color='#9a7aa0'>" .. tostring(champ_name) .. " is scripting!</font>")
        end
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
        console:log("Casting spell") -- Finaly output
      end
    end
  end
end

client:set_event_callback("on_tick", on_tick)
client:set_event_callback("on_new_path", on_new_path)
