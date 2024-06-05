<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:wbei="urn:customs.ru:Information:CommercialFinanceDocuments:WayBillExpressIndividual:5.22.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="."/>
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()"/>
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath"/>
	</xsl:template>
	<xsl:template match="//*[local-name()='WayBillExpressIndividual']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="Date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="Date">
				<xsl:with-param name="text" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="/">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Индивидуальная накладная при экспресс перевозке</title>
				<style type="text/css">
                    body {
                        text-align: center;
                        background: #cccccc;
                    }

                    div.pagePortrait {
                        width: 210mm;
                        margin-top: 10pt;
                        margin-bottom: 10pt;
                        margin-left: auto;
                        margin-right: auto;
                        padding: 10mm;
                        padding-left: 10mm;
                        background: #ffffff;
                        border: solid .5pt #000000;
                        text-align: left;
                    }

                    div.pageAlbum {
                        width: 297mm;
                        margin-top: 10pt;
                        margin-bottom: 10pt;
                        margin-left: auto;
                        margin-right: auto;
                        padding: 10mm;
                        padding-left: 10mm;
                        background: #ffffff;
                        border: solid .5pt #000000;
                        text-align: left;
                    }

                    table.items {
                        border: 1px;
                        border-collapse: collapse;
                        emptyCells: show;
                        font-family: Arial;
                        font-size: 8pt;
                    }

                    .items th {
                        background: #F0F0F0;
                        vertical-align: middle;
                        font-weight: bold;
                        border: solid 1px black;
                        padding: 3px;
                        vertical-align: top;
                    }

                    .items td {
                        border: solid 1px black;
                        padding: 3px;
                        vertical-align: top;
                        text-align: right;
                    }

                    .items td.blank {
                        border: solid 1px black;
                        width: 4pt;
                    }

                    .items td.grey {
                        border: solid 1px black;
                        background: #F0F0F0;
                        border-right: 1px solid black;
                    }

                    h2 {
                        text-align: center;
                    }

                    h3 {
                        text-align: center;
                    }

                    h4 {
                        text-align: center;
                    }

                    .bold {
                        font-weight: bold;
                    }

                    .bold2 {
                        font-weight: bold;
                    }

                    table {
                        border: none;
                        vertical-align: top;
                    }

                    td {
                        vertical-align: top;
                    }

                    td.graphUnderline {
                        border-bottom: 1px solid black;
                        text-align: center;
                        height: 16pt;
                    }

                    td.graph {
                        font-size: 8pt;
                        text-align: center;
                        padding: 0;
                        spacing: 0;
                        white-space: normal;
                    }

                    td.graphBefore {
                        text-align: right;
                        white-space: nowrap;
                        padding-right: 5pt;
                    }

                    hr {
                        border: none;
                        background-color: black;
                        height: 1px;
                    }

                    span.underline {
                        text-decoration: underline;
                    }
                    @media print {
                        div.pageAlbum {
                            border: none;
                        }
                    }
                </style>
			</head>
			<body>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>
	<!--Обработка корневого элемента-->
	<xsl:template match="wbei:WayBillExpressIndividual">
		<div class="pageAlbum">
			<h3>Индивидуальная накладная при экспресс перевозке</h3>
			<table style="width: 100%;">
				<tr>
					<td class="graphUnderline">
						<xsl:apply-templates select="wbei:WayBillNumber"/>
					</td>
				</tr>
				<tr>
					<td class="graph">Номер индивидуальной накладной</td>
				</tr>
				<tr>
					<td class="graphUnderline">
						<xsl:apply-templates select="wbei:MailStickerNumber"/>
					</td>
					<td/>
					<td class="graphUnderline">
						<xsl:apply-templates select="wbei:ShipmentType"/>
					</td>
				</tr>
				<tr>
					<td class="graph">Номер наклейки для разового отправления с оплатой получателя</td>
					<td/>
					<td class="graph">Тип перевозки</td>
				</tr>
				<tr>
					<td class="graphUnderline">
						<xsl:apply-templates select="wbei:Services"/>
					</td>
					<td/>
					<td class="graphUnderline">
						<xsl:apply-templates select="wbei:CustomsModeCode"/>
					</td>
				</tr>
				<tr>
					<td class="graph">Информация об услугах</td>
					<td/>
					<td class="graph">Код таможенного режима</td>
				</tr>
				<tr>
					<td class="graphUnderline">
						<xsl:apply-templates select="wbei:SpecialServices"/>
					</td>
					<td/>
					<td class="graphUnderline">
						<xsl:variable name="xpath_InternationalDistribution">
							<xsl:call-template name="get_xpath">
								<xsl:with-param name="node" select="wbei:InternationalDistribution"/>
							</xsl:call-template>
						</xsl:variable>
						<element xml_node="{$xpath_InternationalDistribution}">
							<xsl:choose>
								<xsl:when test="wbei:InternationalDistribution = '0' or wbei:InternationalDistribution='f' or wbei:InternationalDistribution='false'">не используется</xsl:when>
								<xsl:when test="wbei:InternationalDistribution = '1' or wbei:InternationalDistribution='t' or wbei:InternationalDistribution='true'">используется</xsl:when>
								<xsl:otherwise>ошибка</xsl:otherwise>
							</xsl:choose>
						</element>
					</td>
				</tr>
				<tr>
					<td class="graph">Информация о специальных услугах</td>
					<td/>
					<td class="graph">Международная рассылка</td>
				</tr>
				<tr>
					<td class="graphUnderline">нетто: <xsl:apply-templates select="wbei:NetWeightTotal"/>, брутто:
                        <xsl:apply-templates select="wbei:GrossWeightTotal"/>
					</td>
					<td/>
					<td class="graphUnderline">
						<xsl:apply-templates select="wbei:CurrencyCode"/>
					</td>
				</tr>
				<tr>
					<td class="graph">Суммарный вес товаров, кг</td>
					<td/>
					<td class="graph">Код валюты (для стоимости в этом документе)</td>
				</tr>
			</table>
			<h4>Информация об отправителе и получателе</h4>
			<table style="width: 100%;">
				<tr>
					<td width="46%">
						<span class="bold">Отправитель:</span>
						<p/>
						<xsl:apply-templates select="wbei:Sender"/>
					</td>
					<td width="8%"/>
					<td width="46%">
						<span class="bold">Получатель:</span>
						<p/>
						<table style="width: 100%;">
							<xsl:apply-templates select="wbei:Receiver"/>
						</table>
					</td>
				</tr>
				<tr>
					<td width="46%">
						<span class="bold">Пункт отправления:</span>
						<p/>
						<xsl:call-template name="PointerType">
							<xsl:with-param name="base" select="wbei:DeparturePoint"/>
						</xsl:call-template>
					</td>
					<td width="8%"/>
					<td width="46%">
						<span class="bold">Пункт назначения:</span>
						<p/>
						<xsl:call-template name="PointerType">
							<xsl:with-param name="base" select="wbei:DeliveryPoint"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
			<h4>Информация о перевозчике и страховщике</h4>
			<table style="width: 100%;">
				<tr>
					<td width="46%">
						<span class="bold">Перевозчик:</span>
						<p/>
						<xsl:apply-templates select="wbei:Carrier"/>
					</td>
					<td width="8%"/>
					<td width="46%">
						<span class="bold">Страховщик:</span>
						<p/>
						<xsl:apply-templates select="wbei:Insurance"/>
					</td>
				</tr>
			</table>
			<h4>Информация о товарах</h4>
			<xsl:apply-templates select="wbei:Goods"/>
			<table style="width: 100%;">
				<tr>
					<td class="graphUnderline" width="46%">
						<xsl:call-template name="signature">
							<xsl:with-param name="base" select="wbei:Sender/wbei:Signature"/>
						</xsl:call-template>
					</td>
					<td width="8%"/>
					<td class="graphUnderline" width="46%">
						<xsl:apply-templates select="wbei:WayBillAccepted/wbei:PersonName"/>
					</td>
				</tr>
				<tr>
					<td class="graph">Отправлена</td>
					<td/>
					<td class="graph">Принята</td>
				</tr>
				<tr>
					<td class="graphUnderline">
						<xsl:apply-templates select="wbei:Sender/wbei:Signature/cat_ru:IssueDate" mode="Date"/>
					</td>
					<td/>
					<td class="graphUnderline">
						<xsl:apply-templates select="wbei:WayBillAccepted/wbei:DateTime" mode="Date"/>
					</td>
				</tr>
				<tr>
					<td class="graph">Дата</td>
					<td/>
					<td class="graph">Дата</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Таможенная стоимость -->
	<xsl:template match="wbei:CustomsPayment">
		<xsl:text>вид пл.: </xsl:text>
		<xsl:apply-templates select="wbei:PaymentModeCode"/>
		<xsl:text>, основа нач.: </xsl:text>
		<xsl:apply-templates select="wbei:TaxBase"/>
		<xsl:text>, сумма: </xsl:text>
		<xsl:apply-templates select="wbei:PaymentAmount"/>
	</xsl:template>
	<!-- товары -->
	<xsl:template match="wbei:Goods">
		<table class="items" width="100%">
			<tr>
				<th colspan="2">Получатель по общей накладной</th>
				<th>Номер общей накладной</th>
				<th>Наименование</th>
				<th>Код товара по ТН ВЭД ЕАЭС</th>
				<th>Сведения об упаковке товара</th>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<xsl:call-template name="OrganizationPlain">
						<xsl:with-param name="base" select="wbei:ReceiverByCommonWayBill"/>
					</xsl:call-template>
				</td>
				<td>
					<xsl:apply-templates select="wbei:CommonWayBillNumber"/>
				</td>
				<td align="center">
					<xsl:apply-templates select="wbei:Name"/>
				</td>
				<td>
					<xsl:apply-templates select="wbei:TNVED"/>
				</td>
				<td>
					<xsl:apply-templates select="wbei:Packaging"/>
				</td>
			</tr>
			<tr>
				<th width="15%">Габариты товара, <xsl:apply-templates select="wbei:Dimensions/cat_ru:DimensionsCode"/>
				</th>
				<th width="15%">Вес товара нетто, кг</th>
				<th width="15%">Вес товара брутто, кг</th>
				<th width="15%">Стоимость</th>
				<th width="15%">Таможенная стоимость</th>
				<th width="15%">Таможенные платежи</th>
			</tr>
			<tr>
				<td>
					<xsl:apply-templates select="wbei:Dimensions"/>
				</td>
				<td>
					<xsl:apply-templates select="wbei:NetWeight"/>
				</td>
				<td>
					<xsl:apply-templates select="wbei:GrossWeight"/>
				</td>
				<td>
					<xsl:apply-templates select="wbei:InvoicedCost"/>
				</td>
				<td>
					<xsl:apply-templates select="wbei:CustomsCost"/>
				</td>
				<td>
					<xsl:apply-templates select="wbei:CustomsPayment"/>
				</td>
			</tr>
		</table>
		<br/>
	</xsl:template>
	<xsl:template name="Date">
		<xsl:param name="text"/>
		<xsl:choose>
			<xsl:when test="substring($text, 5, 1) = '-' and substring($text, 8, 1) = '-'">
				<xsl:value-of select="substring($text,9,2)"/>.<xsl:value-of select="substring($text,6,2)"/>.<xsl:value-of select="substring($text,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--Организация plain -->
	<xsl:template name="OrganizationPlain">
		<xsl:param name="base"/>
		<xsl:apply-templates select="$base/cat_ru:OrganizationName"/>
		<xsl:if test="$base/cat_ru:ShortName">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="$base/cat_ru:ShortName"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
			<span class="bold"> ОГРН/ОГРНИП:</span>
			<xsl:apply-templates select="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN">
			<span class="bold"> ИНН:</span>
			<xsl:apply-templates select="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
			<span class="bold"> КПП:</span>
			<xsl:apply-templates select="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!--Данные об отправителе -->
	<xsl:template match="wbei:Sender">
		<table style="width: 100%;">
			<xsl:apply-templates select="wbei:Organisation"/>
			<xsl:apply-templates select="wbei:Address"/>
			<xsl:apply-templates select="wbei:Account"/>
			<tr>
				<td class="graphUnderline">
					<xsl:apply-templates select="wbei:Notes"/>
				</td>
			</tr>
			<tr>
				<td class="graph">Особые отметки</td>
			</tr>
		</table>
	</xsl:template>
	<!--Данные о страховщике -->
	<xsl:template match="wbei:Insurance">
		<table style="width: 100%;">
			<xsl:call-template name="Organization">
				<xsl:with-param name="base" select="wbei:InsuanceCompany"/>
			</xsl:call-template>
			<xsl:apply-templates select="wbei:Account"/>
			<tr>
				<td class="graphUnderline">
					<xsl:apply-templates select="wbei:Amount"/>
				</td>
			</tr>
			<tr>
				<td class="graph">Сумма страховки</td>
			</tr>
			<tr>
				<td class="graphUnderline">
					<xsl:variable name="xpath_PaymentType">
						<xsl:call-template name="get_xpath">
							<xsl:with-param name="node" select="wbei:PaymentType"/>
						</xsl:call-template>
					</xsl:variable>
					<element xml_node="{$xpath_PaymentType}">
						<xsl:choose>
							<xsl:when test="wbei:PaymentType = 1">наличные</xsl:when>
							<xsl:when test="wbei:PaymentType = 2">чек</xsl:when>
							<xsl:when test="wbei:PaymentType = 3">кредитная карта</xsl:when>
							<xsl:otherwise>ошибка</xsl:otherwise>
						</xsl:choose>
					</element>
				</td>
			</tr>
			<tr>
				<td class="graph">Вид оплаты</td>
			</tr>
		</table>
	</xsl:template>
	<!--Пункт отправления -->
	<xsl:template name="PointerType">
		<xsl:param name="base"/>
		<table width="100%">
			<tr>
				<td class="graphUnderline">
					<xsl:apply-templates select="$base/wbei:Name"/>
				</td>
			</tr>
			<tr>
				<td class="graph">Наименование</td>
			</tr>
			<xsl:if test="$base/wbei:IATACode">
				<tr>
					<td class="graphUnderline">
						<xsl:apply-templates select="$base/wbei:IATACode"/>
					</td>
				</tr>
				<tr>
					<td class="graph">Код ИАТА</td>
				</tr>
			</xsl:if>
			<xsl:apply-templates select="$base/wbei:Address"/>
		</table>
	</xsl:template>
	<!--Организация -->
	<xsl:template name="Organization">
		<xsl:param name="base"/>
		<tr>
			<td class="graphUnderline">
				<xsl:apply-templates select="$base/cat_ru:OrganizationName"/>
				<xsl:if test="$base/cat_ru:ShortName">
					<xsl:text> (</xsl:text>
					<xsl:apply-templates select="$base/cat_ru:ShortName"/>
					<xsl:text>) </xsl:text>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graph">Наименование организации</td>
		</tr>
		<tr>
			<td class="graphUnderline">
				<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
					<span> ОГРН/ОГРНИП:</span>
					<xsl:apply-templates select="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
				</xsl:if>
				<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<span> ИНН:</span>
					<xsl:apply-templates select="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:if>
				<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
					<span> КПП:</span>
					<xsl:apply-templates select="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graph">Реквизиты</td>
		</tr>
	</xsl:template>
	<!--Перевозчик -->
	<xsl:template match="wbei:Carrier">
		<table width="100%">
			<tr>
				<td class="graphUnderline">
					<xsl:apply-templates select="wbei:OrganizationName"/>
				</td>
			</tr>
			<tr>
				<td class="graph">Наименование организации</td>
			</tr>
			<tr>
				<td class="graphUnderline">
					<xsl:if test="wbei:OKPOID">
						<span> ОКПО:</span>
						<xsl:apply-templates select="wbei:OKPOID"/>
					</xsl:if>
					<xsl:if test="wbei:INN">
						<span> ИНН:</span>
						<xsl:apply-templates select="wbei:INN"/>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td class="graph">Реквизиты</td>
			</tr>
			<tr>
				<td class="graphUnderline">
					<xsl:apply-templates select="wbei:LegalAddress"/>
				</td>
			</tr>
			<tr>
				<td class="graph">Юридический адрес</td>
			</tr>
			<tr>
				<td class="graphUnderline">
					<xsl:apply-templates select="wbei:FactAddress"/>
				</td>
			</tr>
			<tr>
				<td class="graph">Фактический адрес</td>
			</tr>
			<tr>
				<td class="graphUnderline">
					<xsl:apply-templates select="wbei:CustomsBrokerCertificate"/>
				</td>
			</tr>
			<tr>
				<td class="graph">№ свидетельства в реестре таможенных брокеров (представителей)</td>
			</tr>
			<tr>
				<td class="graphUnderline">
					<xsl:apply-templates select="wbei:Note"/>
				</td>
			</tr>
			<tr>
				<td class="graph">Дополнительные сведения</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Организация -->
	<xsl:template match="wbei:Organisation">
		<tr>
			<td class="graphUnderline">
				<xsl:apply-templates select="cat_ru:OrganizationName"/>
				<xsl:if test="cat_ru:ShortName">
					<xsl:text> (</xsl:text>
					<xsl:apply-templates select="cat_ru:ShortName"/>
					<xsl:text>) </xsl:text>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graph">Наименование организации</td>
		</tr>
		<tr>
			<td class="graphUnderline">
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
					<span> ОГРН/ОГРНИП:</span>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<span> ИНН:</span>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
					<span> КПП:</span>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graph">Реквизиты</td>
		</tr>
	</xsl:template>
	<!--Адрес в виде строки в бланке-->
	<xsl:template match="wbei:Address">
		<tr>
			<td class="graphUnderline">
				<xsl:for-each select="*">
					<xsl:if test="position() > 1">
						<xsl:text>, </xsl:text>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
		</tr>
		<tr>
			<td class="graph">Адрес</td>
		</tr>
	</xsl:template>
	<!--Юридический или фактический адрес в виде строки-->
	<xsl:template match="wbei:LegalAddress | wbei:FactAddress">
		<xsl:for-each select="*">
			<xsl:if test="position() > 1">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<!--Номер счета-->
	<xsl:template match="wbei:Account">
		<tr>
			<td class="graphUnderline">
				<xsl:if test=".">
					<xsl:variable name="xpath_Account">
						<xsl:call-template name="get_xpath">
							<xsl:with-param name="node" select="."/>
						</xsl:call-template>
					</xsl:variable>
					<element xml_node="{$xpath_Account}">
						<xsl:value-of select="."/>
					</element>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graph">Номер счета</td>
		</tr>
	</xsl:template>
	<!-- Размеры -->
	<xsl:template match="wbei:Dimensions">
		<xsl:if test=".">дл. <xsl:apply-templates select="cat_ru:Lenght"/>, шир. <xsl:apply-templates select="cat_ru:Wight"/>, выс.
            <xsl:apply-templates select="cat_ru:Height"/>
			<xsl:text> </xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Упаковка -->
	<xsl:template match="wbei:Packaging">
		<!--xsl:if test="catESAD_cu:PakageTypeCode=1"-->
		<xsl:if test="catESAD_cu:PakageQuantity!=''">
			<xsl:apply-templates select="catESAD_cu:PakageQuantity"/>
			<xsl:if test="catESAD_cu:PakagePartQuantity"> (<xsl:apply-templates select="catESAD_cu:PakagePartQuantity"/>-часть места)
                </xsl:if>
                ,
            </xsl:if>
		<xsl:if test="catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='0']">
			<xsl:for-each select="catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='0']">
				<xsl:apply-templates select="catESAD_cu:PalleteCode"/>
				<xsl:if test="catESAD_cu:PalleteQuantity">
					<span class="graph">-</span>
					<xsl:apply-templates select="catESAD_cu:PalleteQuantity"/>
				</xsl:if>
				<span class="graph">,</span>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='3']">
				Поддоны:
				<xsl:for-each select="catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='3']">
				<xsl:if test="catESAD_cu:CargoDescriptionText">
					<xsl:apply-templates select="catESAD_cu:CargoDescriptionText"/>
				</xsl:if>
				<span class="graph">,</span>
				<xsl:apply-templates select="catESAD_cu:PalleteQuantity"/> /
					<xsl:apply-templates select="catESAD_cu:PalleteCode"/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='4']">
			<br/>В инд.упаковке: 
				<xsl:for-each select="catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='4']">
				<xsl:apply-templates select="catESAD_cu:PalleteCode"/>
				<xsl:if test="catESAD_cu:PalleteQuantity">
					<span class="graph">-</span>
					<xsl:apply-templates select="catESAD_cu:PalleteQuantity"/>
				</xsl:if>
				<xsl:if test="position()!=last()">
					<span class="graph">,</span>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<!--/xsl:if-->
	</xsl:template>
	<!--Подпись-->
	<xsl:template name="signature">
		<xsl:param name="base"/>
		<xsl:apply-templates select="$base/cat_ru:PersonSurname"/> 
		<xsl:apply-templates select="$base/cat_ru:PersonName"/> 
		<xsl:apply-templates select="$base/cat_ru:PersonMiddleName"/> 
		<xsl:if test="$base/cat_ru:PersonPost">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="$base/cat_ru:PersonPost"/>
		</xsl:if>
		<xsl:text>. </xsl:text>
	</xsl:template>
	<xsl:template match="wbei:IdentityCard">
		<tr>
			<td class="graphUnderline">
				<span class="header">Документ, удостоверяющий личность:</span>
				<br/>
				<xsl:if test="RUScat_ru:IdentityCardName">
					<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
				</xsl:if>
				<xsl:if test="not(RUScat_ru:IdentityCardName) and RUScat_ru:FullIdentityCardName">
					<xsl:apply-templates select="RUScat_ru:FullIdentityCardName"/>
				</xsl:if>
				<xsl:if test="RUScat_ru:IdentityCardCode"> (код вида документа <xsl:apply-templates select="RUScat_ru:IdentityCardCode"/>)</xsl:if>
				<xsl:if test="RUScat_ru:IdentityCardName or RUScat_ru:IdentityCardCode">
					<br/>
				</xsl:if>
				<xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
					<span>
			Серия номер:
			<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
					</span>
					<br/>
				</xsl:if>
				<xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName">
					<xsl:text>Выдан </xsl:text>
					<xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="russian_date"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
					<br/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="cat_ru:DimensionsCode">
		<xsl:variable name="xpath_DimensionsCode">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_DimensionsCode}">
			<xsl:choose>
				<xsl:when test=".='006'">МЕТР</xsl:when>
				<xsl:when test=".='055'">КВАДРАТНЫЙ МЕТР</xsl:when>
				<xsl:when test=".='111'">КУБИЧЕСКИЙ САНТИМЕТР</xsl:when>
				<xsl:when test=".='112'">ЛИТР</xsl:when>
				<xsl:when test=".='113'">КУБИЧЕСКИЙ МЕТР</xsl:when>
				<xsl:when test=".='114'">1000 КУБИЧЕСКИХ МЕТРОВ</xsl:when>
				<xsl:when test=".='117'">ТОННУ ПОЛНОЙ МАССЫ</xsl:when>
				<xsl:when test=".='118'">КУБИЧЕСКИЙ МЕТР ПОЛНОГО ОБЪЕМА КУЗОВА</xsl:when>
				<xsl:when test=".='130'">1000 ЛИТРОВ</xsl:when>
				<xsl:when test=".='162'">МЕТРИЧЕСКИЙ КАРАТ</xsl:when>
				<xsl:when test=".='163'">ГРАММ</xsl:when>
				<xsl:when test=".='166'">КИЛОГРАММ</xsl:when>
				<xsl:when test=".='168'">ТОННУ ВЕСА НЕТТО</xsl:when>
				<xsl:when test=".='185'">ГРУЗОПОДЪЕМНОСТЬ В ТОННАХ</xsl:when>
				<xsl:when test=".='214'">КИЛОВАТТ</xsl:when>
				<xsl:when test=".='246'">1000 КИЛОВАТТ В ЧАС</xsl:when>
				<xsl:when test=".='251'">ЛОШАДИНУЮ СИЛУ</xsl:when>
				<xsl:when test=".='305'">КЮРИ</xsl:when>
				<xsl:when test=".='306'">ГРАММ ДЕЛЯЩИХСЯ ИЗОТОПОВ</xsl:when>
				<xsl:when test=".='715'">ПАРУ</xsl:when>
				<xsl:when test=".='796'">ШТУКУ</xsl:when>
				<xsl:when test=".='797'">СТО ШТУК</xsl:when>
				<xsl:when test=".='798'">ТЫСЯЧУ ШТУК</xsl:when>
				<xsl:when test=".='831'">ЛИТР ЧИСТОГО (100%) СПИРТА</xsl:when>
				<xsl:when test=".='841'">КИЛОГРАММ ПЕРОКСИДА ВОДОРОДА</xsl:when>
				<xsl:when test=".='845'">КИЛОГРАММ СУХОГО НА 90% ВЕЩЕСТВА</xsl:when>
				<xsl:when test=".='852'">КИЛОГРАММ ОКСИДА КАЛИЯ</xsl:when>
				<xsl:when test=".='859'">КИЛОГРАММ ГИДРОКСИДА КАЛИЯ</xsl:when>
				<xsl:when test=".='861'">КИЛОГРАММ АЗОТА</xsl:when>
				<xsl:when test=".='863'">КИЛОГРАММ ГИДРОКСИДА НАТРИЯ</xsl:when>
				<xsl:when test=".='865'">КИЛОГРАММ ПЯТИОКСИДА ФОСФОРА</xsl:when>
				<xsl:when test=".='867'">КИЛОГРАММ УРАНА</xsl:when>
				<xsl:otherwise>
					<!--xsl:text>(код ед.изм.:</xsl:text-->
					<xsl:value-of select="."/>
					<!--xsl:text>)</xsl:text-->
				</xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
</xsl:stylesheet>
