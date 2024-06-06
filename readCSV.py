import sys
sys.path.insert(1, "..")
sys.path.insert(2, '../PDF_Text_Extraction')

import os
from utils import utils 
import json_parser
import constants
import check_docs
import make_pi

def readCSVFiles(path):
    invoice = {}
    cmr = {}  
    for file in os.listdir(path):
         
        if str(file).find('.csv') > -1:
            pd_file_path = path + '/' + str(file)
            text_from_invoice = utils.read_csv(pd_file_path)
            print('file=', file)
            if str(file).find('СФ') > -1 or str(file).find('CФ') > -1 :
                invoice = json_parser.match_invoice(constants.matcher_dictionary_asel_invoice, text_from_invoice)
                print('Invoice:\n',invoice)
            elif str(file).find('ЦМР') > -1:
                cmr = json_parser.match_CMR(constants.matcher_dictionary_asel_CMR, text_from_invoice)
                print ('CMR:\n', cmr, '\n')
                

    #check_docs.check_docs(invoice,cmr)
    pi_content = {'invoice':invoice,'cmr': cmr }
    
   # make_pi.make_pi_by_xsd()
    make_pi.make_pi(pi_content, path)


if __name__ == '__main__':
    #path='C:\Users\1\PythonApp\ReneLogAsel\test'
    path = constants.parent_path + '\\' + sys.argv[1]
    readCSVFiles(path)


