if file_manager:file_exists("test.png") then
	sprite = renderer:add_sprite("test.png", 400, 400)
end

screen_size = game.screen_size

xmid = screen_size.width / 2 -- middle of the screen
ymid = screen_size.height / 2 -- middle of the screen

xsprite = xmid - 200 -- sprite size 100px
ysprite = ymid - 200 -- sprite size 100px

config = menu:add_category("Color pick")
scale = menu:add_slider("Scale", config, 50, 1000, 180)

local r = {xmid, ymid - menu:get_value(scale)}
local g = {xmid -(math.cos(math.rad(30))) * menu:get_value(scale), ymid +(math.sin(math.rad(30))) * menu:get_value(scale)}
local b = {xmid +(math.cos(math.rad(30))) * menu:get_value(scale), ymid +(math.sin(math.rad(30))) * menu:get_value(scale)}
local a

--console:log(tostring(r[1]))
--console:log(tostring(r[2]))
--console:log(tostring(g[1]))
--console:log(tostring(g[2]))
--console:log(tostring(b[1]))
--console:log(tostring(b[2]))

function distance(x1, y1, x2, y2) -- distance between two points
	return math.sqrt((x2-x1)^2 + (y2-y1)^2)
end

function on_tick()
	m = game.mouse_2d
	--if spellbook:key_up_down(1) and 
	--if m.x >= xsprite and m.x <= xsprite + 100 and m.y >= ysprite and m.y <= ysprite + 100 then
		SolveRed()
		SolveGreen()
		SolveBlue()
	--end
end

function SolveRed(x, y)
	rvalue = math.floor(255 - distance(m.x, m.y, r[1], r[2]))
	if rvalue < 0 then
		rvalue = 0
	end
end

function SolveGreen(x, y)
	gvalue = math.floor(255 - distance(m.x, m.y, g[1], g[2]))
	if gvalue < 0 then 
		gvalue = 0
	end
end

function SolveBlue(x, y)
	bvalue = math.floor(255 - distance(m.x, m.y, b[1], b[2]))
	if bvalue < 0 then
		bvalue = 0
	end
end

function on_draw()
	sprite:draw(xsprite, ysprite)
	renderer:draw_rect(xsprite, ysprite, 400, 400, rvalue, gvalue, bvalue, 50)
--	minimap:draw_circle(x, y, z, 42.5, 0, 255, 0, 255)
--	minimap:draw_circle(x, y, z, 42.5, 0, 0, 255, 255)
	renderer:draw_line(r[1], r[2], g[1], g[2], 1, 255, 255, 255, 255)
	renderer:draw_line(g[1], g[2], b[1], b[2], 1, 255, 255, 255, 255)
	renderer:draw_line(b[1], b[2], r[1], r[2], 1, 255, 255, 255, 255)
	renderer:draw_text(r[1], r[2], "R " .. tostring(rvalue), rvalue, gvalue, bvalue, 255)
	renderer:draw_text(g[1], g[2], "G " .. tostring(gvalue), rvalue, gvalue, bvalue, 255)
	renderer:draw_text(b[1], b[2], "B " .. tostring(bvalue), rvalue, gvalue, bvalue, 255)
end

--]]

client:set_event_callback("on_draw", on_draw)
client:set_event_callback("on_tick", on_tick)
