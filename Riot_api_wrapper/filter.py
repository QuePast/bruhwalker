import json
import requests
from fnvhash import fnv1a_32

url = 'https://raw.communitydragon.org/latest/game/global/champions/champions.bin.json'
response = requests.get(url)
data = response.json()

# Get the list of champion names from the "name" field of each character
champions = [data[char]['name'] for char in data]

# Remove TFTChampion from the list of champion names
champions = [name for name in champions if name != 'TFTChampion']
#champions = [name for name in champions if name == 'Jax']

# Sort the list alphabetically
champions = sorted(champions)
print("Champions found:", len(champions))

# Open a file for writing
with open('data.txt', 'w') as f:
    # Write the start of the table definition
    f.write('Champs = {\n')

    # Loop over the champion names
    for champion_name in champions:

        # Load the JSON data
        response = requests.get(f'https://raw.communitydragon.org/latest/game/data/characters/{champion_name.lower()}/{champion_name.lower()}.bin.json')
        data = json.loads(response.text)

        if f'Characters/{champion_name}/CharacterRecords/Root' in data:
            # Get the ability names
            ability_paths = data[f'Characters/{champion_name}/CharacterRecords/Root']['spellNames']

            # Write the champion name and start of the spell list
            f.write(f'\t["{champion_name}"] = {{\n')

            # Loop over the abilities
            for spell_names in ability_paths:
                path = f"Characters/{champion_name}/Spells/{spell_names}"
                
                #Fiddlesticks vs FiddleSticks fix / NO NEED TO FIX IN HASH VARIANT SINCE EVERYTHING IS LOWERCASE ANYWAYS RITO PLS
                if champion_name == "FiddleSticks":
                    # Replace "FiddleSticks" with "Fiddlesticks" in the path
                    champion_name = champion_name.replace("FiddleSticks", "Fiddlesticks")
                    path = f"Characters/{champion_name}/Spells/{spell_names}"

                if path in data:
                    #UNHASHED CHAMPS - SHEN
                    if 'mSpellTags' in data[path]["mSpell"]:
                        print(data[path]["mScriptName"])
                        f.write(f'\t\t{{mScriptName = "{data[path]["mScriptName"]}", mSpellTags = "{data[path]["mSpell"]["mSpellTags"]}"}}, \n')
                    else:
                        print(data[path]["mScriptName"] + " mSpellTags not detected")
                else:
                    #PARTIALLY HASHED CHAMPS - AHRI
                    path = "{" + hex(fnv1a_32(f'characters/{champion_name.lower()}/spells/{spell_names.lower()}'.encode()))[2:] + "}"
                    if 'mSpellTags' in data[path]["mSpell"]:
                        print(data[path]["mScriptName"])
                        f.write(f'\t\t{{mScriptName = "{data[path]["mScriptName"]}", mSpellTags = "{data[path]["mSpell"]["mSpellTags"]}"}}, \n')
                    else:
                        print(data[path]["mScriptName"] + " mSpellTags not detected")
                
        else: #FULL HASHED CHAMPS - MILIO
            # Hash the string using fnv1a32
            ability_paths = "{" + hex(fnv1a_32(f'characters/{champion_name.lower()}/characterrecords/root'.encode()))[2:] + "}"

            # Write the champion name and start of the spell list
            f.write(f'\t["{champion_name}"] = {{\n')
            
            if ability_paths in data:
                ability_paths = data[ability_paths]["spellNames"]

                for spell_names in ability_paths:
                    path = "{" + hex(fnv1a_32(f'characters/{champion_name.lower()}/spells/{spell_names.lower()}'.encode()))[2:] + "}"
                    if 'mSpellTags' in data[path]["mSpell"]:
                        print(data[path]["mScriptName"])
                        f.write(f'\t\t{{mScriptName = "{data[path]["mScriptName"]}", mSpellTags = "{data[path]["mSpell"]["mSpellTags"]}"}}, \n')
                    else:
                        print(data[path]["mScriptName"] + " mSpellTags not detected")
            else:
                print(f'Error: Could not find ability tags for champion {champion_name}')
                continue

            # End the spell list and champion definition
        f.write('\t},\n')

    # End the table definition
    f.write('}')

    # End the table definition
