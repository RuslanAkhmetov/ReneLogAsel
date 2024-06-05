<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:ca="urn:customs.ru:Information:WarehouseDocuments:CommercialAct:5.22.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.22.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="ca:CommercialAct">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Коммерческий акт (акт о товарах на временном хранении, несоответствующих сведениям из товаросопроводительных документов)</title>
				<style type="text/css">
			body {
					background: #ffffff;
				}

				div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}

				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}
				
				.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
				}
				
				.header {
					font-weight: bold;
					margin-top:20px;
				}
				
				 table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 10pt;
							}
				jh {
				font: 16;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: 6pt;
							}
				.g{
							border-right:0pt solid;
							}
				</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tr>
							<td align="center" class="graph" colspan="100%" style="border:solid 0pt">
								<font face="Times new roman" size="5">
									<b>
										<xsl:if test="ca:ActDetails/ca:ActName">
											<xsl:apply-templates select="ca:ActDetails/ca:ActName"/> </xsl:if>
					№<xsl:apply-templates select="ca:ActDetails/ca:ActNumber"/>
									</b>
								</font>
							</td>
						</tr>
						<tr>
							<td class="graph" style="border:solid 0pt">Порядковый номер <u>
									<xsl:apply-templates select="ca:ActDetails/ca:ActOrderNumber"/>
								</u>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="graph" style="border:solid 0pt">Сведения об отчете о принятии по форме ДО-1, в отношении товаров которого составлен настоящий Акт:
						№<xsl:apply-templates select="ca:DO1ReportLinkData/catWH_ru:ReportNumber"/> от
						<xsl:apply-templates select="ca:DO1ReportLinkData/catWH_ru:ReportDate" mode="russian_date"/>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td class="graph" style="border:solid 0pt">
								<b>Данные о владельце склада:</b>
							</td>
						</tr>
						<tr>
							<td class="graph" style="border:solid 0pt">
								<xsl:apply-templates select="ca:WarehouseOwner"/>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td class="graph" style="border:solid 0pt">
						Документ, на основании которого разрешено временное хранение:
						<xsl:choose>
									<xsl:when test="ca:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateKind='lic_Certificate'">Свидетельство о включении в реестр владельцев СВХ</xsl:when>
									<xsl:when test="ca:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateKind='lic_Licence'">Лицензия владельца СВХ</xsl:when>
									<xsl:when test="ca:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateKind='lic_Permition'">Разрешение ТО на временное хранение в ином месте</xsl:when>
									<xsl:when test="ca:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateKind='lic_PermZtk'">ПЗТК</xsl:when>
									<xsl:when test="ca:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateKind='lic_TempZtk'">ВЗТК</xsl:when>
								</xsl:choose>
						№<xsl:apply-templates select="ca:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateNumber"/> 
						<xsl:if test="ca:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateDate">
									<xsl:apply-templates select="ca:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateDate" mode="russian_date"/>
								</xsl:if>
							</td>
						</tr>
						<xsl:if test="ca:WarehouseOwner/catWH_ru:WarehousePerson">
							<tr>
								<td class="graph" style="border:solid 0pt">Представитель СВХ:
						<u>
										<xsl:apply-templates select="ca:WarehouseOwner/catWH_ru:WarehousePerson"/>
									</u>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
						</tr>
					</table>
					<table>
						<tr>
							<td align="center" class="graph" colspan="100%" style="border:solid 0pt">
								<i>Сведения о выявленных несоответствиях</i>
							</td>
						</tr>
						<tr>
							<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td class="graph" style="border:solid 0pt">Этап, на котором выявлены несоответствия:
						<xsl:choose>
									<xsl:when test="ca:DiscrepancyInfo/ca:Stage='mist_AtAcceptance'">Несоответствие выявлено на этапе принятия товара</xsl:when>
									<xsl:when test="ca:DiscrepancyInfo/ca:Stage='mist_AtKeeping'">Несоответствие выявлено в процессе временного хранения товара</xsl:when>
								</xsl:choose>
							</td>
						</tr>
						<tr>
							<td class="graph" style="border:solid 0pt">Дата выявления несоответствия:
						<xsl:apply-templates select="ca:DiscrepancyInfo/ca:Date" mode="russian_date"/>
							</td>
						</tr>
						<tr>
							<td class="graph" style="border:solid 0pt">Время выявления несоответствия:
						<xsl:apply-templates select="ca:DiscrepancyInfo/ca:Time"/>
							</td>
						</tr>
						<tr>
							<td class="graph" style="border:solid 0pt">Причины несоответствия:
						<xsl:for-each select="ca:DiscrepancyInfo/ca:Reasons">
									<xsl:apply-templates select="."/>
									<xsl:if test="position()!=last()"> </xsl:if>
								</xsl:for-each>
							</td>
						</tr>
						<xsl:if test="ca:DiscrepancyInfo/ca:TotalPackageNumber">
							<tr>
								<td class="graph" style="border:solid 0pt">Общее количество грузовых мест с учетом выявленных несоответствий:
									 <xsl:apply-templates select="ca:DiscrepancyInfo/ca:TotalPackageNumber"/>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
						</tr>
					</table>
					<table>
						<xsl:if test="ca:DiscrepancyInfo/ca:DiscrepancyDetails">
							<tr>
								<td align="center" class="graph" colspan="2" style="border:solid 0pt">Описание подробностей выявленных несоответствий
						</td>
							</tr>
						</xsl:if>
						<xsl:if test="ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:RecipientFlag">
							<tr>
								<td class="graph" style="border:solid 1pt #000000">Признак присутствия представителя грузополучателя в момент выявления несоответствий</td>
								<td class="graph" style="border:solid 1pt #000000">
									<xsl:if test="ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:RecipientFlag='1' or ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:RecipientFlag='t' or ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:RecipientFlag='true'">
						присутствует</xsl:if>
									<xsl:if test="ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:RecipientFlag='0' or ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:RecipientFlag='f' or ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:RecipientFlag='false'">
						 не присутствует</xsl:if>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:CarrierFlag">
							<tr>
								<td class="graph" style="border:solid 1pt #000000">Признак присутствия представителя перевозчика в момент выявления несоответствий</td>
								<td class="graph" style="border:solid 1pt #000000">
									<xsl:if test="ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:CarrierFlag='1' or ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:CarrierFlag='t' or ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:CarrierFlag='true'">
						присутствует</xsl:if>
									<xsl:if test="ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:CarrierFlag='0' or ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:CarrierFlag='f' or ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:CarrierFlag='false'">
						 не присутствует</xsl:if>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:LeaksFlag">
							<tr>
								<td class="graph" style="border:solid 1pt #000000">Признак наличия повреждений упаковок товаров</td>
								<td class="graph" style="border:solid 1pt #000000">
									<xsl:if test="ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:LeaksFlag='1' or ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:LeaksFlag='t' or ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:LeaksFlag='true'">
						присутствует</xsl:if>
									<xsl:if test="ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:LeaksFlag='0' or ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:LeaksFlag='f' or ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:LeaksFlag='false'">
						 не присутствует</xsl:if>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:LeaksDescription">
							<tr>
								<td class="graph" colspan="2" style="border:solid 0pt">Описание повреждений упаковок товаров:
						<xsl:for-each select="ca:DiscrepancyInfo/ca:DiscrepancyDetails/ca:LeaksDescription">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()"> </xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
						</tr>
					</table>
					<table>
						<xsl:if test="ca:DiscrepancyInfo/ca:MissingGoods">
							<tr>
								<td align="center" class="graph" colspan="2" style="border:solid 0pt">Описание товаров, которые были заявлены в документах, но оказались отсутствующими по факту</td>
							</tr>
							<tr>
								<td align="center" class="graph" style="border:solid 1pt #000000" width="20%">Номер товара в отчете ДО-1</td>
								<td align="center" class="graph" style="border:solid 1pt #000000" width="80%">Дополнение в примечание по товару (графа 11 отчета), уточняющее причины и обстоятельства отсутствия товара</td>
							</tr>
						</xsl:if>
						<xsl:for-each select="ca:DiscrepancyInfo/ca:MissingGoods">
							<tr>
								<td align="center" class="graph" style="border:solid 1pt #000000" width="20%">
									<xsl:apply-templates select="ca:DO1GoodNumber"/>
								</td>
								<td class="graph" style="border:solid 1pt #000000" width="80%">
									<xsl:if test="ca:Comments">
										<xsl:apply-templates select="ca:Comments"/>
									</xsl:if>
								</td>
							</tr>
						</xsl:for-each>
						<tr>
							<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
						</tr>
					</table>
					<table>
						<xsl:if test="ca:DiscrepancyInfo/ca:DiscrepantGoods">
							<tr>
								<td align="center" class="graph" colspan="3" style="border:solid 0pt">Описание товаров, которые были заявлены в документах, присутствуют по факту, но отличаются по своим характеристикам от сведений,
						 заявленных в товаросопроводительных документах</td>
							</tr>
						</xsl:if>
						<xsl:for-each select="ca:DiscrepancyInfo/ca:DiscrepantGoods">
							<tr>
								<td class="graph" colspan="3" style="border:solid 0pt">
									<xsl:value-of select="position()"/>.<br/>
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="3" style="border:solid 0pt #">
				Номер товара в отчете ДО-1:<xsl:apply-templates select="ca:DO1GoodNumber"/>
									<br/>
									<xsl:if test="ca:Comments">
				Дополнение в примечание по товару (графа 11 отчета), уточняющее причины и обстоятельства отсутствия товара: 
				<xsl:apply-templates select="ca:Comments"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td align="center" class="graph" style="border:solid 1pt #000000" width="20%">Описание</td>
								<td align="center" class="graph" style="border:solid 1pt #000000" width="40%">Cогласно товаросопроводительным документам</td>
								<td align="center" class="graph" style="border:solid 1pt #000000" width="40%">Фактическое значение</td>
							</tr>
							<xsl:if test="ca:GoodsTNVEDCode">
								<tr>
									<td class="graph" style="border:solid 1pt #000000" valign="middle">Код товара по ТН ВЭД ЕАЭС</td>
									<td align="center" class="graph" style="border:solid 1pt #000000">
										<xsl:if test="ca:GoodsTNVEDCode/ca:TNVEDCodeByDocs">
											<xsl:apply-templates select="ca:GoodsTNVEDCode/ca:TNVEDCodeByDocs"/>
										</xsl:if>
									</td>
									<td align="center" class="graph" style="border:solid 1pt #000000">
										<xsl:if test="ca:GoodsTNVEDCode/ca:TNVEDCodeByFact">
											<xsl:apply-templates select="ca:GoodsTNVEDCode/ca:TNVEDCodeByFact"/>
										</xsl:if>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="ca:GoodsDescription">
								<tr>
									<td class="graph" style="border:solid 1pt #000000" valign="middle">Описание товара</td>
									<td class="graph" style="border:solid 1pt #000000">
										<xsl:for-each select="ca:GoodsDescription/ca:GoodsDescriptionByDocs">
											<xsl:apply-templates select="."/>
											<xsl:if test="position()!=last()"> </xsl:if>
										</xsl:for-each>
									</td>
									<td class="graph" style="border:solid 1pt #000000">
										<xsl:for-each select="ca:GoodsDescription/ca:GoodsDescriptionByFact">
											<xsl:apply-templates select="."/>
											<xsl:if test="position()!=last()"> </xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="ca:InvoiceCost">
								<tr>
									<td class="graph" style="border:solid 1pt #000000" valign="middle">Сведения о фактурной стоимости</td>
									<td align="center" class="graph" style="border:solid 1pt #000000">
										<xsl:apply-templates select="ca:InvoiceCost/ca:InvoiceCostByDocs/ca:CostAmount"/>
										<xsl:if test="ca:InvoiceCost/ca:InvoiceCostByDocs/ca:CostCurrencyCode">
				(<xsl:apply-templates select="ca:InvoiceCost/ca:InvoiceCostByDocs/ca:CostCurrencyCode"/>)
				</xsl:if>
									</td>
									<td align="center" class="graph" style="border:solid 1pt #000000">
										<xsl:apply-templates select="ca:InvoiceCost/ca:InvoiceCostByFact/ca:CostAmount"/>
										<xsl:if test="ca:InvoiceCost/ca:InvoiceCostByFact/ca:CostCurrencyCode">
				(<xsl:apply-templates select="ca:InvoiceCost/ca:InvoiceCostByFact/ca:CostCurrencyCode"/>)
				</xsl:if>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="ca:PlaceNumber">
								<tr>
									<td class="graph" style="border:solid 1pt #000000" valign="middle">Количество грузовых мест</td>
									<td align="center" class="graph" style="border:solid 1pt #000000">
										<xsl:apply-templates select="ca:PlaceNumber/ca:PlaceNumberByDocs"/>
									</td>
									<td align="center" class="graph" style="border:solid 1pt #000000">
										<xsl:apply-templates select="ca:PlaceNumber/ca:PlaceNumberByFact"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="ca:GoodsQuantity">
								<tr>
									<td class="graph" style="border:solid 1pt #000000" valign="middle">Количество товара в дополнительной единице измерения</td>
									<td align="center" class="graph" style="border:solid 1pt #000000">
										<xsl:apply-templates select="ca:GoodsQuantity/ca:GoodsQuantityByDocs"/>
									</td>
									<td align="center" class="graph" style="border:solid 1pt #000000">
										<xsl:apply-templates select="ca:GoodsQuantity/ca:GoodsQuantityByFact"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="ca:BruttoVolQuant">
								<tr>
									<td class="graph" style="border:solid 1pt #000000" valign="middle">Вес брутто/объем</td>
									<td align="center" class="graph" style="border:solid 1pt #000000">
										<xsl:apply-templates select="ca:BruttoVolQuant/ca:BruttoVolQuantByDocs"/>
									</td>
									<td align="center" class="graph" style="border:solid 1pt #000000">
										<xsl:apply-templates select="ca:BruttoVolQuant/ca:BruttoVolQuantByFact"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
							</tr>
						</xsl:for-each>
					</table>
					<table>
						<tr>
							<td align="center" class="graph" colspan="100%" style="border:solid 0pt">Описание товаров, которые не были заявлены в документах, но оказались в грузе по факту</td>
						</tr>
						<xsl:for-each select="ca:DiscrepancyInfo/ca:ExtraGoods">
							<tr>
								<td class="graph" style="border:solid 0pt">
									<xsl:value-of select="position()"/>. 
						<xsl:if test="cat_ru:PrDocumentName">
										<xsl:apply-templates select="cat_ru:PrDocumentName"/> </xsl:if>
									<xsl:if test="cat_ru:PrDocumentNumber">№<xsl:apply-templates select="cat_ru:PrDocumentNumber"/> </xsl:if>
									<xsl:if test="cat_ru:PrDocumentDate">от <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/> 
						</xsl:if>
						(<xsl:apply-templates select="catWH_ru:PresentedDocumentModeCode"/>)
						</td>
							</tr>
							<xsl:if test="catWH_ru:WhCommDoc/catWH_ru:CompletteList">
								<tr>
									<td class="graph" style="border:solid 0pt">Номер связанных ТТН:
						<xsl:for-each select="catWH_ru:WhCommDoc/catWH_ru:CompletteList">
											<xsl:apply-templates select="."/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="catWH_ru:WhCommDoc/catWH_ru:CustomNumber">
								<tr>
									<td class="graph" style="border:solid 0pt">Регистрационный номер:
						<xsl:apply-templates select="catWH_ru:WhCommDoc/catWH_ru:CustomNumber/cat_ru:CustomsCode"/>/<xsl:apply-templates select="catWH_ru:WhCommDoc/catWH_ru:CustomNumber/cat_ru:RegistrationDate" mode="russian_date_gtd"/>/<xsl:apply-templates select="catWH_ru:WhCommDoc/catWH_ru:CustomNumber/cat_ru:GTDNumber"/>
									</td>
								</tr>
								<tr>
									<td class="graph" style="border:solid 0pt">      
						- порядковый номер транспортного документа по журналу регистрации:<xsl:apply-templates select="catWH_ru:WhCommDoc/catWH_ru:CustomNumber/catWH_ru:WaybillNumPP"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="catWH_ru:WhCommDoc/catWH_ru:Consignor">
								<tr>
									<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
								</tr>
								<tr>
									<td class="graph" style="border:solid 0pt">
										<u>Отправитель</u>:
						<xsl:if test="catWH_ru:WhCommDoc/catWH_ru:Consignor/catWH_ru:CountryCode">
											<xsl:apply-templates select="catWH_ru:WhCommDoc/catWH_ru:Consignor/catWH_ru:CountryCode"/> </xsl:if>
										<xsl:if test="catWH_ru:WhCommDoc/catWH_ru:Consignor/catWH_ru:OrganizationName">
											<xsl:apply-templates select="catWH_ru:WhCommDoc/catWH_ru:Consignor/catWH_ru:OrganizationName"/> </xsl:if>
										<xsl:if test="catWH_ru:WhCommDoc/catWH_ru:Consignor/catWH_ru:Address">
											<xsl:apply-templates select="catWH_ru:WhCommDoc/catWH_ru:Consignor/catWH_ru:Address"/>
										</xsl:if>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="catWH_ru:WhCommDoc/catWH_ru:Consignee">
								<tr>
									<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
								</tr>
								<tr>
									<td class="graph" style="border:solid 0pt">
										<u>Получатель</u>:
						<xsl:apply-templates select="catWH_ru:WhCommDoc/catWH_ru:Consignee"/>
									</td>
								</tr>
								<tr>
									<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
								</tr>
							</xsl:if>
							<tr>
								<td align="center" class="graph" style="border:solid 0pt">Сведения о товарах</td>
							</tr>
							<xsl:for-each select="catWH_ru:Goods">
								<tr>
									<td class="graph" style="border:solid 0pt">
										<xsl:value-of select="position()"/>) </td>
								</tr>
								<tr>
									<td class="graph" style="border:solid 0pt">
										<table>
											<tr>
												<td class="graph" style="border:solid 1pt #000000" width="40%">Валовый номер товара по отчету</td>
												<td align="center" class="graph" style="border:solid 1pt #000000" width="60%">
													<xsl:apply-templates select="catWH_ru:GoodsNumber"/>
												</td>
											</tr>
											<xsl:if test="catWH_ru:GoodsTNVEDCode">
												<tr>
													<td class="graph" style="border:solid 1pt #000000" width="40%">Код товара по ТН ВЭД ЕАЭС</td>
													<td align="center" class="graph" style="border:solid 1pt #000000" width="60%">
														<xsl:apply-templates select="catWH_ru:GoodsTNVEDCode"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="catWH_ru:InvoiceCost">
												<tr>
													<td class="graph" style="border:solid 1pt #000000" width="40%">Фактурная стоимость</td>
													<td align="center" class="graph" style="border:solid 1pt #000000" width="60%">
														<xsl:apply-templates select="catWH_ru:InvoiceCost"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="catWH_ru:CurrencyCode">
												<tr>
													<td class="graph" style="border:solid 1pt #000000" width="40%">Буквенный код валюты фактурной стоимости</td>
													<td align="center" class="graph" style="border:solid 1pt #000000" width="60%">
														<xsl:apply-templates select="catWH_ru:CurrencyCode"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="catWH_ru:GoodsDescriptionFull">
												<tr>
													<td class="graph" style="border:solid 1pt #000000" width="40%">Описание товара</td>
													<td class="graph" style="border:solid 1pt #000000" width="60%">
														<xsl:for-each select="catWH_ru:GoodsDescriptionFull">
															<xsl:apply-templates select="."/>
															<xsl:if test="position()!=last()"> </xsl:if>
														</xsl:for-each>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="catWH_ru:MPONumber">
												<tr>
													<td class="graph" style="border:solid 1pt #000000" width="40%">Номер МПО</td>
													<td class="graph" style="border:solid 1pt #000000" width="60%">
													<xsl:choose>
														<xsl:when test="catWH_ru:MPONumber/catWH_ru:MPONumberComplex">
															Указатель сервиса:<xsl:apply-templates select="catWH_ru:MPONumber/catWH_ru:MPONumberComplex/catWH_ru:ServiceIndicator"/>
																				<br/>
															Порядковый номер:<xsl:apply-templates select="catWH_ru:MPONumber/catWH_ru:MPONumberComplex/catWH_ru:SerialNumber"/>
																				<br/>
															Код страны:<xsl:apply-templates select="catWH_ru:MPONumber/catWH_ru:MPONumberComplex/catWH_ru:CountryCode"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:apply-templates select="catWH_ru:MPONumber/catWH_ru:Number"/>
														</xsl:otherwise>
													</xsl:choose>
									
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="catWH_ru:MPOCaseNum">
												<tr>
													<td class="graph" style="border:solid 1pt #000000" width="40%">Номер емкости, в которой находится МПО</td>
													<td align="center" class="graph" style="border:solid 1pt #000000" width="60%">
														<xsl:apply-templates select="catWH_ru:MPOCaseNum"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="catWH_ru:CargoPlace">
												<tr>
													<td class="graph" style="border:solid 1pt #000000" width="40%">Сведения о грузовых местах</td>
													<td class="graph" style="border:solid 1pt #000000" width="60%">
														<xsl:if test="catWH_ru:CargoPlace/catWH_ru:PlaceNumber">
									Количество грузовых мест:<xsl:apply-templates select="catWH_ru:CargoPlace/catWH_ru:PlaceNumber"/>
															<br/>
														</xsl:if>
														<xsl:if test="catWH_ru:CargoPlace/catWH_ru:PackageCode">
									Код вида упаковки (груза):<xsl:apply-templates select="catWH_ru:CargoPlace/catWH_ru:PackageCode"/>
															<br/>
														</xsl:if>
														<xsl:if test="catWH_ru:CargoPlace/catWH_ru:PlaceDescription">
									Вид грузовых мест:<xsl:apply-templates select="catWH_ru:CargoPlace/catWH_ru:PlaceDescription"/>
														</xsl:if>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="catWH_ru:BruttoVolQuant">
												<tr>
													<td class="graph" style="border:solid 1pt #000000" width="40%">Вес брутто / объем</td>
													<td align="center" class="graph" style="border:solid 1pt #000000" width="60%">
														<xsl:apply-templates select="catWH_ru:BruttoVolQuant"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="catWH_ru:MeasureQuantity">
												<tr>
													<td class="graph" style="border:solid 1pt #000000" width="40%">Количество в дополнительных единицах измерения</td>
													<td align="center" class="graph" style="border:solid 1pt #000000" width="60%">
														<xsl:apply-templates select="catWH_ru:MeasureQuantity"/>
													</td>
												</tr>
											</xsl:if>
											<tr>
												<td class="graph" style="border:solid 1pt #000000" width="40%">Складской номер товара</td>
												<td align="center" class="graph" style="border:solid 1pt #000000" width="60%">
													<xsl:apply-templates select="catWH_ru:GoodsWHNumber"/>
												</td>
											</tr>
											<xsl:if test="catWH_ru:Comments">
												<tr>
													<td class="graph" style="border:solid 1pt #000000" width="40%">Примечание по условиям хранения</td>
													<td align="center" class="graph" style="border:solid 1pt #000000" width="60%">
														<xsl:apply-templates select="catWH_ru:Comments"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="catWH_ru:MPOCaseNumder">
												<tr>
													<td class="graph" style="border:solid 1pt #000000" width="40%">Номер емкости МПО, 29 знаков</td>
													<td align="center" class="graph" style="border:solid 1pt #000000" width="60%">
														<xsl:apply-templates select="catWH_ru:MPOCaseNumder"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="catWH_ru:MpoBillBruttoVolQuant">
												<tr>
													<td class="graph" style="border:solid 1pt #000000" width="40%">Вес брутто МПО (емкости МПО) по сопроводительным документам</td>
													<td align="center" class="graph" style="border:solid 1pt #000000" width="60%">
														<xsl:apply-templates select="catWH_ru:MpoBillBruttoVolQuant"/>
													</td>
												</tr>
											</xsl:if>
											<tr>
												<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
											</tr>
										</table>
									</td>
								</tr>
								<xsl:if test="catWH_ru:KeepingPlace">
									<tr>
										<td align="center" class="graph" style="border:solid 0pt">Описание места хранения товаров</td>
									</tr>
									<tr>
										<td class="graph" style="border:solid 0pt">
											<table>
												<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Area">
													<tr>
														<td class="graph" style="border:solid 1pt #000000" width="50%">Номер площадки / зоны</td>
														<td align="center" class="graph" style="border:solid 1pt #000000" width="50%">
															<xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:Area"/>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Parking">
													<tr>
														<td class="graph" style="border:solid 1pt #000000" width="50%">Парковочное место</td>
														<td align="center" class="graph" style="border:solid 1pt #000000" width="50%">
															<xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:Parking"/>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Square">
													<tr>
														<td class="graph" style="border:solid 1pt #000000" width="50%">Занимаемая площадь в кв.м.</td>
														<td align="center" class="graph" style="border:solid 1pt #000000" width="50%">
															<xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:Square"/>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Angar">
													<tr>
														<td class="graph" style="border:solid 1pt #000000" width="50%">Ангар</td>
														<td align="center" class="graph" style="border:solid 1pt #000000" width="50%">
															<xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:Angar"/>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:WHPackind">
													<tr>
														<td class="graph" style="border:solid 1pt #000000" width="50%">Номер стеллажа или полки (для товара) / номер места в ангаре (для контейнера)</td>
														<td align="center" class="graph" style="border:solid 1pt #000000" width="50%">
															<xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:WHPackind"/>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Cell">
													<tr>
														<td class="graph" style="border:solid 1pt #000000" width="50%">Номер ячейки</td>
														<td align="center" class="graph" style="border:solid 1pt #000000" width="50%">
															<xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:Cell"/>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:WithoutUnloadIndicator">
													<tr>
														<td class="graph" style="border:solid 1pt #000000" width="50%">Признак хранения без выгрузки из ТС (контейнеров)</td>
														<td align="center" class="graph" style="border:solid 1pt #000000" width="50%">
															<xsl:for-each select="catWH_ru:KeepingPlace/catWH_ru:WithoutUnloadIndicator">
																<xsl:choose>
																	<xsl:when test=".='true' or .='1' or .='TRUE' or .='t' or .='T'">ДА</xsl:when>
																	<xsl:otherwise>НЕТ</xsl:otherwise>
																</xsl:choose>
															</xsl:for-each>
														</td>
													</tr>
												</xsl:if>
												<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Comments">
													<tr>
														<td class="graph" colspan="2" style="border:solid 0pt">Комментарий к размещению: <xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:Comments"/>
														</td>
													</tr>
												</xsl:if>
												<tr>
													<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
												</tr>
											</table>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="catWH_ru:AcceptDateTime">
									<tr>
										<td class="graph" style="border:solid 0pt">
											<xsl:text>Дата и время принятия товара на ВХ: </xsl:text>
											<xsl:apply-templates select="catWH_ru:AcceptDateTime" mode="russian_datetime"/>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
								</tr>
								<tr>
									<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
								</tr>
							</xsl:for-each>
							<xsl:if test="catWH_ru:Containers">
								<tr>
									<td align="center" class="graph" style="border:solid 0pt">Сведения о контейнерах</td>
								</tr>
								<xsl:for-each select="catWH_ru:Containers">
									<tr>
										<td class="graph" style="border:solid 0pt">Номер контейнера:
						<xsl:apply-templates select="catWH_ru:ContainerNumber"/>
										</td>
									</tr>
									<xsl:if test="catWH_ru:SizeCode">
										<tr>
											<td class="graph" style="border:solid 0pt">Код размера контейнера по ГОСТ 52524-2005:
									<xsl:apply-templates select="catWH_ru:SizeCode"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="catWH_ru:KindCode">
										<tr>
											<td class="graph" style="border:solid 0pt">Код типа контейнера по ГОСТ 52524-2005:
									<xsl:apply-templates select="catWH_ru:KindCode"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="catWH_ru:GrossWeightQuantity">
										<tr>
											<td class="graph" style="border:solid 0pt">Вес брутто (кг) всех товаров в контейнере:
						<xsl:apply-templates select="catWH_ru:GrossWeightQuantity"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="catWH_ru:KeepingPlace">
										<tr>
											<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
										</tr>
										<tr>
											<td align="center" class="graph" style="border:solid 0pt">Информация о хранении контейнера
								</td>
										</tr>
										<tr>
											<td class="graph" style="border:solid 0pt">
												<table>
													<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Area">
														<tr>
															<td class="graph" style="border:solid 1pt #000000" width="50%">Номер площадки / зоны</td>
															<td align="center" class="graph" style="border:solid 1pt #000000" width="50%">
																<xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:Area"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Parking">
														<tr>
															<td class="graph" style="border:solid 1pt #000000" width="50%">Парковочное место</td>
															<td align="center" class="graph" style="border:solid 1pt #000000" width="50%">
																<xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:Parking"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Square">
														<tr>
															<td class="graph" style="border:solid 1pt #000000" width="50%">Занимаемая площадь в кв.м.</td>
															<td align="center" class="graph" style="border:solid 1pt #000000" width="50%">
																<xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:Square"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Angar">
														<tr>
															<td class="graph" style="border:solid 1pt #000000" width="50%">Ангар</td>
															<td align="center" class="graph" style="border:solid 1pt #000000" width="50%">
																<xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:Angar"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:WHPackind">
														<tr>
															<td class="graph" style="border:solid 1pt #000000" width="50%">Номер стеллажа или полки (для товара) / номер места в ангаре (для контейнера)</td>
															<td align="center" class="graph" style="border:solid 1pt #000000" width="50%">
																<xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:WHPackind"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Cell">
														<tr>
															<td class="graph" style="border:solid 1pt #000000" width="50%">Номер ячейки</td>
															<td align="center" class="graph" style="border:solid 1pt #000000" width="50%">
																<xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:Cell"/>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:WithoutUnloadIndicator">
														<tr>
															<td class="graph" style="border:solid 1pt #000000" width="50%">Признак хранения без выгрузки из ТС (контейнеров)</td>
															<td align="center" class="graph" style="border:solid 1pt #000000" width="50%">
																<xsl:for-each select="catWH_ru:KeepingPlace/catWH_ru:WithoutUnloadIndicator">
																	<xsl:choose>
																		<xsl:when test=".='true' or .='1' or .='TRUE' or .='t' or .='T'">ДА</xsl:when>
																		<xsl:otherwise>НЕТ</xsl:otherwise>
																	</xsl:choose>
																</xsl:for-each>
															</td>
														</tr>
													</xsl:if>
													<xsl:if test="catWH_ru:KeepingPlace/catWH_ru:Comments">
														<tr>
															<td class="graph" colspan="2" style="border:solid 0pt">Комментарий к размещению: <xsl:apply-templates select="catWH_ru:KeepingPlace/catWH_ru:Comments"/>
															</td>
														</tr>
													</xsl:if>
												</table>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
									</tr>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="catWH_ru:GoodContLinks">
								<tr>
									<td align="center" class="graph" style="border:solid 0pt">Сведения о размещении товаров в контейнерах</td>
								</tr>
								<tr>
									<td class="graph" style="border:solid 0pt">
										<table>
											<tr>
												<td align="center" class="graph" style="border:solid 1pt #000000" width="50%">Порядковый номер товара в транспортном документе</td>
												<td align="center" class="graph" style="border:solid 1pt #000000" width="50%">Порядковый номер контейнера  в транспортном документе</td>
											</tr>
											<xsl:for-each select="catWH_ru:GoodContLinks">
												<tr>
													<td align="center" class="graph" style="border:solid 1pt #000000">
														<xsl:apply-templates select="catWH_ru:GoodNumber"/>
													</td>
													<td align="center" class="graph" style="border:solid 1pt #000000">
														<xsl:apply-templates select="catWH_ru:ContainerNumber"/>
													</td>
												</tr>
											</xsl:for-each>
										</table>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td class="graph" colspan="100%" style="border:solid 0pt"> </td>
							</tr>
						</xsl:for-each>
					</table>
					<table>
						<tr>
							<td class="graph" style="border:solid 0pt" width="50%">
								<u>
									<xsl:if test="ca:WareHousePerson/cat_ru:PersonPost">
										<xsl:apply-templates select="ca:WareHousePerson/cat_ru:PersonPost"/> </xsl:if>
									<xsl:apply-templates select="ca:WareHousePerson/cat_ru:PersonSurname"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:apply-templates select="ca:WareHousePerson/cat_ru:PersonName"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:apply-templates select="ca:WareHousePerson/cat_ru:PersonMiddleName"/>
								</u>
							</td>
							<td align="center" class="graph" style="border:solid 0pt">
								<u>
									<xsl:apply-templates select="ca:ActDetails/ca:ActDate" mode="russian_date"/>
								</u>
							</td>
						</tr>
						<tr>
							<td class="graph" style="border:solid 0pt">(уполномоченный сотрудник от склада)</td>
							<td align="center" class="graph" style="border:solid 0pt">(дата оформления документа)</td>
						</tr>
						<xsl:if test="ca:CarrierPerson">
							<tr>
								<td class="graph" style="border:solid 0pt">
									<u>
										<xsl:if test="ca:CarrierPerson/cat_ru:PersonPost">
											<xsl:apply-templates select="ca:CarrierPerson/cat_ru:PersonPost"/> </xsl:if>
										<xsl:apply-templates select="ca:CarrierPerson/cat_ru:PersonSurname"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:apply-templates select="ca:CarrierPerson/cat_ru:PersonName"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:apply-templates select="ca:CarrierPerson/cat_ru:PersonMiddleName"/>
									</u>
								</td>
								<td class="graph" style="border:solid 0pt"> </td>
							</tr>
							<tr>
								<td class="graph" style="border:solid 0pt">(уполномоченный сотрудник от перевозчика)</td>
								<td class="graph" style="border:solid 0pt"> </td>
							</tr>
						</xsl:if>
						<xsl:if test="ca:RecipientPerson">
							<tr>
								<td class="graph" style="border:solid 0pt">
									<u>
										<xsl:if test="ca:RecipientPerson/cat_ru:PersonPost">
											<xsl:apply-templates select="ca:RecipientPerson/cat_ru:PersonPost"/> </xsl:if>
										<xsl:apply-templates select="ca:RecipientPerson/cat_ru:PersonSurname"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:apply-templates select="ca:RecipientPerson/cat_ru:PersonName"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:apply-templates select="ca:RecipientPerson/cat_ru:PersonMiddleName"/>
									</u>
								</td>
								<td class="graph" style="border:solid 0pt"> </td>
							</tr>
							<tr>
								<td class="graph" style="border:solid 0pt">(уполномоченный сотрудник от получателя)</td>
								<td class="graph" style="border:solid 0pt"> </td>
							</tr>
						</xsl:if>
					</table>
				</div>
			</body>
		</html>
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
	<xsl:template match="ca:WarehouseOwner | catWH_ru:Consignee">
		<!--<xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:apply-templates select="cat_ru:OrganizationLanguage"/><br/>
	</xsl:if>-->
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName">(</xsl:if>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if> 
	
	<xsl:choose>
			<xsl:when test="cat_ru:RFOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="cat_ru:RKOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="cat_ru:RBOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="catWH_ru:Address">
			<xsl:apply-templates select="catWH_ru:Address"/>
		</xsl:if>
		<!--xsl:if test="RUScat_ru:IdentityCard">
         <xsl:apply-templates select="RUScat_ru:IdentityCard"/>
      </xsl:if-->
		<xsl:if test="catWH_ru:IdentityCard">
			<xsl:apply-templates select="catWH_ru:IdentityCard"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<span>ОГРН: <xsl:apply-templates select="cat_ru:OGRN"/>
			</span> 
	</xsl:if>
		<xsl:if test="cat_ru:INN">
			<span>ИНН: <xsl:apply-templates select="cat_ru:INN"/>
			</span> 
	</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<span>	КПП: <xsl:apply-templates select="cat_ru:KPP"/>
			</span> 
	</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span>УНП: <xsl:apply-templates select="cat_ru:UNP"/>
			</span> 
	</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span>Идентификационный номер: <xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
			</span> 
	</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span>БИН: <xsl:apply-templates select="cat_ru:BIN"/>
			</span> 
	</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<span>ИИН: <xsl:apply-templates select="cat_ru:IIN"/>
			</span> 
	</xsl:if>
		<xsl:for-each select="cat_ru:ITN">
			<span>	
			ИТН: 
			<xsl:apply-templates select="cat_ru:CategoryCode"/>/<xsl:apply-templates select="cat_ru:KATOCode"/>/<xsl:apply-templates select="cat_ru:RNN"/>
				<xsl:if test="cat_ru:ITNReserv">/<xsl:apply-templates select="cat_ru:ITNReserv"/>
				</xsl:if>
			</span> 
	</xsl:for-each>
	</xsl:template>
	<xsl:template match="catWH_ru:Address">
		<span class="header">Адрес:</span> 
	<xsl:if test="cat_ru:PostalCode"> Почтовый индекс: <xsl:apply-templates select="cat_ru:PostalCode"/>
		</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:apply-templates select="cat_ru:CounryName"/>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode">(<xsl:apply-templates select="cat_ru:CountryCode"/>)</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
			<xsl:apply-templates select="cat_ru:Region"/>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
			<xsl:apply-templates select="cat_ru:City"/>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
			<xsl:apply-templates select="cat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="catWH_ru:AddressLine"> Информация об адресе: <xsl:apply-templates select="catWH_ru:AddressLine"/>
		</xsl:if>
	 
