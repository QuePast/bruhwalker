-- Crash the game in case a internall spellcast bug happens
local function on_tick()
  if game:is_key_down(0x73) then -- F4
    console:log(GAYFALL) -- kek
  end
end

client:set_event_callback("on_tick", on_tick)
