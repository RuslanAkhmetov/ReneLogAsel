#!/usr/bin/env python

#
# Generated Tue May  7 19:48:01 2024 by generateDS.py version 2.43.3.
# Python 3.12.3 (tags/v3.12.3:f6650f9, Apr  9 2024, 14:05:25) [MSC v.1938 64 bit (AMD64)]
#
# Command line options:
#   ('-o', './customs/pi.py')
#   ('-s', './customs/pisub.py')
#
# Command line arguments:
#   ./customs/ESADout_CU.xsd
#
# Command line:
#   C:\Users\1\PythonApp\generateDS-2.43.3\generateDS.py -o "./customs/pi.py" -s "./customs/pisub.py" ./customs/ESADout_CU.xsd
#
# Current working directory (os.getcwd()):
#   generateDS-2.43.3
#

import os
import sys
from lxml import etree as etree_

import ??? as supermod

def parsexml_(infile, parser=None, **kwargs):
    if parser is None:
        # Use the lxml ElementTree compatible parser so that, e.g.,
        #   we ignore comments.
        parser = etree_.ETCompatXMLParser()
    try:
        if isinstance(infile, os.PathLike):
            infile = os.path.join(infile)
    except AttributeError:
        pass
    doc = etree_.parse(infile, parser=parser, **kwargs)
    return doc

def parsexmlstring_(instring, parser=None, **kwargs):
    if parser is None:
        # Use the lxml ElementTree compatible parser so that, e.g.,
        #   we ignore comments.
        try:
            parser = etree_.ETCompatXMLParser()
        except AttributeError:
            # fallback to xml.etree
            parser = etree_.XMLParser()
    element = etree_.fromstring(instring, parser=parser, **kwargs)
    return element

#
# Globals
#

ExternalEncoding = ''
SaveElementTreeNode = True

#
# Data representation classes
#


class AuthoriziedOperatorDetailsTypeSub(supermod.AuthoriziedOperatorDetailsType):
    def __init__(self, OperatorRegistryDoc=None, OperatorAddress=None, **kwargs_):
        super(AuthoriziedOperatorDetailsTypeSub, self).__init__(OperatorRegistryDoc, OperatorAddress,  **kwargs_)
supermod.AuthoriziedOperatorDetailsType.subclass = AuthoriziedOperatorDetailsTypeSub
# end class AuthoriziedOperatorDetailsTypeSub


class ESADout_CUGoodsLocationTypeSub(supermod.ESADout_CUGoodsLocationType):
    def __init__(self, InformationTypeCode=None, CustomsOffice=None, CustomsCountryCode=None, LocationName=None, GoodsLocationPlace=None, GoodsLocationWarehouse=None, RegisterDocumentIdDetails=None, Transport=None, Address=None, **kwargs_):
        super(ESADout_CUGoodsLocationTypeSub, self).__init__(InformationTypeCode, CustomsOffice, CustomsCountryCode, LocationName, GoodsLocationPlace, GoodsLocationWarehouse, RegisterDocumentIdDetails, Transport, Address,  **kwargs_)
supermod.ESADout_CUGoodsLocationType.subclass = ESADout_CUGoodsLocationTypeSub
# end class ESADout_CUGoodsLocationTypeSub


class ESADout_CUPaymentsTypeSub(supermod.ESADout_CUPaymentsType):
    def __init__(self, ESADout_CUCustomsPayment=None, CUDelayPayments=None, **kwargs_):
        super(ESADout_CUPaymentsTypeSub, self).__init__(ESADout_CUCustomsPayment, CUDelayPayments,  **kwargs_)
supermod.ESADout_CUPaymentsType.subclass = ESADout_CUPaymentsTypeSub
# end class ESADout_CUPaymentsTypeSub


class TDDeliveryPlaceTypeSub(supermod.TDDeliveryPlaceType):
    def __init__(self, NumberCustomsZone=None, DeliveryCustomsOffice=None, AuthoriziedOperatorDetails=None, **kwargs_):
        super(TDDeliveryPlaceTypeSub, self).__init__(NumberCustomsZone, DeliveryCustomsOffice, AuthoriziedOperatorDetails,  **kwargs_)
supermod.TDDeliveryPlaceType.subclass = TDDeliveryPlaceTypeSub
# end class TDDeliveryPlaceTypeSub


class AddressTypeSub(supermod.AddressType):
    def __init__(self, PostalCode=None, CountryCode=None, CounryName=None, Region=None, City=None, StreetHouse=None, TerritoryCode=None, **kwargs_):
        super(AddressTypeSub, self).__init__(PostalCode, CountryCode, CounryName, Region, City, StreetHouse, TerritoryCode,  **kwargs_)
supermod.AddressType.subclass = AddressTypeSub
# end class AddressTypeSub


class AutomobileBaseTypeSub(supermod.AutomobileBaseType):
    def __init__(self, Model=None, Mark=None, MarkCode=None, OfftakeYear=None, EngineVolumeQuanity=None, VINID=None, BodyID=None, EngineID=None, ChassisID=None, CabID=None, EmergencyDeviceID=None, extensiontype_=None, **kwargs_):
        super(AutomobileBaseTypeSub, self).__init__(Model, Mark, MarkCode, OfftakeYear, EngineVolumeQuanity, VINID, BodyID, EngineID, ChassisID, CabID, EmergencyDeviceID, extensiontype_,  **kwargs_)
supermod.AutomobileBaseType.subclass = AutomobileBaseTypeSub
# end class AutomobileBaseTypeSub


class BankInformationTypeSub(supermod.BankInformationType):
    def __init__(self, BankAccount=None, BankAccountDescription=None, BankName=None, BankMFO=None, OKPOID=None, BICID=None, SWIFTID=None, CorrAccount=None, TransitCurrencyAccount=None, SpecialTransitCurrencyAccount=None, **kwargs_):
        super(BankInformationTypeSub, self).__init__(BankAccount, BankAccountDescription, BankName, BankMFO, OKPOID, BICID, SWIFTID, CorrAccount, TransitCurrencyAccount, SpecialTransitCurrencyAccount,  **kwargs_)
supermod.BankInformationType.subclass = BankInformationTypeSub
# end class BankInformationTypeSub


class BaseDocTypeSub(supermod.BaseDocType):
    def __init__(self, DocumentID=None, RefDocumentID=None, INNSign=None, MCD_ID=None, extensiontype_=None, **kwargs_):
        super(BaseDocTypeSub, self).__init__(DocumentID, RefDocumentID, INNSign, MCD_ID, extensiontype_,  **kwargs_)
supermod.BaseDocType.subclass = BaseDocTypeSub
# end class BaseDocTypeSub


class CUBranchDescriptionTypeSub(supermod.CUBranchDescriptionType):
    def __init__(self, OrganizationName=None, Address=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, **kwargs_):
        super(CUBranchDescriptionTypeSub, self).__init__(OrganizationName, Address, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures,  **kwargs_)
supermod.CUBranchDescriptionType.subclass = CUBranchDescriptionTypeSub
# end class CUBranchDescriptionTypeSub


class CUTransportMeansTypeSub(supermod.CUTransportMeansType):
    def __init__(self, TransportModeCode=None, TransportNationalityCode=None, extensiontype_=None, **kwargs_):
        super(CUTransportMeansTypeSub, self).__init__(TransportModeCode, TransportNationalityCode, extensiontype_,  **kwargs_)
supermod.CUTransportMeansType.subclass = CUTransportMeansTypeSub
# end class CUTransportMeansTypeSub


class CargoBaseTypeSub(supermod.CargoBaseType):
    def __init__(self, CargoDescription=None, GrossWeightQuantity=None, **kwargs_):
        super(CargoBaseTypeSub, self).__init__(CargoDescription, GrossWeightQuantity,  **kwargs_)
supermod.CargoBaseType.subclass = CargoBaseTypeSub
# end class CargoBaseTypeSub


class ContactTypeSub(supermod.ContactType):
    def __init__(self, Phone=None, Fax=None, Telex=None, E_mail=None, **kwargs_):
        super(ContactTypeSub, self).__init__(Phone, Fax, Telex, E_mail,  **kwargs_)
supermod.ContactType.subclass = ContactTypeSub
# end class ContactTypeSub


class CustomsPersonTypeSub(supermod.CustomsPersonType):
    def __init__(self, PersonName=None, LNP=None, CustomsCode=None, **kwargs_):
        super(CustomsPersonTypeSub, self).__init__(PersonName, LNP, CustomsCode,  **kwargs_)
supermod.CustomsPersonType.subclass = CustomsPersonTypeSub
# end class CustomsPersonTypeSub


class CustomsTypeSub(supermod.CustomsType):
    def __init__(self, Code=None, OfficeName=None, extensiontype_=None, **kwargs_):
        super(CustomsTypeSub, self).__init__(Code, OfficeName, extensiontype_,  **kwargs_)
supermod.CustomsType.subclass = CustomsTypeSub
# end class CustomsTypeSub


class DeliveryTermsRUTypeSub(supermod.DeliveryTermsRUType):
    def __init__(self, DeliveryPlace=None, DeliveryTermsStringCode=None, **kwargs_):
        super(DeliveryTermsRUTypeSub, self).__init__(DeliveryPlace, DeliveryTermsStringCode,  **kwargs_)
supermod.DeliveryTermsRUType.subclass = DeliveryTermsRUTypeSub
# end class DeliveryTermsRUTypeSub


class DeliveryTermsTypeSub(supermod.DeliveryTermsType):
    def __init__(self, DeliveryPlace=None, DeliveryTermsStringCode=None, DeliveryTermsRBCode=None, TransferPlace=None, **kwargs_):
        super(DeliveryTermsTypeSub, self).__init__(DeliveryPlace, DeliveryTermsStringCode, DeliveryTermsRBCode, TransferPlace,  **kwargs_)
supermod.DeliveryTermsType.subclass = DeliveryTermsTypeSub
# end class DeliveryTermsTypeSub


class DimensionsTypeSub(supermod.DimensionsType):
    def __init__(self, DimensionsCode=None, Lenght=None, Wight=None, Height=None, **kwargs_):
        super(DimensionsTypeSub, self).__init__(DimensionsCode, Lenght, Wight, Height,  **kwargs_)
supermod.DimensionsType.subclass = DimensionsTypeSub
# end class DimensionsTypeSub


class DocumentBaseTypeSub(supermod.DocumentBaseType):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, extensiontype_=None, **kwargs_):
        super(DocumentBaseTypeSub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate, extensiontype_,  **kwargs_)
supermod.DocumentBaseType.subclass = DocumentBaseTypeSub
# end class DocumentBaseTypeSub


class GTDID5TypeSub(supermod.GTDID5Type):
    def __init__(self, CustomsCode=None, RegistrationDate=None, SerialNumber=None, **kwargs_):
        super(GTDID5TypeSub, self).__init__(CustomsCode, RegistrationDate, SerialNumber,  **kwargs_)
supermod.GTDID5Type.subclass = GTDID5TypeSub
# end class GTDID5TypeSub


class GTDID6TypeSub(supermod.GTDID6Type):
    def __init__(self, CustomsCode=None, RegistrationDate=None, SerialNumber=None, **kwargs_):
        super(GTDID6TypeSub, self).__init__(CustomsCode, RegistrationDate, SerialNumber,  **kwargs_)
supermod.GTDID6Type.subclass = GTDID6TypeSub
# end class GTDID6TypeSub


class GTDIDType1Sub(supermod.GTDIDType1):
    def __init__(self, CustomsCode=None, RegistrationDate=None, GTDNumber=None, **kwargs_):
        super(GTDIDType1Sub, self).__init__(CustomsCode, RegistrationDate, GTDNumber,  **kwargs_)
supermod.GTDIDType1.subclass = GTDIDType1Sub
# end class GTDIDType1Sub


class GoodsBaseTypeSub(supermod.GoodsBaseType):
    def __init__(self, GoodsNumeric=None, GoodsTNVEDCode=None, GoodsDescription=None, GrossWeightQuantity=None, NetWeightQuantity=None, **kwargs_):
        super(GoodsBaseTypeSub, self).__init__(GoodsNumeric, GoodsTNVEDCode, GoodsDescription, GrossWeightQuantity, NetWeightQuantity,  **kwargs_)
supermod.GoodsBaseType.subclass = GoodsBaseTypeSub
# end class GoodsBaseTypeSub


class ITNKZTypeSub(supermod.ITNKZType):
    def __init__(self, CategoryCode=None, KATOCode=None, RNN=None, ITNReserv=None, **kwargs_):
        super(ITNKZTypeSub, self).__init__(CategoryCode, KATOCode, RNN, ITNReserv,  **kwargs_)
supermod.ITNKZType.subclass = ITNKZTypeSub
# end class ITNKZTypeSub


class IdentityCardTypeSub(supermod.IdentityCardType):
    def __init__(self, IdentityCardCode=None, IdentityCardName=None, IdentityCardSeries=None, IdentityCardNumber=None, IdentityCardDate=None, OrganizationName=None, **kwargs_):
        super(IdentityCardTypeSub, self).__init__(IdentityCardCode, IdentityCardName, IdentityCardSeries, IdentityCardNumber, IdentityCardDate, OrganizationName,  **kwargs_)
supermod.IdentityCardType.subclass = IdentityCardTypeSub
# end class IdentityCardTypeSub


class KGOrganizationFeaturesTypeSub(supermod.KGOrganizationFeaturesType):
    def __init__(self, KGINN=None, KGOKPO=None, **kwargs_):
        super(KGOrganizationFeaturesTypeSub, self).__init__(KGINN, KGOKPO,  **kwargs_)
supermod.KGOrganizationFeaturesType.subclass = KGOrganizationFeaturesTypeSub
# end class KGOrganizationFeaturesTypeSub


class OrganizationBaseTypeSub(supermod.OrganizationBaseType):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, extensiontype_=None, **kwargs_):
        super(OrganizationBaseTypeSub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, extensiontype_,  **kwargs_)
supermod.OrganizationBaseType.subclass = OrganizationBaseTypeSub
# end class OrganizationBaseTypeSub


class OrganizationTypeSub(supermod.OrganizationType):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, OKPOID=None, OKATOCode=None, Address=None, Contact=None, extensiontype_=None, **kwargs_):
        super(OrganizationTypeSub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, OKPOID, OKATOCode, Address, Contact, extensiontype_,  **kwargs_)
supermod.OrganizationType.subclass = OrganizationTypeSub
# end class OrganizationTypeSub


class OrganizationWBankTypeSub(supermod.OrganizationWBankType):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, OKPOID=None, OKATOCode=None, Address=None, Contact=None, BankInformation=None, **kwargs_):
        super(OrganizationWBankTypeSub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, OKPOID, OKATOCode, Address, Contact, BankInformation,  **kwargs_)
supermod.OrganizationWBankType.subclass = OrganizationWBankTypeSub
# end class OrganizationWBankTypeSub


class PersonBaseTypeSub(supermod.PersonBaseType):
    def __init__(self, PersonSurname=None, PersonName=None, PersonMiddleName=None, PersonPost=None, extensiontype_=None, **kwargs_):
        super(PersonBaseTypeSub, self).__init__(PersonSurname, PersonName, PersonMiddleName, PersonPost, extensiontype_,  **kwargs_)
supermod.PersonBaseType.subclass = PersonBaseTypeSub
# end class PersonBaseTypeSub


class PersonSignatureTypeSub(supermod.PersonSignatureType):
    def __init__(self, PersonSurname=None, PersonName=None, PersonMiddleName=None, PersonPost=None, IssueDate=None, **kwargs_):
        super(PersonSignatureTypeSub, self).__init__(PersonSurname, PersonName, PersonMiddleName, PersonPost, IssueDate,  **kwargs_)
supermod.PersonSignatureType.subclass = PersonSignatureTypeSub
# end class PersonSignatureTypeSub


class RAOrganizationFeaturesTypeSub(supermod.RAOrganizationFeaturesType):
    def __init__(self, UNN=None, SocialServiceNumber=None, SocialServiceCertificate=None, **kwargs_):
        super(RAOrganizationFeaturesTypeSub, self).__init__(UNN, SocialServiceNumber, SocialServiceCertificate,  **kwargs_)
supermod.RAOrganizationFeaturesType.subclass = RAOrganizationFeaturesTypeSub
# end class RAOrganizationFeaturesTypeSub


class RBOrganizationFeaturesTypeSub(supermod.RBOrganizationFeaturesType):
    def __init__(self, UNP=None, RBIdentificationNumber=None, **kwargs_):
        super(RBOrganizationFeaturesTypeSub, self).__init__(UNP, RBIdentificationNumber,  **kwargs_)
supermod.RBOrganizationFeaturesType.subclass = RBOrganizationFeaturesTypeSub
# end class RBOrganizationFeaturesTypeSub


class RFOrganizationFeaturesTypeSub(supermod.RFOrganizationFeaturesType):
    def __init__(self, OGRN=None, INN=None, KPP=None, **kwargs_):
        super(RFOrganizationFeaturesTypeSub, self).__init__(OGRN, INN, KPP,  **kwargs_)
supermod.RFOrganizationFeaturesType.subclass = RFOrganizationFeaturesTypeSub
# end class RFOrganizationFeaturesTypeSub


class RKOrganizationFeaturesTypeSub(supermod.RKOrganizationFeaturesType):
    def __init__(self, BIN=None, IIN=None, ITN=None, **kwargs_):
        super(RKOrganizationFeaturesTypeSub, self).__init__(BIN, IIN, ITN,  **kwargs_)
supermod.RKOrganizationFeaturesType.subclass = RKOrganizationFeaturesTypeSub
# end class RKOrganizationFeaturesTypeSub


class SupplementaryQuantityTypeSub(supermod.SupplementaryQuantityType):
    def __init__(self, GoodsQuantity=None, MeasureUnitQualifierName=None, MeasureUnitQualifierCode=None, **kwargs_):
        super(SupplementaryQuantityTypeSub, self).__init__(GoodsQuantity, MeasureUnitQualifierName, MeasureUnitQualifierCode,  **kwargs_)
supermod.SupplementaryQuantityType.subclass = SupplementaryQuantityTypeSub
# end class SupplementaryQuantityTypeSub


class TransportGoodsBaseTypeSub(supermod.TransportGoodsBaseType):
    def __init__(self, GoodsMarking=None, GoodsDescription=None, **kwargs_):
        super(TransportGoodsBaseTypeSub, self).__init__(GoodsMarking, GoodsDescription,  **kwargs_)
supermod.TransportGoodsBaseType.subclass = TransportGoodsBaseTypeSub
# end class TransportGoodsBaseTypeSub


class TransportMeansBaseTypeSub(supermod.TransportMeansBaseType):
    def __init__(self, VIN=None, TransportKindCode=None, TransportTypeName=None, TransportMarkCode=None, TransportIdentifier=None, TransportMeansNationalityCode=None, ActiveTransportIdentifier=None, TransportRegNumber=None, extensiontype_=None, **kwargs_):
        super(TransportMeansBaseTypeSub, self).__init__(VIN, TransportKindCode, TransportTypeName, TransportMarkCode, TransportIdentifier, TransportMeansNationalityCode, ActiveTransportIdentifier, TransportRegNumber, extensiontype_,  **kwargs_)
supermod.TransportMeansBaseType.subclass = TransportMeansBaseTypeSub
# end class TransportMeansBaseTypeSub


class TransportMeansPassportTypeSub(supermod.TransportMeansPassportType):
    def __init__(self, Series=None, PTSNumber=None, RegionCode=None, **kwargs_):
        super(TransportMeansPassportTypeSub, self).__init__(Series, PTSNumber, RegionCode,  **kwargs_)
