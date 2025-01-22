import json
import csv
import os


file_list = os.listdir("People")


dictio_per_year = {}

for file_name in file_list:
    with open(f"People/{file_name}", encoding='utf-8') as file:
        People_json_dict = json.load(file) 
    for people in People_json_dict:
        if "ontology/activeYearsStartYear" in people:
            if 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type_label' in people and any(job == "musical artist" for job in people['http://www.w3.org/1999/02/22-rdf-syntax-ns#type_label']):
                if "ontology/genre_label" in people:
                    name= people['title']
                    genre= people["ontology/genre_label"]
                    year = people["ontology/activeYearsStartYear"]
                    dictio_per_year[name] ={
                       'name': name,
                       'genre': genre,
                       'start_year':year
                       }

                    

with open('clean_data.json', 'w') as file:
    json.dump(dictio_per_year, file, indent=4)