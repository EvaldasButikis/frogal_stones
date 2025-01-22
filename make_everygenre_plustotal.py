import json 
import csv
import itertools


with open("clean_data.json", encoding = 'utf-8') as file: 
    content = json.load (file)

#creating dictionary
dictio_per_year = {}

#inputing which genres you want to look at: 
genre1 = input("What is the first genre?")
genre2 = input("What is the second genre?")
genre1 = genre1.lower()
genre2 = genre2.lower()
#inputing csv name.csv
csvname = input("What should the csv be called?")

for person in content.values():
    year = person["start_year"]
    try:
         year=int(year)
    except:
         continue
    if year not in dictio_per_year:
        dictio_per_year[year] = {
            "total" : 0,
            genre1: 0,
            genre2: 0
        }

    dictio_per_year[year]["total"]+=1


    if type(person['start_year']) is list:
        person['start_year'] = person['start_year'][0]

    year = int(person['start_year'])
#adding years to dictionary
    
    #adding numbers for each genre to the dictionary
    for genre in person["genre"]:
        genre = genre.lower()
        if genre.__contains__(f"{genre1}"):
            dictio_per_year[year][f"{genre1}"]+=1
        if genre.__contains__(f"{genre2}"):
            dictio_per_year[year][f"{genre2}"]+=1
  

output = []
for year, by_genre in dictio_per_year.items():
    line_dict = {"year": year}
    for key in by_genre:
        line_dict[key] = by_genre[key]
    output.append(line_dict)
print(output)

with open(f"{csvname}", 'w') as csvfile:
    writer = csv.DictWriter(csvfile, fieldnames=output[0].keys(), lineterminator="\n")
    writer.writeheader()
    writer.writerows(output)