supermod.TransportMeansPassportType.subclass = TransportMeansPassportTypeSub
# end class TransportMeansPassportTypeSub


class AEORegistryIdDetailsTypeSub(supermod.AEORegistryIdDetailsType):
    def __init__(self, RegistryOwnerCode=None, CountryA2Code=None, DocId=None, AEORegistryKindCode=None, ReregistrationCode=None, DocKindCode=None, **kwargs_):
        super(AEORegistryIdDetailsTypeSub, self).__init__(RegistryOwnerCode, CountryA2Code, DocId, AEORegistryKindCode, ReregistrationCode, DocKindCode,  **kwargs_)
supermod.AEORegistryIdDetailsType.subclass = AEORegistryIdDetailsTypeSub
# end class AEORegistryIdDetailsTypeSub


class AutomobileBaseType2Sub(supermod.AutomobileBaseType2):
    def __init__(self, RecNumber=None, Model=None, Mark=None, MarkCode=None, OfftakeYear=None, EngineVolumeQuanity=None, VINID=None, BodyID=None, EngineID=None, ChassisID=None, CabID=None, EmergencyDeviceID=None, **kwargs_):
        super(AutomobileBaseType2Sub, self).__init__(RecNumber, Model, Mark, MarkCode, OfftakeYear, EngineVolumeQuanity, VINID, BodyID, EngineID, ChassisID, CabID, EmergencyDeviceID,  **kwargs_)
supermod.AutomobileBaseType2.subclass = AutomobileBaseType2Sub
# end class AutomobileBaseType2Sub


class AutomobileTypeSub(supermod.AutomobileType):
    def __init__(self, Model=None, Mark=None, MarkCode=None, OfftakeYear=None, EngineVolumeQuanity=None, VINID=None, BodyID=None, EngineID=None, ChassisID=None, CabID=None, EmergencyDeviceID=None, IdentityCardNumber=None, CarCostInfo=None, EngineMaxPowerMeasure=None, PassedKilometerQuantity=None, **kwargs_):
        super(AutomobileTypeSub, self).__init__(Model, Mark, MarkCode, OfftakeYear, EngineVolumeQuanity, VINID, BodyID, EngineID, ChassisID, CabID, EmergencyDeviceID, IdentityCardNumber, CarCostInfo, EngineMaxPowerMeasure, PassedKilometerQuantity,  **kwargs_)
supermod.AutomobileType.subclass = AutomobileTypeSub
# end class AutomobileTypeSub


class CarCostInfoTypeSub(supermod.CarCostInfoType):
    def __init__(self, CarCost=None, CarCostCurrencyCode=None, **kwargs_):
        super(CarCostInfoTypeSub, self).__init__(CarCost, CarCostCurrencyCode,  **kwargs_)
supermod.CarCostInfoType.subclass = CarCostInfoTypeSub
# end class CarCostInfoTypeSub


class CIMIdDetailsTypeSub(supermod.CIMIdDetailsType):
    def __init__(self, CIMMarkingFlag=None, CIMQuantity=None, CIMList=None, CIMRange=None, **kwargs_):
        super(CIMIdDetailsTypeSub, self).__init__(CIMMarkingFlag, CIMQuantity, CIMList, CIMRange,  **kwargs_)
supermod.CIMIdDetailsType.subclass = CIMIdDetailsTypeSub
# end class CIMIdDetailsTypeSub


class CIMListTypeSub(supermod.CIMListType):
    def __init__(self, CIMID=None, **kwargs_):
        super(CIMListTypeSub, self).__init__(CIMID,  **kwargs_)
supermod.CIMListType.subclass = CIMListTypeSub
# end class CIMListTypeSub


class CIMRangeTypeSub(supermod.CIMRangeType):
    def __init__(self, FirstCIMID=None, LastCIMID=None, **kwargs_):
        super(CIMRangeTypeSub, self).__init__(FirstCIMID, LastCIMID,  **kwargs_)
supermod.CIMRangeType.subclass = CIMRangeTypeSub
# end class CIMRangeTypeSub


class ComponentDescriptionTypeSub(supermod.ComponentDescriptionType):
    def __init__(self, GoodsTNVEDCode=None, KGWeight=None, InvoicedCost=None, InvoiceCurrencyCode=None, SupplementaryQuantity=None, extensiontype_=None, **kwargs_):
        super(ComponentDescriptionTypeSub, self).__init__(GoodsTNVEDCode, KGWeight, InvoicedCost, InvoiceCurrencyCode, SupplementaryQuantity, extensiontype_,  **kwargs_)
supermod.ComponentDescriptionType.subclass = ComponentDescriptionTypeSub
# end class ComponentDescriptionTypeSub


class ComponentsListTypeSub(supermod.ComponentsListType):
    def __init__(self, MechanismUnit=None, **kwargs_):
        super(ComponentsListTypeSub, self).__init__(MechanismUnit,  **kwargs_)
supermod.ComponentsListType.subclass = ComponentsListTypeSub
# end class ComponentsListTypeSub


class ContainerNumberTypeSub(supermod.ContainerNumberType):
    def __init__(self, ContainerIdentificaror=None, FullIndicator=None, **kwargs_):
        super(ContainerNumberTypeSub, self).__init__(ContainerIdentificaror, FullIndicator,  **kwargs_)
supermod.ContainerNumberType.subclass = ContainerNumberTypeSub
# end class ContainerNumberTypeSub


class ContractCostTypeSub(supermod.ContractCostType):
    def __init__(self, ContractCurrencyCode=None, CurrencyQuantity=None, ContractCurrencyRate=None, TotalInvoiceAmount=None, TotalAmount=None, extensiontype_=None, **kwargs_):
        super(ContractCostTypeSub, self).__init__(ContractCurrencyCode, CurrencyQuantity, ContractCurrencyRate, TotalInvoiceAmount, TotalAmount, extensiontype_,  **kwargs_)
supermod.ContractCostType.subclass = ContractCostTypeSub
# end class ContractCostTypeSub


class CountryDetailsTypeSub(supermod.CountryDetailsType):
    def __init__(self, CountryCode=None, CountryName=None, RBCountryCode=None, **kwargs_):
        super(CountryDetailsTypeSub, self).__init__(CountryCode, CountryName, RBCountryCode,  **kwargs_)
supermod.CountryDetailsType.subclass = CountryDetailsTypeSub
# end class CountryDetailsTypeSub


class CU_ElectricalEnergyTypeSub(supermod.CU_ElectricalEnergyType):
    def __init__(self, ElectricalEnergyQuantity=None, QualifierCode=None, **kwargs_):
        super(CU_ElectricalEnergyTypeSub, self).__init__(ElectricalEnergyQuantity, QualifierCode,  **kwargs_)
supermod.CU_ElectricalEnergyType.subclass = CU_ElectricalEnergyTypeSub
# end class CU_ElectricalEnergyTypeSub


class CUConsigmentTypeSub(supermod.CUConsigmentType):
    def __init__(self, ContainerIndicator=None, DispatchCountryCode=None, RBDispatchCountryCode=None, DispatchCountryName=None, DestinationCountryCode=None, DestinationCountryName=None, RBDestinationCountryCode=None, BorderCustomsOffice=None, extensiontype_=None, **kwargs_):
        super(CUConsigmentTypeSub, self).__init__(ContainerIndicator, DispatchCountryCode, RBDispatchCountryCode, DispatchCountryName, DestinationCountryCode, DestinationCountryName, RBDestinationCountryCode, BorderCustomsOffice, extensiontype_,  **kwargs_)
supermod.CUConsigmentType.subclass = CUConsigmentTypeSub
# end class CUConsigmentTypeSub


class CUCustomsPaymentCalculationTypeSub(supermod.CUCustomsPaymentCalculationType):
    def __init__(self, PaymentModeCode=None, PaymentAmount=None, PaymentCurrencyCode=None, TaxBase=None, TaxBaseCurrencyCode=None, TaxBaseTNVEDQualifierCode=None, Rate=None, RateTypeCode=None, RateCurrencyCode=None, RateTNVEDQualifierCode=None, WeightingFactor=None, ComparisonOperationsSign=None, Rate2=None, RateTypeCode2=None, RateCurrencyCode2=None, RateTNVEDQualifierCode2=None, WeightingFactor2=None, OperationsSign=None, Rate3=None, RateTypeCode3=None, RateCurrencyCode3=None, RateTNVEDQualifierCode3=None, WeightingFactor3=None, ComparisonResult=None, RateUseDate=None, PaymentCode=None, NumberDays=None, NumberStages=None, NumberMonths=None, TariffRate=None, LineNumber=None, NumberGroup=None, PrecedingDocumentGoodsNumeric=None, **kwargs_):
        super(CUCustomsPaymentCalculationTypeSub, self).__init__(PaymentModeCode, PaymentAmount, PaymentCurrencyCode, TaxBase, TaxBaseCurrencyCode, TaxBaseTNVEDQualifierCode, Rate, RateTypeCode, RateCurrencyCode, RateTNVEDQualifierCode, WeightingFactor, ComparisonOperationsSign, Rate2, RateTypeCode2, RateCurrencyCode2, RateTNVEDQualifierCode2, WeightingFactor2, OperationsSign, Rate3, RateTypeCode3, RateCurrencyCode3, RateTNVEDQualifierCode3, WeightingFactor3, ComparisonResult, RateUseDate, PaymentCode, NumberDays, NumberStages, NumberMonths, TariffRate, LineNumber, NumberGroup, PrecedingDocumentGoodsNumeric,  **kwargs_)
supermod.CUCustomsPaymentCalculationType.subclass = CUCustomsPaymentCalculationTypeSub
# end class CUCustomsPaymentCalculationTypeSub


class CUDelayPaymentsTypeSub(supermod.CUDelayPaymentsType):
    def __init__(self, PaymentModeCode=None, EndDate=None, PaymentSheduleDetails=None, **kwargs_):
        super(CUDelayPaymentsTypeSub, self).__init__(PaymentModeCode, EndDate, PaymentSheduleDetails,  **kwargs_)
supermod.CUDelayPaymentsType.subclass = CUDelayPaymentsTypeSub
# end class CUDelayPaymentsTypeSub


class PaymentSheduleDetailsTypeSub(supermod.PaymentSheduleDetailsType):
    def __init__(self, ObjectOrdinal=None, EndDate=None, **kwargs_):
        super(PaymentSheduleDetailsTypeSub, self).__init__(ObjectOrdinal, EndDate,  **kwargs_)
supermod.PaymentSheduleDetailsType.subclass = PaymentSheduleDetailsTypeSub
# end class PaymentSheduleDetailsTypeSub


class CUDriverInformationTypeSub(supermod.CUDriverInformationType):
    def __init__(self, PersonSurname=None, PersonName=None, PersonMiddleName=None, PersonPost=None, RegCountryCode=None, IdentityCard=None, **kwargs_):
        super(CUDriverInformationTypeSub, self).__init__(PersonSurname, PersonName, PersonMiddleName, PersonPost, RegCountryCode, IdentityCard,  **kwargs_)
supermod.CUDriverInformationType.subclass = CUDriverInformationTypeSub
# end class CUDriverInformationTypeSub


class CUESADCustomsRepresCertificateTypeSub(supermod.CUESADCustomsRepresCertificateType):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, DocumentModeCode=None, **kwargs_):
        super(CUESADCustomsRepresCertificateTypeSub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate, DocumentModeCode,  **kwargs_)
supermod.CUESADCustomsRepresCertificateType.subclass = CUESADCustomsRepresCertificateTypeSub
# end class CUESADCustomsRepresCertificateTypeSub


class CUESADCustomsRepresentativeTypeSub(supermod.CUESADCustomsRepresentativeType):
    def __init__(self, ContractRepresDecl=None, CustomsRepresCertificate=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, **kwargs_):
        super(CUESADCustomsRepresentativeTypeSub, self).__init__(ContractRepresDecl, CustomsRepresCertificate, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures,  **kwargs_)
supermod.CUESADCustomsRepresentativeType.subclass = CUESADCustomsRepresentativeTypeSub
# end class CUESADCustomsRepresentativeTypeSub


class CUESADGoodsShipmentTypeSub(supermod.CUESADGoodsShipmentType):
    def __init__(self, OriginCountryName=None, OriginCountryCode=None, RBOriginCountryCode=None, SpecificationNumber=None, SpecificationListNumber=None, TotalGoodsNumber=None, TotalPackageNumber=None, TotalSheetNumber=None, TotalCustCost=None, TotalCustomsValueAmount=None, CustCostCurrencyCode=None, extensiontype_=None, **kwargs_):
        super(CUESADGoodsShipmentTypeSub, self).__init__(OriginCountryName, OriginCountryCode, RBOriginCountryCode, SpecificationNumber, SpecificationListNumber, TotalGoodsNumber, TotalPackageNumber, TotalSheetNumber, TotalCustCost, TotalCustomsValueAmount, CustCostCurrencyCode, extensiontype_,  **kwargs_)
supermod.CUESADGoodsShipmentType.subclass = CUESADGoodsShipmentTypeSub
# end class CUESADGoodsShipmentTypeSub


class CUESADMainContractTermsTypeSub(supermod.CUESADMainContractTermsType):
    def __init__(self, ContractCurrencyCode=None, CurrencyQuantity=None, ContractCurrencyRate=None, TotalInvoiceAmount=None, TotalAmount=None, TradeCountryCode=None, RBCountryCode=None, DealFeatureCode=None, DealNatureCode=None, CUESADDeliveryTerms=None, extensiontype_=None, **kwargs_):
        super(CUESADMainContractTermsTypeSub, self).__init__(ContractCurrencyCode, CurrencyQuantity, ContractCurrencyRate, TotalInvoiceAmount, TotalAmount, TradeCountryCode, RBCountryCode, DealFeatureCode, DealNatureCode, CUESADDeliveryTerms, extensiontype_,  **kwargs_)
supermod.CUESADMainContractTermsType.subclass = CUESADMainContractTermsTypeSub
# end class CUESADMainContractTermsTypeSub


class CUESADPresentedDocumentsTypeSub(supermod.CUESADPresentedDocumentsType):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, CustomsCode=None, CustomsControlZoneId=None, PresentedDocumentModeCode=None, DocumentBeginActionsDate=None, DocumentEndActionsDate=None, TemporaryImportCode=None, TemporaryStorageImportDate=None, CustomsPaymentModeCodeType=None, SupplyStatus=None, CountryCode=None, TotalDocuments=None, PreferenciiCountryCode=None, PreferenciiDocID=None, ProcessingGoodsCostInfo=None, RecordID=None, ExecutiveBodyID=None, ExecutiveName=None, LicenseGoods=None, GoodsNumeric=None, RFG44PresentedDocId=None, extensiontype_=None, **kwargs_):
        super(CUESADPresentedDocumentsTypeSub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate, CustomsCode, CustomsControlZoneId, PresentedDocumentModeCode, DocumentBeginActionsDate, DocumentEndActionsDate, TemporaryImportCode, TemporaryStorageImportDate, CustomsPaymentModeCodeType, SupplyStatus, CountryCode, TotalDocuments, PreferenciiCountryCode, PreferenciiDocID, ProcessingGoodsCostInfo, RecordID, ExecutiveBodyID, ExecutiveName, LicenseGoods, GoodsNumeric, RFG44PresentedDocId, extensiontype_,  **kwargs_)
supermod.CUESADPresentedDocumentsType.subclass = CUESADPresentedDocumentsTypeSub
# end class CUESADPresentedDocumentsTypeSub


class CUGoodsLocationPlaceTypeSub(supermod.CUGoodsLocationPlaceType):
    def __init__(self, NumberCustomsZone=None, **kwargs_):
        super(CUGoodsLocationPlaceTypeSub, self).__init__(NumberCustomsZone,  **kwargs_)
supermod.CUGoodsLocationPlaceType.subclass = CUGoodsLocationPlaceTypeSub
# end class CUGoodsLocationPlaceTypeSub


class CUGuaranteeTypeSub(supermod.CUGuaranteeType):
    def __init__(self, PaymentWayCode=None, Amount=None, GuaranteeDocDetails=None, UNP=None, BIC=None, **kwargs_):
        super(CUGuaranteeTypeSub, self).__init__(PaymentWayCode, Amount, GuaranteeDocDetails, UNP, BIC,  **kwargs_)
supermod.CUGuaranteeType.subclass = CUGuaranteeTypeSub
# end class CUGuaranteeTypeSub


class CUIdentityCardTypeSub(supermod.CUIdentityCardType):
    def __init__(self, IdentityCardCode=None, IdentityCardName=None, FullIdentityCardName=None, IdentityCardSeries=None, IdentityCardNumber=None, IdentityCardDate=None, DocValidityDate=None, OrganizationName=None, IssuerCode=None, AuthorityId=None, CountryCode=None, **kwargs_):
        super(CUIdentityCardTypeSub, self).__init__(IdentityCardCode, IdentityCardName, FullIdentityCardName, IdentityCardSeries, IdentityCardNumber, IdentityCardDate, DocValidityDate, OrganizationName, IssuerCode, AuthorityId, CountryCode,  **kwargs_)
supermod.CUIdentityCardType.subclass = CUIdentityCardTypeSub
# end class CUIdentityCardTypeSub


class CUMarkExcisableGoodsTypeSub(supermod.CUMarkExcisableGoodsType):
    def __init__(self, Series=None, Number=None, QuantityMark=None, **kwargs_):
        super(CUMarkExcisableGoodsTypeSub, self).__init__(Series, Number, QuantityMark,  **kwargs_)
supermod.CUMarkExcisableGoodsType.subclass = CUMarkExcisableGoodsTypeSub
# end class CUMarkExcisableGoodsTypeSub


class CUPreferenciiTypeSub(supermod.CUPreferenciiType):
    def __init__(self, CustomsTax=None, CustomsDuty=None, Excise=None, Rate=None, **kwargs_):
        super(CUPreferenciiTypeSub, self).__init__(CustomsTax, CustomsDuty, Excise, Rate,  **kwargs_)
supermod.CUPreferenciiType.subclass = CUPreferenciiTypeSub
# end class CUPreferenciiTypeSub


class CUPresentedDocumentsTypeSub(supermod.CUPresentedDocumentsType):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, CustomsCode=None, CustomsControlZoneId=None, PresentedDocumentModeCode=None, DocumentBeginActionsDate=None, DocumentEndActionsDate=None, TemporaryImportCode=None, TemporaryStorageImportDate=None, CustomsPaymentModeCodeType=None, SupplyStatus=None, CountryCode=None, TotalDocuments=None, PreferenciiCountryCode=None, PreferenciiDocID=None, ProcessingGoodsCostInfo=None, RecordID=None, ExecutiveBodyID=None, ExecutiveName=None, LicenseGoods=None, GoodsNumeric=None, RFG44PresentedDocId=None, TIRPageNumber=None, TIRHolderID=None, RegNumberDocument=None, **kwargs_):
        super(CUPresentedDocumentsTypeSub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate, CustomsCode, CustomsControlZoneId, PresentedDocumentModeCode, DocumentBeginActionsDate, DocumentEndActionsDate, TemporaryImportCode, TemporaryStorageImportDate, CustomsPaymentModeCodeType, SupplyStatus, CountryCode, TotalDocuments, PreferenciiCountryCode, PreferenciiDocID, ProcessingGoodsCostInfo, RecordID, ExecutiveBodyID, ExecutiveName, LicenseGoods, GoodsNumeric, RFG44PresentedDocId, TIRPageNumber, TIRHolderID, RegNumberDocument,  **kwargs_)
