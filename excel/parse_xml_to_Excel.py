#parse_xml_to_Excel - parse zml file for father loading to excel
import xml.etree.ElementTree as ET
from excel.excel_data import Excel_Data
import sys
from database import Customs_code
from database import MarkCode
import re

def parse_SubjectAddressDetails(SubjectAddressDetails, ns):
    Country = SubjectAddressDetails.find('RUScat_ru:CounryName', ns).text
    print ('Country=', Country)
    City = SubjectAddressDetails.find('RUScat_ru:City', ns).text
    print ('City=', City)
    StreetHouse = SubjectAddressDetails.find('RUScat_ru:StreetHouse', ns).text
    print ('Street=', StreetHouse)
    return Country, City, StreetHouse

def parse_IdentityCard(IdentityCard, ns):
    
    IdentityCardCode   =  IdentityCard.find('RUScat_ru:IdentityCardCode', ns). text
    IdentityCardName   =  IdentityCard.find('RUScat_ru:IdentityCardName', ns). text
    IdentityCardNumber =  IdentityCard.find('RUScat_ru:IdentityCardNumber', ns). text
    IdentityCardDate   =  IdentityCard.find('RUScat_ru:IdentityCardDate', ns).text

    return IdentityCardCode, IdentityCardName, IdentityCardNumber, IdentityCardDate

def parse_TDGuarantee(TDGuarantee, ns):
    MeasureCode = TDGuarantee.find('catESAD_cu:MeasureCode',ns).text
    DocNumber   = TDGuarantee.find('catESAD_cu:DocNumber',ns).text
    DocDate     = TDGuarantee.find('catESAD_cu:DocDate',ns).text
    return MeasureCode, DocNumber, DocDate    

def parse_DeliveryCustomsOffice(DeliveryCustomsOffice, ns):
    Code               = DeliveryCustomsOffice.find('cat_ru:Code', ns).text
    OfficeName         = DeliveryCustomsOffice.find('cat_ru:OfficeName', ns).text
    CustomsCountryCode = DeliveryCustomsOffice.find('cat_ru:CustomsCountryCode', ns).text
    return Code, OfficeName, CustomsCountryCode


