# -*- coding: utf-8 -*-
import csv
import sys
import xlrd
import xlwt
from xlutils.copy import copy


def get_value(sh, row, col):
    return sh.cell(row, col).value


def format_xlsx(file_name, sheet_name, col_index):
    er = xlrd.open_workbook(file_name)
    # 检查表单名字：
    # print wb.sheet_names()
    col1 = int(col_index[0]) - 1
    col2 = int(col_index[1]) - 1
    col3 = int(col_index[2]) - 1
    sh = er.sheet_by_name(sheet_name)

    ew = xlwt.Workbook()
    format_sheet = ew.add_sheet('format')
    #通过get_sheet()获取的sheet有write()方法
    # ew = copy(er)
    # format_sheet = ew.get_sheet(0)  #1代表是写到第几个工作表里，从0开始算是第一个。
    # ws.write(1, 6, 'changed!')

    #递归打印出每行的信息：
    for row in range(sh.nrows):
        print sh.row_values(row)
        if get_value(sh, row, col1) + get_value(sh, row, col2) == get_value(sh, row, col3):
            format_sheet.write(row, col1, get_value(sh, row, col1))
            format_sheet.write(row, col2, get_value(sh, row, col2))
            format_sheet.write(row, col3, get_value(sh, row, col3))
        else:
            if '^' in get_value(sh, row, col3):
                ab = get_value(sh, row, col3).split('^')
                format_sheet.write(row, col1, ab[0])
                format_sheet.write(row, col2, '^' + ab[1])
                format_sheet.write(row, col3, get_value(sh, row, col3))
            else:
                format_sheet.write(row, col1, get_value(sh, row, col3))
                format_sheet.write(row, col2, '')
                format_sheet.write(row, col3, get_value(sh, row, col3))
    ew.save('format-' + file_name)

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print 'Usage:%s %s %s \n' % (sys.argv[0], 'file name', 'column numer')
        print 'give column numbers like 1,2,3, otherwise I will use 1,2,3 as default'
        exit()
    if len(sys.argv) == 3:
        col_index = sys.argv[2].split(',')
    else:
        col_index = [1, 2, 3]
    format_xlsx(sys.argv[1], 'Sheet1', col_index)
    # format_xlsx('test.xlsx', 'Sheet1', [1, 2, 3])
