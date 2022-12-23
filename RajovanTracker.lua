data = menu:add_category("Data Mining")
getdata = menu:add_checkbox("Test", data, 0)

do
    local function AutoUpdate()
		local Version = 0.1
        local web_version = http:get("https://raw.githubusercontent.com/TheShaunyboi/BruhWalkerEncrypted/main/Tracker/RajoTracker.lua.version.txt")
		if not tonumber(web_version) == Version then
			http:download_file("https://raw.githubusercontent.com/QuePast/Bruhwalker/main/Tracker/download.bat", "RajovanTracker//download.bat")
			http:download_file("https://raw.githubusercontent.com/QuePast/Bruhwalker/main/Tracker/upload.bat", "RajovanTracker//upload.bat")
			http:download_file("https://raw.githubusercontent.com/QuePast/Bruhwalker/main/Tracker/RajoTracker.lua", "RajovanTracker//RajoTracker.lua")
        else end
    end
    AutoUpdate()
end

--function on_game_end()
function on_tick()
	if menu:get_value(getdata) == 1 then
	-- Do we have anything to write to ?
	-- Add file exist check and download from github
	filepathdownload = os.getenv('LOCALAPPDATA') .."/leaguesense/scripts/RajovanTracker/download.exe"
	os.execute(filepathdownload)

	-- Locate stats file
	filepath = os.getenv('LOCALAPPDATA') .."/leaguesense/scripts/RajovanTracker/stats.txt"
	file = io.open(filepath, "a")
	
	-- Write game info into stats.exe
	file:write("\nChampion = " ..game.local_player.champ_name.. "; Kills = "..game.local_player.player_stats.kills.. "; Deaths = "..game.local_player.player_stats.deaths.. "; Assists = "..game.local_player.player_stats.assists.. "; Ping = "..game.ping.. "; Time = "..game.game_time.. "; Circle Thickness = "..menu:get_value_string("circle quality", "settings").. "; Tick = "..menu:get_value_string("tick", "settings")..", ")
	file:close()
	
	-- Do we have sending instruction ? If not download .bat file
	-- Add file exist check and download from github
	Batfile = file_manager:file_exists(os.getenv('LOCALAPPDATA') .."upload.bat")
	if Batfile == false then
		http:download_file("http://github.com/quepast/bruhwalker/RajovanTracker/upload.exe" , "/leaguesense/scripts/RajovanTracker/upload.exe")
	end

	-- Locate bat file and execute
	filepathupload = os.getenv('LOCALAPPDATA') .."/leaguesense/scripts/RajovanTracker/upload.exe"
	os.execute(filepathupload)

	menu:set_value(getdata, 0)
	end
end

--client:set_event_callback("on_game_end", on_game_end)
client:set_event_callback("on_tick", on_tick)