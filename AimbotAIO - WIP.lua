-- [ AutoUpdate ]
--[[do  
    local function AutoUpdate()
		local Version = 1
		local file_name = "AimbotAIO.lua"
		local url = "https://raw.githubusercontent.com/Radovann/bruh/main/champions/AimbotAIO.lua"        
        local web_version = http:get("https://raw.githubusercontent.com/Radovann/bruh/main/champions/AimbotAIO.version")
        console:log("AimbotAIO.Lua Vers: "..Version)
		console:log("AimbotAIO.Web Vers: "..tonumber(web_version))
		if tonumber(web_version) == Version then
            console:log("AIO successfully loaded....")
        else
			http:download_file(url, file_name)
            console:log("Update available....")
			console:log("Please reload via F5....")
        end
    
    end
    
    AutoUpdate()

end
V2 EXAMPLE
	["Annie"] = {
		{Slot = "W", Type = Cone, Wwindwall = true, Wcollision = false},
		{Slot = "R", Type = Circle, Rwindwall = true, Rcollision = false}
	},    
-- Q, spell type(circular, line, charged), windwall, collision
--]]
Champs = {
	["Aphelios"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true},
		{Slot = "R", Rwindwall = false, Rcollision = true}
	},
	["Senna"] = {
		{Slot = "W", Qwindwall = true, Wcollision = false}
	},
	["Aatrox"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true},
		{Slot = "E", Ewindwall = true, Ecollision = true}
	},
	["Ahri"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true},
		{Slot = "E", Ewindwall = true, Ecollision = true}
	},
	["Amumu"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true}
	},           
	["Anivia"] = {   
		{Slot = "Q", Qwindwall = true, Qcollision = true}
	},
	["Annie"] = {
		{Slot = "W", Wwindwall = true, Wcollision = false},
		{Slot = "R", Rwindwall = true, Rcollision = false}
	},
	["Ashe"] = {
		{Slot = "W", Wwindwall = true, Wcollision = true},
		{Slot = "R", Rwindwall = true, Rcollision = false}
	},
	["Blitzcrank"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true}
	},
	["Brand"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true},
		{Slot = "W", Wwindwall = true, Wcollision = false}
	},
	["Caitlyn"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = false},
		{Slot = "E", Ewindwall = true, Ecollision = true}
	},
	["Cassiopeia"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = false},
		{Slot = "W", Wwindwall = true, Wcollision = true},
		{Slot = "R", Rwindwall = true, Rcollision = true}
	},
	["Chogath"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = false},
		{Slot = "W", Wwindwall = true, Wcollision = false}
	},
	["Corki"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = false},
		{Slot = "R", Rwindwall = true, Rcollision = true}
	},
	["Darius"] = {
		{Slot = "E", Ewindwall = true, Ecollision = false}
	},
	["Diana"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = false}
	},
	["DrMundo"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true}
	},
	["Draven"] = {
		{Slot = "E", Ewindwall = true, Ecollision = false},
		{Slot = "R", Rwindwall = true, Rcollision = false}
	},
	["Elise"] = {
		{Slot = "E", Ewindwall = true, Ecollision = true}
	},
	["Ezreal"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true},
		{Slot = "W", Wwindwall = true, Wcollision = false},
		{Slot = "R", Rwindwall = true, Rcollision = true}
	},
	["Fizz"] = {
		{Slot = "R", Rwindwall = true, Rcollision = false}
	},
	["Galio"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = false}
	},
	["Gragas"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = false}
	},
	["Graves"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true},
		{Slot = "W", Wwindwall = true, Wcollision = false},
		{Slot = "R", Rwindwall = true, Rcollision = true}
	},
	["Heimerdinger"] = {
		{Slot = "W", Wwindwall = true, Wcollision = true},
		{Slot = "E", Ewindwall = true, Ecollision = false}
	},
	["Irelia"] = {
		{Slot = "R", Rwindwall = true, Rcollision = false}
	},
	["JarvanIV"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = false},
		{Slot = "E", Ewindwall = true, Ecollision = false}
	},
	["Jinx"] = {
		{Slot = "W", Wwindwall = true, Wcollision = true},
		{Slot = "E", Ewindwall = true, Ecollision = false},
		{Slot = "R", Rwindwall = true, Rcollision = false}
	},
	["Karma"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true}
	},
	["Karthus"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = false}
	},
	["Kennen"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true}
	},                   
	["Khazix"] = {   
		{Slot = "W", Wwindwall = true, Wcollision = true}
	},                   
	["KogMaw"] = {   
		{Slot = "R", Rwindwall = true, Rcollision = false}
	},
	["Leblanc"] = {
		{Slot = "E", Ewindwall = true, Ecollision = false},
		{Slot = "R", Rwindwall = true, Rcollision = false}
	},
	["LeeSin"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true}
	},
	["Leona"] = {
		{Slot = "E", Ewindwall = true, Ecollision = false},
		{Slot = "R", Rwindwall = true, Rcollision = false}
	},
	["Lucian"] = {
		{Slot = "W", Wwindwall = true, Wcollision = true}
	},
	["Lulu"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true}
	},
	["Lux"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true},
		{Slot = "E", Ewindwall = true, Ecollision = false},
		{Slot = "R", Rwindwall = true, Rcollision = false}
	},
	["Malzahar"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true}
	},
        ["Mordekaiser"] = {
		{Slot = "E", Ewindwall = true, Ecollision = false}
	},
	["Morgana"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true}
	},
	["Nami"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = false}
	},
	["Nautilus"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true}
	},
	["Nidalee"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true}
	},
	["Nocturne"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = false}
	},
	["Olaf"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = false}
	},
	["Quinn"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true}
	},
	["Rakan"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true}
	},
	["Rumble"] = {
		{Slot = "E", Ewindwall = true, Ecollision = true}
	},
	["Sejuani"] = {
		{Slot = "R", Rwindwall = true, Rcollision = false}
	},
	["Sivir"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = false}
	},
	["Skarner"] = {
		{Slot = "E", Ewindwall = true, Ecollision = false}
	},
	["Swain"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = false}
	},
	["Syndra"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = false}
	},
	["Thresh"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true}
	},
	["Twitch"] = {
		{Slot = "W", Wwindwall = true, Wcollision = false}
	},
	["TwistedFate"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = false}
	},
	["Urgot"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true },
		{Slot = "E", Ewindwall = true, Ecollision = false}
	},
	["Varus"] = {
		{Slot = "E", Ewindwall = true, Ecollision = false},
		{Slot = "R", Rwindwall = true, Rcollision = false}
	},
	["Veigar"] = {
		{Slot = "W", Wwindwall = true, Wcollision = false}
	},
	["Viktor"] = {
		{Slot = "W", Wwindwall = true, Wcollision = false},
		{Slot = "E", Ewindwall = true, Ecollision = false},
		{Slot = "R", Rwindwall = true, Rcollision = false}
	},
	["Velkoz"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = true},
		{Slot = "W", Wwindwall = true, Wcollision = false},
		{Slot = "E", Ewindwall = true, Ecollision = false}
	},    
	["Xerath"] = {
		{Slot = "R", Rwindwall = true, Rcollision = false}
	},
	["Zed"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = false}
	},
	["Ziggs"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = false},
		{Slot = "W", Wwindwall = true, Wcollision = false},
		{Slot = "E", Ewindwall = true, Ecollision = false},
		{Slot = "R", Rwindwall = true, Rcollision = false}
	},
	["Zyra"] = {
		{Slot = "Q", Qwindwall = true, Qcollision = false},
		{Slot = "E", Ewindwall = true, Ecollision = false}
	}
}

