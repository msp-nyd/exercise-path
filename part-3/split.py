
# Read a csv file and generate smaller csv files with number of lines.
# Last file may include same number of lines or lesser depending on the orginal number of lines in the big file.

import csv

# Since the original patient.csv has 600K rows, 5 small csv will be created for 100k row per file

number_of_lines = 100000

def split_file(part, lines):
    with open('./output/patient_'+ str(part) +'.csv', 'w') as f_out:
        f_out.write(header)
        f_out.writelines(lines)

with open("patient.csv", "r") as f:
    count = 0
    header = f.readline()
    lines = []
    for line in f:
        count += 1
        lines.append(line)
        if count % number_of_lines == 0:
            split_file(count // number_of_lines, lines)
            lines = []
    if len(lines) > 0:
        split_file((count // number_of_lines) + 1, lines)
