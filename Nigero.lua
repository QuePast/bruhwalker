if file_manager:file_exists("test.png") then
	sprite = renderer:add_sprite("test.png", 100, 100)
end

local r = (-(math.cos(math.deg(30))*85), -(math.sin(math.deg(30)*85)))
local g = ((math.cos(math.deg(30))*85), -(math.sin(math.deg(30)*85)))
local b = (0, 85)
local a

screen_size = game.screen_size

xmid = screen_size.width / 2 -- middle of the screen
ymid = screen_size.height / 2 -- middle of the screen

xsprite = xmin - 50 -- sprite size 100px
ysprite = ymid - 50 -- sprite size 100px

function distance(x1, y1, x2, y2) -- distance between two points
	return math.sqrt((x2-x1)^2 + (y2-y1)^2)
end

local function on_tick()
	if spellbook:key_down_int(0x01) and m.x >= xsprite and m.x <= xsprite + 100 and m.y >= ysprite and m.y <= ysprite + 100 then
		SolveRed()
		SolveGreen()
		SolveBlue()
		end
	end
end

local function SolveRed(x, y)
	m = game.mouse_2d
	rvalue = distance(m.x, m.y, r.x, r.y)
end

local function SolveGreen(x, y)
	m = game.mouse_2d
	gvalue = distance(m.x, m.y, g.x, g.y)
end

local function SolveBlue(x, y)
	m = game.mouse_2d
	bvalue = distance(m.x, m.y, b.x, b.y)
end

local function on_draw()
	sprite:draw(xsprite, ysprite)
	renderer:draw_rect(xsprite, ysprite, 100, -100, rvalue, gvalue, bvalue, 100)
end

client:set_event_callback("on_draw", on_draw)
client:set_event_callback("on_tick", on_draw)
