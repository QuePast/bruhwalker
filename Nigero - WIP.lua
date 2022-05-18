if file_manager:file_exists("test.png") then
	sprite = renderer:add_sprite("test.png", 255, 255)
end

screen_size = game.screen_size

xmid = screen_size.width / 2 -- middle of the screen
ymid = screen_size.height / 2 -- middle of the screen

xsprite = xmid - (255/2) -- sprite size 100px
ysprite = ymid - (255/2) -- sprite size 100px

config = menu:add_category("Color pick")
scale = menu:add_slider("Scale", config, 50, 1000, 255)

local r = xmid + (255/2)
local g = ymid + (255/2)
local b = xmid - (255/2)
local a

function on_tick()
	m = game.mouse_2d
	--if spellbook:key_up_down(1) and 
	--if m.x >= xsprite and m.x <= xsprite + 100 and m.y >= ysprite and m.y <= ysprite + 100 then
		SolveRed()
		SolveGreen()
		SolveBlue()
	--end
end

function SolveRed()
	rvalue = math.floor(255 - (r - m.x))
	if rvalue < 0 then 
		rvalue = 0
	elseif rvalue > 255 then 
		rvalue = 255
	end
--	console:log(tostring(rvalue))
end

function SolveGreen()
	gvalue = math.floor(255 - (g - m.y))
	if gvalue < 0 then 
		gvalue = 0
	elseif gvalue > 255 then 
		gvalue = 255
	end
--	console:log(tostring(gvalue))
end

function SolveBlue()
	bvalue = math.floor(255 + (b - m.x))
	if bvalue < 0 then 
		bvalue = 0
	elseif bvalue > 255 then 
		bvalue = 255
	end
--	console:log(tostring(bvalue))
end

function on_draw()
	sprite:draw(xsprite, ysprite)
--	renderer:draw_rect(xsprite, ysprite+255, 255, 255, rvalue, gvalue, bvalue, 255)

--	renderer:draw_line(xmid - (255/2), ymid - (255/2), xmid - (255/2), ymid + (255/2), 1, 255, 255, 255, 255)
--	renderer:draw_line(xmid - (255/2), ymid + (255/2), xmid + (255/2), ymid + (255/2), 1, 255, 255, 255, 255)
--	renderer:draw_line(xmid + (255/2), ymid + (255/2), xmid + (255/2), ymid - (255/2), 1, 255, 255, 255, 255)
--	renderer:draw_line(xmid + (255/2), ymid - (255/2), xmid - (255/2), ymid - (255/2), 1, 255, 255, 255, 255)
	
--	renderer:draw_text(r[1], r[2], "R " .. tostring(rvalue), rvalue, gvalue, bvalue, 255)
--	renderer:draw_text(g[1], g[2], "G " .. tostring(gvalue), rvalue, gvalue, bvalue, 255)
--	renderer:draw_text(b[1], b[2], "B " .. tostring(bvalue), rvalue, gvalue, bvalue, 255)
end

client:set_event_callback("on_draw", on_draw)
client:set_event_callback("on_tick", on_tick)
