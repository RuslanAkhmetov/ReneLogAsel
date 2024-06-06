# %%
#Extracting CMR and Invoice pdf files and save 
#Отправителя
#Получателя
#Переврзчика
#Автомашины
#Таможни назначения
#Таможня отправления берем Верхний Ларс код 10803040

import sys

import utils.utils
sys.path.insert(1, "..")
sys.path.insert(2, '../PDF_Text_Extraction')

from PDF_Text_Extraction import pdf_xtractor                  #.extract_pdf_file

import os
import utils
import constants



def extract(path):
    for file in os.listdir(path):
         
        if str(file).find('.pdf') > -1 :
            pd_file_path = path + '/' + str(file)
            text_on_page = pdf_xtractor.extract_pdf_file(pd_file_path)
            utils.utils.save_result_to_csv_old (text_on_page, path + '/out_' + str(file).replace('.pdf','') + '.csv')


if __name__ == '__main__':
    #path='C:\Users\1\PythonApp\ReneLogAsel\test'
    path = constants.parent_path + '\\' + sys.argv[1]
    extract(path)


