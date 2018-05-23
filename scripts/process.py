import csv
import sys


if __name__ == '__main__':
    reader = csv.reader(sys.stdin)
    writer = csv.writer(sys.stdout)
    for row in reader:
        data_row = row[:2]
        if row[2] not in ['USA', 'parent-location']:
            data_row[1] += ', ' + row[2]
        writer.writerow(data_row)