def parse_xml_to_Excel(input_file) :
    ex_data = Excel_Data()

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
        
    tree = ET.parse (input_file)
    root = tree.getroot()
    ESADout_CUGoodsShipment = root.find('{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}ESADout_CUGoodsShipment')

    ESADout_CUConsignor   = ESADout_CUGoodsShipment.find('{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}ESADout_CUConsignor')
    ex_data.Consignor     = ESADout_CUConsignor.find('cat_ru:OrganizationName', ns).text
    SubjectAddressDetails = ESADout_CUConsignor.find('RUScat_ru:SubjectAddressDetails', ns)
    ex_data.ConsignorCountry, ex_data.ConsignorCity, ex_data.ConsignorSteetHouse = parse_SubjectAddressDetails(SubjectAddressDetails, ns)
    

    ESADout_CUConsignee = ESADout_CUGoodsShipment.find('{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}ESADout_CUConsignee')
    ex_data.Consignee = ESADout_CUConsignee.find('cat_ru:OrganizationName', ns).text
    SubjectAddressDetails = ESADout_CUConsignee.find('RUScat_ru:SubjectAddressDetails', ns)
    ex_data.ConsigneeCountry, ex_data.ConsigneeCity, ex_data.ConsigneeStreetHouse = parse_SubjectAddressDetails(SubjectAddressDetails, ns)
    
    ESADout_CUDeclarant = ESADout_CUGoodsShipment.find('{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}ESADout_CUDeclarant')
    ex_data.Driver = ESADout_CUDeclarant.find('cat_ru:OrganizationName', ns).text
    SubjectAddressDetails = ESADout_CUDeclarant.find('RUScat_ru:SubjectAddressDetails', ns)
    ex_data.DriverCountry, ex_data.DriverCity, ex_data.DriverStreetHouse = parse_SubjectAddressDetails(SubjectAddressDetails, ns)

    ESADout_CUCarrier = ESADout_CUGoodsShipment.find('{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}ESADout_CUCarrier')
    ESADout_CUDriverInformation = ESADout_CUCarrier.find('{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}ESADout_CUDriverInformation')
    IdentityCard = ESADout_CUDriverInformation.find('RUScat_ru:IdentityCard', ns)
    _, _, ex_data.DriverPassport, ex_data.DriverPassportDate = parse_IdentityCard(IdentityCard, ns)

    TDGuarantee = ESADout_CUGoodsShipment.find('{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}TDGuarantee')
    _, ex_data.DopNumber, _ = parse_TDGuarantee(TDGuarantee, ns)

    
    
    ESADout_CUConsigment = ESADout_CUGoodsShipment.find('{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}ESADout_CUConsigment')
    TDDeliveryPlace      = ESADout_CUConsigment.find('{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}TDDeliveryPlace')
    DeliveryCustomsOffice = TDDeliveryPlace.find('{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}DeliveryCustomsOffice')
    ex_data.DeliveryCustomsOfficeCode, _ , _ = parse_DeliveryCustomsOffice(DeliveryCustomsOffice, ns)


    ex_data.Currency = ESADout_CUGoodsShipment.find('catESAD_cu:CustCostCurrencyCode', ns).text
    ex_data.InvoiceCost = int(float(ESADout_CUGoodsShipment.find('catESAD_cu:TotalCustCost', ns).text))
    ESADout_CUGoods = ESADout_CUGoodsShipment.find('{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}ESADout_CUGoods')
    ex_data.HS_code = ESADout_CUGoods.find('catESAD_cu:GoodsTNVEDCode', ns).text
    ESADout_CUPresentedDocuments = ESADout_CUGoods.findall('{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}ESADout_CUPresentedDocument')
    for document in ESADout_CUPresentedDocuments:
        document_code =  document.find('catESAD_cu:PresentedDocumentModeCode',ns).text
        if document_code == '02015':
            ex_data.CMR     = document.find('cat_ru:PrDocumentNumber',ns).text
            ex_data.CMRDate = document.find('cat_ru:PrDocumentDate',ns).text
        elif document_code == '09023':
            if document.find('cat_ru:PrDocumentNumber', ns).text.find('69050/') > -1:
                ex_data.TempReg = document.find('cat_ru:PrDocumentNumber',ns).text
                ex_data.TempRegDate = document.find('cat_ru:PrDocumentDate',ns).text
            elif re.search(r'N\d{8}', document.find('cat_ru:PrDocumentNumber', ns).text) is not None:
                ex_data.Passport = document.find('cat_ru:PrDocumentNumber',ns).text
                ex_data.PassportDate = document.find('cat_ru:PrDocumentDate',ns).text
        elif document_code == '04021':
            ex_data.Invoice = document.find('cat_ru:PrDocumentNumber',ns).text
            ex_data.InvoiceDate = document.find('cat_ru:PrDocumentDate',ns).text
        elif document_code == '02099':
            ex_data.Deal = document.find('cat_ru:PrDocumentNumber',ns).text
            ex_data.DealDate = document.find('cat_ru:PrDocumentDate',ns).text

    GoodsDescription = ESADout_CUGoods.find('catESAD_cu:GoodsDescription', ns)
    description = GoodsDescription.text
    for plant in MarkCode.mark_code:
        if description.find(plant) > -1:
            ex_data.MODEL = plant
    
    pattern = ex_data.MODEL + r'\s+([A-Z\s\d]+)\s'   
    ex_data.MARKA = re.search(pattern, description)[1]

    pattern = ex_data.MODEL + r'\s+' + ex_data.MARKA + r'\s+.*(2\d{3})\s*[ГгY]\.?'
    ex_data.Prod_year = re.search(pattern, description)[1]
    pattern = r'\s+(\d{4}[A-Z]{2})$'
    ex_data.RegNum = re.search(pattern, description)[1]
    pattern = r'\s+(\d{2,3})\s?HP'
    ex_data.Power = re.search(pattern,description)[1]
    SupplementaryGoodsQuantity = ESADout_CUGoods.find('{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}SupplementaryGoodsQuantity')
                                                      
    ex_data.Gross = int(float(ESADout_CUGoods.find('catESAD_cu:GrossWeightQuantity', ns).text))

    GoodsQuantity = SupplementaryGoodsQuantity.find('cat_ru:GoodsQuantity',ns)
    ex_data.Engine_Value = GoodsQuantity.text
    RUTransportMeans = ESADout_CUGoodsShipment.find('.//{urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0}RUTransportMeans')
    ex_data.VIN = RUTransportMeans.find('cat_ru:VIN',ns).text
    


    return ex_data


if __name__ == '__main__':
    file = sys.argv[1]

    data = parse_xml_to_Excel(file)
    print('regnum = ',data.RegNum)
    data.export_to_df()
    
    
    