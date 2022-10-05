
config = menu:add_category("Color pick")
keybind = menu:add_keybinder("Hotkey", config, 0x11)

screen_size = game.screen_size

xsprite = (screen_size.width / 2) - (255/2) -- Middle of the screen - (half of sprite width 255px)
ysprite = (screen_size.height / 2) - (255/2) -- Middle of the screen - (half of sprite height 255px)

r = (screen_size.width / 2) + (255/2) -- right rectangle max line
g = (screen_size.height / 2) + (255/2) -- bottom rectangle max line
b = (screen_size.width / 2) - (255/2) -- left rectangle max line
a = (screen_size.height / 2) - (255/2) -- opacity max line

rvalueuser = 255
gvalueuser = 255
bvalueuser = 255
avalueuser = 255

function on_tick()
	m = game.mouse_2d

	SolveRed() -- distance between mouse pos.x and red line
	SolveGreen() -- green line and mouse pos y
	SolveBlue() -- blue pos and mouse pos x
	SolveOpacity() -- opacity max and mouse pos y
end

if file_manager:file_exists("colorpick.png") then
	sprite = renderer:add_sprite("colorpick.png", 255, 255)
else
	http:download_file("https://raw.githubusercontent.com/QuePast/bruhwalker/main/ColorPick/colorpick.png", "colorpick.png")
	sprite = renderer:add_sprite("colorpick.png", 255, 255)
end

function SolveRed()
	--V2 rvalue = math.floor(255 - (((screen_size.width / 2) + (255/2)) - m.x))
	rvalue = math.floor(255 - (r - m.x))
	if rvalue < 0 then
		rvalue = 0
	elseif rvalue > 255 then
		rvalue = 255
	end
end

function SolveGreen()
	gvalue = math.floor(255 - (g - m.y))
	if gvalue < 0 then
		gvalue = 0
	elseif gvalue > 255 then
		gvalue = 255
	end
end

function SolveBlue()
	bvalue = math.floor(255 + (b - m.x))
	if bvalue < 0 then
		bvalue = 0
	elseif bvalue > 255 then
		bvalue = 255
	end
end

function SolveOpacity()
	avalue = math.floor(255 + (a - m.y))
	if avalue < 0 then
		avalue = 0
	elseif avalue > 255 then
		avalue = 255
	end
end

function on_draw()
	if game:is_key_down(menu:get_value(keybind)) then
		if avalueuser == nil then avalueuser = 255 end
		-- Draw RGB sprite
		sprite:draw(xsprite, ysprite)
		
		-- Draw dot in sprite with line; some additional boundaries because its hard to get 0 and 255 values
		if game:is_key_down(0x01) and m.x >= xsprite - 5 and m.x <= xsprite + 260 and m.y >= ysprite - 5 and m.y <= ysprite + 260 then
			rvalueuser = rvalue
			gvalueuser = gvalue
			bvalueuser = bvalue
			renderer:draw_line(m.x-5, m.y, m.x+5, m.y , 10, 255, 255, 255, 255)
		end

		-- Opacity rectangle + line
		renderer:draw_rect(xsprite+265, ysprite, 40, 255, rvalueuser, gvalueuser, bvalueuser, avalueuser)
		
		  -- Change opacity line height if in the region and left clicked; some additional boundaries because its hard to get 0 and 255 values
		if game:is_key_down(0x01) and m.x >= xsprite + 259 and m.x <= xsprite + 299 and m.y >= ysprite -5 and m.y <= ysprite + 260 then
			avalueuser = avalue
			--avalueuser = math.floor((ysprite + 255) - m.y) -- real opacity value saved from user
			renderer:draw_line(xsprite + 264, m.y, xsprite + 304, m.y, 5, 255, 255, 255, 255)
		end		
		
		-- RGBA values (top rectangle test if fits)
		renderer:draw_text(xsprite - 40, ysprite, "R " .. tostring(rvalueuser), 255, 0, 0, 255)
		renderer:draw_text(xsprite - 40, ysprite + 20, "G " .. tostring(gvalueuser), 0, 255, 0, 255)
		renderer:draw_text(xsprite - 40, ysprite + 40, "B " .. tostring(bvalueuser), 0, 0, 255, 255)
		renderer:draw_text(xsprite - 40, ysprite + 60, "A " .. tostring(avalueuser), 255, 255, 255, 255)
	end
end

-- Callbacks
client:set_event_callback("on_tick", on_tick)
client:set_event_callback("on_draw", on_draw)