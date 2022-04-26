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
--]]

Champs = {
		["Aphelios"] = {
			{Slot = "Q", Qwindwall = true, Qcollision = true},
			{Slot = "R", Rwindwall = false, Rcollision = true}
	},
		["Senna"] = {
			{Slot = "W", Qwindwall = true, Wcollision = false},
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
			{Slot = "W", Wwindwall = true, Wcollision = false},
	},
		["Caitlyn"] = {
			{Slot = "Q", Qwindwall = true, Qcollision = false},
			{Slot = "E", Ewindwall = true, Ecollision = true},
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
			{Slot = "Q", Qwindwall = true, Qcollision = false},
			--{Slot = "E", Ewindwall = true, Ecollision = false}
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
			{Slot = "Q", Qwindwall = true, Qcollision = false},
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
			{Slot = "E", Ewindwall = true, Ecollision = false},
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
			{Slot = "Q", Qwindwall = true, Qcollision = true},
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
			{Slot = "R", Rwindwall = true, Rcollision = false},
    },
		["Zed"] = {
			{Slot = "Q", Qwindwall = true, Qcollision = false},
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

local myHero = game.local_player
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
	pred_output = pred:predict(qspeed, 0, qrange, qwidth, unit, Qcollision, Qwindwall)
	if pred_output.can_cast then
		castPos = pred_output.cast_pos
		spellbook:cast_spell(SLOT_Q, 0, castPos.x, castPos.y, castPos.z) 			
	end	
end	

local function CastW(unit)
	pred_output = pred:predict(wspeed, 0, wrange, wwidth, unit, Wcollision, Wwindwall)
	if pred_output.can_cast then
		castPos = pred_output.cast_pos
		spellbook:cast_spell(SLOT_W, 0, castPos.x, castPos.y, castPos.z) 			
	end	
end	

local function CastE(unit)
	pred_output = pred:predict(espeed, 0, erange, ewidth, unit, Ecollision, Ewindwall)
	if pred_output.can_cast then
		castPos = pred_output.cast_pos
		spellbook:cast_spell(SLOT_E, 0, castPos.x, castPos.y, castPos.z) 			
	end	
end	

local function CastR(unit)
	pred_output = pred:predict(rspeed, 0, rrange, rwidth, unit, Rcollision, Rcollision)
	if pred_output.can_cast then
		castPos = pred_output.cast_pos
		spellbook:cast_spell(SLOT_R, 0, castPos.x, castPos.y, castPos.z) 			
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

client:set_event_callback("on_tick", on_tick)

--[[ MISSCLICK PLUGIN CODE 10%
-- 1. ENEMY PLAYERS ( NOT LUX W )
players = game.players

for _, v in ipairs(players) do
	champ_name = v.champ_name
	
	console:log(champ_name)
end

-- 2. ENEMY MINIONS (??ALL collision spells??)
minions = game.minions

for _, v in ipairs(minions) do
end

-- 3. ENEMY PETS (??ALL collision spells??)
pets= game.pets

for _, v in ipairs(pets) do
end

-- 4. JUNGLE PLANTS (??ALL collision spells??)
jungle_minions= game.jungle_minions

for _, v in ipairs(jungle_minions) do
end

-- 5. ENEMY TURRETS (Ezreal W)
turrets= game.turrets

for _, v in ipairs(turrets) do
end

-- 6. ENEMY INHIBS (Ezreal W)
inhibs = game.inhibs

for _, v in ipairs(inhibs) do
end

-- 7. ALLY PLAYERS ( LUX W )
players = game.players

for _, v in ipairs(players) do
	champ_name = v.champ_name
	
	console:log(champ_name)
end

ARK COPYPASTA
--------------------------
-- Object Manager class --

local ObjectManager = Class()

function ObjectManager:__init() end

function ObjectManager:GetAllyHeroes(range)
    local pos = myHero.path.server_pos
    return Linq(game.players):Where(function(u)
        return Data:IsValid(u) and not u.is_enemy and
            u.object_id ~= myHero.object_id and range >=
            Geometry:Distance(pos, u.path.server_pos)
    end)
end

function ObjectManager:GetAllyMinions(range)
    local pos = myHero.path.server_pos
    return Linq(game.minions):Where(function(u)
        return Data:IsValid(u) and not u.is_enemy and
            Geometry:Distance(pos, u.origin) <= range
    end)
end

function ObjectManager:GetEnemyHeroes(range)
    local pos = myHero.path.server_pos
    return Linq(game.players):Where(function(u)
        return Data:IsValid(u) and u.is_enemy
            and (range and Geometry:Distance(
            pos, u.path.server_pos) <= range
            or Geometry:IsInAutoAttackRange(u))
    end)
end

function ObjectManager:GetEnemyMinions()
    return Linq(game.minions):Where(function(u)
        return Data:IsValid(u) and u.is_enemy
            and Geometry:IsInAutoAttackRange(u)
    end)
end

function ObjectManager:GetEnemyMonsters()
    return Linq(game.jungle_minions):Where(function(u)
        return Data:IsValid(u) and u.is_enemy
            and Geometry:IsInAutoAttackRange(u)
    end)
end

function ObjectManager:GetEnemyPets()
    return Linq(game.pets):Where(function(u)
        return Data:IsValid(u) and u.is_enemy
            and Geometry:IsInAutoAttackRange(u)
    end)
end

function ObjectManager:GetEnemyStructure()
    return Linq(game.nexus):Concat(
        game.inhibs):First(function(t)
        return Data:IsValid(t) and t.is_enemy
            and Geometry:IsInAutoAttackRange(t)
    end)
end

function ObjectManager:GetEnemyTurret()
    return Linq(game.turrets):First(function(t)
        return Data:IsValid(t) and t.is_enemy
            and Geometry:IsInAutoAttackRange(t)
    end)
end

--]]
