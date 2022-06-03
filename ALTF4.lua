local function on_tick()
  if game:is_key_down(0x12) and game:is_key_down(0x73) then -- reworked to right alt since the left one doesnt work
    console:log(GAYFALL) -- kek
  end
end

client:set_event_callback("on_tick", on_tick)
