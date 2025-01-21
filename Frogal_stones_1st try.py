import json
import csv


with open("every_musician.json") as file:
        People_json_dict = json.load(file)

dictio_per_year = {}

genre_list= {
     "punk": 0,
     "rock":0
}

for people in People_json_dict.values():
    year = people["start_year"]
    try:
         year=int(year)
    except:
         continue
    if year not in dictio_per_year:
        dictio_per_year[year] = 0
    dictio_per_year[year]+=1
    dictio_per_year[year]=str(dictio_per_year[year])

    for year in dictio_per_year:
        for genre in people["genre"]:
            if genre.__contains__("rock"):
                dictio_per_year[year]["rock"]+=1
            if genre.__contains__("punk"):
                dictio_per_year[year]["punk"]+=1
              

""" for ['start_year'] in people:
        
        for genre in people["genre"]:
            if genre in dictio_per_year:
                dictio_per_year [genre] +=1
            else: 
                dictio_per_year [genre] = 1
"""
                        
print(dictio_per_year)
print(genre_list)




"""
with open('Musician_per_ear.json', 'w') as file:
    json.dump(dictio_per_year, file, indent=4)"""
                        
csv_file = 'file.csv'

"""with open("muscisian_per_startyear.csv", 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(['Key', 'Value'])
	
    # Write data
    for key, value in dictio_per_year.items():
        writer.writerow([key, value])"""

            
             

 

