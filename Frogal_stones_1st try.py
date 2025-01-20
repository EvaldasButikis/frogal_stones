import json
import csv


with open("People/A_people.json", encoding='utf-8') as file:
        As = json.load(file)

dictio_per_year = {}
results={}


for people in As:
    if "ontology/birthYear" in people:
        if 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type_label' in people and any(job == "musical artist" for job in people['http://www.w3.org/1999/02/22-rdf-syntax-ns#type_label']):
            year = people["ontology/birthYear"]
            try:
                year = int(year)
            except:
                continue
            if year not in dictio_per_year:
                dictio_per_year[year] = 0
            dictio_per_year[year]+=1
                    

print(dictio_per_year) 
                        

            
             

 

