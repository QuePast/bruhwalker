import json
import requests

url = 'https://raw.communitydragon.org/latest/game/global/champions/champions.bin.json'
response = requests.get(url)
data = response.json()

# Get the list of champion names from the keys of the data dictionary
champions = [key.split('/')[-1] for key in data.keys()]

# Remove TFTChampion from the list of champion names
champions = [name for name in champions if name != 'TFTChampion']
#champions = [name for name in champions if name == 'Ashe']
# Sort the list alphabetically
champions = sorted(champions)

# Open a file for writing
with open('spells.lua', 'w') as f:
    # Write the start of the table definition
    f.write('Champs = {\n')

    # Loop over the champion names
    for champion in champions:
        # Load the JSON data
        response = requests.get(f'https://raw.communitydragon.org/latest/game/data/characters/{champion.lower()}/{champion.lower()}.bin.json')
        data = json.loads(response.text)

        champion_name = champion

        if "mAbilities" in data[f'Characters/{champion_name}/CharacterRecords/Root']:
            # Get the ability names
            ability_paths = data[f'Characters/{champion_name}/CharacterRecords/Root']['mAbilities']

            # Write the champion name and start of the spell list
            f.write(f'\t["{champion_name}"] = {{\n')

            # Loop over the abilities
            for ability_name in ability_paths:
                ability_data = data[f"{ability_name}"]["mChildSpells"]
                
                for script_name_full in ability_data:
                    script_name = data[f"{script_name_full}"]['mScriptName']
                    print(script_name)
                    print(script_name_full)
                    if "mSpell" in data[f"{script_name_full}"]:
                        if 'mTargetingTypeData' in data[f"{script_name_full}"]['mSpell']:
                            root_type = data[f"{script_name_full}"]['mSpell']['mTargetingTypeData']['__type']
                            if root_type != "SelfAoe" and root_type != "TargetOrLocation" and root_type != "Self" and root_type != "TerrainLocation" and root_type != "TerrainType" and root_type != "DragDirection" and root_type != "WallDetection":
                                if root_type == "Direction":
                                    root_type = "linear"
                                if root_type == "Location" or root_type == "LocationClamped" or root_type == "Area" or root_type == "AreaClamped":
                                    root_type = "circular"
                                if root_type == "Cone":
                                    root_type = "cone"
                                # Write the spell name and root type
                                f.write(f'\t\t{{spell_name = "{script_name}", root_type = "{root_type}"}},\n')
    
            # End the spell list and champion definition
            f.write('\t},\n')

    # End the table definition
    f.write('}')
