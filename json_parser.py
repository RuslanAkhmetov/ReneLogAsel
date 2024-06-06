import json
import re
from utils import utils
import constants as const
import sys
#sys.path.insert(1, "..")
sys.path.insert(2, '../database')

from database import hs_code
from database import country_code

def match_invoice(dict, text):
    invoice = {}
    invoice['PrDocumentNumber'] = re.search(dict['PrDocumentNumber'], text)[1]
    invoice['PrDocumentDate'] = re.search(dict['PrDocumentDate'], text)[1]
    invoice['GoodsDescription'] = re.search(dict['GoodsDescription'], text)[1]
    invoice['GrossWeight'] = re.search(dict['GrossWeight'], text)[1]
    if invoice['GrossWeight'].find('.') == -1:
        invoice['GrossWeight'] +='.000000'
        
    invoice['InvoicedCost'] = re.search(dict['InvoicedCost'], text)[1]

    print('cost = ', invoice['InvoicedCost'] )

    if invoice['InvoicedCost'].find('.') == -1:
        invoice['InvoicedCost'] += '.00'
    invoice['ContractCurrencyCode'] = re.search(dict['ContractCurrencyCode'], text)[1]
    invoice['ConsignorName'] = re.search(dict['ConsignorName'],text)[1]
    invoice['ConsignorCountry'] = re.search(dict['ConsignorCountry'], text)[1]
    invoice['ConsignorCountryCode'] = country_code.country_code[invoice['ConsignorCountry']]
    invoice['ConsignorCity'] = re.search(dict['ConsignorCity'],text)[1]
    invoice['ConsignorStreetHouse'] = re.search(dict['ConsignorStreetHouse'],text)[1]
    invoice['ConsigneeName'] = re.search(dict['ConsigneeName'], text)[1]
    invoice['ConsigneeCountry'] = re.search(dict['ConsigneeCountry'],text)[1]
    invoice['ConsigneeCountryCode'] = country_code.country_code[invoice['ConsigneeCountry']]
    invoice['ConsigneeCity'] = re.search(dict['ConsigneeCity'],text)[1]
    if invoice['ConsigneeCity'].find('ОБЛ')>-1: invoice['ConsigneeCity'] = re.search(dict['ConsigneeCityWithRegion'],text)[1]  #костыль
    ConsigneeStreetHouse = dict['component'] + invoice['ConsigneeName']+r'\s+[ID/\s0-9]*\s+([А-Я\/\s\.\,\-0-9]+)\s+'+invoice['ConsigneeCity']+r'\,?\s+'+invoice['ConsigneeCountry']+';'
    invoice['ConsigneeStreetHouse'] = re.search(ConsigneeStreetHouse,text)[1]
    return invoice

