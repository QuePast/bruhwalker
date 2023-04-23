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

# Sort the list alphabetically
champions = sorted(champions)

# Define a dictionary mapping roles to numbers
role_dict = {
    "tank": 1,
    "fighter": 2,
    "support": 3,
    "mage": 4,
    "marksman": 5,
    "assassin": 5, # since you specified that assassins should have the same number as marksmen
}

# Open a file for writing
with open('spells.lua', 'w') as f:

    # Loop over the champion names
    for champion in champions:
        # Load the JSON data
        response = requests.get(f'https://raw.communitydragon.org/latest/game/data/characters/{champion.lower()}/{champion.lower()}.bin.json')
        data = json.loads(response.text)

        champion_name = champion

        if f'Characters/{champion_name}/CharacterRecords/Root' in data:
            # Get the ability tags
            ability_tags = data[f'Characters/{champion_name}/CharacterRecords/Root']["characterToolData"]['searchTags']
            ability_tags_secondary = data[f'Characters/{champion_name}/CharacterRecords/Root']["characterToolData"].get('searchTagsSecondary', "")
        else:
            # Hash the string using fnv1a32
            hashed_str = hex(fnv1a_32(f'characters/{champion.lower()}/characterrecords/root'.encode()))[2:]
            hex_hash = "{" + hashed_str + "}"
            if hex_hash in data:
                ability_tags = data[hex_hash]["characterToolData"]['searchTags']
                ability_tags_secondary = data[hex_hash]["characterToolData"].get('searchTagsSecondary', "")
            else:
                print(f'Error: Could not find ability tags for champion {champion_name}')
                continue
        
        print(champion_name, ability_tags, ability_tags_secondary)
        
        # Convert ability tags and secondary tags to lists if they are strings
        if isinstance(ability_tags, str):
            ability_tags = [ability_tags]
        if isinstance(ability_tags_secondary, str):
            ability_tags_secondary = [ability_tags_secondary]

        # Combine the ability tags and secondary tags into a single list
        all_tags = ability_tags + ability_tags_secondary

        # Calculate the average tag number and round it up
        tag_numbers = [role_dict.get(tag.lower(), 0) for tag in all_tags]
        valid_tag_numbers = [number for number in tag_numbers if number != 0]
        avg_tag_number = min(5, round(sum(valid_tag_numbers) / len(valid_tag_numbers))) if valid_tag_numbers else 0

        print(f'["{champion_name}"] = {tag_numbers} / {valid_tag_numbers} / {avg_tag_number}')

        # Write the champion name and average tag number to the file
        f.write(f'["{champion_name}"] = {avg_tag_number},')

print('Script completed successfully.')
