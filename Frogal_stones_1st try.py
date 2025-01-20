import json
import csv


with open(f"People/A_people.json", encoding='utf-8') as file:
        People_json_dict = json.load(file)

dictio_per_year = {}

for people in People_json_dict:
    if "ontology/birthYear" in people:
        if 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type_label' in people and any(job == "musical artist" for job in people['http://www.w3.org/1999/02/22-rdf-syntax-ns#type_label']):
            year = people["ontology/birthYear"]
            try:
                year = int(year)
            except:
                continue
            if year not in dictio_per_year:
                dictio_per_year[year] = 0
            elif year in dictio_per_year:
                dictio_per_year[year]+=1
                    
print(dictio_per_year)

with open('Musician_per_Year.json', 'w') as file:
    json.dump(dictio_per_year, file, indent=4)
                        
csv_file = 'file.csv'

with open("csv_nb_muscisian_per_year.csv", 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(['Key', 'Value'])
	
    # Write data
    for key, value in dictio_per_year.items():
        writer.writerow([key, value])

            
             

 

