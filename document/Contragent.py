from database import country_code as cs
from document.Document import Document


class Contragent:
    def __init__(self):
        self.Name = ''
        self.CountryCode = ''
        self.City = ''
        self.StreetHouse = ''
        self.PhoneNumber = ''
        self.Document = Document()


    def country_code_validate(self):
        print(cs.country_code_dict)
        if self.CountryCode in  cs.country_code_dict.keys():
            print('True')
            return True
        else:
            return False