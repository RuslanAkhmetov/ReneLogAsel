# %%
#Extracting CMR and Invoice pdf files and save 
#Отправителя
#Получателя
#Переврзчика
#Автомашины
#Таможни назначения
#Таможня отправления берем Верхний Ларс код 10803040

import sys
sys.path.insert(1, "..")
sys.path.insert(2, '../PDF_Text_Extraction')

from PDF_Text_Extraction import pdf_xtractor                        #.extract_pdf_file
import os
from utils import utils
import json_parser
import constants
import check_docs
import make_pi



def extract(path):
    invoice = {}
    cmr = {}  
    for file in os.listdir(path):
         
        if str(file).find('.pdf') > -1:
            pd_file_path = path + '/' + str(file)
            text_on_page = pdf_xtractor.extract_pdf_file(pd_file_path)
            utils.save_result_to_csv_old (text_on_page, path + '/out_' + str(file).replace('.pdf','') + '.csv')
            
            text_from_invoice = ''.join(text_on_page['Page_0'][4])
            if str(file).find('СФ') > -1:
                invoice = json_parser.match_invoice(constants.matcher_dictionary_asel_invoice, text_from_invoice)
                #print('Invoice:\n',invoice)
            elif str(file).find('ЦМР') > -1:
                cmr = json_parser.match_CMR(constants.matcher_dictionary_asel_CMR, text_from_invoice)
                print ('CMR:\n', cmr, '\n')
                

    #check_docs.check_docs(invoice,cmr)
    pi_content = {'invoice':invoice,'cmr': cmr }
    
   # make_pi.make_pi_by_xsd()
    make_pi.make_pi(pi_content)




if __name__ == '__main__':
    #path='C:\Users\1\PythonApp\ReneLogAsel\test'
    path = sys.argv[1]
    extract(path)




