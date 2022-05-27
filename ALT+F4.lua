local function on_tick()
  If game:is_key_down(0x12) and game:is_key_down(0x73) then
    console:log("Game Crash")
  end
end

client:set_event_callback("on_tick", on_tick)
