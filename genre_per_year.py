import json 
import csv
import itertools

#open json file with clean data
with open("clean_data.json", encoding = 'utf-8') as file: 
    every_musician = json.load (file)

#creating dictionary
genre_per_year = {}

#inputing which genres you want to look at: 
genres_of_interest = ["rock", "punk", "blues", "metal"]

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
    punkgenres = ["punk", "post_hardcore", "garage rock","noise rock"]
    #for punkies in punkgenres:
    
    def check_genre(target_genre):
        return any(target_genre in genre.lower() for genre in person["genre"])
    
    if check_genre("rock") and check_genre("punk") and check_genre("metal") and check_genre("blues"): 
        genre_per_year[year]["rock"]+=1/4
        genre_per_year[year]["punk"]+=1/4
        genre_per_year[year]["metal"]+=1/4
        genre_per_year[year]["blues"]+=1/4
    if check_genre("punk") and check_genre("rock") and check_genre("metal"):
        genre_per_year[year]["rock"]+=1/3
        genre_per_year[year]["punk"]+=1/3
        genre_per_year[year]["metal"]+=1/3
    elif check_genre("blues") and check_genre("rock"): 
        genre_per_year[year]["blues"] +=0.5
        genre_per_year[year]["rock"] +=0.5
    elif check_genre("blues") and check_genre("metal"):
        genre_per_year[year]["blues"] +=0.5
        genre_per_year[year]["metal"] +=0.5
    elif check_genre("punk") and check_genre("blues"):
        genre_per_year[year]["blues"] +=0.5
        genre_per_year[year]["punk"]+=0.5
    elif check_genre("punk") and check_genre("rock"): 
        genre_per_year[year]["rock"]+=0.5
        genre_per_year[year]["punk"]+=0.5
    elif check_genre("metal") and check_genre("punk"):
        genre_per_year[year]["metal"]+=0.5
        genre_per_year[year]["punk"]+=0.5
    elif check_genre("metal") and check_genre("rock"): 
        genre_per_year[year]["metal"]+=0.5
        genre_per_year[year]["rock"]+=0.5
    elif check_genre("punk"):
        genre_per_year[year]["punk"] +=1
    elif check_genre("rock"):
        genre_per_year[year]["rock"] +=1
    elif check_genre("metal"): 
        genre_per_year[year]["metal"] +=1
    elif check_genre("blues"):
        genre_per_year[year]["blues"] +=1
  
    

#Turning dictionary of dictionaries into list of dictionaries
output = []
for year, by_genre in genre_per_year.items():
    line_dict = {"year": year}
    for key in by_genre:
        line_dict[key] = by_genre[key]
    output.append(line_dict)
print(output)

#outputting to csv
with open("Data_rock_punk_metal_blues.csv", 'w') as csvfile:
    writer = csv.DictWriter(csvfile, fieldnames=output[0].keys(), lineterminator="\n")
    writer.writeheader()
    writer.writerows(output)