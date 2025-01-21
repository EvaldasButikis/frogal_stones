import json
import csv


with open("People/A_people.json", encoding='utf-8') as file:
        People_json_dict = json.load(file)

dictio_per_year = {}

for people in People_json_dict:
    if "ontology/activeYearsStartYear" in people:
        if 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type_label' in people and any(job == "musical artist" for job in people['http://www.w3.org/1999/02/22-rdf-syntax-ns#type_label']):
            if "ontology/genre_label" in people:
                name= people['title']
                genre= people["ontology/genre_label"]
                year = people["ontology/activeYearsStartYear"]
            
    dictio_per_year[name] = {
        'genre': genre,
        'start_year':year
    }

                    
print(dictio_per_year)

with open('every_musician.json', 'w') as file:
    json.dump(dictio_per_year, file, indent=4)
                        
"""csv_file = 'file.csv'

with open("csv_nb_muscisian_per_startyear.csv", 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(['Key', 'Value'])
	
    # Write data
    for key, value in dictio_per_year.items():
        writer.writerow([key, value])

            """
             

 

