#invoice and CMR FIELDS should be the same
def compare(str1,str2) ->int:
    if str1 == str2:
        print(f'Strings {str1} and {str2} are the same.\n')
        return 0 
    else:
        print (f'Attention \n String in Invoice:\n{str1}\n differs from the same string in CMR:\n{str2}\n')
        return 1


def check_docs(invoice, cmr) -> int:
    result = compare(invoice['ConsignorName'], cmr['ConsignorName']) 
    
    for key in cmr['CAR']:
        if key != 'REG_NOMER' and invoice['GoodsDescription'].find(cmr['CAR'][key]) == -1: 
            result += 1
            print (f'There is not {key} = {cmr['CAR'][key]} in {invoice['GoodsDescription']}')
    result += compare(invoice['GrossWeight'], cmr['GrossWeight'])
    result += compare(invoice['ConsignorCountry'], cmr['ConsignorCountry'] )
    result += compare(invoice['ConsignorCity'], cmr['ConsignorCity']) 
    result += compare(invoice['ConsignorStreetHouse'], cmr['ConsignorStreetHouse']) 
    result += compare(invoice['ConsigneeName'], cmr['ConsigneeName'])
    result += compare(invoice['ConsigneeCountry'],cmr['ConsigneeCountry']) 
    result += compare(invoice['ConsigneeCity'] , cmr['ConsigneeCity'])
    result += compare(invoice['ConsigneeStreetHouse'] , cmr['ConsigneeStreetHouse'])
    return result    





 