supermod.CUPresentedDocumentsType.subclass = CUPresentedDocumentsTypeSub
# end class CUPresentedDocumentsTypeSub


class CUTransportTypeSub(supermod.CUTransportType):
    def __init__(self, TransporKind=None, TransporIdentifier=None, **kwargs_):
        super(CUTransportTypeSub, self).__init__(TransporKind, TransporIdentifier,  **kwargs_)
supermod.CUTransportType.subclass = CUTransportTypeSub
# end class CUTransportTypeSub


class CUWarehousePlaceTypeSub(supermod.CUWarehousePlaceType):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, **kwargs_):
        super(CUWarehousePlaceTypeSub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate,  **kwargs_)
supermod.CUWarehousePlaceType.subclass = CUWarehousePlaceTypeSub
# end class CUWarehousePlaceTypeSub


class DeliveryTermsType3Sub(supermod.DeliveryTermsType3):
    def __init__(self, DeliveryPlace=None, DeliveryTermsStringCode=None, DeliveryTermsRBCode=None, **kwargs_):
        super(DeliveryTermsType3Sub, self).__init__(DeliveryPlace, DeliveryTermsStringCode, DeliveryTermsRBCode,  **kwargs_)
supermod.DeliveryTermsType3.subclass = DeliveryTermsType3Sub
# end class DeliveryTermsType3Sub


class DimensionTypeSub(supermod.DimensionType):
    def __init__(self, LengthMeasure=None, WidthMeasure=None, HeightMeasure=None, **kwargs_):
        super(DimensionTypeSub, self).__init__(LengthMeasure, WidthMeasure, HeightMeasure,  **kwargs_)
supermod.DimensionType.subclass = DimensionTypeSub
# end class DimensionTypeSub


class DocBaseTypeSub(supermod.DocBaseType):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, DocStartDate=None, DocValidityDate=None, CountryCode=None, DocKindCode=None, extensiontype_=None, **kwargs_):
        super(DocBaseTypeSub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate, DocStartDate, DocValidityDate, CountryCode, DocKindCode, extensiontype_,  **kwargs_)
supermod.DocBaseType.subclass = DocBaseTypeSub
# end class DocBaseTypeSub


class DTIdentificationMeansDetailsTypeSub(supermod.DTIdentificationMeansDetailsType):
    def __init__(self, CIMMarkingCode=None, CIMQuantity=None, IdentificationMeansDetails=None, **kwargs_):
        super(DTIdentificationMeansDetailsTypeSub, self).__init__(CIMMarkingCode, CIMQuantity, IdentificationMeansDetails,  **kwargs_)
supermod.DTIdentificationMeansDetailsType.subclass = DTIdentificationMeansDetailsTypeSub
# end class DTIdentificationMeansDetailsTypeSub


class DTMDocDetailsTypeSub(supermod.DTMDocDetailsType):
    def __init__(self, TransportModeCode=None, **kwargs_):
        super(DTMDocDetailsTypeSub, self).__init__(TransportModeCode,  **kwargs_)
supermod.DTMDocDetailsType.subclass = DTMDocDetailsTypeSub
# end class DTMDocDetailsTypeSub


class EECCustomsTypeSub(supermod.EECCustomsType):
    def __init__(self, Code=None, OfficeName=None, CountryCode=None, **kwargs_):
        super(EECCustomsTypeSub, self).__init__(Code, OfficeName, CountryCode,  **kwargs_)
supermod.EECCustomsType.subclass = EECCustomsTypeSub
# end class EECCustomsTypeSub


class ESADCommonOfficialMarkTypeSub(supermod.ESADCommonOfficialMarkType):
    def __init__(self, GRNumber=None, StageMarkIdentifier=None, NoteMarkIdentifier=None, InformationTypeCode=None, MarkDescription=None, DateInf=None, TimeInf=None, Amount=None, PaymentTypeCode=None, PostponementProcent=None, Code=None, CurrencyName=None, PersonName=None, LNP=None, GoodsDevisionDate=None, GoodsDevisionTime=None, Deadline=None, CustomsCode=None, CustomsActionDate=None, DocumentIndicator=None, DeadlineMonth=None, DocumentInfo=None, CommonMarkOrganization=None, **kwargs_):
        super(ESADCommonOfficialMarkTypeSub, self).__init__(GRNumber, StageMarkIdentifier, NoteMarkIdentifier, InformationTypeCode, MarkDescription, DateInf, TimeInf, Amount, PaymentTypeCode, PostponementProcent, Code, CurrencyName, PersonName, LNP, GoodsDevisionDate, GoodsDevisionTime, Deadline, CustomsCode, CustomsActionDate, DocumentIndicator, DeadlineMonth, DocumentInfo, CommonMarkOrganization,  **kwargs_)
supermod.ESADCommonOfficialMarkType.subclass = ESADCommonOfficialMarkTypeSub
# end class ESADCommonOfficialMarkTypeSub


class ESADConsigmentTypeSub(supermod.ESADConsigmentType):
    def __init__(self, ContainerIndicator=None, DispatchCountryCode=None, RBDispatchCountryCode=None, DispatchCountryName=None, DestinationCountryCode=None, DestinationCountryName=None, RBDestinationCountryCode=None, DeliveryCustomsOffice=None, BorderCustomsOffice=None, **kwargs_):
        super(ESADConsigmentTypeSub, self).__init__(ContainerIndicator, DispatchCountryCode, RBDispatchCountryCode, DispatchCountryName, DestinationCountryCode, DestinationCountryName, RBDestinationCountryCode, DeliveryCustomsOffice, BorderCustomsOffice,  **kwargs_)
supermod.ESADConsigmentType.subclass = ESADConsigmentTypeSub
# end class ESADConsigmentTypeSub


class ESADContainerTypeSub(supermod.ESADContainerType):
    def __init__(self, ContainerQuantity=None, ContainerKind=None, ContainerNumber=None, **kwargs_):
        super(ESADContainerTypeSub, self).__init__(ContainerQuantity, ContainerKind, ContainerNumber,  **kwargs_)
supermod.ESADContainerType.subclass = ESADContainerTypeSub
# end class ESADContainerTypeSub


class ESADContractDetailsTypeSub(supermod.ESADContractDetailsType):
    def __init__(self, ForeignTradeConsignee=None, DealPassportNumber=None, ForeignMainContractDetails=None, ForeignAddContractDetails=None, DeliveryTerms=None, OriginCountryDetails=None, CustomsCost=None, GoodsQuantity=None, **kwargs_):
        super(ESADContractDetailsTypeSub, self).__init__(ForeignTradeConsignee, DealPassportNumber, ForeignMainContractDetails, ForeignAddContractDetails, DeliveryTerms, OriginCountryDetails, CustomsCost, GoodsQuantity,  **kwargs_)
supermod.ESADContractDetailsType.subclass = ESADContractDetailsTypeSub
# end class ESADContractDetailsTypeSub


class ESADContractListTypeSub(supermod.ESADContractListType):
    def __init__(self, DealPassportNumber=None, ContractNumber=None, ContractDate=None, BankName=None, SupplyInformations=None, AdditionalContract=None, **kwargs_):
        super(ESADContractListTypeSub, self).__init__(DealPassportNumber, ContractNumber, ContractDate, BankName, SupplyInformations, AdditionalContract,  **kwargs_)
supermod.ESADContractListType.subclass = ESADContractListTypeSub
# end class ESADContractListTypeSub


class ESADCurrencyQuotaTypeSub(supermod.ESADCurrencyQuotaType):
    def __init__(self, QuotaCurrencyQuantity=None, QuotaCurrencyCode=None, QuotaCurrencyName=None, **kwargs_):
        super(ESADCurrencyQuotaTypeSub, self).__init__(QuotaCurrencyQuantity, QuotaCurrencyCode, QuotaCurrencyName,  **kwargs_)
supermod.ESADCurrencyQuotaType.subclass = ESADCurrencyQuotaTypeSub
# end class ESADCurrencyQuotaTypeSub


class ESADCustomsProcedureTypeSub(supermod.ESADCustomsProcedureType):
    def __init__(self, MainCustomsModeCode=None, PrecedingCustomsModeCode=None, GoodsTransferFeature=None, **kwargs_):
        super(ESADCustomsProcedureTypeSub, self).__init__(MainCustomsModeCode, PrecedingCustomsModeCode, GoodsTransferFeature,  **kwargs_)
supermod.ESADCustomsProcedureType.subclass = ESADCustomsProcedureTypeSub
# end class ESADCustomsProcedureTypeSub


class ESADDecisionTypeSub(supermod.ESADDecisionType):
    def __init__(self, DecisionCode=None, DateInf=None, TimeInf=None, LNP=None, Foundation=None, **kwargs_):
        super(ESADDecisionTypeSub, self).__init__(DecisionCode, DateInf, TimeInf, LNP, Foundation,  **kwargs_)
supermod.ESADDecisionType.subclass = ESADDecisionTypeSub
# end class ESADDecisionTypeSub


class ESADExciseListTypeSub(supermod.ESADExciseListType):
    def __init__(self, ExciseNumber=None, **kwargs_):
        super(ESADExciseListTypeSub, self).__init__(ExciseNumber,  **kwargs_)
supermod.ESADExciseListType.subclass = ESADExciseListTypeSub
# end class ESADExciseListTypeSub


class ESADExciseRangeTypeSub(supermod.ESADExciseRangeType):
    def __init__(self, ExciseFirstNumber=None, ExciseLastNumber=None, **kwargs_):
        super(ESADExciseRangeTypeSub, self).__init__(ExciseFirstNumber, ExciseLastNumber,  **kwargs_)
supermod.ESADExciseRangeType.subclass = ESADExciseRangeTypeSub
# end class ESADExciseRangeTypeSub


class ESADExciseTypeSub(supermod.ESADExciseType):
    def __init__(self, ExciseQuantity=None, ExciseSerieses=None, ExciseList=None, ExciseRange=None, **kwargs_):
        super(ESADExciseTypeSub, self).__init__(ExciseQuantity, ExciseSerieses, ExciseList, ExciseRange,  **kwargs_)
supermod.ESADExciseType.subclass = ESADExciseTypeSub
# end class ESADExciseTypeSub


class ESADFilledPersonTypeSub(supermod.ESADFilledPersonType):
    def __init__(self, PersonSurname=None, PersonName=None, PersonMiddleName=None, PersonPost=None, QualificationCertificate=None, AuthoritesDocument=None, IdentityCard=None, Contact=None, **kwargs_):
        super(ESADFilledPersonTypeSub, self).__init__(PersonSurname, PersonName, PersonMiddleName, PersonPost, QualificationCertificate, AuthoritesDocument, IdentityCard, Contact,  **kwargs_)
supermod.ESADFilledPersonType.subclass = ESADFilledPersonTypeSub
# end class ESADFilledPersonTypeSub


class ESADGoodsOfficialMarkTypeSub(supermod.ESADGoodsOfficialMarkType):
    def __init__(self, StageMarkIdentifier=None, NoteMarkIdentifier=None, InformationTypeCode=None, MarkDescription=None, DateInf=None, TimeInf=None, PersonName=None, LNP=None, ReqCompletionDate=None, ReqCompletionTime=None, DocumentIndicator=None, Deadline=None, DeadlineMonth=None, **kwargs_):
        super(ESADGoodsOfficialMarkTypeSub, self).__init__(StageMarkIdentifier, NoteMarkIdentifier, InformationTypeCode, MarkDescription, DateInf, TimeInf, PersonName, LNP, ReqCompletionDate, ReqCompletionTime, DocumentIndicator, Deadline, DeadlineMonth,  **kwargs_)
supermod.ESADGoodsOfficialMarkType.subclass = ESADGoodsOfficialMarkTypeSub
# end class ESADGoodsOfficialMarkTypeSub


class ESADGoodsPackagingTypeSub(supermod.ESADGoodsPackagingType):
    def __init__(self, PakageQuantity=None, PakageTypeCode=None, PakagePartQuantity=None, PackagePalleteInformation=None, **kwargs_):
        super(ESADGoodsPackagingTypeSub, self).__init__(PakageQuantity, PakageTypeCode, PakagePartQuantity, PackagePalleteInformation,  **kwargs_)
supermod.ESADGoodsPackagingType.subclass = ESADGoodsPackagingTypeSub
# end class ESADGoodsPackagingTypeSub


class ESADGoodsQuotaTypeSub(supermod.ESADGoodsQuotaType):
    def __init__(self, ESADProductQuantityQuota=None, ESADCurrencyQuota=None, SupplementaryGoodsQuantity=None, **kwargs_):
        super(ESADGoodsQuotaTypeSub, self).__init__(ESADProductQuantityQuota, ESADCurrencyQuota, SupplementaryGoodsQuantity,  **kwargs_)
supermod.ESADGoodsQuotaType.subclass = ESADGoodsQuotaTypeSub
# end class ESADGoodsQuotaTypeSub


class ESADout_CUCustomsPaymentTypeSub(supermod.ESADout_CUCustomsPaymentType):
    def __init__(self, PaymentModeCode=None, PaymentAmount=None, PaymentCurrencyCode=None, CurrencyRate=None, extensiontype_=None, **kwargs_):
        super(ESADout_CUCustomsPaymentTypeSub, self).__init__(PaymentModeCode, PaymentAmount, PaymentCurrencyCode, CurrencyRate, extensiontype_,  **kwargs_)
supermod.ESADout_CUCustomsPaymentType.subclass = ESADout_CUCustomsPaymentTypeSub
# end class ESADout_CUCustomsPaymentTypeSub


class ESADProductQuantityQuotaTypeSub(supermod.ESADProductQuantityQuotaType):
    def __init__(self, QuotaQuantity=None, QuotaMeasureUnitQualifierCode=None, QuotaMeasurementName=None, **kwargs_):
        super(ESADProductQuantityQuotaTypeSub, self).__init__(QuotaQuantity, QuotaMeasureUnitQualifierCode, QuotaMeasurementName,  **kwargs_)
supermod.ESADProductQuantityQuotaType.subclass = ESADProductQuantityQuotaTypeSub
# end class ESADProductQuantityQuotaTypeSub


class ESADReloadContainerTypeSub(supermod.ESADReloadContainerType):
    def __init__(self, ContainerNumber=None, **kwargs_):
        super(ESADReloadContainerTypeSub, self).__init__(ContainerNumber,  **kwargs_)
supermod.ESADReloadContainerType.subclass = ESADReloadContainerTypeSub
# end class ESADReloadContainerTypeSub


class ESADReloadingInfoTypeSub(supermod.ESADReloadingInfoType):
    def __init__(self, ReloadCountryCode=None, ReloadCountryName=None, PlaceName=None, ContainerIndicator=None, TransportModeCode=None, TransportNationalityCode=None, TransportMeansQuantity=None, ReloadingTransportMeans=None, ReloadingCustomsOffice=None, ReloadContainer=None, **kwargs_):
        super(ESADReloadingInfoTypeSub, self).__init__(ReloadCountryCode, ReloadCountryName, PlaceName, ContainerIndicator, TransportModeCode, TransportNationalityCode, TransportMeansQuantity, ReloadingTransportMeans, ReloadingCustomsOffice, ReloadContainer,  **kwargs_)
supermod.ESADReloadingInfoType.subclass = ESADReloadingInfoTypeSub
# end class ESADReloadingInfoTypeSub


class GoodsGroupDescriptionTypeSub(supermod.GoodsGroupDescriptionType):
    def __init__(self, GoodsDescription=None, RKTNVED=None, ObjectOrdinal=None, ComponentNumber=None, GoodsGroupInformation=None, GroupNum=None, **kwargs_):
        super(GoodsGroupDescriptionTypeSub, self).__init__(GoodsDescription, RKTNVED, ObjectOrdinal, ComponentNumber, GoodsGroupInformation, GroupNum,  **kwargs_)
supermod.GoodsGroupDescriptionType.subclass = GoodsGroupDescriptionTypeSub
# end class GoodsGroupDescriptionTypeSub


class GoodsGroupInformationTypeSub(supermod.GoodsGroupInformationType):
    def __init__(self, InfoDescription=None, Manufacturer=None, ManufacturerINN=None, ManufacturerKPP=None, ManufacturerOKATO=None, TradeMark=None, ProductionPlaceName=None, GoodsMark=None, GoodsModel=None, GoodsMarking=None, GoodsStandard=None, GoodsSort=None, WoodDescriptionDetails=None, Dimensions=None, DateIssue=None, SerialNumber=None, GoodsGroupQuantity=None, ArticleWeight=None, RecordId=None, LineNum=None, InvoicedCost=None, LicenseGroup=None, **kwargs_):
        super(GoodsGroupInformationTypeSub, self).__init__(InfoDescription, Manufacturer, ManufacturerINN, ManufacturerKPP, ManufacturerOKATO, TradeMark, ProductionPlaceName, GoodsMark, GoodsModel, GoodsMarking, GoodsStandard, GoodsSort, WoodDescriptionDetails, Dimensions, DateIssue, SerialNumber, GoodsGroupQuantity, ArticleWeight, RecordId, LineNum, InvoicedCost, LicenseGroup,  **kwargs_)
supermod.GoodsGroupInformationType.subclass = GoodsGroupInformationTypeSub
# end class GoodsGroupInformationTypeSub


class GoodsItemBaseTypeSub(supermod.GoodsItemBaseType):
    def __init__(self, GoodsNumeric=None, GoodFeatures=None, GoodsDescription=None, GrossWeightQuantity=None, NetWeightQuantity=None, NetWeightQuantity2=None, InvoicedCost=None, InvoicedCurrencyCode=None, InvoicedCurrencyQuantity=None, InvoicedCurrencyRate=None, InvoicedCurrencyDate=None, CustomsCost=None, StatisticalCost=None, TotalStatisticValueAmount=None, extensiontype_=None, **kwargs_):
        super(GoodsItemBaseTypeSub, self).__init__(GoodsNumeric, GoodFeatures, GoodsDescription, GrossWeightQuantity, NetWeightQuantity, NetWeightQuantity2, InvoicedCost, InvoicedCurrencyCode, InvoicedCurrencyQuantity, InvoicedCurrencyRate, InvoicedCurrencyDate, CustomsCost, StatisticalCost, TotalStatisticValueAmount, extensiontype_,  **kwargs_)
supermod.GoodsItemBaseType.subclass = GoodsItemBaseTypeSub
# end class GoodsItemBaseTypeSub


class GoodsSTZTypeSub(supermod.GoodsSTZType):
    def __init__(self, LineNumber=None, GoodsDescription=None, SupplementaryQuantity=None, GoodsGroupDescription=None, **kwargs_):
        super(GoodsSTZTypeSub, self).__init__(LineNumber, GoodsDescription, SupplementaryQuantity, GoodsGroupDescription,  **kwargs_)
supermod.GoodsSTZType.subclass = GoodsSTZTypeSub
# end class GoodsSTZTypeSub


class GuaranteeTDTypeSub(supermod.GuaranteeTDType):
    def __init__(self, GeneralDocName=None, GeneralNumber=None, GeneralDate=None, GeneralKindCode=None, GuaranteeDocName=None, GuaranteeNumber=None, GuaranteeDate=None, GuaranteeKindCode=None, AddGuaranteeDocName=None, AddGuaranteeNumber=None, AddGuaranteeDate=None, AddGuaranteeKindCode=None, **kwargs_):
        super(GuaranteeTDTypeSub, self).__init__(GeneralDocName, GeneralNumber, GeneralDate, GeneralKindCode, GuaranteeDocName, GuaranteeNumber, GuaranteeDate, GuaranteeKindCode, AddGuaranteeDocName, AddGuaranteeNumber, AddGuaranteeDate, AddGuaranteeKindCode,  **kwargs_)
