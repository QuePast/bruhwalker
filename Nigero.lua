local r = (-(math.cos(math.deg(30))*85), -(math.sin(math.deg(30)*85)))
local g = ((math.cos(math.deg(30))*85), -(math.sin(math.deg(30)*85)))
local b = (0, 85)
local blackhole



function distance(x1, y1, x2, y2)
	return math.sqrt((x2-x1)^2 + (y2-y1)^2)
end
