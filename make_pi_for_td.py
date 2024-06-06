# %%
#make_pi_for_td
#add missed elemenets to xml file unloaded from arsenal system 

import xml.etree.ElementTree as ET
import sys
sys.path.insert(2, '../database')
from database import MarkCode
from database import Customs_code
from excel import parse_xml_to_Excel as Excel_parser
import constants
import re

def make_td_from_pi(input_file,  car_characteristics = None, car_cost=None, car_cost_currency_code=None):
    ns = { 
        ""          : "urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0",
        "cat_ru"    : "urn:customs.ru:CommonAggregateTypes:5.22.0",
        "catESAD_cu": "urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0",
        "cltESAD_cu": "urn:customs.ru:CUESADCommonLeafTypes:5.17.0",
        "RUDECLcat" : "urn:customs.ru:RUDeclCommonAggregateTypesCust:5.23.0",
        "RUScat_ru" : "urn:customs.ru:RUSCommonAggregateTypes:5.22.0",
        "RUSclt_ru" : "urn:customs.ru:RUSCommonLeafTypes:5.21.0",}
    
    for key, value in ns.items():
        ET.register_namespace(key, value)

    data_from_XML = Excel_parser.parse_xml_to_Excel(file)
    df_from_XML = data_from_XML.export_to_df()
    #df_from_XML.to_clipboard(excel=True,index=False, sep=';')
    csv_file = file.replace('.xml', '.csv')
    df_from_XML.to_csv(csv_file, index=False, encoding='utf-8', header= False, sep=';')
    #excel_file = file.replace('.xml', '.xlsx')
    #df_from_XML.to_excel(excel_file, index = False)

    tree = ET.parse (input_file)
    root = tree.getroot()
    print(root.tag)

    ESADout_CUGoodsShipment = root.find('{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}ESADout_CUGoodsShipment')

    if car_cost_currency_code == None:
        car_cost_currency_code = ESADout_CUGoodsShipment.find('catESAD_cu:CustCostCurrencyCode', ns).text
    
    if car_cost == None:
        car_cost = ESADout_CUGoodsShipment.find('catESAD_cu:TotalCustCost', ns).text
    ESADout_CUGoods = ESADout_CUGoodsShipment.find('{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}ESADout_CUGoods')

    TransitFeature = ET.Element('{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}TransitFeature')
    TransitFeature.text = 'ФЛ'
    root.insert(3, TransitFeature)

    if car_characteristics == None:
        car_characteristics ={}
        GoodsDescription = ESADout_CUGoods.find('catESAD_cu:GoodsDescription', ns)
        description = GoodsDescription.text
        for plant in MarkCode.mark_code:
            if description.find(plant) > -1:
                car_characteristics['PLANT'] = plant
        if car_characteristics['PLANT'] == None:
            print ('I can not find plant in ', description)
            return
        pattern = car_characteristics['PLANT'] + r'\s+([A-Z\s\d]+)\s'   # +\d{4}'
        print('pattern =',pattern)
        car_characteristics['MODEL'] = re.search(pattern, description)[1]
        print('MODEL :', car_characteristics['MODEL'])
        pattern = car_characteristics['PLANT'] + r'\s+' + car_characteristics['MODEL'] + r'\s+.*(2\d{3})\s*[ГгY]\.?'
        car_characteristics['PRODUCTION_YEAR'] = re.search(pattern, description)[1]
        print('YEAR :', car_characteristics['PRODUCTION_YEAR'])

        SupplementaryGoodsQuantity = ESADout_CUGoods.find('{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}SupplementaryGoodsQuantity')
                                                          
        GoodsQuantity = SupplementaryGoodsQuantity.find('cat_ru:GoodsQuantity',ns)
        car_characteristics['ENGINE_VALUE'] = GoodsQuantity.text
        print ('ENGINE_VALUE', car_characteristics['ENGINE_VALUE'])

        RUTransportMeans = ESADout_CUGoodsShipment.find('.//{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}RUTransportMeans')

        car_characteristics['VIN'] = RUTransportMeans.find('cat_ru:VIN',ns).text
        print('VIN ', car_characteristics['VIN'])

    #44 я графа
    ESADout_CUPresentedDocuments = ESADout_CUGoods.findall('{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}ESADout_CUPresentedDocument')
    print ('ESADout_CUPresentedDocuments',ESADout_CUPresentedDocuments[0])
    passport_first = False
    for document in ESADout_CUPresentedDocuments:
        document_code =  document.find('catESAD_cu:PresentedDocumentModeCode',ns).text
        print ('Code:', document_code)
        if document_code in Customs_code.doc_code.keys():
            PrDocumentName= ET.Element('{urn:customs.ru:CommonAggregateTypes:5.22.0}PrDocumentName')
            PrDocumentName.text = Customs_code.doc_code[document_code]
            document.insert(0, PrDocumentName)
            if document_code == '02099':
                document.find('catESAD_cu:PresentedDocumentModeCode',ns).text = '09023'
        elif document_code == '09023':
            if document.find('cat_ru:PrDocumentNumber', ns).text.find('69050/') > -1:
                PrDocumentName = ET.Element( '{urn:customs.ru:CommonAggregateTypes:5.22.0}PrDocumentName')
                PrDocumentName.text = 'СВИДЕТЕЛЬСТВО О ВРЕМЕННОЙ РЕГИСТРАЦИИ'
                document.insert(0, PrDocumentName)
            elif re.match(r'N\d{8}', document.find('cat_ru:PrDocumentNumber', ns).text) is not None and not passport_first:
                PrDocumentName = ET.Element( '{urn:customs.ru:CommonAggregateTypes:5.22.0}PrDocumentName')
                PrDocumentName.text = 'ПАСПОРТ ВОДИТЕЛЯ'
                document.insert(0, PrDocumentName)
                passport_first = True
    
            
    GoodsAutomotive = ET.SubElement(ESADout_CUGoods, '{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}GoodsAutomobile')
    ET.SubElement(GoodsAutomotive,'{urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0}RecNumber' ).text = '1'

    if str(car_characteristics['PLANT']) in MarkCode.mark_code: 
        ET.SubElement(GoodsAutomotive, '{urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0}Model').text = car_characteristics['PLANT'] + ' ' + car_characteristics['MODEL']
        ET.SubElement(GoodsAutomotive, '{urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0}Mark').text = car_characteristics['PLANT']
        ET.SubElement(GoodsAutomotive, '{urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0}MarkCode').text = MarkCode.mark_code[car_characteristics['PLANT']]
    ET.SubElement(GoodsAutomotive, '{urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0}OfftakeYear').text = car_characteristics['PRODUCTION_YEAR']
    EngineVolumeQuanity = ET.SubElement(GoodsAutomotive, '{urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0}EngineVolumeQuanity')
    ET.SubElement(EngineVolumeQuanity, '{urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0}MeasuredAmount').text = car_characteristics['ENGINE_VALUE']
    ET.SubElement(EngineVolumeQuanity, '{urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0}MeasureUnitQualifierName').text = 'СМ3, МЛ'
    ET.SubElement(EngineVolumeQuanity, '{urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0}MeasureUnitQualifierCode').text = '111'
    ET.SubElement(GoodsAutomotive, '{urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0}VINID').text = car_characteristics['VIN']
    CarCostInfo = ET.SubElement(GoodsAutomotive, '{urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0}CarCostInfo')
    ET.SubElement(CarCostInfo, '{urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0}CarCost').text = car_cost
    ET.SubElement(CarCostInfo, '{urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0}CarCostCurrencyCode').text = car_cost_currency_code



    """
    <ExecutionPlace xmlns="urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0">т/п МАПП Верхний Ларс</ExecutionPlace>
    """
    ExecutionPlace = ET.Element('{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}ExecutionPlace')
    ExecutionPlace.text = 'т/п МАПП Верхний Ларс'
    root.insert(6, ExecutionPlace)

    PackagePalleteInformation = ET.Element( '{urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0}PackagePalleteInformation')
    InfoKindCode = ET.Element('{urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0}InfoKindCode', )
    InfoKindCode.text = '0'
    PackagePalleteInformation.insert(0, InfoKindCode)
    PalleteCode = ET.Element ('{urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0}PalleteCode')
    PalleteCode.text ='NE'
    PackagePalleteInformation.insert(1, PalleteCode)
    PalleteQuantity = ET.Element('{urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0}PalleteQuantity')
    PalleteQuantity.text = '1'
    PackagePalleteInformation.insert(2, PalleteQuantity)

    ESADGoodsPackaging = ESADout_CUGoods.find( '{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}ESADGoodsPackaging')
    ESADGoodsPackaging.append( PackagePalleteInformation)


    #out_file = '/pi_for_' + input_file[len(path)+1:]
    out_file = file.replace('.xml', '_pi_for_td.xml')
    tree.write(out_file)

if __name__ == '__main__':
    #path= path = constants.parent_path + '\\' + sys.argv[1]
    file = constants.parent_path + '\\' + sys.argv[1] + '\\' + sys.argv[1] + '.xml' 
    #pat = sys.argv[2]
    #car_character = {'PLANT':'HYUNDAI','MODEL':'SONATA', 'PRODUCTION_YEAR' : '2018', 'ENGINE_VALUE':'2500', 'VIN' :'4T1BF1FK6GU265476'}
    #cost = '5000'
    #cost_cur_code = 'USD'
    make_td_from_pi(file, car_characteristics = None, car_cost= None, car_cost_currency_code= None)




