# -*- coding: utf-8 -*-
import csv
import sys


def format(file_name, col_index):
    col1 = col_index[0] - 1
    col2 = col_index[1] - 1
    col3 = col_index[2] - 1
    f = open(file_name, 'rb')
    wf = open('format-' + file_name, 'wb')
    csvreader = csv.reader(f, delimiter=' ')
    csvwriter = csv.writer(wf, delimiter=' ')
    i = 0
    for row in csvreader:
        i += 1
        if row[col1] + row[col2] == row[col3]:
            pass
        else:
            if row[col3].find(row[col1]) != -1:
                start = row[col3].find(row[col1])
                row[col2] = row[col3][start + len(row[col1]):]
            elif row[col3].find(row[col2]) != -1:
                end = row[col3].find(row[col2])
                row[col1] = row[col3][:end]
            else:
                print 'fail line ' + str(i)
        csvwriter.writerow(row)
    f.close()
    wf.close()


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print 'Usage:%s %s %s \n' % (sys.argv[0], 'file name', 'column numer')
        print 'give column numbers like 1,2,3, otherwise I will use 1,2,3 as default'
        exit()
    if len(sys.argv) == 3:
        col_index = sys.argv[2].split(',')
    else:
        col_index = [1, 2, 3]
    format(sys.argv[1], col_index)
