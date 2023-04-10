--[[
 _______                    _                               
(_______)                  | |                              
    _  ____ _   _ ____   __| |_____ ____  _____  ____ _____ 
   | |/ ___) | | |  _ \ / _  (____ |    \| ___ |/ ___) ___ |
   | | |   | |_| | | | ( (_| / ___ | | | | ____| |   | ____|
   |_|_|    \__  |_| |_|\____\_____|_|_|_|_____)_|   |_____)
           (____/                                           
--]]

-- Exit if the local player's champion is not Tryndamere
if game.local_player.champ_name ~= "Tryndamere" then return end

-- AutoUpdate
local Version = 0.1
local Url = "https://raw.githubusercontent.com/QuePast/bruhwalker/main/"

local function AutoUpdate()
    local result = http:get(Url .. "Tryndamere.version")
    if result and result ~= "" and tonumber(result) > Version then
        http:download_file(Url .. "Tryndamere.lua", "Tryndamere.lua")
        console:log("[Tryndamere] Successfully updated. Please reload!")
        return true
    end
    return false
end

-- Download PKDamageLib.lua if it does not exist
if not file_manager:file_exists("PKDamageLib.lua") then
    http:download_file("http://raw.githubusercontent.com/Astraanator/test/main/Champions/PKDamageLib.lua", "PKDamageLib.lua")
end

-- Initialize
pred:use_prediction()
myHero = game.local_player
require "PKDamageLib"

local w = {range = 850}
local e = {speed = 1700, range = 650, delay = 0.25, width = 220, collision = {}}

-- Create menu
tryndamere = menu:add_category_sprite("Tryndamere by Rajovan" , os.getenv("LOCALAPPDATA") .. "/leaguesense/sprites/Tryndamere.png")
	enable = menu:add_checkbox("Enable", tryndamere )
	combo_enable = menu:add_subcategory("Features", tryndamere )
		menu:add_label("Combo", combo_enable) 
		combo_w = menu:add_checkbox("Combo W", combo_enable )
		combo_e = menu:add_checkbox("Combo E", combo_enable )
		menu:add_label("Misc", combo_enable) 
		killsteal_e = menu:add_checkbox("Killsteal E", combo_enable )
		clear_e = menu:add_checkbox("Laneclear E", combo_enable )
			clear_e_count = menu:add_slider("Number of minions for E", combo_enable, 1, 6, 3 )
		menu:add_label("Auto R settings", combo_enable) 
		auto_r = menu:add_checkbox("Auto R", combo_enable )
			r_hp = menu:add_slider("If HP lower than %", combo_enable, 1, 100, 20 )
			r_count = menu:add_checkbox("R only if Enemy around", combo_enable )
			r_attacked = menu:add_checkbox("R when getting attacked", combo_enable )
	
	drawing = menu:add_subcategory("Drawings", tryndamere )
		draw_w = menu:add_checkbox("Draw W", drawing )
		draw_e = menu:add_checkbox("Draw E", drawing )
		draw_r_countdown = menu:add_checkbox("Draw R Timer", drawing )

-- Helper Functions
function MyHeroReady()
	return not (myHero.is_recalling or game.is_chat_opened or game.is_shop_opened or evade:is_evading())
end

function IsValid(unit)
    return (unit and unit.is_targetable and unit.is_alive and unit.is_visible and unit.object_id ~= 0 and unit.health > 0 and IsKillable(unit))
end

local function GetDistanceSqr(p1, p2)
	return (p1.x - p2.x) *  (p1.x - p2.x) + ((p1.z or p1.y) - (p2.z or p2.y)) * ((p1.z or p1.y) - (p2.z or p2.y)) 
end

local function GetDistance(p1, p2)
	return math.sqrt(GetDistanceSqr(p1, p2))
end

function VectorPointProjectionOnLineSegment(v1, v2, v)
	local cx, cy, ax, ay, bx, by = v.x, v.z, v1.x, v1.z, v2.x, v2.z
	local rL = ((cx - ax) * (bx - ax) + (cy - ay) * (by - ay)) / ((bx - ax) ^ 2 + (by - ay) ^ 2)
	local pointLine = { x = ax + rL * (bx - ax), y = ay + rL * (by - ay) }
	local rS = rL < 0 and 0 or (rL > 1 and 1 or rL)
	local isOnSegment = rS == rL
	local pointSegment = isOnSegment and pointLine or { x = ax + rS * (bx - ax), y = ay + rS * (by - ay) }
	return pointSegment, pointLine, isOnSegment
end

local function GetLineTargetCount(source, Pos, delay, speed, width, range)
	local Count = 0
	minions = game.minions
	for _, minion in ipairs(minions) do 
		if minion.is_enemy and myHero:distance_to(minion.origin) < range and IsValid(minion) then
			local proj1, pointLine, isOnSegment = VectorPointProjectionOnLineSegment(source.origin, Pos.origin, minion.origin)
			if proj1 and isOnSegment and (GetDistanceSqr(minion.origin, proj1) <= (minion.bounding_radius + width) * (minion.bounding_radius + width)) then
				Count = Count + 1
			end
		end
	end
	return Count
