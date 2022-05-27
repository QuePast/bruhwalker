local function on_tick()
  If game:is_key_down(key) and game:is_key_down(key) then
  console:log("Game Crash")
end
end

client:set_event_callback("on_tick", on_tick)
