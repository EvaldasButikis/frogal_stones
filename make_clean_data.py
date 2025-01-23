import json
import csv
import os

#to access every file inside the "people folder"
file_list_every_letter = os.listdir("People")

#making an empty dictionary to input the cleaned data
musicians = {}

#loading the file for each letter 
for file_name in file_list_every_letter:
    with open(f"People/{file_name}", encoding='utf-8') as file:
        letter_people = json.load(file) 
    #filtering for people listed in the dictionary who have the activestartyear listed
    for person in letter_people:
        if "ontology/activeYearsStartYear" in person:
            #filtering for person who have occupation listed and keeping those who are listed as "musical artist"
            if 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type_label' in person and any(job == "musical artist" for job in person['http://www.w3.org/1999/02/22-rdf-syntax-ns#type_label']):
                #filtering for people who have the genre_label listed
                if "ontology/genre_label" in person:
                    #adding all relevant information to the dictionary
                    name= person['title']
                    genres= person["ontology/genre_label"]
                    year = person["ontology/activeYearsStartYear"]
                    
                    if type(genres) is not list:
                        genres = [genres]

                    clean_genres = []
                    for genre in genres:
                        clean_genres.append(genre.replace("-", "_"))

                    musicians[name] ={
                       'name': name,
                       'genre': clean_genres,
                       'start_year':year
                       }

                    
#outputting data to above dictionary
with open('clean_data.json', 'w') as file:
    json.dump(musicians, file, indent=4)