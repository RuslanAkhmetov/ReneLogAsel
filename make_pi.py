import xml.etree.ElementTree as ET
from datetime import datetime
from datetime import timedelta
from database import country_code
import constants
import xmlschema
from pprint import pprint
import json
from utils import utils


def make_pi_by_xsd(path):
    schema = xmlschema.XMLSchema('./customs/ESADout_CU.xsd')
    xml_document =  path + '/0175AF.xml'
    xt = ET.parse(xml_document)
    if schema.is_valid(xt):
        with open(path + '/pi.json','w',encoding='utf-8') as f:
            f.write(
                json.dumps(schema.to_dict(xml_document, decimal_type = str), ensure_ascii=False, indent=4 )
            )
        pprint(json.dumps(schema.to_dict(xml_document, decimal_type = str),ensure_ascii=False, indent=4))
    else:
        print(schema.validation_errors)    



def make_pi(content, path):
    
    with open('./templatefiles/pi.json', 'r+',encoding='utf-8') as f:
        data = json.load(f)
        f.close()        # <--- should reset file position to the beginning.

    data["EECEDocHeaderAddInfo"]["RUScat_ru:EDocDateTime"] = datetime.now().strftime("%Y-%m-%dT%H:%M:%S")
    data["RecipientCountryCode"] = content['cmr']['ConsigneeCountryCode']
    data["ESADout_CUGoodsShipment"]["catESAD_cu:TotalCustCost"] = content['invoice']['InvoicedCost']
    data["ESADout_CUGoodsShipment"]["catESAD_cu:CustCostCurrencyCode"] = content['invoice']['ContractCurrencyCode']
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsignor"]["cat_ru:OrganizationName"] = content['invoice']['ConsignorName']
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsignor"]["RUScat_ru:SubjectAddressDetails"][0]["RUScat_ru:CountryCode"] = content['invoice']['ConsignorCountryCode']
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsignor"]["RUScat_ru:SubjectAddressDetails"][0]["RUScat_ru:CounryName"] = content['invoice']['ConsignorCountry']
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsignor"]["RUScat_ru:SubjectAddressDetails"][0]["RUScat_ru:City"] = content['invoice']['ConsignorCity']
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsignor"]["RUScat_ru:SubjectAddressDetails"][0]["RUScat_ru:StreetHouse"]= content['invoice']['ConsignorStreetHouse']
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsignee"]["cat_ru:OrganizationName"]= content['invoice']['ConsigneeName']
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsignee"]["RUScat_ru:SubjectAddressDetails"][0]["RUScat_ru:CountryCode"] = content['invoice']['ConsigneeCountryCode']
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsignee"]["RUScat_ru:SubjectAddressDetails"][0]["RUScat_ru:CounryName"] = content['invoice']['ConsigneeCountry']
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsignee"]["RUScat_ru:SubjectAddressDetails"][0]["RUScat_ru:City"] = content['invoice']['ConsigneeCity']
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsignee"]["RUScat_ru:SubjectAddressDetails"][0]["RUScat_ru:StreetHouse"]= content['invoice']['ConsigneeStreetHouse'] 
    data["ESADout_CUGoodsShipment"]["ESADout_CUDeclarant"]["cat_ru:OrganizationName"] = content['cmr']['DeclarantName']
    declarant_addr = [ {"RUScat_ru:CountryCode": content['cmr']['DeclarantCountryCode'],
                        "RUScat_ru:CounryName": content['cmr']['DeclarantCountry'],
                        "RUScat_ru:City": content['cmr']['DeclarantCity'],
                        "RUScat_ru:StreetHouse": content['cmr']['DeclarantStreetHouse']}]
    
    data["ESADout_CUGoodsShipment"]["ESADout_CUDeclarant"]["RUScat_ru:SubjectAddressDetails"] =  declarant_addr

    data["ESADout_CUGoodsShipment"]["ESADout_CUCarrier"]["cat_ru:OrganizationName"] = content['cmr']['DeclarantName']
    data["ESADout_CUGoodsShipment"]["ESADout_CUCarrier"]["RUScat_ru:SubjectAddressDetails"] =  declarant_addr
    driver =[{"cat_ru:PersonSurname": content['cmr']['DeclarantName'].split()[0],
              "cat_ru:PersonName"   : content['cmr']['DeclarantName'].split()[1],
              "RUScat_ru:IdentityCard": {
                    "RUScat_ru:IdentityCardCode"  : "10",
                    "RUScat_ru:IdentityCardName"  : constants.IdentityCardName,
                    "RUScat_ru:IdentityCardNumber": content['cmr']['DeclarantDocId'],
                    "RUScat_ru:IdentityCardDate"  : ""
            }}]
    data["ESADout_CUGoodsShipment"]["ESADout_CUCarrier"]["ESADout_CUDriverInformation"] = driver 
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]["catESAD_cu:DispatchCountryCode"] = content['invoice']['ConsignorCountryCode']
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]["catESAD_cu:DispatchCountryName"] = content['invoice']['ConsignorCountry']
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]["catESAD_cu:DestinationCountryCode"]= content['invoice']['ConsigneeCountryCode']
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]["catESAD_cu:DestinationCountryName"]= content['invoice']['ConsigneeCountry']

    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]["DateExpectedArrival"] = (datetime.today() + timedelta(days=7)).strftime("%Y-%m-%d")
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]["TimeExpectedArrival"] = (datetime.today() + timedelta(days=7)).strftime("%Y-%m-%d")

    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]["ESADout_CUDepartureArrivalTransport"]["cat_ru:TransportNationalityCode"] = content['invoice']['ConsignorCountryCode']
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]["ESADout_CUDepartureArrivalTransport"]["RUTransportMeans"] =  {
                                                                "cat_ru:VIN" : content['cmr']['CAR']['VIN'],
                                                                "cat_ru:TransportIdentifier": content['cmr']['CAR']['REG_NOMER'],
                                                                "cat_ru:TransportMeansNationalityCode": content['invoice']['ConsignorCountryCode']
    }
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]["TDDeliveryPlace"]["DeliveryCustomsOffice"]["cat_ru:Code"] = content['cmr']['DeliveryCustomsOfficeColde']

    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]["TDDeliveryPlace"]["DeliveryCustomsOffice"]["cat_ru:CustomsCountryCode"] = country_code.country_digit_code[content['invoice']['ConsigneeCountry']]

    data["ESADout_CUGoodsShipment"]["ESADout_CUMainContractTerms"]["catESAD_cu:ContractCurrencyCode"] = content['invoice']['ContractCurrencyCode']
    data["ESADout_CUGoodsShipment"]["ESADout_CUMainContractTerms"]["catESAD_cu:TotalInvoiceAmount"] = content['invoice']['InvoicedCost']

    data["ESADout_CUGoodsShipment"]["ESADout_CUGoods"][0]["catESAD_cu:GoodsDescription"][0] = constants.GoodsDescription + str(content['cmr']['GoodsDescription']) 
    data["ESADout_CUGoodsShipment"]["ESADout_CUGoods"][0]["catESAD_cu:GrossWeightQuantity"] = content['cmr']['GrossWeight']
    data["ESADout_CUGoodsShipment"]["ESADout_CUGoods"][0]["catESAD_cu:InvoicedCost"] = content['invoice']['InvoicedCost']
    data["ESADout_CUGoodsShipment"]["ESADout_CUGoods"][0]["catESAD_cu:GoodsTNVEDCode"] = content['cmr']['CAR']['HS_CODE']
    data["ESADout_CUGoodsShipment"]["ESADout_CUGoods"][0]["CurrencyCode"] = content['invoice']['ContractCurrencyCode']
    
    data["ESADout_CUGoodsShipment"]["ESADout_CUGoods"][0]["ESADout_CUPresentedDocument"][0] = {
                                        "cat_ru:PrDocumentNumber": content['cmr']['PrDocumentNumber'],
                                        "cat_ru:PrDocumentDate": utils.XML_date_format(content['cmr']['PrDocumentDate']),
                                        "catESAD_cu:PresentedDocumentModeCode": "02015"
    }

    
        

    data["ESADout_CUGoodsShipment"]["ESADout_CUGoods"][0]["ESADout_CUPresentedDocument"][1] = {
                                        "cat_ru:PrDocumentNumber": content['invoice']['PrDocumentNumber'],
                                        "cat_ru:PrDocumentDate":  utils.XML_date_format(content['invoice']['PrDocumentDate']),
                                        "catESAD_cu:PresentedDocumentModeCode": "04021"
    }


    data["ESADout_CUGoodsShipment"]["ESADout_CUGoods"][0]["ESADout_CUPresentedDocument"][2] = {
                                        "cat_ru:PrDocumentNumber": content['cmr']['PrDocumentNumber'],
                                        "cat_ru:PrDocumentDate": utils.XML_date_format(content['cmr']['PrDocumentDate']),
                                        "catESAD_cu:PresentedDocumentModeCode": "02099"
    }


    data["ESADout_CUGoodsShipment"]["ESADout_CUGoods"][0]["ESADout_CUPresentedDocument"][3] = {
                                        "cat_ru:PrDocumentNumber":'69050/0' + str(content['cmr']['PrDocumentNumber']),
                                        "cat_ru:PrDocumentDate": utils.XML_date_format(content['cmr']['PrDocumentDate']),
                                        "catESAD_cu:PresentedDocumentModeCode": "09023"
    }

    data["ESADout_CUGoodsShipment"]["ESADout_CUGoods"][0]["SupplementaryGoodsQuantity"]["cat_ru:GoodsQuantity"] = content['cmr']['CAR']['ENGINE_VALUE']



    root ={"ESADout_CU":data}
    out = open(path +  '/out_pi.json', 'w', encoding= 'utf-8') 
    out.write(
    json.dumps(root, indent=4,ensure_ascii=False)
    )
    out.close()
    jsonfile = open(path + '/out_pi.json', 'r', encoding= 'utf-8')
    schema = xmlschema.XMLSchema('./customs/ESADout_CU.xsd')
    #if schema.is_valid(data):
    ns = { "": "urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0",
    "cat_ru": "urn:customs.ru:CommonAggregateTypes:5.22.0",
    "catESAD_cu": "urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0",
    "cltESAD_cu": "urn:customs.ru:CUESADCommonLeafTypes:5.17.0",
    "RUDECLcat": "urn:customs.ru:RUDeclCommonAggregateTypesCust:5.23.0",
    "RUScat_ru": "urn:customs.ru:RUSCommonAggregateTypes:5.22.0",
    "RUSclt_ru": "urn:customs.ru:RUSCommonLeafTypes:5.21.0",}
    xml_element = xmlschema.from_json(jsonfile, schema= schema, preserve_root=True, namespaces=ns)
    for key, value in ns.items():
        ET.register_namespace(key, value)
    tree = ET.ElementTree(xml_element)
    pi_file = path + '/pi_test.xml'
    tree.write(pi_file, encoding='utf-8',xml_declaration=True)

    #make_td_from_pi(pi_file, content['cmr']['CAR'], content['invoice']['InvoicedCost'], content['invoice']['ContractCurrencyCode'], path) #не работает