supermod.GuaranteeTDType.subclass = GuaranteeTDTypeSub
# end class GuaranteeTDTypeSub


class IdentificationMeansDataUnitDetailsTypeSub(supermod.IdentificationMeansDataUnitDetailsType):
    def __init__(self, AIId=None, IdentifacationMeansUnitCharacterValueId=None, **kwargs_):
        super(IdentificationMeansDataUnitDetailsTypeSub, self).__init__(AIId, IdentifacationMeansUnitCharacterValueId,  **kwargs_)
supermod.IdentificationMeansDataUnitDetailsType.subclass = IdentificationMeansDataUnitDetailsTypeSub
# end class IdentificationMeansDataUnitDetailsTypeSub


class IdentificationMeansDetailsTypeSub(supermod.IdentificationMeansDetailsType):
    def __init__(self, AggregationKindCode=None, IdentificationMeansListDetails=None, IdentificationMeansRangeDetails=None, IdentifacationMeansCustomsId=None, **kwargs_):
        super(IdentificationMeansDetailsTypeSub, self).__init__(AggregationKindCode, IdentificationMeansListDetails, IdentificationMeansRangeDetails, IdentifacationMeansCustomsId,  **kwargs_)
supermod.IdentificationMeansDetailsType.subclass = IdentificationMeansDetailsTypeSub
# end class IdentificationMeansDetailsTypeSub


class IdentificationMeansItemDetailsTypeSub(supermod.IdentificationMeansItemDetailsType):
    def __init__(self, IdentificationMeansKindCode=None, IdentificationMeansDataUnitDetails=None, **kwargs_):
        super(IdentificationMeansItemDetailsTypeSub, self).__init__(IdentificationMeansKindCode, IdentificationMeansDataUnitDetails,  **kwargs_)
supermod.IdentificationMeansItemDetailsType.subclass = IdentificationMeansItemDetailsTypeSub
# end class IdentificationMeansItemDetailsTypeSub


class IdentificationMeansListDetailsTypeSub(supermod.IdentificationMeansListDetailsType):
    def __init__(self, IdentificationMeansItemDetails=None, **kwargs_):
        super(IdentificationMeansListDetailsTypeSub, self).__init__(IdentificationMeansItemDetails,  **kwargs_)
supermod.IdentificationMeansListDetailsType.subclass = IdentificationMeansListDetailsTypeSub
# end class IdentificationMeansListDetailsTypeSub


class IdentificationMeansRangeDetailsTypeSub(supermod.IdentificationMeansRangeDetailsType):
    def __init__(self, FirstIdentificationMeansItemDetails=None, LastIdentificationMeansItemDetails=None, **kwargs_):
        super(IdentificationMeansRangeDetailsTypeSub, self).__init__(FirstIdentificationMeansItemDetails, LastIdentificationMeansItemDetails,  **kwargs_)
supermod.IdentificationMeansRangeDetailsType.subclass = IdentificationMeansRangeDetailsTypeSub
# end class IdentificationMeansRangeDetailsTypeSub


class InvestmentGoodsIdDetailsTypeSub(supermod.InvestmentGoodsIdDetailsType):
    def __init__(self, CountryCode=None, InvestmentProjectSeqId=None, InvestmentProjectYear=None, InvestmentGoodsListKindCode=None, InvestmentProjectGoodsSeqId=None, **kwargs_):
        super(InvestmentGoodsIdDetailsTypeSub, self).__init__(CountryCode, InvestmentProjectSeqId, InvestmentProjectYear, InvestmentGoodsListKindCode, InvestmentProjectGoodsSeqId,  **kwargs_)
supermod.InvestmentGoodsIdDetailsType.subclass = InvestmentGoodsIdDetailsTypeSub
# end class InvestmentGoodsIdDetailsTypeSub


class IPObjectRegistryNumTypeSub(supermod.IPObjectRegistryNumType):
    def __init__(self, DocumentModeCode=None, CountryCode=None, IPORegistryNumber=None, **kwargs_):
        super(IPObjectRegistryNumTypeSub, self).__init__(DocumentModeCode, CountryCode, IPORegistryNumber,  **kwargs_)
supermod.IPObjectRegistryNumType.subclass = IPObjectRegistryNumTypeSub
# end class IPObjectRegistryNumTypeSub


class LicenseGoodsTypeSub(supermod.LicenseGoodsType):
    def __init__(self, AppNumber=None, GoodsNumericLic=None, **kwargs_):
        super(LicenseGoodsTypeSub, self).__init__(AppNumber, GoodsNumericLic,  **kwargs_)
supermod.LicenseGoodsType.subclass = LicenseGoodsTypeSub
# end class LicenseGoodsTypeSub


class LicenseGroupTypeSub(supermod.LicenseGroupType):
    def __init__(self, LicDocument=None, RecordId=None, GoodsNumericLic=None, **kwargs_):
        super(LicenseGroupTypeSub, self).__init__(LicDocument, RecordId, GoodsNumericLic,  **kwargs_)
supermod.LicenseGroupType.subclass = LicenseGroupTypeSub
# end class LicenseGroupTypeSub


class ManufacturerAddressTypeSub(supermod.ManufacturerAddressType):
    def __init__(self, AddressKindCode=None, PostalCode=None, CountryCode=None, CounryName=None, Region=None, District=None, Town=None, City=None, StreetHouse=None, House=None, Room=None, AddressText=None, OKTMO=None, OKATO=None, KLADR=None, AOGUID=None, AOID=None, TerritoryCode=None, PostOfficeBoxId=None, **kwargs_):
        super(ManufacturerAddressTypeSub, self).__init__(AddressKindCode, PostalCode, CountryCode, CounryName, Region, District, Town, City, StreetHouse, House, Room, AddressText, OKTMO, OKATO, KLADR, AOGUID, AOID, TerritoryCode, PostOfficeBoxId,  **kwargs_)
supermod.ManufacturerAddressType.subclass = ManufacturerAddressTypeSub
# end class ManufacturerAddressTypeSub


class MechanismUnitTypeSub(supermod.MechanismUnitType):
    def __init__(self, GoodsTNVEDCode=None, KGWeight=None, InvoicedCost=None, InvoiceCurrencyCode=None, SupplementaryQuantity=None, UnitDescription=None, MechUnitPart=None, **kwargs_):
        super(MechanismUnitTypeSub, self).__init__(GoodsTNVEDCode, KGWeight, InvoicedCost, InvoiceCurrencyCode, SupplementaryQuantity, UnitDescription, MechUnitPart,  **kwargs_)
supermod.MechanismUnitType.subclass = MechanismUnitTypeSub
# end class MechanismUnitTypeSub


class MechUnitPartTypeSub(supermod.MechUnitPartType):
    def __init__(self, GoodsTNVEDCode=None, KGWeight=None, InvoicedCost=None, InvoiceCurrencyCode=None, SupplementaryQuantity=None, PartDescription=None, **kwargs_):
        super(MechUnitPartTypeSub, self).__init__(GoodsTNVEDCode, KGWeight, InvoicedCost, InvoiceCurrencyCode, SupplementaryQuantity, PartDescription,  **kwargs_)
supermod.MechUnitPartType.subclass = MechUnitPartTypeSub
# end class MechUnitPartTypeSub


class PackagePalleteInformationTypeSub(supermod.PackagePalleteInformationType):
    def __init__(self, InfoKindCode=None, PalleteCode=None, PalleteQuantity=None, CargoDescriptionText=None, **kwargs_):
        super(PackagePalleteInformationTypeSub, self).__init__(InfoKindCode, PalleteCode, PalleteQuantity, CargoDescriptionText,  **kwargs_)
supermod.PackagePalleteInformationType.subclass = PackagePalleteInformationTypeSub
# end class PackagePalleteInformationTypeSub


class PIRegNumberTypeSub(supermod.PIRegNumberType):
    def __init__(self, CountryCode=None, Date=None, PINumber=None, **kwargs_):
        super(PIRegNumberTypeSub, self).__init__(CountryCode, Date, PINumber,  **kwargs_)
supermod.PIRegNumberType.subclass = PIRegNumberTypeSub
# end class PIRegNumberTypeSub


class PrecedingDocumentTypeSub(supermod.PrecedingDocumentType):
    def __init__(self, LineNumber=None, PrecedingDocumentID=None, PrecedingDocumentCustomsCode=None, PrecedingDocumentDate=None, PrecedingDocumentNumber=None, PrecedingDocumentOrdinalId=None, AddNumberPart=None, DTMDocDetails=None, PIDocumentNumber=None, TIRIdDetails=None, OtherPrDocumentNumber=None, OtherPrDocumentDate=None, PrecedingDocumentGoodsNumeric=None, PrecedingDocumentName=None, PrecedingDocumentModeCode=None, PrcDocGoodsTNVEDCode=None, extensiontype_=None, **kwargs_):
        super(PrecedingDocumentTypeSub, self).__init__(LineNumber, PrecedingDocumentID, PrecedingDocumentCustomsCode, PrecedingDocumentDate, PrecedingDocumentNumber, PrecedingDocumentOrdinalId, AddNumberPart, DTMDocDetails, PIDocumentNumber, TIRIdDetails, OtherPrDocumentNumber, OtherPrDocumentDate, PrecedingDocumentGoodsNumeric, PrecedingDocumentName, PrecedingDocumentModeCode, PrcDocGoodsTNVEDCode, extensiontype_,  **kwargs_)
supermod.PrecedingDocumentType.subclass = PrecedingDocumentTypeSub
# end class PrecedingDocumentTypeSub


class ProcessingGoodsCostInfoTypeSub(supermod.ProcessingGoodsCostInfoType):
    def __init__(self, ProcessingGoodsCost=None, ProcessingGoodsCostCurrencyCode=None, **kwargs_):
        super(ProcessingGoodsCostInfoTypeSub, self).__init__(ProcessingGoodsCost, ProcessingGoodsCostCurrencyCode,  **kwargs_)
supermod.ProcessingGoodsCostInfoType.subclass = ProcessingGoodsCostInfoTypeSub
# end class ProcessingGoodsCostInfoTypeSub


class ProcessingGoodsTypeSub(supermod.ProcessingGoodsType):
    def __init__(self, GoodsTNVEDCode=None, GoodsDescription=None, ProcessingGoodsQuantity=None, **kwargs_):
        super(ProcessingGoodsTypeSub, self).__init__(GoodsTNVEDCode, GoodsDescription, ProcessingGoodsQuantity,  **kwargs_)
supermod.ProcessingGoodsType.subclass = ProcessingGoodsTypeSub
# end class ProcessingGoodsTypeSub


class RangeMeasureTypeSub(supermod.RangeMeasureType):
    def __init__(self, MinRangeMeasure=None, MaxRangeMeasure=None, **kwargs_):
        super(RangeMeasureTypeSub, self).__init__(MinRangeMeasure, MaxRangeMeasure,  **kwargs_)
supermod.RangeMeasureType.subclass = RangeMeasureTypeSub
# end class RangeMeasureTypeSub


class RBGoodsReleaseNumberTypeSub(supermod.RBGoodsReleaseNumberType):
    def __init__(self, CustomsCode=None, ReleaseNumber=None, **kwargs_):
        super(RBGoodsReleaseNumberTypeSub, self).__init__(CustomsCode, ReleaseNumber,  **kwargs_)
supermod.RBGoodsReleaseNumberType.subclass = RBGoodsReleaseNumberTypeSub
# end class RBGoodsReleaseNumberTypeSub


class RFBasePresentedDocIDTypeSub(supermod.RFBasePresentedDocIDType):
    def __init__(self, ElectronicDocumentID=None, ElectronicArchID=None, DocumentModeID=None, extensiontype_=None, **kwargs_):
        super(RFBasePresentedDocIDTypeSub, self).__init__(ElectronicDocumentID, ElectronicArchID, DocumentModeID, extensiontype_,  **kwargs_)
supermod.RFBasePresentedDocIDType.subclass = RFBasePresentedDocIDTypeSub
# end class RFBasePresentedDocIDTypeSub


class RFPresentedDocIDTypeSub(supermod.RFPresentedDocIDType):
    def __init__(self, ElectronicDocumentID=None, ElectronicArchID=None, DocumentModeID=None, PresentedDocumentModeCode=None, ProvidingIndicationMark=None, RegNumberDocument=None, **kwargs_):
        super(RFPresentedDocIDTypeSub, self).__init__(ElectronicDocumentID, ElectronicArchID, DocumentModeID, PresentedDocumentModeCode, ProvidingIndicationMark, RegNumberDocument,  **kwargs_)
supermod.RFPresentedDocIDType.subclass = RFPresentedDocIDTypeSub
# end class RFPresentedDocIDTypeSub


class RFTechMarkTypeSub(supermod.RFTechMarkType):
    def __init__(self, RFTechDocumentId=None, **kwargs_):
        super(RFTechMarkTypeSub, self).__init__(RFTechDocumentId,  **kwargs_)
supermod.RFTechMarkType.subclass = RFTechMarkTypeSub
# end class RFTechMarkTypeSub


class SubjectBaseDetailsTypeSub(supermod.SubjectBaseDetailsType):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, CountryA2Code=None, BusinessEntityTypeCode=None, BusinessEntityTypeName=None, UITN=None, extensiontype_=None, **kwargs_):
        super(SubjectBaseDetailsTypeSub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, CountryA2Code, BusinessEntityTypeCode, BusinessEntityTypeName, UITN, extensiontype_,  **kwargs_)
supermod.SubjectBaseDetailsType.subclass = SubjectBaseDetailsTypeSub
# end class SubjectBaseDetailsTypeSub


class SupplementaryQuantityType4Sub(supermod.SupplementaryQuantityType4):
    def __init__(self, GoodsQuantity=None, MeasureUnitQualifierName=None, MeasureUnitQualifierCode=None, **kwargs_):
        super(SupplementaryQuantityType4Sub, self).__init__(GoodsQuantity, MeasureUnitQualifierName, MeasureUnitQualifierCode,  **kwargs_)
supermod.SupplementaryQuantityType4.subclass = SupplementaryQuantityType4Sub
# end class SupplementaryQuantityType4Sub


class SupplyConsigneeTypeSub(supermod.SupplyConsigneeType):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, CountryCode=None, **kwargs_):
        super(SupplyConsigneeTypeSub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, CountryCode,  **kwargs_)
supermod.SupplyConsigneeType.subclass = SupplyConsigneeTypeSub
# end class SupplyConsigneeTypeSub


class SupplyConsignorTypeSub(supermod.SupplyConsignorType):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, CountryCode=None, **kwargs_):
        super(SupplyConsignorTypeSub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, CountryCode,  **kwargs_)
supermod.SupplyConsignorType.subclass = SupplyConsignorTypeSub
# end class SupplyConsignorTypeSub


class SupplyInformationsTypeSub(supermod.SupplyInformationsType):
    def __init__(self, OriginCountryName=None, CustomsCost=None, ContractCurrencyCode=None, DeliveryTerms=None, GoodsQuantity=None, SupplyConsignor=None, SupplyConsignee=None, **kwargs_):
        super(SupplyInformationsTypeSub, self).__init__(OriginCountryName, CustomsCost, ContractCurrencyCode, DeliveryTerms, GoodsQuantity, SupplyConsignor, SupplyConsignee,  **kwargs_)
supermod.SupplyInformationsType.subclass = SupplyInformationsTypeSub
# end class SupplyInformationsTypeSub


class TDGuaranteeTypeSub(supermod.TDGuaranteeType):
    def __init__(self, MeasureCode=None, DocNumber=None, DocDate=None, GuaranteeCertificateIdDetails=None, TransitGuaranteeDocDetails=None, NationalGuaranteeCode=None, NonGuaranteeCountryCode=None, RegisterDocumentIdDetails=None, GuaranteeName=None, UNP=None, BIC=None, GuaranteeAmount=None, GuaranteeTD=None, extensiontype_=None, **kwargs_):
        super(TDGuaranteeTypeSub, self).__init__(MeasureCode, DocNumber, DocDate, GuaranteeCertificateIdDetails, TransitGuaranteeDocDetails, NationalGuaranteeCode, NonGuaranteeCountryCode, RegisterDocumentIdDetails, GuaranteeName, UNP, BIC, GuaranteeAmount, GuaranteeTD, extensiontype_,  **kwargs_)
supermod.TDGuaranteeType.subclass = TDGuaranteeTypeSub
# end class TDGuaranteeTypeSub


class TIRIdDetailsTypeSub(supermod.TIRIdDetailsType):
    def __init__(self, TIRSeries=None, TIRID=None, **kwargs_):
        super(TIRIdDetailsTypeSub, self).__init__(TIRSeries, TIRID,  **kwargs_)
supermod.TIRIdDetailsType.subclass = TIRIdDetailsTypeSub
# end class TIRIdDetailsTypeSub


class TransportMeansRegistrationIdDetailsTypeSub(supermod.TransportMeansRegistrationIdDetailsType):
    def __init__(self, VIN=None, TransportKindCode=None, TransportTypeName=None, TransportMarkCode=None, TransportIdentifier=None, TransportMeansNationalityCode=None, ActiveTransportIdentifier=None, TransportRegNumber=None, FirstTrailerRegId=None, SecondTrailerRegId=None, **kwargs_):
        super(TransportMeansRegistrationIdDetailsTypeSub, self).__init__(VIN, TransportKindCode, TransportTypeName, TransportMarkCode, TransportIdentifier, TransportMeansNationalityCode, ActiveTransportIdentifier, TransportRegNumber, FirstTrailerRegId, SecondTrailerRegId,  **kwargs_)
supermod.TransportMeansRegistrationIdDetailsType.subclass = TransportMeansRegistrationIdDetailsTypeSub
# end class TransportMeansRegistrationIdDetailsTypeSub


class UITN40TypeSub(supermod.UITN40Type):
    def __init__(self, UITNCode=None, CountryCode=None, **kwargs_):
        super(UITN40TypeSub, self).__init__(UITNCode, CountryCode,  **kwargs_)
supermod.UITN40Type.subclass = UITN40TypeSub
# end class UITN40TypeSub


class UnifiedCode20TypeSub(supermod.UnifiedCode20Type):
    def __init__(self, UnifiedCode=None, CodeListId=None, **kwargs_):
        super(UnifiedCode20TypeSub, self).__init__(UnifiedCode, CodeListId,  **kwargs_)
supermod.UnifiedCode20Type.subclass = UnifiedCode20TypeSub
# end class UnifiedCode20TypeSub


class UnifiedPhysicalMeasureTypeSub(supermod.UnifiedPhysicalMeasureType):
    def __init__(self, MeasuredAmount=None, MeasureUnitQualifierName=None, MeasureUnitQualifierCode=None, **kwargs_):
        super(UnifiedPhysicalMeasureTypeSub, self).__init__(MeasuredAmount, MeasureUnitQualifierName, MeasureUnitQualifierCode,  **kwargs_)
supermod.UnifiedPhysicalMeasureType.subclass = UnifiedPhysicalMeasureTypeSub
# end class UnifiedPhysicalMeasureTypeSub


class WoodDescriptionDetailsTypeSub(supermod.WoodDescriptionDetailsType):
    def __init__(self, WoodSortiment=None, WoodKind=None, ProductSortName=None, AllowanceDetails=None, DeviationDetails=None, DiameterRangeDetails=None, ContractVolumeMeasure=None, FactVolumeMeasure=None, **kwargs_):
        super(WoodDescriptionDetailsTypeSub, self).__init__(WoodSortiment, WoodKind, ProductSortName, AllowanceDetails, DeviationDetails, DiameterRangeDetails, ContractVolumeMeasure, FactVolumeMeasure,  **kwargs_)
