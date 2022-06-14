--[[
-- test opacity
0. Add opacity changer
1. Fix scalability = menu:add_slider...
- Some math behind scalability
4. Add manual input with drawing into sprite
5. Drawing dot into sprite
6. Check moving rectangles pk code and steal it if it sucks less than my solution xD
7. Rework to "library"

--- STUFF NEEDED IN SCRIPT ---

if not file_manager:file_exists("Colorpick.lua") then
	local file_name = "Colorpick.lua"
	local url = "http://raw.githubusercontent.com/Radovann/bruhwalker/main/Colorpick.lua"   	
	http:download_file(url, file_name)
end

if file_manager:file_exists("test.png") then
	sprite = renderer:add_sprite("test.png", 255, 255)
end

screen_size = game.screen_size

xmid = screen_size.width / 2 -- middle of the screen
ymid = screen_size.height / 2 -- middle of the screen
xsprite = xmid - (255/2) -- sprite size 255px
ysprite = ymid - (255/2) -- sprite size 255px

function on_draw()
	sprite:draw(xsprite, ysprite)
end
------------------------------]]
screen_size = game.screen_size

xmid = screen_size.width / 2 -- middle of the screen
ymid = screen_size.height / 2 -- middle of the screen

config = menu:add_category("Color pick")

xsprite = xmid - (255/2) -- sprite size 255px
ysprite = ymid - (255/2) -- sprite size 255px

local r = xmid + (255/2) -- right rectangle max line
local g = ymid + (255/2) -- bottom rectangle max line
local b = xmid - (255/2) -- left rectangle max line
local a = ymid - (255/2) -- opacity max line

function on_tick()
-- function solvecolor(mouse_pos.x, mouse_pos.y)
	m = game.mouse_2d
	--if game:is_key_down(0x01) and 
	--if m.x >= xsprite and m.x <= xsprite + 100 and m.y >= ysprite and m.y <= ysprite + 100 then
		SolveRed() -- distance between mouse pos.x and red line
		SolveGreen() -- green line and mouse pos y
		SolveBlue() -- blue pos and mouse pos x
		SolveOpacity() -- opacity max and mouse pos y
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

function SolveOpacity()
	avalue = math.floor(255 + (a - m.y))
	if avalue < 0 then 
		avalue = 0
	elseif avalue > 255 then 
		avalue = 255
	end
--	console:log(tostring(avalue))
end

if file_manager:file_exists("test.png") then
	sprite = renderer:add_sprite("test.png", 255, 255)
end

function on_draw()
	sprite:draw(xsprite, ysprite)
--	renderer:draw_rect(xsprite, ysprite+255, 255, 255, rvalue, gvalue, bvalue, 255)
	renderer:draw_rect(xsprite+260, ysprite, 40, 255, rvalue, gvalue, bvalue, avalue) -- opacity rectangle 
	if game:is_key_down(0x01) and m.x >= xsprite+259 and m.x <= xsprite+299 and m.y >= ysprite and m.y <= ysprite+255 then
		renderer:draw_line(xsprite+259, m.y, xsprite+299, m.y, 5, 255, 255, 255, 255) -- opacity setting line -> y changing when mouse in region and left clicked
	end

	renderer:draw_text(xsprite - 50, ysprite, "R " .. tostring(rvalue), rvalue, gvalue, bvalue, 255)
	renderer:draw_text(xsprite - 50, ysprite + 20, "G " .. tostring(gvalue), rvalue, gvalue, bvalue, 255)
	renderer:draw_text(xsprite - 50, ysprite + 40, "B " .. tostring(bvalue), rvalue, gvalue, bvalue, 255)
	renderer:draw_text(xsprite - 50, ysprite + 60, "A " .. tostring(avalue), rvalue, gvalue, bvalue, 255)
end

client:set_event_callback("on_tick", on_tick)
client:set_event_callback("on_draw", on_draw)