pred:use_prediction()

local blah = { ["Q"] = "Q", ["W"] = "W", ["E"] = "E", ["R"] = "R" }
local keybindings = { ["Q"] = "81", ["W"] = "87", ["E"] = "69", ["R"] = "82" }

config = menu:add_category("Aimbot by Radovan")
spell_enable = menu:add_checkbox("Enable", config , 1)

spellsa = menu:add_subcategory(game.local_player.champ_name .." settings", config)

if Champs[game.local_player.champ_name] then
	console:log( game.local_player.champ_name .. " is supported") else
	console:log( game.local_player.champ_name .. " is not supported")
	return 
end

if not Champs[game.local_player.champ_name] then return end

if Champs[game.local_player.champ_name] then
	for i, spells in pairs(Champs[game.local_player.champ_name]) do
		if spells.Slot == "Q" then 
			spellmenuq = menu:add_keybinder("Q Key", spellsa, 81)
			spellmenu_enableq = menu:add_checkbox("Q Enabled", spellsa, 1)
			qrange = spellbook:get_spell_slot(SLOT_Q).spell_data.cast_range
			qspeed = spellbook:get_spell_slot(SLOT_Q).spell_data.missile_speed
			qwidth = spellbook:get_spell_slot(SLOT_Q).spell_data.width
		elseif spells.Slot == "W" then 
			spellmenuw = menu:add_keybinder("W Key", spellsa, 87)
			spellmenu_enablew = menu:add_checkbox("W Enabled", spellsa, 1)
			wrange = spellbook:get_spell_slot(SLOT_W).spell_data.cast_range
			wspeed = spellbook:get_spell_slot(SLOT_W).spell_data.missile_speed
			wwidth = spellbook:get_spell_slot(SLOT_W).spell_data.width
		elseif spells.Slot == "E" then 
			spellmenue = menu:add_keybinder("E Key", spellsa, 69)
			spellmenu_enablee = menu:add_checkbox("E Enabled", spellsa, 1)
			erange = spellbook:get_spell_slot(SLOT_E).spell_data.cast_range
			espeed = spellbook:get_spell_slot(SLOT_E).spell_data.missile_speed
			ewidth = spellbook:get_spell_slot(SLOT_E).spell_data.width
		elseif spells.Slot == "R" then 
			spellmenur = menu:add_keybinder("R Key", spellsa, 82)
			spellmenu_enabler = menu:add_checkbox("R Enabled", spellsa, 1)	
			rrange = spellbook:get_spell_slot(SLOT_R).spell_data.cast_range
			rspeed = spellbook:get_spell_slot(SLOT_R).spell_data.missile_speed
			rwidth = spellbook:get_spell_slot(SLOT_R).spell_data.width
		end
	end