def match_CMR(dict, cmr_text):
    cmr ={}
    
    #Читаем Графу 1
    cmr_part = cmr_text[cmr_text.find(';1 Отправитель'): cmr_text.find(';2 Получатель')]
    cmr['PrDocumentNumber'] = re.search(dict['PrDocumentNumber'], cmr_part)[1]
    cmr['ConsignorName']= re.search(dict['ConsignorName'], cmr_part)[1]
    pattern = r'\n;' + cmr['ConsignorName'] + r';+\n;ID[/|\s]([A-Z0-9А-Я]+);'
    print ('pattern =', pattern)
    cmr['ConsigneeDocId'] = re.search(pattern, cmr_part)[1]    
    print(cmr['ConsigneeDocId'])
    pattern = r'\n;' + cmr['ConsignorName'] + r';+\n;ID[/|\s]' + cmr['ConsigneeDocId'] + r';+\n;*\n?;([А-Я\,\.\s0-9]+);' 
   
    cmr['ConsignorStreetHouse']= re.search(pattern, cmr_part )[1]
    pattern = r'\n;' + cmr['ConsignorName'] + r';+\n;ID[/|\s]' + cmr['ConsigneeDocId'] + r';+\n;*\n?;'+ cmr['ConsignorStreetHouse'] + r';+\n;.+\s([А-Я]+);' 
    cmr['ConsignorCountry']= re.search(pattern, cmr_part )[1].upper()
    cmr['ConsignorCountryCode'] = country_code.country_code[cmr['ConsignorCountry']]
    pattern = (r'\n;' + cmr['ConsignorName'] + r';+\n;ID[/|\s]' + cmr['ConsigneeDocId'] + r';+\n;*\n?;'+ cmr['ConsignorStreetHouse'] + 
               r';+\n;([А-Я\s\.]+)\,?\s' + cmr['ConsignorCountry'] +';') 
    cmr['ConsignorCity']= re.search(pattern, cmr_part )[1]

    #Читаем Графу 2 и 16 (если заполнена)
    cmr_part = cmr_text[cmr_text.find(';2 Получатель'):cmr_text.find(';3 Место разгрузки')]
    print(cmr_part)
    if utils.check_string(dict['ConsigneeName'], cmr_part):
        cmr['ConsigneeName'] = re.search(dict['ConsigneeName'], cmr_part)[1]
        pattern = r'\n;' + cmr['ConsigneeName'] + r';+([А-ЯA-Z]+\s[А-ЯA-Z]+);+'
        print('DeclarantName ' , pattern)
        cmr['DeclarantName'] = None
        if utils.check_string(pattern, cmr_part):
            cmr['DeclarantName'] = re.search(pattern, cmr_part)[1]
        pattern = r'\n;' + cmr['ConsigneeName'] + r';+.*;+\n;ID[/\s]([0-9A-Z]+);+'
        print('Получатель = ',cmr['ConsigneeName'])
        if utils.check_string(pattern, cmr_part):
            cmr['ConsigneeDocId'] =re.search(pattern, cmr_part)[1]
            print('cmr[ConsigneeDocId]=', cmr['ConsigneeDocId'])
           
        pattern = r'\n;ID[/\s]' + cmr['ConsigneeDocId'] + r';+ID[/\s]([A-Z0-9]+);+'
        if utils.check_string(pattern, cmr_part):
            cmr['DeclarantDocId'] = re.search(pattern,cmr_part)[1]
            
        
            pattern =  r'ID[/\s]' + cmr['DeclarantDocId'] + r';+\n;' + dict['ConsigneeStreetHouse']       #
        else: 
            pattern =  r'\n;ID[/\s]' + cmr['ConsigneeDocId'] + r';+\n;' + dict['ConsigneeStreetHouse']
        print ('Pattern = ', pattern)

        if utils.check_string(pattern, cmr_part):
            cmr['ConsigneeStreetHouse'] = re.search(pattern, cmr_part)[1]
            print('ADRESS', cmr['ConsigneeStreetHouse'])
            pattern = cmr['ConsigneeStreetHouse'] + r';+' + dict['DeclarantStreetHouse']

            print('pattern DeclarantStreetHouse=', pattern )
            
            if utils.check_string(pattern, cmr_part):
                cmr['DeclarantStreetHouse'] =  re.search(pattern, cmr_part)[1]

        pattern = cmr['ConsigneeStreetHouse'] + r';+.+;+\n;.*' + dict['ConsigneeCountry']
        if utils.check_string(pattern, cmr_part):
            cmr['ConsigneeCountry'] = re.search(pattern,cmr_part)[1].upper()
            print(cmr['ConsigneeCountry'])
            cmr['ConsigneeCountryCode'] = country_code.country_code[cmr['ConsigneeCountry']]
            pattern = dict['ConsigneeCity'] + r'[\s,]*' + str(cmr['ConsigneeCountry']) + ';+'
            if utils.check_string(pattern, cmr_part):
                cmr['ConsigneeCity'] = re.search(pattern, cmr_part)[1]
                pattern = str(cmr['ConsigneeCity']) + r'\,+\s+' + str(cmr['ConsigneeCountry']) + ';+' + dict['DeclarantCity'] + dict['DeclarantCountry']
                print('patter42=', pattern)
                if utils.check_string(pattern, cmr_part):
                    cmr['DeclarantCity'] = re.search(pattern, cmr_part)[1]
                    cmr['DeclarantCountry'] = re.search(pattern, cmr_part)[2].upper()
                    cmr['DeclarantCountryCode'] = country_code.country_code[cmr['DeclarantCountry']]
        pattern = cmr['ConsigneeCountry'] + r';+.+;+' + dict['ConsigneePhone']
        if utils.check_string(pattern, cmr_part):            
            cmr['ConsigneePhone'] = re.search(pattern,cmr_part)[1]
        pattern = dict['DeclarantPhone'] + ';+$'
        if utils.check_string(pattern, cmr_part):
            cmr['DeclarantPhone'] = re.search(pattern,cmr_part)[1]


    #Читаем Графу 6
    cmr_part = cmr_text[cmr_text.find(';6 Знаки и номера'):cmr_text.find(';13 Указания отправителя')]
    
    pattern = dict['GoodsDescriptionPart1']
    if utils.check_string(pattern,cmr_part):
        results = re.findall(pattern, cmr_part)
        cmr['GoodsDescription'] = ""
        for res in results:
            if str(res)!='CMR':
                cmr['GoodsDescription'] +=  str(res) + ' '
        cmr['CAR'] = car_description_parser(const.matcher_dictionary_car_description, cmr['GoodsDescription'])

    if utils.check_string(dict['GrossWeight'], cmr_part):
        cmr['GrossWeight'] = re.search(dict['GrossWeight'], cmr_part)[1]
        if cmr['GrossWeight'].find('.') == -1:
            cmr['GrossWeight'] += '.000000'

     #Читаем Графу 13
    cmr_part = cmr_text[cmr_text.find(';13 Указания отправителя'): cmr_text.find(';14 Возврат')]  
    
    if utils.check_string(dict['DeliveryCustomsOfficeColde'], cmr_part):
        cmr['DeliveryCustomsOfficeColde'] = re.search(dict['DeliveryCustomsOfficeColde'], cmr_part)[1]

    #Читаем Графу 21
    cmr_part = cmr_text[cmr_text.find(';21 Составлена'): cmr_text.find(';24 Груз получен')]  
    if utils.check_string(dict['PrDocumentDate'], cmr_part):
        cmr['PrDocumentDate'] = re.search(dict['PrDocumentDate'], cmr_part)[1]
        cmr['PrDocumentPlace'] = re.search(dict['PrDocumentPlace'], cmr_part)[1]

    #Читаем Графу 23
    cmr_part = cmr_text[cmr_text.find(';23 Путевой лист'): cmr_text.find(';25 Регистрац.')]  
    if utils.check_string(dict['CarrierName'], cmr_part):
        cmr['CarrierName'] = re.search(dict['CarrierName'],cmr_part)[1]
    if utils.check_string(dict['CarrierDocId'], cmr_part):
        cmr['CarrierDocId'] = re.search(dict['CarrierDocId'],cmr_part)[1]
        if len(cmr['CarrierDocId'].strip()) == 8:
            cmr['CarrierDocId'] = 'N' + cmr['CarrierDocId'] 
    

    if cmr['DeclarantName'] == None:
        if cmr['CarrierName'] == cmr ['ConsigneeName']:
            cmr['DeclarantName'] = cmr ['ConsigneeName']
            cmr['DeclarantDocId'] = cmr['ConsigneeDocId']
            cmr['DeclarantStreetHouse'] = cmr['ConsigneeStreetHouse']
            cmr['DeclarantCity'] = cmr['ConsigneeCity']
            cmr['DeclarantCountry'] = cmr['ConsigneeCountry']
            cmr['DeclarantCountryCode'] = cmr['ConsigneeCountryCode']
        else:
            cmr['DeclarantName'] = ''
            cmr['DeclarantDocId'] = ''
            cmr['DeclarantStreetHouse'] = ''
            cmr['DeclarantCity'] = ''
            cmr['DeclarantCountry'] = ''
            cmr['DeclarantCountryCode'] = ''
    if len(cmr['DeclarantDocId'].strip()) == 8:
                cmr['DeclarantDocId'] = 'N'+ cmr['DeclarantDocId']
    if len(cmr['ConsigneeDocId'].strip()) == 8:
                cmr['ConsigneeDocId'] = 'N'+ cmr['ConsigneeDocId']
                
    print ('DeclarantDocId = ', cmr['DeclarantDocId'])
    print ('ConsigneeDocId = ', cmr['ConsigneeDocId'])
    return cmr
    

