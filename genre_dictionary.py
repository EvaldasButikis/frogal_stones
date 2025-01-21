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
#removing errors
for genre in genre_list: 
    if len('Value')<2: 
         genre_list.pop("Value") 


#total number of genres
dictionary_val = 0
for genre in genre_list: 
     dic = genre_list[genre]
     dictionary_val += dic
print (dictionary_val)

with open("genre.csv", 'w', encoding='utf-8') as file: 
    writer = csv.writer(file)
    writer.writerow(['Key', 'Value'])
    for key, value in genre_list.items(): 
         writer.writerow([key, value])




                    
                  



    