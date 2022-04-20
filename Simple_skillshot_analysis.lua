local blitz_in_game = false
local blitz_obj = nil
if game.local_player.champ_name ~= "Blitzcrank" then
    for i, champ in ipairs(game.players) do
        if champ.champ_name == "Blitzcrank" then
            blitz_in_game = true
            blitz_obj = champ
        end
    end
else
    blitz_in_game = true
end

if not blitz_in_game then
    return
end

blitz = menu:add_category("Blitz Hook Tracker")
enabled = menu:add_checkbox("Enabled", blitz, 1)
print_options = menu:add_subcategory("Print Options", blitz)
print_console = menu:add_checkbox("Print in Console", print_options, 1)
print_chat = menu:add_combobox("Print in League Chat Mode", print_options, {"Off", "Team Chat", "All Chat"}, 2)
drawing_options = menu:add_subcategory("Drawing Options", blitz)
draw_percent = menu:add_checkbox("Draw Percentage", drawing_options, 1)
draw_x_position = menu:add_slider("Draw Percentage X Position", drawing_options, 0, tonumber(game.screen_size.width), tonumber(game.screen_size.width) / 2)
draw_y_position = menu:add_slider("Draw Percentage Y Position", drawing_options, 0, tonumber(game.screen_size.height), 0)

local_player = game.local_player

hooks_thrown = 0
hooks_hit = 0
last_hook = nil
hook_range = 1150
hook_velocity = 1800
hook_time = (hook_velocity / hook_range)
printed = false

local function on_process_spell(obj, args)
    if menu:get_value(enabled) == 1 then
        if args.spell_name == "RocketGrab" then
            hooks_thrown = hooks_thrown + 1
            last_hook = game.game_time
            printed = false
        end
    end
end

local function on_buff_active(obj, buff_name)
    if menu:get_value(enabled) == 1 then
        if buff_name == "rocketgrab2" then
            hooks_hit = hooks_hit + 1
            printed = false
        end
    end
end

local hit_perc = 0
local text_string = "Blitzcrank Hook Score: " .. tostring(hooks_hit) .. "/" .. tostring(hooks_thrown) .. " (" .. tostring(math.floor(hit_perc + 0.5)) .. "%%)"
local function on_tick()
    if menu:get_value(enabled) == 1 then
        if hooks_thrown ~= 0 then
            hit_perc = (hooks_hit / hooks_thrown) * 100
        end
        if last_hook then
            if (game.game_time > last_hook + hook_time) and not printed then
                text_string = "Blitzcrank Hook Score: " .. tostring(hooks_hit) .. "/" .. tostring(hooks_thrown) .. " (" .. tostring(math.floor(hit_perc + 0.5)) .. "%%)"
                local chat_string = "Blitzcrank Hook Score: " .. tostring(hooks_hit) .. "/" .. tostring(hooks_thrown) .. " (" .. tostring(math.floor(hit_perc + 0.5)) .. "%)"
                if menu:get_value(print_console) == 1 then
                    console:log(text_string)
                end
                if menu:get_value(print_chat) == 1 then
                    game:send_chat(chat_string)
                elseif menu:get_value(print_chat) == 2 then
                    game:send_chat("/all " .. chat_string)
                end
                printed = true
            end
        end
    end
end

local function on_draw()
    if menu:get_value(enabled) == 1 then
        if menu:get_value(draw_percent) == 1 then
            renderer:draw_text_centered(menu:get_value(draw_x_position), menu:get_value(draw_y_position), text_string)
        end
    end
end

client:set_event_callback("on_process_spell", on_process_spell)
client:set_event_callback("on_buff_active", on_buff_active)
client:set_event_callback("on_tick", on_tick)
client:set_event_callback("on_draw", on_draw)
