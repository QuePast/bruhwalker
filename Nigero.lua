if file_manager:file_exists("test.png") then
	sprite = renderer:add_sprite("test.png", 100, 100)
end

local r = (-(math.cos(math.deg(30))*85), -(math.sin(math.deg(30)*85)))
local g = ((math.cos(math.deg(30))*85), -(math.sin(math.deg(30)*85)))
local b = (0, 85)
local blackhole

m = game.mouse_2d
screen_size = game.screen_size

xmid = screen_size.width / 2
ymid = screen_size.height / 2

xsprite = xmin - 50 -- sprite size 100
ysprite = ymid - 50 -- sprite size 100

function distance(x1, y1, x2, y2)
	return math.sqrt((x2-x1)^2 + (y2-y1)^2)
end

local function on_tick()
	if left click down 
		& x bigger than xsprite & x lower than xsprite + 100
		& y bigger than ysprite & y lower than ysprite + 100
		return distance(m.x, m.y, r.x, r.y)
		return distance(m.x, m.y, g.x, g.y)
		return distance(m.x, m.y, b.x, b.y)

local function on_draw()
	sprite:draw(xsprite, ysprite)
end

client:set_event_callback("on_draw", on_draw)
client:set_event_callback("on_tick", on_draw)
