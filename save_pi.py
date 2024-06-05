import pandas as pd
import xml.etree.ElementTree as ET
import sys

def save_pi(input_file):
    output_file = 'C:\Renelog\Renelog.xlsx'
    ns = { 
        "": "urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0",
        "cat_ru": "urn:customs.ru:CommonAggregateTypes:5.22.0",
        "catESAD_cu": "urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0",
        "cltESAD_cu": "urn:customs.ru:CUESADCommonLeafTypes:5.17.0",
        "RUDECLcat": "urn:customs.ru:RUDeclCommonAggregateTypesCust:5.23.0",
        "RUScat_ru": "urn:customs.ru:RUSCommonAggregateTypes:5.22.0",
        "RUSclt_ru": "urn:customs.ru:RUSCommonLeafTypes:5.21.0",}
    
    for key, value in ns.items():
        ET.register_namespace(key, value)

    currency_code =[]
    car_cost = []
    consignor_name = []

    tree = ET.parse (input_file)
    root = tree.getroot()
    ESADout_CUGoodsShipment = root.find('{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}ESADout_CUGoodsShipment')

    currency_code[0] = ESADout_CUGoodsShipment.find('catESAD_cu:CustCostCurrencyCode', ns).text
    car_cost[0] = ESADout_CUGoodsShipment.find('catESAD_cu:TotalCustCost', ns).text
    ESADout_CUConsignor = ESADout_CUGoodsShipment.find('{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}ESADout_CUConsignor')
    consignor_name[0] = ESADout_CUConsignor.find('cat_ru:OrganizationName',ns).text
    
    <RUScat_ru:SubjectAddressDetails xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0"><RUScat_ru:CountryCode>GE</RUScat_ru:CountryCode><RUScat_ru:CounryName>√–”«»ﬂ</RUScat_ru:CounryName><RUScat_ru:City>“¡»À»—»</RUScat_ru:City><RUScat_ru:StreetHouse>¿Ã¿√À≈¡¿,27</RUScat_ru:StreetHouse></RUScat_ru:SubjectAddressDetails></ESADout_CUConsignor>

if __name__ == '__main__':
#file= r'C:\Users\1\PythonApp\ReneLogAsel\test'
file = sys.argv[1]
save_pi(file)