supermod.WoodDescriptionDetailsType.subclass = WoodDescriptionDetailsTypeSub
# end class WoodDescriptionDetailsTypeSub


class WoodCodeDetailsTypeSub(supermod.WoodCodeDetailsType):
    def __init__(self, Numeric=None, NationalCommodityCode=None, VolumeMeasure=None, FactVolumeMeasure=None, HumidityMeasure=None, ItemQuantity=None, LabelId=None, LabelRangeDetails=None, **kwargs_):
        super(WoodCodeDetailsTypeSub, self).__init__(Numeric, NationalCommodityCode, VolumeMeasure, FactVolumeMeasure, HumidityMeasure, ItemQuantity, LabelId, LabelRangeDetails,  **kwargs_)
supermod.WoodCodeDetailsType.subclass = WoodCodeDetailsTypeSub
# end class WoodCodeDetailsTypeSub


class LabelRangeDetailsTypeSub(supermod.LabelRangeDetailsType):
    def __init__(self, FirstLabelId=None, LastLabelId=None, **kwargs_):
        super(LabelRangeDetailsTypeSub, self).__init__(FirstLabelId, LastLabelId,  **kwargs_)
supermod.LabelRangeDetailsType.subclass = LabelRangeDetailsTypeSub
# end class LabelRangeDetailsTypeSub


class AEORegistryIdDetailsType11Sub(supermod.AEORegistryIdDetailsType11):
    def __init__(self, RegistryOwnerCode=None, CountryA2Code=None, DocId=None, AEORegistryKindCode=None, ReregistrationCode=None, **kwargs_):
        super(AEORegistryIdDetailsType11Sub, self).__init__(RegistryOwnerCode, CountryA2Code, DocId, AEORegistryKindCode, ReregistrationCode,  **kwargs_)
supermod.AEORegistryIdDetailsType11.subclass = AEORegistryIdDetailsType11Sub
# end class AEORegistryIdDetailsType11Sub


class AmountType12Sub(supermod.AmountType12):
    def __init__(self, Amount=None, CurrencyCode=None, **kwargs_):
        super(AmountType12Sub, self).__init__(Amount, CurrencyCode,  **kwargs_)
supermod.AmountType12.subclass = AmountType12Sub
# end class AmountType12Sub


class AmountNTypeSub(supermod.AmountNType):
    def __init__(self, Amount=None, CurrencyCode=None, **kwargs_):
        super(AmountNTypeSub, self).__init__(Amount, CurrencyCode,  **kwargs_)
supermod.AmountNType.subclass = AmountNTypeSub
# end class AmountNTypeSub


class BusinessEntityId20TypeSub(supermod.BusinessEntityId20Type):
    def __init__(self, BusinessEntityId=None, KindId=None, **kwargs_):
        super(BusinessEntityId20TypeSub, self).__init__(BusinessEntityId, KindId,  **kwargs_)
supermod.BusinessEntityId20Type.subclass = BusinessEntityId20TypeSub
# end class BusinessEntityId20TypeSub


class CarrierRepresentativeDetailsTypeSub(supermod.CarrierRepresentativeDetailsType):
    def __init__(self, PersonSurname=None, PersonName=None, PersonMiddleName=None, PersonPost=None, CommunicationDetails=None, IdentityCard=None, RoleCode=None, **kwargs_):
        super(CarrierRepresentativeDetailsTypeSub, self).__init__(PersonSurname, PersonName, PersonMiddleName, PersonPost, CommunicationDetails, IdentityCard, RoleCode,  **kwargs_)
supermod.CarrierRepresentativeDetailsType.subclass = CarrierRepresentativeDetailsTypeSub
# end class CarrierRepresentativeDetailsTypeSub


class CountryDetailsType13Sub(supermod.CountryDetailsType13):
    def __init__(self, CountryCode=None, CountryName=None, **kwargs_):
        super(CountryDetailsType13Sub, self).__init__(CountryCode, CountryName,  **kwargs_)
supermod.CountryDetailsType13.subclass = CountryDetailsType13Sub
# end class CountryDetailsType13Sub


class CountryDetailsV3TypeSub(supermod.CountryDetailsV3Type):
    def __init__(self, CountryCode=None, CountryName=None, TerritoryCode=None, **kwargs_):
        super(CountryDetailsV3TypeSub, self).__init__(CountryCode, CountryName, TerritoryCode,  **kwargs_)
supermod.CountryDetailsV3Type.subclass = CountryDetailsV3TypeSub
# end class CountryDetailsV3TypeSub


class CustomsPersonDetailsSub(supermod.CustomsPersonDetails):
    def __init__(self, PersonSurname=None, PersonName=None, PersonMiddleName=None, PersonPost=None, LNP=None, CustomsCode=None, **kwargs_):
        super(CustomsPersonDetailsSub, self).__init__(PersonSurname, PersonName, PersonMiddleName, PersonPost, LNP, CustomsCode,  **kwargs_)
supermod.CustomsPersonDetails.subclass = CustomsPersonDetailsSub
# end class CustomsPersonDetailsSub


class DeliveryTermsType14Sub(supermod.DeliveryTermsType14):
    def __init__(self, DeliveryPlace=None, DeliveryTermsStringCode=None, DeliveryTermsRBCode=None, **kwargs_):
        super(DeliveryTermsType14Sub, self).__init__(DeliveryPlace, DeliveryTermsStringCode, DeliveryTermsRBCode,  **kwargs_)
supermod.DeliveryTermsType14.subclass = DeliveryTermsType14Sub
# end class DeliveryTermsType14Sub


class DocBaseType15Sub(supermod.DocBaseType15):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, DocStartDate=None, DocValidityDate=None, CountryCode=None, **kwargs_):
        super(DocBaseType15Sub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate, DocStartDate, DocValidityDate, CountryCode,  **kwargs_)
supermod.DocBaseType15.subclass = DocBaseType15Sub
# end class DocBaseType15Sub


class DocBaseV2TypeSub(supermod.DocBaseV2Type):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, DocStartDate=None, DocValidityDate=None, DocKindCode=None, extensiontype_=None, **kwargs_):
        super(DocBaseV2TypeSub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate, DocStartDate, DocValidityDate, DocKindCode, extensiontype_,  **kwargs_)
supermod.DocBaseV2Type.subclass = DocBaseV2TypeSub
# end class DocBaseV2TypeSub


class DocBaseV4TypeSub(supermod.DocBaseV4Type):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, DocKindCode=None, **kwargs_):
        super(DocBaseV4TypeSub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate, DocKindCode,  **kwargs_)
supermod.DocBaseV4Type.subclass = DocBaseV4TypeSub
# end class DocBaseV4TypeSub


class DocNumberTypeSub(supermod.DocNumberType):
    def __init__(self, AddNumber=None, **kwargs_):
        super(DocNumberTypeSub, self).__init__(AddNumber,  **kwargs_)
supermod.DocNumberType.subclass = DocNumberTypeSub
# end class DocNumberTypeSub


class DocumentBaseType16Sub(supermod.DocumentBaseType16):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, **kwargs_):
        super(DocumentBaseType16Sub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate,  **kwargs_)
supermod.DocumentBaseType16.subclass = DocumentBaseType16Sub
# end class DocumentBaseType16Sub


class DocumentBaseV1TypeSub(supermod.DocumentBaseV1Type):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, **kwargs_):
        super(DocumentBaseV1TypeSub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate,  **kwargs_)
supermod.DocumentBaseV1Type.subclass = DocumentBaseV1TypeSub
# end class DocumentBaseV1TypeSub


class EECCustomsType17Sub(supermod.EECCustomsType17):
    def __init__(self, Code=None, OfficeName=None, CountryCode=None, **kwargs_):
        super(EECCustomsType17Sub, self).__init__(Code, OfficeName, CountryCode,  **kwargs_)
supermod.EECCustomsType17.subclass = EECCustomsType17Sub
# end class EECCustomsType17Sub


class EECEDocHeaderAddInfoTypeSub(supermod.EECEDocHeaderAddInfoType):
    def __init__(self, InfEnvelopeCode=None, EDocCode=None, EDocDateTime=None, LanguageCode=None, SourceCountryCode=None, DestinationCountryCode=None, **kwargs_):
        super(EECEDocHeaderAddInfoTypeSub, self).__init__(InfEnvelopeCode, EDocCode, EDocDateTime, LanguageCode, SourceCountryCode, DestinationCountryCode,  **kwargs_)
supermod.EECEDocHeaderAddInfoType.subclass = EECEDocHeaderAddInfoTypeSub
# end class EECEDocHeaderAddInfoTypeSub


class EECGoodsBaseTypeSub(supermod.EECGoodsBaseType):
    def __init__(self, GoodsNumeric=None, GoodsTNVEDCode=None, GoodsDescription=None, extensiontype_=None, **kwargs_):
        super(EECGoodsBaseTypeSub, self).__init__(GoodsNumeric, GoodsTNVEDCode, GoodsDescription, extensiontype_,  **kwargs_)
supermod.EECGoodsBaseType.subclass = EECGoodsBaseTypeSub
# end class EECGoodsBaseTypeSub


class EECGoodsManufacturerDetailsTypeSub(supermod.EECGoodsManufacturerDetailsType):
    def __init__(self, ManufacturerName=None, TradeMarkName=None, ProductionPlaceName=None, extensiontype_=None, **kwargs_):
        super(EECGoodsManufacturerDetailsTypeSub, self).__init__(ManufacturerName, TradeMarkName, ProductionPlaceName, extensiontype_,  **kwargs_)
supermod.EECGoodsManufacturerDetailsType.subclass = EECGoodsManufacturerDetailsTypeSub
# end class EECGoodsManufacturerDetailsTypeSub


class ExchangeRateWithCurrencyA3TypeSub(supermod.ExchangeRateWithCurrencyA3Type):
    def __init__(self, CurrencyRate=None, CurrencyA3Code=None, ScaleNumber=None, **kwargs_):
        super(ExchangeRateWithCurrencyA3TypeSub, self).__init__(CurrencyRate, CurrencyA3Code, ScaleNumber,  **kwargs_)
supermod.ExchangeRateWithCurrencyA3Type.subclass = ExchangeRateWithCurrencyA3TypeSub
# end class ExchangeRateWithCurrencyA3TypeSub


class GoodLocationTransportMeansDetailsTypeSub(supermod.GoodLocationTransportMeansDetailsType):
    def __init__(self, UnifiedTransportModeCode=None, TransportMeansRegId=None, **kwargs_):
        super(GoodLocationTransportMeansDetailsTypeSub, self).__init__(UnifiedTransportModeCode, TransportMeansRegId,  **kwargs_)
supermod.GoodLocationTransportMeansDetailsType.subclass = GoodLocationTransportMeansDetailsTypeSub
# end class GoodLocationTransportMeansDetailsTypeSub


class InvoiceValueBaseDetailsTypeSub(supermod.InvoiceValueBaseDetailsType):
    def __init__(self, ValueAmount=None, ExchangeRate=None, **kwargs_):
        super(InvoiceValueBaseDetailsTypeSub, self).__init__(ValueAmount, ExchangeRate,  **kwargs_)
supermod.InvoiceValueBaseDetailsType.subclass = InvoiceValueBaseDetailsTypeSub
# end class InvoiceValueBaseDetailsTypeSub


class OrganizationType18Sub(supermod.OrganizationType18):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, CountryA2Code=None, BusinessEntityTypeCode=None, BusinessEntityTypeName=None, UITN=None, SubjectAddressDetails=None, CommunicationDetails=None, **kwargs_):
        super(OrganizationType18Sub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, CountryA2Code, BusinessEntityTypeCode, BusinessEntityTypeName, UITN, SubjectAddressDetails, CommunicationDetails,  **kwargs_)
supermod.OrganizationType18.subclass = OrganizationType18Sub
# end class OrganizationType18Sub


class PeriodDetailsTypeSub(supermod.PeriodDetailsType):
    def __init__(self, StartDateTime=None, EndDateTime=None, **kwargs_):
        super(PeriodDetailsTypeSub, self).__init__(StartDateTime, EndDateTime,  **kwargs_)
supermod.PeriodDetailsType.subclass = PeriodDetailsTypeSub
# end class PeriodDetailsTypeSub


class RegisterDocumentIdDetailsTypeSub(supermod.RegisterDocumentIdDetailsType):
    def __init__(self, CountryA2Code=None, RegistrationNumberId=None, ReregistrationCode=None, AEORegistryKindCode=None, **kwargs_):
        super(RegisterDocumentIdDetailsTypeSub, self).__init__(CountryA2Code, RegistrationNumberId, ReregistrationCode, AEORegistryKindCode,  **kwargs_)
supermod.RegisterDocumentIdDetailsType.subclass = RegisterDocumentIdDetailsTypeSub
# end class RegisterDocumentIdDetailsTypeSub


class RegisterOrganizationDetailsTypeSub(supermod.RegisterOrganizationDetailsType):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, CountryA2Code=None, BusinessEntityTypeCode=None, BusinessEntityTypeName=None, UITN=None, AddressDetails=None, CommunicationDetails=None, PostalAddressDetails=None, BranchFlagCode=None, **kwargs_):
        super(RegisterOrganizationDetailsTypeSub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, CountryA2Code, BusinessEntityTypeCode, BusinessEntityTypeName, UITN, AddressDetails, CommunicationDetails, PostalAddressDetails, BranchFlagCode,  **kwargs_)
supermod.RegisterOrganizationDetailsType.subclass = RegisterOrganizationDetailsTypeSub
# end class RegisterOrganizationDetailsTypeSub


class ResourceItemStatusDetailsTypeSub(supermod.ResourceItemStatusDetailsType):
    def __init__(self, ValidityPeriodDetails=None, UpdateDateTime=None, **kwargs_):
        super(ResourceItemStatusDetailsTypeSub, self).__init__(ValidityPeriodDetails, UpdateDateTime,  **kwargs_)
supermod.ResourceItemStatusDetailsType.subclass = ResourceItemStatusDetailsTypeSub
# end class ResourceItemStatusDetailsTypeSub


class RUAddressTypeSub(supermod.RUAddressType):
    def __init__(self, AddressKindCode=None, PostalCode=None, CountryCode=None, CounryName=None, Region=None, District=None, Town=None, City=None, StreetHouse=None, House=None, Room=None, AddressText=None, OKTMO=None, OKATO=None, KLADR=None, AOGUID=None, AOID=None, TerritoryCode=None, PostOfficeBoxId=None, **kwargs_):
        super(RUAddressTypeSub, self).__init__(AddressKindCode, PostalCode, CountryCode, CounryName, Region, District, Town, City, StreetHouse, House, Room, AddressText, OKTMO, OKATO, KLADR, AOGUID, AOID, TerritoryCode, PostOfficeBoxId,  **kwargs_)
supermod.RUAddressType.subclass = RUAddressTypeSub
# end class RUAddressTypeSub


class RUIdentityCardTypeSub(supermod.RUIdentityCardType):
    def __init__(self, IdentityCardCode=None, IdentityCardName=None, FullIdentityCardName=None, IdentityCardSeries=None, IdentityCardNumber=None, IdentityCardDate=None, DocValidityDate=None, OrganizationName=None, IssuerCode=None, AuthorityId=None, CountryCode=None, extensiontype_=None, **kwargs_):
        super(RUIdentityCardTypeSub, self).__init__(IdentityCardCode, IdentityCardName, FullIdentityCardName, IdentityCardSeries, IdentityCardNumber, IdentityCardDate, DocValidityDate, OrganizationName, IssuerCode, AuthorityId, CountryCode, extensiontype_,  **kwargs_)
supermod.RUIdentityCardType.subclass = RUIdentityCardTypeSub
# end class RUIdentityCardTypeSub


class RUOrganizationBaseTypeSub(supermod.RUOrganizationBaseType):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, extensiontype_=None, **kwargs_):
        super(RUOrganizationBaseTypeSub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, extensiontype_,  **kwargs_)
supermod.RUOrganizationBaseType.subclass = RUOrganizationBaseTypeSub
# end class RUOrganizationBaseTypeSub


class RUOrganizationNameAddrTypeSub(supermod.RUOrganizationNameAddrType):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, Address=None, **kwargs_):
        super(RUOrganizationNameAddrTypeSub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, Address,  **kwargs_)
supermod.RUOrganizationNameAddrType.subclass = RUOrganizationNameAddrTypeSub
# end class RUOrganizationNameAddrTypeSub


class RUOrganizationTypeSub(supermod.RUOrganizationType):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, Address=None, IdentityCard=None, Contact=None, OrganizationFullDatas=None, **kwargs_):
        super(RUOrganizationTypeSub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, Address, IdentityCard, Contact, OrganizationFullDatas,  **kwargs_)
supermod.RUOrganizationType.subclass = RUOrganizationTypeSub
# end class RUOrganizationTypeSub


class SigningDetailsTypeSub(supermod.SigningDetailsType):
    def __init__(self, PersonSurname=None, PersonName=None, PersonMiddleName=None, PersonPost=None, CommunicationDetails=None, SigningDate=None, **kwargs_):
        super(SigningDetailsTypeSub, self).__init__(PersonSurname, PersonName, PersonMiddleName, PersonPost, CommunicationDetails, SigningDate,  **kwargs_)
supermod.SigningDetailsType.subclass = SigningDetailsTypeSub
# end class SigningDetailsTypeSub


class SubjectBaseDetailsType19Sub(supermod.SubjectBaseDetailsType19):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, CountryA2Code=None, BusinessEntityTypeCode=None, BusinessEntityTypeName=None, UITN=None, **kwargs_):
        super(SubjectBaseDetailsType19Sub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, CountryA2Code, BusinessEntityTypeCode, BusinessEntityTypeName, UITN,  **kwargs_)
supermod.SubjectBaseDetailsType19.subclass = SubjectBaseDetailsType19Sub
# end class SubjectBaseDetailsType19Sub


class SubjectDetailsTypeSub(supermod.SubjectDetailsType):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, CountryA2Code=None, BusinessEntityTypeCode=None, BusinessEntityTypeName=None, UITN=None, PersonId=None, IdentityCard=None, SubjectAddressDetails=None, CommunicationDetails=None, extensiontype_=None, **kwargs_):
        super(SubjectDetailsTypeSub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, CountryA2Code, BusinessEntityTypeCode, BusinessEntityTypeName, UITN, PersonId, IdentityCard, SubjectAddressDetails, CommunicationDetails, extensiontype_,  **kwargs_)
supermod.SubjectDetailsType.subclass = SubjectDetailsTypeSub
# end class SubjectDetailsTypeSub


class SubjectDetailsBankTypeSub(supermod.SubjectDetailsBankType):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, CountryA2Code=None, BusinessEntityTypeCode=None, BusinessEntityTypeName=None, UITN=None, PersonId=None, IdentityCard=None, SubjectAddressDetails=None, CommunicationDetails=None, BankInformation=None, **kwargs_):
        super(SubjectDetailsBankTypeSub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, CountryA2Code, BusinessEntityTypeCode, BusinessEntityTypeName, UITN, PersonId, IdentityCard, SubjectAddressDetails, CommunicationDetails, BankInformation,  **kwargs_)
supermod.SubjectDetailsBankType.subclass = SubjectDetailsBankTypeSub
# end class SubjectDetailsBankTypeSub