def car_description_parser(dict, car_desc) -> tuple:
        car_characters={}
        if utils.check_string(dict['PLANT'], car_desc):
            # ИСПРАВИТЬ
            car_characters['PLANT'] = re.search(dict['PLANT'], car_desc)[1]
            pattern = car_characters['PLANT'] + r'\s+' +dict['MODEL']
            if utils.check_string(pattern, car_desc):
                car_characters['MODEL'] = re.search(pattern, car_desc)[1]
        if utils.check_string(dict['VIN'],car_desc):
            car_characters['VIN'] = re.search(dict['VIN'], car_desc)[1]
        if utils.check_string(dict['POWER'], car_desc ):
            car_characters['POWER'] = re.search(dict['POWER'], car_desc)[1]
        if utils.check_string(dict['ENGINE_VALUE'], car_desc):
            car_characters['ENGINE_VALUE'] = re.search(dict['ENGINE_VALUE'], car_desc) [1]
            if   car_characters['ENGINE_VALUE'].find('.') == -1:
                car_characters['ENGINE_VALUE'] += '.000000'
        if utils.check_string(dict['PRODUCTION_YEAR'], car_desc):
            car_characters['PRODUCTION_YEAR'] = re.search(dict['PRODUCTION_YEAR'], car_desc)[1]
            if car_characters ['ENGINE_VALUE'] != None:
                
                car_characters ['HS_CODE'] = hs_code.car_hs_code(float(car_characters['ENGINE_VALUE']), int (car_characters['PRODUCTION_YEAR']))
        if utils.check_string(dict['REG_NOMER'], car_desc):
            car_characters['REG_NOMER'] = re.search(dict['REG_NOMER'], car_desc)[1]
            car_characters['REG_NOMER'] = car_characters['REG_NOMER'].replace(' ','')
        
            
        return car_characters

        


