import re as re_
import sys



class Invoice:
    def __init__(self):
        self.PrDocumentNumber = ''
        self.PrDocumentDate = ''
        self.GoodsDescription = ''
        self.GrossWeight = ''
        self.InvoicedCost = ''
        self.ContractCurrencyCode = ''
        self.ConsignorName = ''
        self.ConsignorCountry = ''
        self.ConsignorCountryCode = ''
        self.ConsignorCity = ''
        self.ConsignorStreetHouse = ''
        self.ConsigneeName = ''
        self.ConsigneeCountry = ''
        self.ConsigneeCountryCode = ''
        self.ConsigneeCity = ''
        self.ConsigneeStreetHouse = ''

