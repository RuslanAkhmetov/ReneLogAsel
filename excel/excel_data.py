import re as re_
import sys
sys.path.insert(1, "..")
sys.path.insert(2, '../utils')
from utils import utils
import pandas as pd


Validate_simpletypes_ = True
String_cleanup_pat_ = re_.compile(r"[\n\r\s]+")

class Excel_Data:

    def __init__(self):
        self.RegNum                    =  ''
        self.Consignor                 =  ''
        self.ConsignorCountry          =  ''
        self.ConsignorCity             =  ''
        self.ConsignorSteetHouse       =  ''
        self.Consignee                 =  ''
        self.ConsigneeCountry          =  ''
        self.ConsigneeCity             =  ''
        self.ConsigneeStreetHouse      =  ''
        self.ConsigneeIIN              =  ''
        self.Driver                    =  ''
        self.DriverCountry             =  ''
        self.DriverCity                =  ''
        self.DriverStreetHouse         =  ''
        self.DriversBornDate           =  ''
        self.Passport                  =  ''
        self.PassportDate              =  None
        self.DriverIIN                 =  ''
        self.DeliveryCustomsOfficeCode =  ''
        self.GoodsDescription          =  ''
        self.MODEL                     =  ''
        self.MARKA                     =  ''
        self.Prod_year                 =  ''
        self.Engine_Value              =  ''
        self.Power                     =  ''
        self.VIN                       =  ''
        self.HS_code                   =  ''
        self.Gross                     =  ''
        self.InvoiceCost               =  ''
        self.Currency                  =  ''
        self.CMR                       =  ''
        self.CMRDate                   =  ''
        self.Deal                      = ''
        self.DealDate                  =  ''
        self.Invoice                   =  ''
        self.InvoiceDate               =  None
        self.TempReg                   =  ''
        self.TempRegDate               =  None
        self.ReneLogContract           =  ''
        self.ReneLogContractDate       =  ''
        self.DopNumber                 =  ''
        self.UIN                       =  ''
    
    def from_slice(self, slice) -> None:
        self.gds_collector_      =  None
        self.RegNum                    =  slice['RegNum']
        self.Consignor                 =  slice['Consignor']
        self.ConsignorCountry          =  slice['ConsignorCountry']
        self.ConsignorCity             =  slice['ConsignorCity']
        self.ConsignorSteetHouse       =  slice['ConsignorSteetHouse']
        self.Consignee                 =  slice['Consignee']
        self.ConsigneeCountry          =  slice['ConsigneeCountry']
        self.ConsigneeCity             =  slice['ConsigneeCity']
        self.ConsigneeStreetHouse      =  slice['ConsigneeStreetHouse']
        self.ConsigneeIIN              =  slice['ConsigneeIIN']
        self.Driver                    =  slice['Driver']
        self.DriverCountry             =  slice['DriverCountry']
        self.DriverCity                =  slice['DriverCity']
        self.DriverStreetHouse         =  slice['DriverStreetHouse']
        self.DriversBornDate           =  slice['DriversBornDate']
        self.DriverPassport            =  slice['DriverPassport']
        self.DriverPassportDate        =  slice['DriverPassportDate']
        self.DriverIIN                 =  slice['DriverIIN']
        self.DeliveryCustomsOfficeCode =  slice['DeliveryCustomsOfficeCode']
        self.GoodsDescription          =  slice['GoodsDescription']
        self.MODEL                     =  slice['MODEL']
        self.MARKA                     =  slice['MARKA']
        self.Prod_year                 =  slice['Prod_year']
        self.Engine_Value              =  slice['Engine_Value']
        self.Power                     =  slice['Power']
        self.VIN                       =  slice['VIN']
        self.validate_VINIDType(self.VIN)
        self.HS_code                   =  slice['HS_code']
        self.Gross                     =  slice['Gross']
        self.InvoiceCost               =  slice['InvoiceCost']
        self.Currency                  =  slice['Currency']
        self.CMR                       =  slice['CMR']
        self.CMRDate                   =  slice['CMRDate']
        self.Deal                      =  slice['Deal']
        self.DealDate                  =  slice['DealDate']
        self.Invoice                   =  slice['Invoice']
        self.InvoiceDate               =  slice['InvoiceDate']
        self.TempReg                   =  slice['TempReg']
        self.TempRegDate               =  slice['TempRegDate']
        self.ReneLogContract           =  slice['ReneLogContract']
        self.ReneLogContractDate       =  slice['ReneLogContractDate']
        self.DopNumber                 =  slice['DopNumber']
        self.UIN                       =  slice['UIN']

    def validate_VINIDType(self, value):
        result = True
        # Validate type VINIDType, a restriction on CategoryCust:IdentifierCategoriesCust.
        if value is not None and Validate_simpletypes_  is not None:    #and self.gds_collector_
            if not isinstance(value, str):
                lineno = self.gds_get_node_lineno_()
                self.gds_collector_.add_message('Value "%(value)s"%(lineno)s is not of the correct base simple type (str)' % {"value": value, "lineno": lineno, })
                return False
            if len(value) > 40:
                lineno = self.gds_get_node_lineno_()
            #    self.gds_collector_.add_message('Value "%(value)s"%(lineno)s does not match xsd maxLength restriction on VINIDType' % {"value": value, "lineno": lineno} )
                result = False
            if len(value) < 1:
                lineno = self.gds_get_node_lineno_()
            #    self.gds_collector_.add_message('Value "%(value)s"%(lineno)s does not match xsd minLength restriction on VINIDType' % {"value" : value, "lineno": lineno} )
                result = False
        return result    
    
    
    def export_to_df(self):
        out = pd.DataFrame ({
               'RegNum'                    : [self.RegNum],
               'Consignor'                 : [self.Consignor],                 
               'ConsignorCountry'          : [self.ConsignorCountry],  
               'ConsignorCity'             : [self.ConsignorCity], 
               'ConsignorSteetHouse'       : [self.ConsignorSteetHouse], 
               'Consignee'                 : [self.Consignee], 
               'ConsigneeCountry'          : [self.ConsigneeCountry], 
               'ConsigneeCity'             : [self.ConsigneeCity], 
               'ConsigneeStreetHouse'      : [self.ConsigneeStreetHouse], 
               'ConsigneeIIN'              : [self.ConsigneeIIN],  
               'Driver'                    : [self.Driver],  
               'DriverCountry'             : [self.DriverCountry],  
               'DriverCity'                : [self.DriverCity],  
               'DriverStreetHouse'         : [self.DriverStreetHouse],  
               'DriversBornDate'           : [self.DriversBornDate],  
               'DriverPassport'            : [self.DriverPassport],  
               'DriverPassportDate'        : [self.DriverPassportDate],  
               'DriverIIN'                 : [self.DriverIIN],  
               'DeliveryCustomsOfficeCode' : [self.DeliveryCustomsOfficeCode],  
               'GoodsDescription'          : [self.GoodsDescription],  
               'MODEL'                     : [self.MODEL],  
               'MARKA'                     : [self.MARKA],  
               'Prod_year'                 : [self.Prod_year],  
               'Engine_Value'              : [self.Engine_Value],  
               'Power'                     : [self.Power],  
               'VIN'                       : [self.VIN],  
               'HS_code'                   : [self.HS_code],  
               'Gross'                     : [self.Gross],  
               'InvoiceCost'               : [self.InvoiceCost],  
               'Currency'                  : [self.Currency],  
               'CMR'                       : [self.CMR],  
               'CMRDate'                   : [self.CMRDate],  
               'Deal'                      : [self.Deal],  
               'DealDate'                  : [self.DealDate],  
               'Invoice'                   : [self.Invoice],  
               'InvoiceDate'               : [self.InvoiceDate],  
               'TempReg'                   : [self.TempReg],  
               'TempRegDate'               : [self.TempRegDate],  
               'ReneLogContract'           : [self.ReneLogContract],  
               'ReneLogContractDate'       : [self.ReneLogContractDate],  
               'DopNumber'                 : [self.DopNumber],  
               'UIN'                       : [self.UIN],  
            } )
        #out.to_clipboard(excel=True,index=False, sep=',')
        #out.to_csv('test.csv', index=False, encoding='utf-8', header= False)
        #out.to_excel('ReneLog.xlsx', index = False)
        return out