import json
import csv

with open("People/A_people.json", encoding='utf-8') as file:
        content = json.load(file)


genre_list = {}

for people in content:
    if 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type_label' in people and any(job == "musical artist" for job in people['http://www.w3.org/1999/02/22-rdf-syntax-ns#type_label']):
        if "ontology/genre_label" in people: 
            for genre in people["ontology/genre_label"]:
                item = people["ontology/genre_label"] 
                if genre in genre_list: 
                    genre_list [genre] +=1
                else: 
                    genre_list [genre] = 1
 

with open ("genre.json") as file: 
     json.dump ("genre_dump")


                    
                  



    