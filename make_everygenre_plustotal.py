import json 
import csv
import itertools


with open("clean_data.json", encoding = 'utf-8') as file: 
    content = json.load (file)

#creating dictionary
dictio_per_year = {}

#inputing which genres you want to look at: 
genres_of_interest = ["rock", "punk"]
#inputing csv name.csv
csvname = "test.csv"

for person in content.values():
    year = person["start_year"]
    try:
         year=int(year)
    except:
         continue
    if year not in dictio_per_year:
        dictio_per_year[year] = {
            "total" : 0
        }
        for genre in genres_of_interest:
            dictio_per_year[year][genre] = 0

    dictio_per_year[year]["total"]+=1


    if type(person['start_year']) is list:
        person['start_year'] = person['start_year'][0]

    year = int(person['start_year'])
#adding years to dictionary
    
    #adding numbers for each genre to the dictionary
    if type(person["genre"]) is not list:
        person["genre"] = [person["genre"]]

    for genre in genres_of_interest:
        if any( genre in genry.lower() for genry in person["genre"]):
            dictio_per_year[year][genre] += 1
  

output = []
for year, by_genre in dictio_per_year.items():
    line_dict = {"year": year}
    for key in by_genre:
        line_dict[key] = by_genre[key]
    output.append(line_dict)
print(output)

with open("good_punk_rock_total_data", 'w') as csvfile:
    writer = csv.DictWriter(csvfile, fieldnames=output[0].keys(), lineterminator="\n")
    writer.writeheader()
    writer.writerows(output)