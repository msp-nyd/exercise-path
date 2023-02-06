# create fake data

from faker import Faker
import csv

fake = Faker()

# Number of fake records to create in csv 
total_fake_records = 500000

with open('patient.csv', 'w') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(['id', 'patient_name', 'guest_name'])
    for n in range(1, total_fake_records):
        writer.writerow([fake.random_number(digits=5),str(fake.name()),str(fake.name())])
