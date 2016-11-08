# -*- coding: utf-8 -*-
import csv
import sys
import xlrd
import xlwt


def get_value(sh, row, col):
    value = sh.cell(row, col).value
    if type(value) == float:
        value = str(value)
    else:
        value = value
    return value


def copy_origin(sh, fs, row, col1, col2, col3):
    col_range = range(0, col1) + range(col1 + 1, col2) + range(col2 + 1, col3) + range(col3 + 1, sh.ncols)
    col_set = list(set(col_range))
    for i in col_set:
        fs.write(row, i, get_value(sh, row, i))


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

    # wb = Workbook()  #创建工作薄
    # ew = ExcelWriter(workbook=wb)  # 写入工作薄对象
    # format_sheet = wb.create_sheet()       #创建表格
    # format_sheet.title = 'format'            #创建标题
    # # format_sheet.cell(None, row=1, column=1).value = '**'    #写入单元格内容

    #递归打印出每行的信息：
    for row in range(sh.nrows):
        if row == 0 or get_value(sh, row, col3) == '' or get_value(sh, row, col1) + get_value(sh, row, col2) == get_value(sh, row, col3):
            for i in range(sh.ncols):
                format_sheet.write(row, i, get_value(sh, row, i))
        else:
            if '^' in get_value(sh, row, col3):
                ab = get_value(sh, row, col3).split('^')
                format_sheet.write(row, col1, ab[0])
                format_sheet.write(row, col2, '^' + ab[1])
                format_sheet.write(row, col3, get_value(sh, row, col3))
                copy_origin(sh, format_sheet, row, col1, col2, col3)
            else:
                format_sheet.write(row, col1, get_value(sh, row, col3))
                format_sheet.write(row, col2, '')
                format_sheet.write(row, col3, get_value(sh, row, col3))
                copy_origin(sh, format_sheet, row, col1, col2, col3)
    ew.save('format-' + file_name.replace('xlsx', 'xls'))

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