end

function GetEnemyHeroes()
	local _EnemyHeroes = {}
	for _, unit in ipairs(game.players) do
		if unit and unit.is_enemy then
			table.insert(_EnemyHeroes, unit)
		end
	end
	return _EnemyHeroes
end

-- Main functions
function on_tick_always()
	if menu:get_value(enable) == 1 and MyHeroReady() then
		if combo:get_mode() == 1 then
			Combo()
		end
		
		if combo:get_mode() == 3 and menu:get_value(clear_e) == 1 and spellbook:can_cast(SLOT_E) then
			Laneclear()
			JungleClear()
		end
		
		if menu:get_value(killsteal_e) == 1 then
			Killsteal()
		end
		
		if menu:get_value(auto_r) == 1 and spellbook:can_cast(SLOT_R) then
			Auto_R()
		end
	end
end

function Combo()
    local target = selector:find_target(w.range, mode_health)
    if IsValid(target) then
        if menu:get_value(combo_w) == 1 and spellbook:can_cast(SLOT_W) and target:is_facing(myHero) then
            spellbook:cast_spell(SLOT_W)
        elseif menu:get_value(combo_e) == 1 and spellbook:can_cast(SLOT_E) and myHero:distance_to(target.origin) > 125 then
            local pred_output = pred:predict(e.speed, e.delay, e.range, e.width, target, false, false)
            if pred_output.can_cast then
                local castPos = pred_output.cast_pos
                spellbook:cast_spell(SLOT_E, 0.25, castPos.x, castPos.y, castPos.z)
            end
        end
    end
end

function Laneclear() -- 3+ MINIONS FOR E
	for _, minion in ipairs(game.minions) do
		if myHero:distance_to(minion.origin) < e.range and minion.is_enemy and IsValid(minion) and not myHero.is_auto_attacking then					
			local Count = GetLineTargetCount(myHero, minion, 0.25, e.speed, e.width, e.range)
			if Count >= menu:get_value(clear_e_count) then	
				spellbook:cast_spell(SLOT_E, 0.25, minion.origin.x, minion.origin.y, minion.origin.z)
			end					 
		end
	end
end

function JungleClear() -- SPAM E
	for _, minion in ipairs(game.jungle_minions) do
		if myHero:distance_to(minion.origin) < e.range and IsValid(minion) and not myHero.is_auto_attacking then				
			spellbook:cast_spell(SLOT_E, 0.25, minion.origin.x, minion.origin.y, minion.origin.z)
		end
	end
end

function Killsteal()
	for _, target in ipairs(GetEnemyHeroes()) do
		if IsValid(target) and spellbook:can_cast(SLOT_E) then
			local EDmg = getdmg("E", target, myHero, 1)
			if EDmg > target.health then
				pred_output = pred:predict(e.speed, e.delay, e.range, e.width, target, false, false)
				if pred_output.can_cast then
					castPos = pred_output.cast_pos
					spellbook:cast_spell(SLOT_E, 0.25, castPos.x, castPos.y, castPos.z)
				end
			end
		end
	end
end

function Auto_R()
    if spellbook:can_cast(SLOT_R) and myHero:health_percentage() <= menu:get_value(r_hp) then
        if menu:get_value(r_count) == 1 then
            local target = selector:find_target(750, mode_distance)
            if target.object_id ~= 0 then
                spellbook:cast_spell(SLOT_R)
            end
        elseif menu:get_value(r_count) == 0 then
            spellbook:cast_spell(SLOT_R)
        end
    end
end

-- Ult if getting attacked
function on_process_spell(obj, args)
	if menu:get_value(auto_r) == 1 and menu:get_value(r_attacked) == 1 and spellbook:can_cast(SLOT_R) then
		if obj ~= myHero and args.target.champ_name == "Tryndamere" then
			if myHero:health_percentage() <= menu:get_value(r_hp) then
				spellbook:cast_spell(SLOT_R)
			end
		end
	end
end

-- Drawing circles
function on_draw()
	if menu:get_value(enable) == 1 then
		if myHero.object_id ~= 0 then
			if myHero.is_on_screen then -- + FPS downloader hack
				x,y,z = myHero.origin.x, myHero.origin.y, myHero.origin.z
				if menu:get_value(draw_w) == 1 then
					renderer:draw_circle(x, y, z, w.range, 255, 255, 255, 255)
				end
				if menu:get_value(draw_e) == 1 then
					renderer:draw_circle(x, y, z, e.range, 255, 255, 255, 255)
				end
				if menu:get_value(draw_r_countdown) == 1 then
					if myHero:get_buff("UndyingRage").is_valid then
						r_countdown = myHero:get_buff("UndyingRage").end_time - game.game_time
						w2s = game:world_to_screen(x, y, z)
						renderer:draw_text_big_centered(w2s.x, w2s.y, string.format("%.1f", r_countdown), 255, 255, 255, 255)
					end
				end
			end
		end
	end
end

-- Event callbacks
client:set_event_callback("on_tick_always", on_tick_always)
client:set_event_callback("on_draw", on_draw)
client:set_event_callback("on_process_spell", on_process_spell)
