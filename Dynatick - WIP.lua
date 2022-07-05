-- Dont think it would help with glitches and freezing
-- Will check once again a bit later
-- Work Suspended
-- Supposed to keep calculations when not in teamfight or game.fps is stable and above some value
-- 6/2022 project revived

function class(name)
 _G[name] = {}
 _G[name].__index = _G[name]
 local mt = {
  __call = function (self, ...) 
   local b = {}
   setmetatable(b, _G[name]) 
   if b.__init then 
    b:__init(...) 
   end 
   return b 
  end
 }
 setmetatable(_G[name], mt)
 return _G[name]
end

class "LagFreeCircles"
function LagFreeCircles:__init()
	_G.oldDrawCircle = rawget(_G, 'DrawCircle')
	_G.DrawCircle = self.DrawCircle2
	AddTickCallback(function() self:OnDrawCircles() end)
end
function LagFreeCircles:OnDrawCircles()
	if not Menu.draw.LagFree then 
		_G.DrawCircle = _G.oldDrawCircle
	else
		_G.DrawCircle = self.DrawCircle2
	end
end
function LagFreeCircles:DrawCircleNextLvl(x, y, z, radius, width, color, chordlength)
	radius = radius or 300
	quality = math.max(8,self:round(180/math.deg((math.asin((chordlength/(2*radius)))))))
	quality = 2 * math.pi / quality
	radius = radius*.92
	local points = {}
	for theta = 0, 2 * math.pi + quality, quality do
		local c = WorldToScreen(D3DXVECTOR3(x + radius * math.cos(theta), y, z - radius * math.sin(theta)))
		points[#points + 1] = D3DXVECTOR2(c.x, c.y)
	end
	DrawLines2(points, width or 1, color or 4294967295)
end
function LagFreeCircles:round(num) 
 if num >= 0 then return math.floor(num+.5) else return math.ceil(num-.5) end
end
function LagFreeCircles.DrawCircle2(x, y, z, radius, color)
    local vPos1 = Vector(x, y, z)
    local vPos2 = Vector(cameraPos.x, cameraPos.y, cameraPos.z)
    local tPos = vPos1 - (vPos1 - vPos2):normalized() * radius
    local sPos = WorldToScreen(D3DXVECTOR3(tPos.x, tPos.y, tPos.z))
    if OnScreen({ x = sPos.x, y = sPos.y }, { x = sPos.x, y = sPos.y }) then
        LagFreeCircles:DrawCircleNextLvl(x, y, z, radius, 1, color, 150) 
    end
end


----------------------------------------------------------------------------------------------------
--[[
- FPS graph tracker over-time
- Drawing hijack raytracing
 ]]--

local Class = function(...)
    local cls = {}
    cls.__index = cls
    function cls:New(...)
        local instance = setmetatable({}, cls)
        cls.__init(instance, ...)
        return instance
    end
    cls.__call = function(_, ...) return cls:New(...) end
    return setmetatable(cls, {__call = cls.__call})
end

downloadmorefps = menu:add_category("FPS Boost")
hz = menu:add_slider("Refresh rate", downloadmorefps, 60, 240, 144, "Set your monitor refresh rate")

--[[
function LagFreeCircles:Quality()
	fps = game.fps
	fpsmin = menu:get_value(hz) * 0.95
	-- reduced fpsmin in case user have locked fps
	
	if fps >= fpsmin then
		quality = 100
	else fps <= fpsmin then
		quality = 100 * (fps / fpsmin)
	end
end
]]--
local Orbwalker = Class()

function Orbwalker:__init()
    self.geometry = Geometry:New()
    client:set_event_callback("on_draw", function() self:OnDraw() end)
	console:log("loaded")
end

--------------------
-- Geometry class --

_G.Geometry = Class()

function Geometry:__init() end

function Geometry:CircleToPolygon(center, radius, steps)
    local result = {}
    for i = 0, steps - 1 do
        local phi = 2 * math.pi / steps * (i + 0.5)
        local cx = center.x + radius * math.cos(phi)
        local cy = center.z + radius * math.sin(phi)
        table.insert(result, vec3.new(cx, center.y, cy))
    end
    return result
end

function Geometry:DrawPolygon(polygon, color, width)
    local size, c, w = #polygon, color, width
    if size < 3 then return end
    for i = 1, size do
        local p1, p2 = polygon[i], polygon[i % size + 1]
        local a = game:world_to_screen_2(p1.x, p1.y, p1.z)
        local b = game:world_to_screen_2(p2.x, p2.y, p2.z)
        renderer:draw_line(a.x, a.y, b.x, b.y, w, c.r, c.g, c.b, c.a)
    end
end

function Orbwalker:OnDraw()
	m = game.turrets
	for _, v in ipairs(m) do
		local points = self.geometry:CircleToPolygon(v.origin, v.bounding_radius + 50, 5)
		local color = {r = 255, g = 255, b = 255, a = 255}
		
		self.geometry:DrawPolygon(points, color, 2)
	end
end

local orb = Orbwalker:New()
