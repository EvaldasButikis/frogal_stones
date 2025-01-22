import json 
import csv
import itertools

#open json file with clean data
with open("clean_data.json", encoding = 'utf-8') as file: 
    every_musician = json.load (file)

#creating dictionary
genre_per_year = {}

#inputing which genres you want to look at: 
genres_of_interest = ["rock", "punk", "blue", "metal"]

#for every person in the muscian database
for person in every_musician.values():
    #if multiple start years are listed go with the first one
    if type(person['start_year']) is list:
        person['start_year'] = person['start_year'][0]

    #converting value of start year to integer
    year = int(person['start_year'])
    #adding a key for every year in the dictionary
    if year not in genre_per_year:
        genre_per_year[year] = {
            "total" : 0
        }
    #adding a key for every genre of interest under every year
        for genre in genres_of_interest:
            genre_per_year[year][genre] = 0

    genre_per_year[year]["total"]+=1
   
    
    #avoiding error of iterating over every letter in string if the genres are not a list
    if type(person["genre"]) is not list:
        person["genre"] = [person["genre"]]

    #If any of the genres in the list mention target genre, add 1 to the corresponding key in the dictionary
    for genre in genres_of_interest:
        if any(genre in genres.lower() for genres in person["genre"]):
            genre_per_year[year][genre] += 1

#Turning dictionary of dictionaries into list of dictionaries
output = []
for year, by_genre in genre_per_year.items():
    line_dict = {"year": year}
    for key in by_genre:
        line_dict[key] = by_genre[key]
    output.append(line_dict)
print(output)

#outputting to csv
with open("Data_rock_blues_metal_punk.csv", 'w') as csvfile:
    writer = csv.DictWriter(csvfile, fieldnames=output[0].keys(), lineterminator="\n")
    writer.writeheader()
    writer.writerows(output)