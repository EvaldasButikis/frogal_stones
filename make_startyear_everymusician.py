import json
import csv


with open("clean_data.json") as file:
        People_json_dict = json.load(file)

dictio_per_year = {}

for people in People_json_dict.values():
    year = people["start_year"]
    try:
         year=int(year)
    except:
         continue
    if year not in dictio_per_year:
        dictio_per_year[year] = 0
    dictio_per_year[year]+=1

print(dictio_per_year)

with open('startyear_every_musician.json', 'w') as file:
    json.dump(dictio_per_year, file, indent=4)