class SupplementaryQuantity24point8TypeSub(supermod.SupplementaryQuantity24point8Type):
    def __init__(self, GoodsQuantity=None, MeasureUnitQualifierName=None, MeasureUnitQualifierCode=None, **kwargs_):
        super(SupplementaryQuantity24point8TypeSub, self).__init__(GoodsQuantity, MeasureUnitQualifierName, MeasureUnitQualifierCode,  **kwargs_)
supermod.SupplementaryQuantity24point8Type.subclass = SupplementaryQuantity24point8TypeSub
# end class SupplementaryQuantity24point8TypeSub


class TradeCountryDetailsTypeSub(supermod.TradeCountryDetailsType):
    def __init__(self, CountryCode=None, TerritoryCode=None, **kwargs_):
        super(TradeCountryDetailsTypeSub, self).__init__(CountryCode, TerritoryCode,  **kwargs_)
supermod.TradeCountryDetailsType.subclass = TradeCountryDetailsTypeSub
# end class TradeCountryDetailsTypeSub


class TransportMeansRegIdTypeSub(supermod.TransportMeansRegIdType):
    def __init__(self, TransportMeansRegIdNumber=None, CountryCode=None, **kwargs_):
        super(TransportMeansRegIdTypeSub, self).__init__(TransportMeansRegIdNumber, CountryCode,  **kwargs_)
supermod.TransportMeansRegIdType.subclass = TransportMeansRegIdTypeSub
# end class TransportMeansRegIdTypeSub


class UITN40Type20Sub(supermod.UITN40Type20):
    def __init__(self, UITNCode=None, CountryCode=None, **kwargs_):
        super(UITN40Type20Sub, self).__init__(UITNCode, CountryCode,  **kwargs_)
supermod.UITN40Type20.subclass = UITN40Type20Sub
# end class UITN40Type20Sub


class UnifiedCode20Type21Sub(supermod.UnifiedCode20Type21):
    def __init__(self, UnifiedCode=None, CodeListId=None, **kwargs_):
        super(UnifiedCode20Type21Sub, self).__init__(UnifiedCode, CodeListId,  **kwargs_)
supermod.UnifiedCode20Type21.subclass = UnifiedCode20Type21Sub
# end class UnifiedCode20Type21Sub


class UnifiedPhysicalMeasureType22Sub(supermod.UnifiedPhysicalMeasureType22):
    def __init__(self, MeasuredAmount=None, MeasureUnitQualifierName=None, MeasureUnitQualifierCode=None, **kwargs_):
        super(UnifiedPhysicalMeasureType22Sub, self).__init__(MeasuredAmount, MeasureUnitQualifierName, MeasureUnitQualifierCode,  **kwargs_)
supermod.UnifiedPhysicalMeasureType22.subclass = UnifiedPhysicalMeasureType22Sub
# end class UnifiedPhysicalMeasureType22Sub


class WarehouseDetailsTypeSub(supermod.WarehouseDetailsType):
    def __init__(self, AddressDetails=None, WarehouseKindCode=None, TypeWarehouseIndicator=None, TotalAreaMeasure=None, CubageMeasure=None, TransportModeCode=None, WarehouseActivityDescriptionText=None, AdditionalInfoText=None, **kwargs_):
        super(WarehouseDetailsTypeSub, self).__init__(AddressDetails, WarehouseKindCode, TypeWarehouseIndicator, TotalAreaMeasure, CubageMeasure, TransportModeCode, WarehouseActivityDescriptionText, AdditionalInfoText,  **kwargs_)
supermod.WarehouseDetailsType.subclass = WarehouseDetailsTypeSub
# end class WarehouseDetailsTypeSub


class BasePresentedDocDetailsTypeSub(supermod.BasePresentedDocDetailsType):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, DocStartDate=None, DocValidityDate=None, CountryCode=None, DocKindCode=None, AuthorityName=None, AuthorityId=None, InformationSourceDetails=None, LineId=None, EDocCode=None, DocArchIdDetails=None, extensiontype_=None, **kwargs_):
        super(BasePresentedDocDetailsTypeSub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate, DocStartDate, DocValidityDate, CountryCode, DocKindCode, AuthorityName, AuthorityId, InformationSourceDetails, LineId, EDocCode, DocArchIdDetails, extensiontype_,  **kwargs_)
supermod.BasePresentedDocDetailsType.subclass = BasePresentedDocDetailsTypeSub
# end class BasePresentedDocDetailsTypeSub


class BrokerRegistryDocDetailsTypeSub(supermod.BrokerRegistryDocDetailsType):
    def __init__(self, DocKindCode=None, CountryA2Code=None, RegistrationNumberId=None, **kwargs_):
        super(BrokerRegistryDocDetailsTypeSub, self).__init__(DocKindCode, CountryA2Code, RegistrationNumberId,  **kwargs_)
supermod.BrokerRegistryDocDetailsType.subclass = BrokerRegistryDocDetailsTypeSub
# end class BrokerRegistryDocDetailsTypeSub


class CalculationTypeSub(supermod.CalculationType):
    def __init__(self, PaymentModeCode=None, TaxBase=None, TaxBaseCurrencyCode=None, TaxBaseQualifierCode=None, RateTypeCode=None, Rate=None, RateTNVEDQualifierCode=None, RateCurrencyCode=None, NumberDays=None, NumberStages=None, NumberMonths=None, WeightingFactor=None, RateUseDate=None, PaymentCode=None, PaymentAmount=None, PaymentCurrencyCode=None, TNVEDGroup=None, ReferenceLineId=None, RefReferenceLineId=None, ReferenceConsignmentItemOrdinal=None, **kwargs_):
        super(CalculationTypeSub, self).__init__(PaymentModeCode, TaxBase, TaxBaseCurrencyCode, TaxBaseQualifierCode, RateTypeCode, Rate, RateTNVEDQualifierCode, RateCurrencyCode, NumberDays, NumberStages, NumberMonths, WeightingFactor, RateUseDate, PaymentCode, PaymentAmount, PaymentCurrencyCode, TNVEDGroup, ReferenceLineId, RefReferenceLineId, ReferenceConsignmentItemOrdinal,  **kwargs_)
supermod.CalculationType.subclass = CalculationTypeSub
# end class CalculationTypeSub


class CommodityDescriptionBaseDetailsTypeSub(supermod.CommodityDescriptionBaseDetailsType):
    def __init__(self, ManufacturerName=None, TradeMarkName=None, ProductionPlaceName=None, ProductMarkName=None, ProductModelName=None, ProductId=None, ProductSortName=None, StandardName=None, ProductInstanceId=None, ManufactureDate=None, IPObjectRegistryIdDetails=None, **kwargs_):
        super(CommodityDescriptionBaseDetailsTypeSub, self).__init__(ManufacturerName, TradeMarkName, ProductionPlaceName, ProductMarkName, ProductModelName, ProductId, ProductSortName, StandardName, ProductInstanceId, ManufactureDate, IPObjectRegistryIdDetails,  **kwargs_)
supermod.CommodityDescriptionBaseDetailsType.subclass = CommodityDescriptionBaseDetailsTypeSub
# end class CommodityDescriptionBaseDetailsTypeSub


class CommodityGroupItemDetailsTypeSub(supermod.CommodityGroupItemDetailsType):
    def __init__(self, LineId=None, CommodityDescriptionDetails=None, ProductionPlaceName=None, StandardName=None, **kwargs_):
        super(CommodityGroupItemDetailsTypeSub, self).__init__(LineId, CommodityDescriptionDetails, ProductionPlaceName, StandardName,  **kwargs_)
supermod.CommodityGroupItemDetailsType.subclass = CommodityGroupItemDetailsTypeSub
# end class CommodityGroupItemDetailsTypeSub


class CUPresentedDocumentsType23Sub(supermod.CUPresentedDocumentsType23):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, CustomsCode=None, CustomsControlZoneId=None, PresentedDocumentModeCode=None, DocumentBeginActionsDate=None, DocumentEndActionsDate=None, TemporaryImportCode=None, TemporaryStorageImportDate=None, CustomsPaymentModeCodeType=None, SupplyStatus=None, CountryCode=None, TotalDocuments=None, PreferenciiCountryCode=None, PreferenciiDocID=None, ProcessingGoodsCostInfo=None, RecordID=None, ExecutiveBodyID=None, ExecutiveName=None, LicenseGoods=None, GoodsNumeric=None, RFG44PresentedDocId=None, TIRPageNumber=None, TIRHolderID=None, InformationSourceDetails=None, DocumentPresentingDetails=None, **kwargs_):
        super(CUPresentedDocumentsType23Sub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate, CustomsCode, CustomsControlZoneId, PresentedDocumentModeCode, DocumentBeginActionsDate, DocumentEndActionsDate, TemporaryImportCode, TemporaryStorageImportDate, CustomsPaymentModeCodeType, SupplyStatus, CountryCode, TotalDocuments, PreferenciiCountryCode, PreferenciiDocID, ProcessingGoodsCostInfo, RecordID, ExecutiveBodyID, ExecutiveName, LicenseGoods, GoodsNumeric, RFG44PresentedDocId, TIRPageNumber, TIRHolderID, InformationSourceDetails, DocumentPresentingDetails,  **kwargs_)
supermod.CUPresentedDocumentsType23.subclass = CUPresentedDocumentsType23Sub
# end class CUPresentedDocumentsType23Sub


class CustomDocIDTypeSub(supermod.CustomDocIDType):
    def __init__(self, Code=None, **kwargs_):
        super(CustomDocIDTypeSub, self).__init__(Code,  **kwargs_)
supermod.CustomDocIDType.subclass = CustomDocIDTypeSub
# end class CustomDocIDTypeSub


class DisassemComponentTypeSub(supermod.DisassemComponentType):
    def __init__(self, GoodsTNVEDCode=None, KGWeight=None, InvoicedCost=None, InvoiceCurrencyCode=None, SupplementaryQuantity=None, IDNumber=None, ComponentName=None, ComponentId=None, ParentIDNumber=None, ChangeAction=None, **kwargs_):
        super(DisassemComponentTypeSub, self).__init__(GoodsTNVEDCode, KGWeight, InvoicedCost, InvoiceCurrencyCode, SupplementaryQuantity, IDNumber, ComponentName, ComponentId, ParentIDNumber, ChangeAction,  **kwargs_)
supermod.DisassemComponentType.subclass = DisassemComponentTypeSub
# end class DisassemComponentTypeSub


class DocumentPresentingDetailsTypeSub(supermod.DocumentPresentingDetailsType):
    def __init__(self, DocPresentKindCode=None, PresentedDocumentModeCode=None, DocPresentDate=None, CustomsDocIdDetails=None, DTMDocDetails=None, TIRIdDetails=None, OtherPrecedingDocId=None, OtherPrecedingDocDate=None, **kwargs_):
        super(DocumentPresentingDetailsTypeSub, self).__init__(DocPresentKindCode, PresentedDocumentModeCode, DocPresentDate, CustomsDocIdDetails, DTMDocDetails, TIRIdDetails, OtherPrecedingDocId, OtherPrecedingDocDate,  **kwargs_)
supermod.DocumentPresentingDetailsType.subclass = DocumentPresentingDetailsTypeSub
# end class DocumentPresentingDetailsTypeSub


class DTMDocDetailsType24Sub(supermod.DTMDocDetailsType24):
    def __init__(self, TransportModeCode=None, **kwargs_):
        super(DTMDocDetailsType24Sub, self).__init__(TransportModeCode,  **kwargs_)
supermod.DTMDocDetailsType24.subclass = DTMDocDetailsType24Sub
# end class DTMDocDetailsType24Sub


class GoodsGroupDescriptionType25Sub(supermod.GoodsGroupDescriptionType25):
    def __init__(self, LineId=None, GoodsDescription=None, ObjectOrdinal=None, RKTNVED=None, CommodityGroupItemDetails=None, **kwargs_):
        super(GoodsGroupDescriptionType25Sub, self).__init__(LineId, GoodsDescription, ObjectOrdinal, RKTNVED, CommodityGroupItemDetails,  **kwargs_)
supermod.GoodsGroupDescriptionType25.subclass = GoodsGroupDescriptionType25Sub
# end class GoodsGroupDescriptionType25Sub


class GoodsLocationDetailsTypeSub(supermod.GoodsLocationDetailsType):
    def __init__(self, GoodsLocationCode=None, CustomsOfficeCode=None, CountryCode=None, GoodsLocationName=None, CustomsControlZoneId=None, GoodsLocationDocDetails=None, RegisterDocumentIdDetails=None, GoodLocationTransportMeansDetails=None, UnifiedAddressDetails=None, **kwargs_):
        super(GoodsLocationDetailsTypeSub, self).__init__(GoodsLocationCode, CustomsOfficeCode, CountryCode, GoodsLocationName, CustomsControlZoneId, GoodsLocationDocDetails, RegisterDocumentIdDetails, GoodLocationTransportMeansDetails, UnifiedAddressDetails,  **kwargs_)
supermod.GoodsLocationDetailsType.subclass = GoodsLocationDetailsTypeSub
# end class GoodsLocationDetailsTypeSub


class InformationSourceDetailsTypeSub(supermod.InformationSourceDetailsType):
    def __init__(self, InformationSourceName=None, DetailsResourceId=None, EventDate=None, **kwargs_):
        super(InformationSourceDetailsTypeSub, self).__init__(InformationSourceName, DetailsResourceId, EventDate,  **kwargs_)
supermod.InformationSourceDetailsType.subclass = InformationSourceDetailsTypeSub
# end class InformationSourceDetailsTypeSub


class PaymentDocumentTypeSub(supermod.PaymentDocumentType):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, CustomsDocumentCode=None, INN=None, PersonId=None, **kwargs_):
        super(PaymentDocumentTypeSub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate, CustomsDocumentCode, INN, PersonId,  **kwargs_)
supermod.PaymentDocumentType.subclass = PaymentDocumentTypeSub
# end class PaymentDocumentTypeSub


class PaymentGuaranteeDetailsTypeSub(supermod.PaymentGuaranteeDetailsType):
    def __init__(self, PaymentGuaranteeMethodCode=None, GuaranteeAmount=None, GuaranteeDocDetails=None, INN=None, BankId=None, **kwargs_):
        super(PaymentGuaranteeDetailsTypeSub, self).__init__(PaymentGuaranteeMethodCode, GuaranteeAmount, GuaranteeDocDetails, INN, BankId,  **kwargs_)
supermod.PaymentGuaranteeDetailsType.subclass = PaymentGuaranteeDetailsTypeSub
# end class PaymentGuaranteeDetailsTypeSub


class PlaceDetailsTypeSub(supermod.PlaceDetailsType):
    def __init__(self, PlaceName=None, AddressDetails=None, **kwargs_):
        super(PlaceDetailsTypeSub, self).__init__(PlaceName, AddressDetails,  **kwargs_)
supermod.PlaceDetailsType.subclass = PlaceDetailsTypeSub
# end class PlaceDetailsTypeSub


class PowerOfAttorneyDetailsTypeSub(supermod.PowerOfAttorneyDetailsType):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, DocStartDate=None, DocValidityDate=None, DocKindCode=None, DocArchIdDetails=None, **kwargs_):
        super(PowerOfAttorneyDetailsTypeSub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate, DocStartDate, DocValidityDate, DocKindCode, DocArchIdDetails,  **kwargs_)
supermod.PowerOfAttorneyDetailsType.subclass = PowerOfAttorneyDetailsTypeSub
# end class PowerOfAttorneyDetailsTypeSub


class PrecedingDocDetailsTypeSub(supermod.PrecedingDocDetailsType):
    def __init__(self, LineId=None, PrecedingDocumentModeCode=None, PrecedingDocumentName=None, CustomsDocIdDetails=None, DTMDocDetails=None, PIDocumentNumber=None, TIRIdDetails=None, OtherPrDocumentNumber=None, OtherPrDocumentDate=None, PrecedingDocumentGoodsNumeric=None, PrecedingGoodsDetails=None, **kwargs_):
        super(PrecedingDocDetailsTypeSub, self).__init__(LineId, PrecedingDocumentModeCode, PrecedingDocumentName, CustomsDocIdDetails, DTMDocDetails, PIDocumentNumber, TIRIdDetails, OtherPrDocumentNumber, OtherPrDocumentDate, PrecedingDocumentGoodsNumeric, PrecedingGoodsDetails,  **kwargs_)
supermod.PrecedingDocDetailsType.subclass = PrecedingDocDetailsTypeSub
# end class PrecedingDocDetailsTypeSub


class PrecedingDocumentCustomsTypeSub(supermod.PrecedingDocumentCustomsType):
    def __init__(self, PrecedingDocumentCustomsCode=None, PrecedingDocumentDate=None, PrecedingDocumentNumber=None, **kwargs_):
        super(PrecedingDocumentCustomsTypeSub, self).__init__(PrecedingDocumentCustomsCode, PrecedingDocumentDate, PrecedingDocumentNumber,  **kwargs_)
supermod.PrecedingDocumentCustomsType.subclass = PrecedingDocumentCustomsTypeSub
# end class PrecedingDocumentCustomsTypeSub


class PrecedingDocumentOtherTypeSub(supermod.PrecedingDocumentOtherType):
    def __init__(self, DocId=None, DocCreationDate=None, **kwargs_):
        super(PrecedingDocumentOtherTypeSub, self).__init__(DocId, DocCreationDate,  **kwargs_)
supermod.PrecedingDocumentOtherType.subclass = PrecedingDocumentOtherTypeSub
# end class PrecedingDocumentOtherTypeSub


class PrecedingGoodsDetailsTypeSub(supermod.PrecedingGoodsDetailsType):
    def __init__(self, DeclGrossWeightQuantity=None, SupplementaryQuantity=None, **kwargs_):
        super(PrecedingGoodsDetailsTypeSub, self).__init__(DeclGrossWeightQuantity, SupplementaryQuantity,  **kwargs_)
supermod.PrecedingGoodsDetailsType.subclass = PrecedingGoodsDetailsTypeSub
# end class PrecedingGoodsDetailsTypeSub


class PresentedDocDetailsTypeSub(supermod.PresentedDocDetailsType):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, DocStartDate=None, DocValidityDate=None, CountryCode=None, DocKindCode=None, AuthorityName=None, AuthorityId=None, InformationSourceDetails=None, LineId=None, EDocCode=None, DocArchIdDetails=None, DocumentPresentingDetails=None, **kwargs_):
        super(PresentedDocDetailsTypeSub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate, DocStartDate, DocValidityDate, CountryCode, DocKindCode, AuthorityName, AuthorityId, InformationSourceDetails, LineId, EDocCode, DocArchIdDetails, DocumentPresentingDetails,  **kwargs_)
supermod.PresentedDocDetailsType.subclass = PresentedDocDetailsTypeSub
# end class PresentedDocDetailsTypeSub


class ProcessingGoodsDeclarationTypeSub(supermod.ProcessingGoodsDeclarationType):
    def __init__(self, RateOutputGoods=None, ProcessingDoc=None, GoodsIdentificationMethod=None, ProcessingPlaceDetails=None, Substitute=None, Organization=None, ProcessingProduct=None, WasteProducts=None, Heels=None, ProcessingOperationDetails=None, **kwargs_):
        super(ProcessingGoodsDeclarationTypeSub, self).__init__(RateOutputGoods, ProcessingDoc, GoodsIdentificationMethod, ProcessingPlaceDetails, Substitute, Organization, ProcessingProduct, WasteProducts, Heels, ProcessingOperationDetails,  **kwargs_)
supermod.ProcessingGoodsDeclarationType.subclass = ProcessingGoodsDeclarationTypeSub
# end class ProcessingGoodsDeclarationTypeSub


