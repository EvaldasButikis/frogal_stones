import json
import csv


with open("People/A_people.json", encoding='utf-8') as file:
        As = json.load(file)

all_years =list(range(1, 2025))
results = {}

for people in As:
    if "ontology/birthYear" in people:
        for year in all_years:
            haha_year= 0
            if people["ontology/birthYear"]== year:
                 haha_year=+1
            results[year]= haha_year
             
                        

print(results)
            
             

 

''' print(precipi_per_month)

    relative_precipi = {}
    for date in all_dates:
        relative_precipi[date] = precipi_per_month[date]/precipi_total

    print(relative_precipi)
            
    results[station["Location"]]={
         "precipitation_per_month" :precipi_per_month,
         "relative_precipitation":relative_precipi,
         'total_precipitation':precipi_total

    }


with open('results.json', 'w', encoding='utf-8') as file:
    json.dump(results, file,indent=4)'''