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
