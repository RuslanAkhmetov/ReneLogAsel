import xml.etree.ElementTree as ET
from datetime import datetime
from datetime import timedelta
from database import country_code
import constants
import xmlschema
from pprint import pprint
import json
import utils
import sys

import utils.utils
sys.path.insert(2, '../excel')
from excel import take_excel_data
from excel import excel_data


def make_pi_from_excel(input_file):
    last_row = take_excel_data.take_excel_data(input_file)
    
    content = excel_data.Excel_Data.from_slice(last_row)

    with open('./templatefiles/pi_for_excel.json', 'r+',encoding='utf-8') as f:
        data = json.load(f)
        f.close()        # <--- should reset file position to the beginning.

    data["EECEDocHeaderAddInfo"]["RUScat_ru:EDocDateTime"] = datetime.now().strftime("%Y-%m-%dT%H:%M:%S")
    data["RecipientCountryCode"] =  country_code.country_code[content.ConsigneeCountry]
    data["ESADout_CUGoodsShipment"]["catESAD_cu:TotalCustCost"] = str(content.InvoiceCost)
    data["ESADout_CUGoodsShipment"]["catESAD_cu:CustCostCurrencyCode"] = content.Currency
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsignor"]["cat_ru:OrganizationName"] = content.Consignor
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsignor"]["RUScat_ru:SubjectAddressDetails"][0]["RUScat_ru:CountryCode"] = country_code.country_code[content.ConsignorCountry]
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsignor"]["RUScat_ru:SubjectAddressDetails"][0]["RUScat_ru:CounryName"] = content.ConsignorCountry
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsignor"]["RUScat_ru:SubjectAddressDetails"][0]["RUScat_ru:City"]       = content.ConsignorCity
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsignor"]["RUScat_ru:SubjectAddressDetails"][0]["RUScat_ru:StreetHouse"]= content.ConsignorSteetHouse
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsignee"]["cat_ru:OrganizationName"]                                    = content.Consignee
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsignee"]["RUScat_ru:SubjectAddressDetails"][0]["RUScat_ru:CountryCode"] = country_code.country_code[content.ConsigneeCountry]
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsignee"]["RUScat_ru:SubjectAddressDetails"][0]["RUScat_ru:CounryName"] = content.ConsigneeCountry
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsignee"]["RUScat_ru:SubjectAddressDetails"][0]["RUScat_ru:City"] = content.ConsigneeCity
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsignee"]["RUScat_ru:SubjectAddressDetails"][0]["RUScat_ru:StreetHouse"]= content.ConsigneeStreetHouse
    data["ESADout_CUGoodsShipment"]["ESADout_CUDeclarant"]["cat_ru:OrganizationName"] = content.Driver
    declarant_addr = [ {"RUScat_ru:CountryCode": country_code.country_code[content.DriverCountry],
                        "RUScat_ru:CounryName" : content.DriverCountry,
                        "RUScat_ru:City"       : content.DriverCity,
                        "RUScat_ru:StreetHouse": content.DriverStreetHouse}]
    
    data["ESADout_CUGoodsShipment"]["ESADout_CUDeclarant"]["RUScat_ru:SubjectAddressDetails"] =  declarant_addr

    data["ESADout_CUGoodsShipment"]["ESADout_CUCarrier"]["cat_ru:OrganizationName"] = content.Driver
    data["ESADout_CUGoodsShipment"]["ESADout_CUCarrier"]["RUScat_ru:SubjectAddressDetails"] =  declarant_addr
    driver =[{"cat_ru:PersonSurname"  : content.Driver.split()[0],
              "cat_ru:PersonName"     : content.Driver.split()[1],
              "RUScat_ru:IdentityCard": {
                    "RUScat_ru:IdentityCardCode"  : "10",
                    "RUScat_ru:IdentityCardName"  : constants.IdentityCardName,
                    "RUScat_ru:IdentityCardNumber": content.Passport,
                    "RUScat_ru:IdentityCardDate"  : content.PassportDate.strftime("%Y-%m-%d")
            }}]
    data["ESADout_CUGoodsShipment"]["ESADout_CUCarrier"]["ESADout_CUDriverInformation"] = driver 
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]["catESAD_cu:DispatchCountryCode"]   =  country_code.country_code[content.ConsignorCountry]
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]["catESAD_cu:DispatchCountryName"]   = content.ConsignorCountry
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]["catESAD_cu:DestinationCountryCode"]=  country_code.country_code[content.ConsigneeCountry]
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]["catESAD_cu:DestinationCountryName"]= content.ConsigneeCountry

    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]["DateExpectedArrival"] = (datetime.today() + timedelta(days=7)).strftime("%Y-%m-%d")
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]["TimeExpectedArrival"] = (datetime.today() + timedelta(days=7)).strftime("%Y-%m-%d")

    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]["ESADout_CUDepartureArrivalTransport"]["cat_ru:TransportNationalityCode"] = country_code.country_code[content.ConsignorCountry]
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]["ESADout_CUDepartureArrivalTransport"]["RUTransportMeans"] =  {
                                                                            "cat_ru:VIN"                          : content.VIN,
                                                                            "cat_ru:TransportIdentifier"          : content.RegNum,
                                                                            "cat_ru:TransportMeansNationalityCode": country_code.country_code[content.ConsignorCountry]
    }
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]["TDDeliveryPlace"]["DeliveryCustomsOffice"]["cat_ru:Code"] = str(content.DeliveryCustomsOfficeCode)
   
    data["ESADout_CUGoodsShipment"]["ESADout_CUConsigment"]["TDDeliveryPlace"]["DeliveryCustomsOffice"]["cat_ru:CustomsCountryCode"] = country_code.country_digit_code[content.ConsigneeCountry]

    data["ESADout_CUGoodsShipment"]["ESADout_CUMainContractTerms"]["catESAD_cu:ContractCurrencyCode"] = content.Currency
    data["ESADout_CUGoodsShipment"]["ESADout_CUMainContractTerms"]["catESAD_cu:TotalInvoiceAmount"]   = str(content.InvoiceCost)

    data["ESADout_CUGoodsShipment"]["ESADout_CUGoods"][0]["catESAD_cu:GoodsDescription"][0] = content.GoodsDescription
    data["ESADout_CUGoodsShipment"]["ESADout_CUGoods"][0]["catESAD_cu:GrossWeightQuantity"] = str(content.Gross)
    data["ESADout_CUGoodsShipment"]["ESADout_CUGoods"][0]["catESAD_cu:InvoicedCost"] =  str(content.InvoiceCost)
    data["ESADout_CUGoodsShipment"]["ESADout_CUGoods"][0]["catESAD_cu:GoodsTNVEDCode"] = content.HS_code
    data["ESADout_CUGoodsShipment"]["ESADout_CUGoods"][0]["CurrencyCode"] = content.Currency
    
    data["ESADout_CUGoodsShipment"]["ESADout_CUGoods"][0]["ESADout_CUPresentedDocument"][0]= {
                                                        "cat_ru:PrDocumentNumber": utils.utils.conver_digit_to_str(content.CMR),
                                                        "cat_ru:PrDocumentDate": utils.utils.XML_date_format(content.CMRDate),
                                                        "catESAD_cu:PresentedDocumentModeCode": "02015"
    }

    data["ESADout_CUGoodsShipment"]["ESADout_CUGoods"][0]["ESADout_CUPresentedDocument"][1]= {
                                                        "cat_ru:PrDocumentNumber": utils.utils.conver_digit_to_str(content.Invoice),
                                                        "cat_ru:PrDocumentDate": utils.utils.XML_date_format(content.InvoiceDate),
                                                        "catESAD_cu:PresentedDocumentModeCode": "04021"
    }


    data["ESADout_CUGoodsShipment"]["ESADout_CUGoods"][0]["ESADout_CUPresentedDocument"][2] = {
                                                        "cat_ru:PrDocumentNumber"             : utils.utils.conver_digit_to_str(content.Deal),
                                                        "cat_ru:PrDocumentDate"               : utils.utils.XML_date_format(content.DealDate),
                                                        "catESAD_cu:PresentedDocumentModeCode": "02099"
    }

    data["ESADout_CUGoodsShipment"]["ESADout_CUGoods"][0]["ESADout_CUPresentedDocument"][3] = {
                                                        "cat_ru:PrDocumentNumber"             : utils.utils.conver_digit_to_str(content.TempReg),
                                                        "cat_ru:PrDocumentDate"               : utils.utils.XML_date_format(content.TempRegDate),
                                                        "catESAD_cu:PresentedDocumentModeCode": "09023"
    }

    data["ESADout_CUGoodsShipment"]["ESADout_CUGoods"][0]["ESADout_CUPresentedDocument"][4] = {
                                                        "cat_ru:PrDocumentNumber"             : utils.utils.conver_digit_to_str(content.Passport),
                                                        "cat_ru:PrDocumentDate"               : utils.utils.XML_date_format(content.PassportDate),
                                                        "catESAD_cu:PresentedDocumentModeCode": "09023"
    }

    data["ESADout_CUGoodsShipment"]["ESADout_CUGoods"][0]["SupplementaryGoodsQuantity"]["cat_ru:GoodsQuantity"] = str(content.Engine_Value)


    root ={"ESADout_CU":data}
    last_slesh_pos = input_file.rfind('\\')
    
    path = input_file[0:last_slesh_pos ]
    print(path)
    out = open(path +  '/out_pi_from_excel.json', 'w', encoding= 'utf-8') 
    out.write(
    json.dumps(root, indent=4,ensure_ascii=False)
    )
    out.close()
    jsonfile = open(path + '/out_pi_from_excel.json', 'r', encoding= 'utf-8')
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
    pi_file = path + '/pi_from_excel_test.xml'
    tree.write(pi_file, encoding='utf-8',xml_declaration=True)
    
    

if __name__ == '__main__':
    file = sys.argv[1]
    make_pi_from_excel(file)    