import json

# Read input JSON data from file
with open('backend/games4.json', 'r') as file:
    data = json.load(file)

# Check if the data is a list of dictionaries
if isinstance(data, list):
    transformed_data = []
    for game_data in data:
        if 'stores' in game_data and isinstance(game_data['stores'], list):
            transformed_stores = [store_obj['store'] for store_obj in game_data['stores']]
            game_data['stores'] = transformed_stores
        transformed_data.append(game_data)

# Write the transformed data to an output file
with open('backend/output.json', 'w') as file:
    json.dump(transformed_data, file, indent=2)
