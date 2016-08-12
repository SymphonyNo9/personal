# -*- coding: utf-8 -*-
import csv
import sys
import xlrd


def format_csv(file_name, col_index):
    col1 = int(col_index[0]) - 1
    col2 = int(col_index[1]) - 1
    col3 = int(col_index[2]) - 1
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


def get_value(sh, row, col):
    return sh.cell(row, col).value

def format_xlsx(file_name, sheet_name, col_index):
    wb = xlrd.open_workbook(file_name)
    # 检查表单名字：
    # print wb.sheet_names()
    col1 = int(col_index[0]) - 1
    col2 = int(col_index[1]) - 1
    col3 = int(col_index[2]) - 1
    sh = wb.sheet_by_name(sheet_name)
    #递归打印出每行的信息：
    for rownum in range(sh.nrows):
        print sh.row_values(rownum)
        if get_value(sh,rownum, col1) + get_value(sh,rownum, col2) == get_value(sh,rownum, col3):
            pass
        else:
            if not get_value(sh,rownum, col2):
                pass

if __name__ == '__main__':
    # if len(sys.argv) < 2:
    #     print 'Usage:%s %s %s \n' % (sys.argv[0], 'file name', 'column numer')
    #     print 'give column numbers like 1,2,3, otherwise I will use 1,2,3 as default'
    #     exit()
    # if len(sys.argv) == 3:
    #     col_index = sys.argv[2].split(',')
    # else:
    #     col_index = [1, 2, 3]
    # format(sys.argv[1], col_index)
    format_xlsx('test.xlsx', 'Sheet1', [1, 2, 3])
