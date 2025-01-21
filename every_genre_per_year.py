import json 
import csv

with open("every_musician.json", encoding = 'utf-8') as file: 
    content = json.load (file)

#creating dictionary
dictio_per_year = {}


for person in content.values():
    if type(person['start_year']) is list:
        person['start_year'] = person['start_year'][0]
    year = int(person['start_year'])
    if year not in dictio_per_year:
        dictio_per_year[year] = {}
    
    #to avoid error of letters being counted under genre
    if type(person["genre"]) is not list:
        person["genre"] = [person["genre"]]
    
    #adding to dictionary
    for genre in person["genre"]:
        if genre in dictio_per_year[year]: 
            dictio_per_year[year][genre] +=1
        else: 
            dictio_per_year[year][genre] = 1
  


with open('every_genre_per_year.json', 'w') as file:
    json.dump(dictio_per_year, file, indent=4)
    