class ProcessingOperationDetailsTypeSub(supermod.ProcessingOperationDetailsType):
    def __init__(self, ProcessingOperationName=None, ProcessingOperationMethodText=None, **kwargs_):
        super(ProcessingOperationDetailsTypeSub, self).__init__(ProcessingOperationName, ProcessingOperationMethodText,  **kwargs_)
supermod.ProcessingOperationDetailsType.subclass = ProcessingOperationDetailsTypeSub
# end class ProcessingOperationDetailsTypeSub


class RegisterDocumentDetailsTypeSub(supermod.RegisterDocumentDetailsType):
    def __init__(self, RegistrationNumberIdentifier=None, DocCreationDate=None, RegisterDocumentCode=None, ReregistrationCode=None, CountryCode=None, **kwargs_):
        super(RegisterDocumentDetailsTypeSub, self).__init__(RegistrationNumberIdentifier, DocCreationDate, RegisterDocumentCode, ReregistrationCode, CountryCode,  **kwargs_)
supermod.RegisterDocumentDetailsType.subclass = RegisterDocumentDetailsTypeSub
# end class RegisterDocumentDetailsTypeSub


class RegisterDocumentIdDetailsType26Sub(supermod.RegisterDocumentIdDetailsType26):
    def __init__(self, CountryA2Code=None, RegistrationNumberId=None, ReregistrationCode=None, AEORegistryKindCode=None, **kwargs_):
        super(RegisterDocumentIdDetailsType26Sub, self).__init__(CountryA2Code, RegistrationNumberId, ReregistrationCode, AEORegistryKindCode,  **kwargs_)
supermod.RegisterDocumentIdDetailsType26.subclass = RegisterDocumentIdDetailsType26Sub
# end class RegisterDocumentIdDetailsType26Sub


class RepresentativeContractDetailsTypeSub(supermod.RepresentativeContractDetailsType):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, DocStartDate=None, DocValidityDate=None, DocKindCode=None, DocArchIdDetails=None, **kwargs_):
        super(RepresentativeContractDetailsTypeSub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate, DocStartDate, DocValidityDate, DocKindCode, DocArchIdDetails,  **kwargs_)
supermod.RepresentativeContractDetailsType.subclass = RepresentativeContractDetailsTypeSub
# end class RepresentativeContractDetailsTypeSub


class SignatoryPersonDetailsTypeSub(supermod.SignatoryPersonDetailsType):
    def __init__(self, SigningDetails=None, SignatoryPersonIdentityDetails=None, QualificationCertificate=None, PowerOfAttorneyDetails=None, **kwargs_):
        super(SignatoryPersonDetailsTypeSub, self).__init__(SigningDetails, SignatoryPersonIdentityDetails, QualificationCertificate, PowerOfAttorneyDetails,  **kwargs_)
supermod.SignatoryPersonDetailsType.subclass = SignatoryPersonDetailsTypeSub
# end class SignatoryPersonDetailsTypeSub


class SignatoryPersonIdentityDetailsTypeSub(supermod.SignatoryPersonIdentityDetailsType):
    def __init__(self, IdentityCardCode=None, IdentityCardName=None, FullIdentityCardName=None, IdentityCardSeries=None, IdentityCardNumber=None, IdentityCardDate=None, DocValidityDate=None, OrganizationName=None, IssuerCode=None, AuthorityId=None, CountryCode=None, DocArchIdDetails=None, **kwargs_):
        super(SignatoryPersonIdentityDetailsTypeSub, self).__init__(IdentityCardCode, IdentityCardName, FullIdentityCardName, IdentityCardSeries, IdentityCardNumber, IdentityCardDate, DocValidityDate, OrganizationName, IssuerCode, AuthorityId, CountryCode, DocArchIdDetails,  **kwargs_)
supermod.SignatoryPersonIdentityDetailsType.subclass = SignatoryPersonIdentityDetailsTypeSub
# end class SignatoryPersonIdentityDetailsTypeSub


class SignatoryRepresentativeDetailsTypeSub(supermod.SignatoryRepresentativeDetailsType):
    def __init__(self, BrokerRegistryDocDetails=None, RepresentativeContractDetails=None, **kwargs_):
        super(SignatoryRepresentativeDetailsTypeSub, self).__init__(BrokerRegistryDocDetails, RepresentativeContractDetails,  **kwargs_)
supermod.SignatoryRepresentativeDetailsType.subclass = SignatoryRepresentativeDetailsTypeSub
# end class SignatoryRepresentativeDetailsTypeSub


class SignCertifPersonTypeSub(supermod.SignCertifPersonType):
    def __init__(self, PersonSurname=None, PersonName=None, PersonMiddleName=None, PersonPost=None, RFOrganizationFeatures=None, SNILS=None, OrganizationName=None, SertifName=None, **kwargs_):
        super(SignCertifPersonTypeSub, self).__init__(PersonSurname, PersonName, PersonMiddleName, PersonPost, RFOrganizationFeatures, SNILS, OrganizationName, SertifName,  **kwargs_)
supermod.SignCertifPersonType.subclass = SignCertifPersonTypeSub
# end class SignCertifPersonTypeSub


class SimplePresentedDocDetailsTypeSub(supermod.SimplePresentedDocDetailsType):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, DocStartDate=None, DocValidityDate=None, CountryCode=None, DocKindCode=None, AuthorityName=None, AuthorityId=None, InformationSourceDetails=None, LineId=None, EDocCode=None, DocArchIdDetails=None, **kwargs_):
        super(SimplePresentedDocDetailsTypeSub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate, DocStartDate, DocValidityDate, CountryCode, DocKindCode, AuthorityName, AuthorityId, InformationSourceDetails, LineId, EDocCode, DocArchIdDetails,  **kwargs_)
supermod.SimplePresentedDocDetailsType.subclass = SimplePresentedDocDetailsTypeSub
# end class SimplePresentedDocDetailsTypeSub


class TDGuaranteeType27Sub(supermod.TDGuaranteeType27):
    def __init__(self, MeasureCode=None, DocNumber=None, DocDate=None, GuaranteeCertificateIdDetails=None, TransitGuaranteeDocDetails=None, NationalGuaranteeCode=None, NonGuaranteeCountryCode=None, RegisterDocumentIdDetails=None, GuaranteeName=None, UNP=None, BIC=None, GuaranteeAmount=None, GuaranteeTD=None, GuaranteeAddress=None, **kwargs_):
        super(TDGuaranteeType27Sub, self).__init__(MeasureCode, DocNumber, DocDate, GuaranteeCertificateIdDetails, TransitGuaranteeDocDetails, NationalGuaranteeCode, NonGuaranteeCountryCode, RegisterDocumentIdDetails, GuaranteeName, UNP, BIC, GuaranteeAmount, GuaranteeTD, GuaranteeAddress,  **kwargs_)
supermod.TDGuaranteeType27.subclass = TDGuaranteeType27Sub
# end class TDGuaranteeType27Sub


class TIRIdDetailsType28Sub(supermod.TIRIdDetailsType28):
    def __init__(self, TIRSeries=None, TIRID=None, **kwargs_):
        super(TIRIdDetailsType28Sub, self).__init__(TIRSeries, TIRID,  **kwargs_)
supermod.TIRIdDetailsType28.subclass = TIRIdDetailsType28Sub
# end class TIRIdDetailsType28Sub


class SubjectBranchDetailsTypeSub(supermod.SubjectBranchDetailsType):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, CountryA2Code=None, BusinessEntityTypeCode=None, BusinessEntityTypeName=None, UITN=None, PersonId=None, IdentityCard=None, SubjectAddressDetails=None, CommunicationDetails=None, SubjectBranch=None, extensiontype_=None, **kwargs_):
        super(SubjectBranchDetailsTypeSub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, CountryA2Code, BusinessEntityTypeCode, BusinessEntityTypeName, UITN, PersonId, IdentityCard, SubjectAddressDetails, CommunicationDetails, SubjectBranch, extensiontype_,  **kwargs_)
supermod.SubjectBranchDetailsType.subclass = SubjectBranchDetailsTypeSub
# end class SubjectBranchDetailsTypeSub


class EECDTGoodsBaseDetailsTypeSub(supermod.EECDTGoodsBaseDetailsType):
    def __init__(self, GoodsNumeric=None, GoodsTNVEDCode=None, GoodsDescription=None, UnifiedGrossMassMeasure=None, UnifiedNetMassMeasure=None, GoodsMeasureDetails=None, **kwargs_):
        super(EECDTGoodsBaseDetailsTypeSub, self).__init__(GoodsNumeric, GoodsTNVEDCode, GoodsDescription, UnifiedGrossMassMeasure, UnifiedNetMassMeasure, GoodsMeasureDetails,  **kwargs_)
supermod.EECDTGoodsBaseDetailsType.subclass = EECDTGoodsBaseDetailsTypeSub
# end class EECDTGoodsBaseDetailsTypeSub


class ManufacturerTypeSub(supermod.ManufacturerType):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, CountryA2Code=None, BusinessEntityTypeCode=None, BusinessEntityTypeName=None, UITN=None, PersonId=None, Address=None, **kwargs_):
        super(ManufacturerTypeSub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, CountryA2Code, BusinessEntityTypeCode, BusinessEntityTypeName, UITN, PersonId, Address,  **kwargs_)
supermod.ManufacturerType.subclass = ManufacturerTypeSub
# end class ManufacturerTypeSub


class CUPrecedingDocumentTypeSub(supermod.CUPrecedingDocumentType):
    def __init__(self, LineNumber=None, PrecedingDocumentID=None, PrecedingDocumentCustomsCode=None, PrecedingDocumentDate=None, PrecedingDocumentNumber=None, PrecedingDocumentOrdinalId=None, AddNumberPart=None, DTMDocDetails=None, PIDocumentNumber=None, TIRIdDetails=None, OtherPrDocumentNumber=None, OtherPrDocumentDate=None, PrecedingDocumentGoodsNumeric=None, PrecedingDocumentName=None, PrecedingDocumentModeCode=None, PrcDocGoodsTNVEDCode=None, NetWeightQuantity=None, CustomsCountryCode=None, CustomsCost=None, NetWeight=None, SupplementaryGoodsQuantity=None, **kwargs_):
        super(CUPrecedingDocumentTypeSub, self).__init__(LineNumber, PrecedingDocumentID, PrecedingDocumentCustomsCode, PrecedingDocumentDate, PrecedingDocumentNumber, PrecedingDocumentOrdinalId, AddNumberPart, DTMDocDetails, PIDocumentNumber, TIRIdDetails, OtherPrDocumentNumber, OtherPrDocumentDate, PrecedingDocumentGoodsNumeric, PrecedingDocumentName, PrecedingDocumentModeCode, PrcDocGoodsTNVEDCode, NetWeightQuantity, CustomsCountryCode, CustomsCost, NetWeight, SupplementaryGoodsQuantity,  **kwargs_)
supermod.CUPrecedingDocumentType.subclass = CUPrecedingDocumentTypeSub
# end class CUPrecedingDocumentTypeSub


class CUESADGoodsItemTypeSub(supermod.CUESADGoodsItemType):
    def __init__(self, GoodsNumeric=None, GoodFeatures=None, GoodsDescription=None, GrossWeightQuantity=None, NetWeightQuantity=None, NetWeightQuantity2=None, InvoicedCost=None, InvoicedCurrencyCode=None, InvoicedCurrencyQuantity=None, InvoicedCurrencyRate=None, InvoicedCurrencyDate=None, CustomsCost=None, StatisticalCost=None, TotalStatisticValueAmount=None, GoodsTNVEDCode=None, GoodsClassificationCode=None, AdditionalSign=None, IntellectPropertySign=None, GoodsTraceabilityCode=None, CIMSign=None, RestrictionSign=None, BeginPeriodDate=None, EndPeriodDate=None, OriginCountryCode=None, OriginCountryName=None, RBOriginCountryCode=None, PrefOriginCountry=None, CustomsCostCorrectMethod=None, GoodsAddTNVEDCode=None, LicenseGoodsKindCode=None, DeliveryTime=None, DeliveryTimeEND=None, AdditionalSheetCount=None, QuantityFact=None, OilField=None, TNVEDContract=None, IPObjectRegistryNum=None, CUESADDeliveryTerms=None, ForeignTradeContractDetails=None, GoodsGroupDescription=None, Preferencii=None, CIMIdDetails=None, DTIdentificationMeansDetails=None, GoodsTraceabilityMeasureDetails=None, WoodCodeDetails=None, GoodsSTZ=None, extensiontype_=None, **kwargs_):
        super(CUESADGoodsItemTypeSub, self).__init__(GoodsNumeric, GoodFeatures, GoodsDescription, GrossWeightQuantity, NetWeightQuantity, NetWeightQuantity2, InvoicedCost, InvoicedCurrencyCode, InvoicedCurrencyQuantity, InvoicedCurrencyRate, InvoicedCurrencyDate, CustomsCost, StatisticalCost, TotalStatisticValueAmount, GoodsTNVEDCode, GoodsClassificationCode, AdditionalSign, IntellectPropertySign, GoodsTraceabilityCode, CIMSign, RestrictionSign, BeginPeriodDate, EndPeriodDate, OriginCountryCode, OriginCountryName, RBOriginCountryCode, PrefOriginCountry, CustomsCostCorrectMethod, GoodsAddTNVEDCode, LicenseGoodsKindCode, DeliveryTime, DeliveryTimeEND, AdditionalSheetCount, QuantityFact, OilField, TNVEDContract, IPObjectRegistryNum, CUESADDeliveryTerms, ForeignTradeContractDetails, GoodsGroupDescription, Preferencii, CIMIdDetails, DTIdentificationMeansDetails, GoodsTraceabilityMeasureDetails, WoodCodeDetails, GoodsSTZ, extensiontype_,  **kwargs_)
supermod.CUESADGoodsItemType.subclass = CUESADGoodsItemTypeSub
# end class CUESADGoodsItemTypeSub


class OrganizationBackAddrTypeSub(supermod.OrganizationBackAddrType):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, OKPOID=None, OKATOCode=None, Address=None, Contact=None, FactAddress=None, **kwargs_):
        super(OrganizationBackAddrTypeSub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, OKPOID, OKATOCode, Address, Contact, FactAddress,  **kwargs_)
supermod.OrganizationBackAddrType.subclass = OrganizationBackAddrTypeSub
# end class OrganizationBackAddrTypeSub


class DriverInformationTypeSub(supermod.DriverInformationType):
    def __init__(self, PersonSurname=None, PersonName=None, PersonMiddleName=None, PersonPost=None, RegCountryCode=None, IdentityCard=None, **kwargs_):
        super(DriverInformationTypeSub, self).__init__(PersonSurname, PersonName, PersonMiddleName, PersonPost, RegCountryCode, IdentityCard,  **kwargs_)
supermod.DriverInformationType.subclass = DriverInformationTypeSub
# end class DriverInformationTypeSub


class CUOrganizationTypeSub(supermod.CUOrganizationType):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, Address=None, IdentityCard=None, Contact=None, **kwargs_):
        super(CUOrganizationTypeSub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, Address, IdentityCard, Contact,  **kwargs_)
supermod.CUOrganizationType.subclass = CUOrganizationTypeSub
# end class CUOrganizationTypeSub


class CUCustomsTypeSub(supermod.CUCustomsType):
    def __init__(self, Code=None, OfficeName=None, CustomsCountryCode=None, **kwargs_):
        super(CUCustomsTypeSub, self).__init__(Code, OfficeName, CustomsCountryCode,  **kwargs_)
supermod.CUCustomsType.subclass = CUCustomsTypeSub
# end class CUCustomsTypeSub


class AuthoritesDocumentTypeSub(supermod.AuthoritesDocumentType):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, ComplationAuthorityDate=None, extensiontype_=None, **kwargs_):
        super(AuthoritesDocumentTypeSub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate, ComplationAuthorityDate, extensiontype_,  **kwargs_)
supermod.AuthoritesDocumentType.subclass = AuthoritesDocumentTypeSub
# end class AuthoritesDocumentTypeSub


class RBTechMarKTypeSub(supermod.RBTechMarKType):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, DelcKind=None, SumPayment=None, DocumentModeCode=None, **kwargs_):
        super(RBTechMarKTypeSub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate, DelcKind, SumPayment, DocumentModeCode,  **kwargs_)
supermod.RBTechMarKType.subclass = RBTechMarKTypeSub
# end class RBTechMarKTypeSub


class PaymentDocumentType30Sub(supermod.PaymentDocumentType30):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, PaymentDate=None, DocumentModeCode=None, **kwargs_):
        super(PaymentDocumentType30Sub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate, PaymentDate, DocumentModeCode,  **kwargs_)
supermod.PaymentDocumentType30.subclass = PaymentDocumentType30Sub
# end class PaymentDocumentType30Sub


class ESADout_CUMainContractTermsTypeSub(supermod.ESADout_CUMainContractTermsType):
    def __init__(self, ContractCurrencyCode=None, CurrencyQuantity=None, ContractCurrencyRate=None, TotalInvoiceAmount=None, TotalAmount=None, TradeCountryCode=None, RBCountryCode=None, DealFeatureCode=None, DealNatureCode=None, CUESADDeliveryTerms=None, **kwargs_):
        super(ESADout_CUMainContractTermsTypeSub, self).__init__(ContractCurrencyCode, CurrencyQuantity, ContractCurrencyRate, TotalInvoiceAmount, TotalAmount, TradeCountryCode, RBCountryCode, DealFeatureCode, DealNatureCode, CUESADDeliveryTerms,  **kwargs_)
supermod.ESADout_CUMainContractTermsType.subclass = ESADout_CUMainContractTermsTypeSub
# end class ESADout_CUMainContractTermsTypeSub