end 

local function Ready(spells)
    return spellbook:can_cast(spells)
end

local function CastQ(unit)
	pred_output = pred:predict(qspeed, 0.2, qrange, qwidth, unit, Qcollision, Qwindwall)
	if pred_output.can_cast then
		castPos = pred_output.cast_pos
		spellbook:cast_spell(SLOT_Q, 0.3, castPos.x, castPos.y, castPos.z)
	end
end

local function CastW(unit)
	pred_output = pred:predict(wspeed, 0.2, wrange, wwidth, unit, Wcollision, Wwindwall)
	if pred_output.can_cast then
		castPos = pred_output.cast_pos
		spellbook:cast_spell(SLOT_W, 0.3, castPos.x, castPos.y, castPos.z)
	end
end

local function CastE(unit)
	pred_output = pred:predict(espeed, 0.2, erange, ewidth, unit, Ecollision, Ewindwall)
	if pred_output.can_cast then
		castPos = pred_output.cast_pos
		spellbook:cast_spell(SLOT_E, 0.3, castPos.x, castPos.y, castPos.z)
	end
end

local function CastR(unit)
	pred_output = pred:predict(rspeed, 0.2, rrange, rwidth, unit, Rcollision, Rcollision)
	if pred_output.can_cast then
		castPos = pred_output.cast_pos
		spellbook:cast_spell(SLOT_R, 0.3, castPos.x, castPos.y, castPos.z)
	end
end

local function Castspell_Q()
	target = selector:find_target(qrange, cursor)
	if target.object_id ~= 0 and Ready(SLOT_Q) then
		if myHero:distance_to(target.origin) <= qrange  then
			CastQ(target)
		end
	end
end

local function Castspell_W()
	target = selector:find_target(wrange, cursor)
	if target.object_id ~= 0 and Ready(SLOT_W) then
		if myHero:distance_to(target.origin) <= wrange  then
			CastW(target)
		end
	end
end

local function Castspell_E()
	target = selector:find_target(erange, cursor)
	if target.object_id ~= 0 and Ready(SLOT_E) then
		if myHero:distance_to(target.origin) <= erange  then
			CastE(target)
		end           
	end	 
end

local function Castspell_R()
	target = selector:find_target(rrange, cursor)   
	if target.object_id ~= 0 and Ready(SLOT_R) then
		if myHero:distance_to(target.origin) <= rrange  then
			CastR(target)
		end
	end
end

function on_tick()
	GetEnemyHeroes()
	for i, spells in pairs(Champs[game.local_player.champ_name]) do
		if spells.Slot == "Q" then
			if game:is_key_down(menu:get_value(spellmenuq)) and menu:get_value(spellmenu_enableq) == 1 then
				Castspell_Q()
			end
		elseif spells.Slot == "W" then
			if game:is_key_down(menu:get_value(spellmenuw)) and menu:get_value(spellmenu_enablew) == 1 then
				Castspell_W()
			end
		elseif spells.Slot == "E" then
			if game:is_key_down(menu:get_value(spellmenue)) and menu:get_value(spellmenu_enablee) == 1 then
				Castspell_E()
			end
		elseif spells.Slot == "R" then
			if game:is_key_down(menu:get_value(spellmenur)) and menu:get_value(spellmenu_enabler) == 1 then
				Castspell_R()
			end
		end
	end
end

function on_draw()
	renderer:draw_circle(x, y, z, radius, r, g, b, a) -- Q + Color
	renderer:draw_circle(x, y, z, radius, r, g, b, a) -- W + Color
	renderer:draw_circle(x, y, z, radius, r, g, b, a) -- E + Color
	renderer:draw_circle(x, y, z, radius, r, g, b, a) -- R + Color
	renderer:draw_line(x, y, x2, y2, w, r, g, b, a) -- Draw target mouse.pos <100> target
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
