parent_path = r'C:\Renelog\Asel'

matcher_dictionary_asel_invoice = {
'InvoicedCost'                 :  r';Итого;.+;.+;(\d{1,2}\s?\d{3})',                              #for using in invoice
'ContractCurrencyCode'         :  r';Стоимость в ([A-Z]{3});',                                             #for using in invoice
'ConsignorName'                :  r'\n;([A-ZА-ЯЁ]+\s+[A-ZА-ЯЁ]+\s?[A-ZА-ЯЁA-Z]*)\s+[0-9A-ZА-ЯЁ\/\s]+\s+[0-9А-Я\s\.\,]+;',     #+ГРУЗИЯ
'ConsignorCountry'             :  r'\n;[А-ЯA-Z\s\,0-9/\.]+(ГРУЗИЯ);',
'ConsignorCity'                :  r'\n;[А-ЯA-Z\s,\.0-9\/]+\s([А-Я]+)\,?\s[А-Я]+\s?;',
'ConsignorStreetHouse'         :  r'\n;[А-ЯA-Z\s,0-9\/]+\s\n?([А-Я\.\,\s0-9]+)\s[А-Я]+\,?\s[А-Я]+\s?;',
'ConsigneeName'                :  r'\n;.+;([А-Я]+\s[А-Я]+\s?[А-Я]*)\s+[ID/\s0-9]*\s+[А-Я\/\-0-9\s\,\.]+;',
'ConsigneeCountry'             :  r'\n;.+;[А-Я\s]+[ID/\s0-9]*\s+[А-Я\/\-0-9\s\,\.]+\s([А-Я]+);',
#'ConsigneeCountry'             :  r'\n;.+;[А-Я]+\s[А-Я]+\s+[ID\/0-9]*\s+[А-Я\/\-0-9\s\,\.]+\s([А-Я]+);',
'ConsigneeCity'                :  r'\n;.+;[А-Я\s]+[ID/\s0-9]*\s+[А-Я\/\-\d\s\,\.]+\s([А-Я\-\.]+)\,?\s[А-Я]+;',
'ConsigneeCityWithRegion'      :  r'\n;.+;[А-Я\s]+[ID/\s0-9]*\s+[А-Я\/\-\d\s\,\.]+\s([А-Я\-]+\sОБЛ[\.АСТЬ]{0,4})\,?\s[А-Я]+;',
'component'                    :  r'\n;.+;',
'ConsigneeStreetHouse'         :  r' ',
'DeclarantName'                :  r' ',
'DeclarantCountry'             :  r' ',
'DeclarantCity'                :  r' ',
'DeclarantStreetHouse'         :  r' ',
'DeliveryCustomsOfficeCode'    :  r' ',
'GoodsDescription'             :  r'\n;([A-Z0-9Гг.СМ3\s]+);.+;[0-9]{3,4}\s?kg;.+;',                #for using in invoice
'GrossWeight'                  :  r';[A-Z0-9Гг.СМ3\s]+;1;([0-9]{3,4})\s?kg;.+;',
'PrDocumentNumber'              :  r'INVOICE [№,#]{1}\s*([\d.\\/]{0,5}\d{7})\s*?[от]{0,2}\s*?\d{2}.\d{2}.\d{4}',  #for using in invoice
'PrDocumentDate'                :  r'Дата\s+(\d{2}.\d{2}.\d{4})',                                 #for using in invoice
}


matcher_dictionary_asel_CMR = {
'ConsignorName'                :  r'\n;([A-ZА-ЯЁ]+\s+[A-ZА-ЯЁ]+\s?[A-ZА-ЯЁA-Z]*);',
'ConsignorID'                  :  r'',
'ConsignorCountry'             :  r'',
'ConsignorCity'                :  r'',
'ConsignorStreetHouse'         :  r'',
'ConsigneeName'                :  r'\n;([А-ЯA-Z]+\s+[А-ЯA-Z]+[\sА-ЯA-Z]*);',
'ConsigneeCountry'             :  r'[\,\s]+([А-Я]+);',
'ConsigneeCity'                :  r';+\n;([А-ЯCЁ\s\.]+)\,?\s',                           #r';+\n;([А-Я\s\.]+)\,?\s',
'ConsigneePhone'               :  r'\n;(\+?\d{11,13});',
#'ConsigneeCityWithRegion'     :  r';+\n;([А-Я\s\.]+ОБЛ[АСТЬ]{0,4})\,?\s',
'component'                    :  r'',
'ConsigneeStreetHouse'         :  r'([А-ЯA-Z0-9\s\/\-\.\,]+)',
'DeclarantName'                :  r' ',
'DeclarantCountry'             :  r'([А-Я]+);',
'DeclarantCity'                :  r';+([А-Я\s\.]+)[\,\s]{2,}',
'DeclarantPhone'               :  r';(\+?\d{11,13});',
'DeclarantStreetHouse'         :  r';([А-Я0-9\s\/\-\.\,]+);',
'DeliveryCustomsOfficeCode'    :  r' ',
'GoodsDescriptionPart1'        :  r'\n;([A-ZА-Яа-я0-9\s\.]+);',                      #;SUBARU FORESTER 2018г. 2500 CM3;;;;;;;;;;;;;;;;;;;;;;;               
'GrossWeight'                  :  r';(\d{4})\s?k?g;',
'DeliveryCustomsOfficeColde'   :  r'\s(\d{8})',
'PrDocumentNumber'             :  r';;;Международная товарно-транспортная накладная CMR (\d{6,8}).+;;;',  
'PrDocumentDate'               :  r';21\s+Составлена\s+в\s+[А-Я]+\s+Дата\s+(\d{2}\.\d{2}\.\d{4})\s+.+;', 
'PrDocumentPlace'              :  r'([А-Я]+)\s+Дата',
'CarrierName'                  :  r'([А-Я]+\s[А-Я]+)\s+Фамилии',
'CarrierDocId'                 :  r'\s+Фамилии\s+ID/\s(\d+)\s+водителей'


}

matcher_dictionary_car_description ={
'PLANT'                        :  r'(^[A-Z]+)',
'MODEL'                        :  r'([0-9A-Z]+)',
'MARKA'                        :  r'([A-Z]+)',
'VIN'                          :  r'([A-HJ-NPR-Z\d]{3}[A-HJ-NPR-Z\d]{5}[\dXBW][A-HJ-NPR-Z\d][A-HJ-NPR-Z\d][A-HJ-NPR-Z\d]{6})',  
#'VIN'                          :  r'^(?<wmi>[A-HJ-NPR-Z\d]{3})(?<vds>[A-HJ-NPR-Z\d]{5})(?<check>[\dX])(?<vis>(?<year>[A-HJ-NPR-Z\d])(?<plant>[A-HJ-NPR-Z\d])(?<seq>[A-HJ-NPR-Z\d]{6}))$',
'POWER'                        :  r'(\d{2,3})\s*HP',
'ENGINE_VALUE'                 :  r'(\d{3,4})\s*(СМ|CM)3',
'PRODUCTION_YEAR'              :  r'((19|20)\d{2})\s{0,2}(г|Г|y|Y)',
'REG_NOMER'                    :  r'([0-9]{4}\s?[A-Z]{2})[^3]{1}'      
}

IdentityCardName = 'Паспорт иностранного гражданина'

GoodsDescription = 'АВТОМОБИЛЬ БУ:  '