</xsl:template>
	<xsl:template match="RUScat_ru:IdentityCard | catWH_ru:IdentityCard">
		<span class="header">Документ, удостоверяющий личность:</span> 
	<xsl:if test="RUScat_ru:IdentityCardName">
			<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardCode"> (код вида документа <xsl:apply-templates select="RUScat_ru:IdentityCardCode"/>)</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardName or RUScat_ru:IdentityCardCode"> </xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
			<span>
			Серия номер:
			<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
			</span>
		 
	</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName">
		Выдан
		<xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="russian_date"/>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
		 
	</xsl:if>
	 
</xsl:template>
	<xsl:template match="catWH_ru:WarehousePerson | catWH_ru:Inspector">
		<xsl:if test="catWH_ru:LNP">
			<xsl:apply-templates select="catWH_ru:LNP"/> </xsl:if>
		<xsl:if test="cat_ru:PersonPost">
			<xsl:apply-templates select="cat_ru:PersonPost"/> </xsl:if>
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:apply-templates select="cat_ru:PersonName"/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
	</xsl:template>
	<xsl:template match="ca:GoodsQuantityByDocs | ca:GoodsQuantityByFact | ca:BruttoVolQuantByDocs | ca:BruttoVolQuantByFact | catWH_ru:BruttoVolQuant | catWH_ru:MeasureQuantity | catWH_ru:MpoBillBruttoVolQuant">
		<xsl:apply-templates select="catWH_ru:GoodsQuantity"/>
(<xsl:if test="catWH_ru:MeasureUnitQualifierName">
			<xsl:apply-templates select="catWH_ru:MeasureUnitQualifierName"/>/</xsl:if>
		<xsl:apply-templates select="catWH_ru:MeasureUnitQualifierCode"/>)
</xsl:template>
	<xsl:template match="//*[local-name()='CommercialAct']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
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
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_datetime">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text>   </xsl:text>
				<xsl:value-of select="substring($dateIn,12,8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_datetime">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_datetime">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
</xsl:stylesheet>