class ESADout_CUGoodsTypeSub(supermod.ESADout_CUGoodsType):
    def __init__(self, GoodsNumeric=None, GoodFeatures=None, GoodsDescription=None, GrossWeightQuantity=None, NetWeightQuantity=None, NetWeightQuantity2=None, InvoicedCost=None, InvoicedCurrencyCode=None, InvoicedCurrencyQuantity=None, InvoicedCurrencyRate=None, InvoicedCurrencyDate=None, CustomsCost=None, StatisticalCost=None, TotalStatisticValueAmount=None, GoodsTNVEDCode=None, GoodsClassificationCode=None, AdditionalSign=None, IntellectPropertySign=None, GoodsTraceabilityCode=None, CIMSign=None, RestrictionSign=None, BeginPeriodDate=None, EndPeriodDate=None, OriginCountryCode=None, OriginCountryName=None, RBOriginCountryCode=None, PrefOriginCountry=None, CustomsCostCorrectMethod=None, GoodsAddTNVEDCode=None, LicenseGoodsKindCode=None, DeliveryTime=None, DeliveryTimeEND=None, AdditionalSheetCount=None, QuantityFact=None, OilField=None, TNVEDContract=None, IPObjectRegistryNum=None, CUESADDeliveryTerms=None, ForeignTradeContractDetails=None, GoodsGroupDescription=None, Preferencii=None, CIMIdDetails=None, DTIdentificationMeansDetails=None, GoodsTraceabilityMeasureDetails=None, WoodCodeDetails=None, GoodsSTZ=None, LanguageGoods=None, MilitaryProducts=None, CurrencyCode=None, ESADout_CUPresentedDocument=None, ESADout_CUPrecedingDocument=None, ESADout_CUCustomsPaymentCalculation=None, ESADout_CUCustomsConditions=None, SupplementaryGoodsQuantity=None, SupplementaryGoodsQuantity1=None, ESADGoodsPackaging=None, ESADGoodsQuota=None, ESADContainer=None, ESADCustomsProcedure=None, ESADExcise=None, ElectricalEnergReceived=None, ElectricalEnergGiven=None, GoodsAutomobile=None, RBSupplementaryGoodsQuantity=None, TotalGrossMassMeasure=None, TotalNetMassMeasure=None, InvestmentGoodsIdDetails=None, DestinationCountryDetails=None, **kwargs_):
        super(ESADout_CUGoodsTypeSub, self).__init__(GoodsNumeric, GoodFeatures, GoodsDescription, GrossWeightQuantity, NetWeightQuantity, NetWeightQuantity2, InvoicedCost, InvoicedCurrencyCode, InvoicedCurrencyQuantity, InvoicedCurrencyRate, InvoicedCurrencyDate, CustomsCost, StatisticalCost, TotalStatisticValueAmount, GoodsTNVEDCode, GoodsClassificationCode, AdditionalSign, IntellectPropertySign, GoodsTraceabilityCode, CIMSign, RestrictionSign, BeginPeriodDate, EndPeriodDate, OriginCountryCode, OriginCountryName, RBOriginCountryCode, PrefOriginCountry, CustomsCostCorrectMethod, GoodsAddTNVEDCode, LicenseGoodsKindCode, DeliveryTime, DeliveryTimeEND, AdditionalSheetCount, QuantityFact, OilField, TNVEDContract, IPObjectRegistryNum, CUESADDeliveryTerms, ForeignTradeContractDetails, GoodsGroupDescription, Preferencii, CIMIdDetails, DTIdentificationMeansDetails, GoodsTraceabilityMeasureDetails, WoodCodeDetails, GoodsSTZ, LanguageGoods, MilitaryProducts, CurrencyCode, ESADout_CUPresentedDocument, ESADout_CUPrecedingDocument, ESADout_CUCustomsPaymentCalculation, ESADout_CUCustomsConditions, SupplementaryGoodsQuantity, SupplementaryGoodsQuantity1, ESADGoodsPackaging, ESADGoodsQuota, ESADContainer, ESADCustomsProcedure, ESADExcise, ElectricalEnergReceived, ElectricalEnergGiven, GoodsAutomobile, RBSupplementaryGoodsQuantity, TotalGrossMassMeasure, TotalNetMassMeasure, InvestmentGoodsIdDetails, DestinationCountryDetails,  **kwargs_)
supermod.ESADout_CUGoodsType.subclass = ESADout_CUGoodsTypeSub
# end class ESADout_CUGoodsTypeSub


class ESADout_CUGoodsShipmentTypeSub(supermod.ESADout_CUGoodsShipmentType):
    def __init__(self, OriginCountryName=None, OriginCountryCode=None, RBOriginCountryCode=None, SpecificationNumber=None, SpecificationListNumber=None, TotalGoodsNumber=None, TotalPackageNumber=None, TotalSheetNumber=None, TotalCustCost=None, TotalCustomsValueAmount=None, CustCostCurrencyCode=None, ESADout_CUConsignor=None, ESADout_CUConsignee=None, ESADout_CUFinancialAdjustingResponsiblePerson=None, ESADout_CUDeclarant=None, ESADout_CUCarrier=None, ESADout_CUGoodsLocation=None, ESADout_CUConsigment=None, ESADout_CUMainContractTerms=None, ESADout_CUGoods=None, ESADout_CUPayments=None, Guarantee=None, TDGuarantee=None, **kwargs_):
        super(ESADout_CUGoodsShipmentTypeSub, self).__init__(OriginCountryName, OriginCountryCode, RBOriginCountryCode, SpecificationNumber, SpecificationListNumber, TotalGoodsNumber, TotalPackageNumber, TotalSheetNumber, TotalCustCost, TotalCustomsValueAmount, CustCostCurrencyCode, ESADout_CUConsignor, ESADout_CUConsignee, ESADout_CUFinancialAdjustingResponsiblePerson, ESADout_CUDeclarant, ESADout_CUCarrier, ESADout_CUGoodsLocation, ESADout_CUConsigment, ESADout_CUMainContractTerms, ESADout_CUGoods, ESADout_CUPayments, Guarantee, TDGuarantee,  **kwargs_)
supermod.ESADout_CUGoodsShipmentType.subclass = ESADout_CUGoodsShipmentTypeSub
# end class ESADout_CUGoodsShipmentTypeSub


class ESADout_CUFinancialAdjustingResponsiblePersonTypeSub(supermod.ESADout_CUFinancialAdjustingResponsiblePersonType):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, CountryA2Code=None, BusinessEntityTypeCode=None, BusinessEntityTypeName=None, UITN=None, PersonId=None, IdentityCard=None, SubjectAddressDetails=None, CommunicationDetails=None, SubjectBranch=None, DeclarantEqualFlag=None, **kwargs_):
        super(ESADout_CUFinancialAdjustingResponsiblePersonTypeSub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, CountryA2Code, BusinessEntityTypeCode, BusinessEntityTypeName, UITN, PersonId, IdentityCard, SubjectAddressDetails, CommunicationDetails, SubjectBranch, DeclarantEqualFlag,  **kwargs_)
supermod.ESADout_CUFinancialAdjustingResponsiblePersonType.subclass = ESADout_CUFinancialAdjustingResponsiblePersonTypeSub
# end class ESADout_CUFinancialAdjustingResponsiblePersonTypeSub


class ESADout_CUDepartureArrivalTransportTypeSub(supermod.ESADout_CUDepartureArrivalTransportType):
    def __init__(self, TransportModeCode=None, TransportNationalityCode=None, TransportMeansQuantity=None, MethodTransport=None, NameObject=None, RUTransportMeans=None, **kwargs_):
        super(ESADout_CUDepartureArrivalTransportTypeSub, self).__init__(TransportModeCode, TransportNationalityCode, TransportMeansQuantity, MethodTransport, NameObject, RUTransportMeans,  **kwargs_)
supermod.ESADout_CUDepartureArrivalTransportType.subclass = ESADout_CUDepartureArrivalTransportTypeSub
# end class ESADout_CUDepartureArrivalTransportTypeSub


class ESADout_CUConsigmentTypeSub(supermod.ESADout_CUConsigmentType):
    def __init__(self, ContainerIndicator=None, DispatchCountryCode=None, RBDispatchCountryCode=None, DispatchCountryName=None, DestinationCountryCode=None, DestinationCountryName=None, RBDestinationCountryCode=None, BorderCustomsOffice=None, ESADout_CUDepartureArrivalTransport=None, ESADout_CUBorderTransport=None, ESADout_CUReloadingInfo=None, DateExpectedArrival=None, TimeExpectedArrival=None, PPBorderCustoms=None, TDDeliveryPlace=None, **kwargs_):
        super(ESADout_CUConsigmentTypeSub, self).__init__(ContainerIndicator, DispatchCountryCode, RBDispatchCountryCode, DispatchCountryName, DestinationCountryCode, DestinationCountryName, RBDestinationCountryCode, BorderCustomsOffice, ESADout_CUDepartureArrivalTransport, ESADout_CUBorderTransport, ESADout_CUReloadingInfo, DateExpectedArrival, TimeExpectedArrival, PPBorderCustoms, TDDeliveryPlace,  **kwargs_)
supermod.ESADout_CUConsigmentType.subclass = ESADout_CUConsigmentTypeSub
# end class ESADout_CUConsigmentTypeSub


class ESADout_CUCarrierTypeSub(supermod.ESADout_CUCarrierType):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, CountryA2Code=None, BusinessEntityTypeCode=None, BusinessEntityTypeName=None, UITN=None, PersonId=None, IdentityCard=None, SubjectAddressDetails=None, CommunicationDetails=None, ESADout_CUDriverInformation=None, **kwargs_):
        super(ESADout_CUCarrierTypeSub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, CountryA2Code, BusinessEntityTypeCode, BusinessEntityTypeName, UITN, PersonId, IdentityCard, SubjectAddressDetails, CommunicationDetails, ESADout_CUDriverInformation,  **kwargs_)
supermod.ESADout_CUCarrierType.subclass = ESADout_CUCarrierTypeSub
# end class ESADout_CUCarrierTypeSub


class ESADout_CUBorderTransportTypeSub(supermod.ESADout_CUBorderTransportType):
    def __init__(self, TransportModeCode=None, TransportNationalityCode=None, TransportMeansQuantity=None, MethodTransport=None, NameObject=None, RUTransportMeans=None, **kwargs_):
        super(ESADout_CUBorderTransportTypeSub, self).__init__(TransportModeCode, TransportNationalityCode, TransportMeansQuantity, MethodTransport, NameObject, RUTransportMeans,  **kwargs_)
supermod.ESADout_CUBorderTransportType.subclass = ESADout_CUBorderTransportTypeSub
# end class ESADout_CUBorderTransportTypeSub


class CustomsPaymentTypeSub(supermod.CustomsPaymentType):
    def __init__(self, PaymentModeCode=None, PaymentAmount=None, PaymentCurrencyCode=None, CurrencyRate=None, PaymentWayCode=None, PaymentDocument=None, UITN=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, PersonId=None, IdentityCard=None, **kwargs_):
        super(CustomsPaymentTypeSub, self).__init__(PaymentModeCode, PaymentAmount, PaymentCurrencyCode, CurrencyRate, PaymentWayCode, PaymentDocument, UITN, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, PersonId, IdentityCard,  **kwargs_)
supermod.CustomsPaymentType.subclass = CustomsPaymentTypeSub
# end class CustomsPaymentTypeSub


class CUWarehousePlaceType29Sub(supermod.CUWarehousePlaceType29):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, PresentedDocumentModeCode=None, DocStartDate=None, DocValidityDate=None, **kwargs_):
        super(CUWarehousePlaceType29Sub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate, PresentedDocumentModeCode, DocStartDate, DocValidityDate,  **kwargs_)
supermod.CUWarehousePlaceType29.subclass = CUWarehousePlaceType29Sub
# end class CUWarehousePlaceType29Sub


class ESADout_CUTypeSub(supermod.ESADout_CUType):
    def __init__(self, DocumentID=None, RefDocumentID=None, INNSign=None, MCD_ID=None, DocumentModeID='1006107E', EECEDocHeaderAddInfo=None, CustomsProcedure=None, CustomsModeCode=None, TransitFeature=None, TransitDirectionCode=None, ElectronicDocumentSign=None, DocUsageCode=None, DeclarationKind=None, SubsoilSign=None, SealNumber=None, SealQuantity=None, SealId=None, SealDescriptionText=None, RecipientCountryCode=None, MovementCode=None, ExecutionPlace=None, RailwayStationCode=None, RailwayStampDate=None, RegNumberDoc=None, SecurityLabelCode=None, ESADout_CUGoodsShipment=None, RBTechMarK=None, FilledPerson=None, SignCertifPerson=None, CUESADCustomsRepresentative=None, **kwargs_):
        super(ESADout_CUTypeSub, self).__init__(DocumentID, RefDocumentID, INNSign, MCD_ID, DocumentModeID, EECEDocHeaderAddInfo, CustomsProcedure, CustomsModeCode, TransitFeature, TransitDirectionCode, ElectronicDocumentSign, DocUsageCode, DeclarationKind, SubsoilSign, SealNumber, SealQuantity, SealId, SealDescriptionText, RecipientCountryCode, MovementCode, ExecutionPlace, RailwayStationCode, RailwayStampDate, RegNumberDoc, SecurityLabelCode, ESADout_CUGoodsShipment, RBTechMarK, FilledPerson, SignCertifPerson, CUESADCustomsRepresentative,  **kwargs_)
supermod.ESADout_CUType.subclass = ESADout_CUTypeSub
# end class ESADout_CUTypeSub


class GoodsShipmentSubjectDetailsTypeSub(supermod.GoodsShipmentSubjectDetailsType):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, CountryA2Code=None, BusinessEntityTypeCode=None, BusinessEntityTypeName=None, UITN=None, PersonId=None, IdentityCard=None, SubjectAddressDetails=None, CommunicationDetails=None, SubjectBranch=None, AEORegistryIdDetails=None, EqualIndicator=None, ExchangePostOfficeCode=None, SubjectAdditionalCode=None, **kwargs_):
        super(GoodsShipmentSubjectDetailsTypeSub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, CountryA2Code, BusinessEntityTypeCode, BusinessEntityTypeName, UITN, PersonId, IdentityCard, SubjectAddressDetails, CommunicationDetails, SubjectBranch, AEORegistryIdDetails, EqualIndicator, ExchangePostOfficeCode, SubjectAdditionalCode,  **kwargs_)
supermod.GoodsShipmentSubjectDetailsType.subclass = GoodsShipmentSubjectDetailsTypeSub
# end class GoodsShipmentSubjectDetailsTypeSub


class DeclarantDetailsTypeSub(supermod.DeclarantDetailsType):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, CountryA2Code=None, BusinessEntityTypeCode=None, BusinessEntityTypeName=None, UITN=None, PersonId=None, IdentityCard=None, SubjectAddressDetails=None, CommunicationDetails=None, SubjectBranch=None, RegisterDocumentIdDetails=None, **kwargs_):
        super(DeclarantDetailsTypeSub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, CountryA2Code, BusinessEntityTypeCode, BusinessEntityTypeName, UITN, PersonId, IdentityCard, SubjectAddressDetails, CommunicationDetails, SubjectBranch, RegisterDocumentIdDetails,  **kwargs_)
supermod.DeclarantDetailsType.subclass = DeclarantDetailsTypeSub
# end class DeclarantDetailsTypeSub


class AEODeclarantDetailsTypeSub(supermod.AEODeclarantDetailsType):
    def __init__(self, OrganizationName=None, ShortName=None, OrganizationLanguage=None, RFOrganizationFeatures=None, RKOrganizationFeatures=None, RBOrganizationFeatures=None, RAOrganizationFeatures=None, KGOrganizationFeatures=None, CountryA2Code=None, BusinessEntityTypeCode=None, BusinessEntityTypeName=None, UITN=None, PersonId=None, IdentityCard=None, SubjectAddressDetails=None, CommunicationDetails=None, SubjectBranch=None, AEORegistryIdDetails=None, **kwargs_):
        super(AEODeclarantDetailsTypeSub, self).__init__(OrganizationName, ShortName, OrganizationLanguage, RFOrganizationFeatures, RKOrganizationFeatures, RBOrganizationFeatures, RAOrganizationFeatures, KGOrganizationFeatures, CountryA2Code, BusinessEntityTypeCode, BusinessEntityTypeName, UITN, PersonId, IdentityCard, SubjectAddressDetails, CommunicationDetails, SubjectBranch, AEORegistryIdDetails,  **kwargs_)
supermod.AEODeclarantDetailsType.subclass = AEODeclarantDetailsTypeSub
# end class AEODeclarantDetailsTypeSub


class FilledPersonAuthDocTypeSub(supermod.FilledPersonAuthDocType):
    def __init__(self, PrDocumentName=None, PrDocumentNumber=None, PrDocumentDate=None, ComplationAuthorityDate=None, PresentedDocumentModeCode=None, ProvidingIndicationMark=None, RFPresentedDocID=None, **kwargs_):
        super(FilledPersonAuthDocTypeSub, self).__init__(PrDocumentName, PrDocumentNumber, PrDocumentDate, ComplationAuthorityDate, PresentedDocumentModeCode, ProvidingIndicationMark, RFPresentedDocID,  **kwargs_)
supermod.FilledPersonAuthDocType.subclass = FilledPersonAuthDocTypeSub
# end class FilledPersonAuthDocTypeSub


def get_root_tag(node):
    tag = supermod.Tag_pattern_.match(node.tag).groups()[-1]
    rootClass = None
    rootClass = supermod.GDSClassesMapping.get(tag)
    if rootClass is None and hasattr(supermod, tag):
        rootClass = getattr(supermod, tag)
    return tag, rootClass


def parse(inFilename, silence=False):
    parser = None
    doc = parsexml_(inFilename, parser)
    rootNode = doc.getroot()
    rootTag, rootClass = get_root_tag(rootNode)
    if rootClass is None:
        rootTag = 'ESADout_CUType'
        rootClass = supermod.ESADout_CUType
    rootObj = rootClass.factory()
    rootObj.build(rootNode)
    # Enable Python to collect the space used by the DOM.
    if not SaveElementTreeNode:
        doc = None
        rootNode = None
    if not silence:
        sys.stdout.write('<?xml version="1.0" ?>\n')
        rootObj.export(
            sys.stdout, 0, name_=rootTag,
            namespacedef_='xmlns:ESADout_CU="urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0"',
            pretty_print=True)
    return rootObj


def parseEtree(inFilename, silence=False):
    parser = None
    doc = parsexml_(inFilename, parser)
    rootNode = doc.getroot()
    rootTag, rootClass = get_root_tag(rootNode)
    if rootClass is None:
        rootTag = 'ESADout_CUType'
        rootClass = supermod.ESADout_CUType
    rootObj = rootClass.factory()
    rootObj.build(rootNode)
    mapping = {}
    rootElement = rootObj.to_etree(None, name_=rootTag, mapping_=mapping)
    reverse_mapping = rootObj.gds_reverse_node_mapping(mapping)
    # Enable Python to collect the space used by the DOM.
    if not SaveElementTreeNode:
        doc = None
        rootNode = None
    if not silence:
        content = etree_.tostring(
            rootElement, pretty_print=True,
            xml_declaration=True, encoding="utf-8")
        sys.stdout.write(content)
        sys.stdout.write('\n')
    return rootObj, rootElement, mapping, reverse_mapping


def parseString(inString, silence=False):
    if sys.version_info.major == 2:
        from StringIO import StringIO
    else:
        from io import BytesIO as StringIO
    parser = None
    rootNode= parsexmlstring_(inString, parser)
    rootTag, rootClass = get_root_tag(rootNode)
    if rootClass is None:
        rootTag = 'ESADout_CUType'
        rootClass = supermod.ESADout_CUType
    rootObj = rootClass.factory()
    rootObj.build(rootNode)
    # Enable Python to collect the space used by the DOM.
    if not SaveElementTreeNode:
        rootNode = None
    if not silence:
        sys.stdout.write('<?xml version="1.0" ?>\n')
        rootObj.export(
            sys.stdout, 0, name_=rootTag,
            namespacedef_='xmlns:ESADout_CU="urn:customs.ru:Information:CustomsDocuments:ESADout_CU:5.23.0"')
    return rootObj


def parseLiteral(inFilename, silence=False):
    parser = None
    doc = parsexml_(inFilename, parser)
    rootNode = doc.getroot()
    rootTag, rootClass = get_root_tag(rootNode)
    if rootClass is None:
        rootTag = 'ESADout_CUType'
        rootClass = supermod.ESADout_CUType
    rootObj = rootClass.factory()
    rootObj.build(rootNode)
    # Enable Python to collect the space used by the DOM.
    if not SaveElementTreeNode:
        doc = None
        rootNode = None
    if not silence:
        sys.stdout.write('#from ??? import *\n\n')
        sys.stdout.write('import ??? as model_\n\n')
        sys.stdout.write('rootObj = model_.rootClass(\n')
        rootObj.exportLiteral(sys.stdout, 0, name_=rootTag)
        sys.stdout.write(')\n')
    return rootObj


USAGE_TEXT = """
Usage: python ???.py <infilename>
"""


def usage():
    print(USAGE_TEXT)
    sys.exit(1)


def main():
    args = sys.argv[1:]
    if len(args) != 1:
        usage()
    infilename = args[0]
    parse(infilename)


if __name__ == '__main__':
    #import pdb; pdb.set_trace()
    main()
