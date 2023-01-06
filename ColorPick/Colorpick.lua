
config = menu:add_category("Color pick")
keybind = menu:add_keybinder("Hotkey", config, 0x11)

screen_size = game.screen_size
sprite_size = 255
half_size = sprite_size / 2

xsprite = (screen_size.width / 2) - half_size
ysprite = (screen_size.height / 2) - half_size

red = (screen_size.width / 2) + half_size
green = (screen_size.height / 2) + half_size
blue = (screen_size.width / 2) - half_size
alfa = (screen_size.height / 2) - half_size

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
	rvalue = update_colors(red, m.x, -1)
end

function SolveGreen()
	gvalue = update_colors(green, m.y, -1)
end

function SolveBlue()
	bvalue = update_colors(blue, m.x, 1)
end

function SolveOpacity()
	avalue = update_colors(alfa, m.y, 1)
end

function update_colors(line, m, zeroing)
	local value = math.floor(255 + (zeroing*(line - m)))
	if value < 0 then
		value = 0
	elseif value > 255 then
		value = 255
	end
	return value
end

function on_draw()
	if game:is_key_down(menu:get_value(keybind)) then
		if not avalueuser then avalueuser = 255 end
		-- Draw RGB sprite
		sprite:draw(xsprite, ysprite)
		
		-- Draw dot in sprite with line; some additional boundaries because its hard to get 0 and 255 values
		if game:is_key_down(0x01) and m.x >= xsprite - 5 and m.x <= xsprite + 260 and m.y >= ysprite - 5 and m.y <= ysprite + 260 then
			rvalueuser, gvalueuser, bvalueuser = rvalue, gvalue, bvalue
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
