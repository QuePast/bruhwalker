--if file_manager:file_exists("test.png") then
--	sprite = renderer:add_sprite("test.png", 100, 100)
--end

screen_size = game.screen_size

xmid = screen_size.width / 2 -- middle of the screen
ymid = screen_size.height / 2 -- middle of the screen

xsprite = xmid - 50 -- sprite size 100px
ysprite = ymid - 50 -- sprite size 100px

local r = {xmid, ymid+85}
local g = {xmid -(math.cos(30)*85), ymid -(math.sin(30)*85)}
local b = {xmid -(math.cos(30)*85), ymid -(math.sin(30)*85)}
local a

function distance(x1, y1, x2, y2) -- distance between two points
	return math.sqrt((x2-x1)^2 + (y2-y1)^2)
end

function on_tick()
	m = game.mouse_2d
	--if spellbook:key_up_down(1) and 
	if m.x >= xsprite and m.x <= xsprite + 100 and m.y >= ysprite and m.y <= ysprite + 100 then
		SolveRed()
		SolveGreen()
		SolveBlue()
	end
end

function SolveRed(x, y)
	rvalue = 255 - distance(m.x, m.y, r[1], r[2])
			console:log(tostring(rvalue))
	if rvalue < 0 then
		rvalue = 0
		console:log(tostring(rvalue))
	end
end

function SolveGreen(x, y)
	gvalue = distance(m.x, m.y, g[1], g[2])
	if gvalue >= 255 then 
		gvalue = 255
	end
end

function SolveBlue(x, y)
	bvalue = distance(m.x, m.y, b[1], b[2])
	if bvalue >= 255 then
		gvalue = 255
	end
end

function on_draw()
--	sprite:draw(xsprite, ysprite)
--	renderer:draw_rect(xsprite, ysprite, 100, 100, rvalue, gvalue, bvalue, 100)
	renderer:draw_text(m.x + 50, m.y + 100, tostring(rvalue), 255, 255, 255, 255)
	renderer:draw_text(m.x + 50, m.y + 200, tostring(gvalue), 255, 255, 255, 255)
	renderer:draw_text(m.x + 50, m.y + 300, tostring(bvalue), 255, 255, 255, 255)
end

--]]

client:set_event_callback("on_draw", on_draw)
client:set_event_callback("on_tick", on_tick)
