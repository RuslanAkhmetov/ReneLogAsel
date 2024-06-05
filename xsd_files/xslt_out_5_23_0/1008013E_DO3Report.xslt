<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="catWH_ru cat_ru do3r" version="1.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.22.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:do3r="urn:customs.ru:Information:WarehouseDocuments:DO3Report:5.22.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="do3r:DO3Report">
		<html>
			<head>
				<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<title>DO3Report</title>
				<style type="text/css">
					@media print {
					  .page {
						-ms-transform: rotate(270deg);
						/* IE 9 */
						-webkit-transform: rotate(270deg);
						/* Chrome, Safari, Opera */
						transform: rotate(270deg);
						top: 1.5in;
						left: -1in;
					  }
					}
					
					body {	text-align: center; background: #cccccc; }
					table { border: 0; cellpadding: 0; cellspacing: 0; width:100%; border-collapse: collapse; }
					td { font-size: 9.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ padding-left:4pt }
					td.bold { font-size: 9.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: bottom; /*white-space: nowrap;*/ }					
					td.value { font-size: 8.0pt; font-family: Courier; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ }
					td.border-left { border-left: medium none; border-right: .5pt solid black; }
					td.border { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }
					td.border-left { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: medium none; } 
					td.border-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; } 
					td.border-top { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-bottom { border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; } 
					td.border-top-bottom { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; } 
					td.border-top-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-top-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }
					td.border-left-right-bottom { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-bottom { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-right { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; }
					span.bold { font-size: 10.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; }					
					span.valueMain {border-bottom: solid 1px black; font-family: Arial; font-style: italic; font-weight: bold; }
                    .value {border-bottom: solid 1px black; font-style: italic; font-family: Arial; text-valign: bottom; }
					div.page { /*width: 297mm; height: 210mm;*/ margin-top: 6pt; margin-bottom: 6pt; padding:5mm; padding-left:5mm; background: #ffffff; border: solid 1pt #000000; }
					p.number-date { font-weight: bold; }
					.bordered {border: solid 1pt #000000;}
					.underlined { border-bottom: solid 0.8pt #000000; }
					.graph { font-family: Arial; font-size: 7pt; }
					.graph-number { font-size: 9pt; font-weight: bold; }
					</style>
			</head>
			<body>
				<div class="page">
					<table border="0" cellpadding="3" cellspacing="0" style="width:297mm">
						<tr>
							<td style="width:297mm">
								<table border="0" cellpadding="3" cellspacing="0" style="width:297mm">
									<tbody>
										<!--Информация о СВХ (верхний левый угол)-->
										<tr>
											<td style="width:297mm">
												<table border="0" cellpadding="3" cellspacing="0" style="width:297mm">
													<tr>
														<td align="center" height="30mm" rowspan="3" style="width:160mm;border:solid 1pt #000000;">
															<b>Склад временного хранения </b>
															<u>
																<xsl:apply-templates select="do3r:WarehouseOwner/cat_ru:OrganizationName"/>
															</u>
															<br/>
															<b> Свидетельство о включении в реестр владельцев складов временного хранения от </b>
															<u>
																<xsl:if test="do3r:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateDate">
																	<xsl:apply-templates mode="russian_date" select="do3r:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateDate"/>
																</xsl:if>
															</u>
															<b> № </b>
															<u>
																<xsl:apply-templates select="do3r:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateNumber"/>
															</u>
															<br/>
															<span class="graph">(при хранении товаров в ином месте временного хранения указывается номер разрешения таможни)</span>
														</td>
														<td style="width:100mm"/>
														<td rowspan="1" style="width:23mm;border:solid 1pt #000000;">
															<b>Форма ДО3</b>
														</td>
													</tr>
													<tr/>
													<tr/>
												</table>
											</td>
										</tr>
										<br/>
										<br/>
										<!--Тело документа -->
										<tr>
											<td style="width:297mm">
												<table style="width:297mm">
													<tbody>
														<tr>
															<td align="center" style="width:297mm">
																<xsl:call-template name="DO3R_title"/>
																<br/>
																<br/>
															</td>
														</tr>
														<tr>
															<td style="width:250mm">
																<xsl:call-template name="DO3R"/>
																<br/>
																<br/>
															</td>
														</tr>
														<tr align="right">
															<td align="right" style="width:297mm">
																<xsl:call-template name="Signature"/>
																<br/>
																<br/>
															</td>
														</tr>
														<!--tr>
															<td>
																<xsl:call-template name="DO3Radd"/>
																<br/>
																<br/>
															</td>
														</tr>
														<tr align="right">
															<td align="right" style="width:180mm;">
																<xsl:call-template name="Signature"/>
															</td>
														</tr-->
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="DO3R">
		<table border="1" style="width:250mm">
			<tr>
				<td style="width:3mm">  </td>
				<td align="center" colspan="12" style="width:177mm">
					<b>Приход</b>
				</td>
				<td align="center" colspan="7" style="width:70mm">
					<b>Расход</b>
				</td>
			</tr>
			<tr>
				<!--1-->
				<td class="graph" style="width:3mm">№
								п/п</td>
				<!--2-->
				<td class="graph" style="width:11mm">Дата и время поме-щения на склад</td>
				<!--3-->
				<td class="graph" style="width:8mm">Номер отчета по форме ДО-1</td>
				<!--4-->
				<td class="graph" style="width:10mm">Поряд-ковый номер товаров в отч-ете по форме ДО-1</td>
				<!--5-->
				<td class="graph" style="width:18mm">Наиме-нование товара</td>
				<!--6-->
				<td class="graph" style="width:15mm">Вид дата и номер транспортного документа</td>
				<!--7-->
				<td class="graph" style="width:11mm">Склад-ской номер товара</td>
				<!--8-->
				<td class="graph" style="width:7mm">Коли-чество грузовых мест</td>
				<!--9-->
				<td class="graph" style="width:16mm">Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. еди-ницах из-мерения) </td>
				<!--10-->
				<td class="graph" style="width:15mm">Код товара в соответствии с ГС или ТН ВЭД ЕАЭС</td>
				<!--11-->
				<td class="graph" style="width:17mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td>
				<!--12-->
				<td class="graph" style="width:10mm">Буквенный код валюты</td>
				<!--13-->
				<td class="graph" style="width:12mm">Наиме-нование полу-чателя</td>
				<!--14-->
				<td class="graph" style="width:12mm">Дата и время выдачи товара со склада</td>
				<!--15-->
				<td class="graph" style="width:12mm">Номер отчета по форме ДО-2</td>
				<!--16-->
				<td class="graph" style="width:7mm">Коли-чество грузовых мест</td>
				<!--17-->
				<td class="graph" style="width:16mm">Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. еди-ницах из-мерения)</td>
				<!--18-->
				<td class="graph" style="width:17mm">Вес товара брутто (в кг) или объем товара (в куб.м), исключая контейнеры и другое транспортное оборудование</td>
				<!--19-->
				<td class="graph" style="width:17mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td>
				<!--20-->
				<td class="graph" style="width:17mm">Вид,дата и номер документа, по которому разрешена выдача то-варов со склада</td>
			</tr>
			<tr>
				<td align="center">1</td>
				<td align="center">2</td>
				<td align="center">3</td>
				<td align="center">4</td>
				<td align="center">5</td>
				<td align="center">6</td>
				<td align="center">7</td>
				<td align="center">8</td>
				<td align="center">9</td>
				<td align="center">10</td>
				<td align="center">11</td>
				<td align="center">12</td>
				<td align="center">13</td>
				<td align="center">14</td>
				<td align="center">15</td>
				<td align="center">16</td>
				<td align="center">17</td>
				<td align="center">18</td>
				<td align="center">19</td>
				<td align="center" style="width:17mm">20</td>
			</tr>
			<xsl:for-each select="do3r:DO3Goods/do3r:Goods">
				<xsl:variable name="Output">
					<xsl:if test="count(do3r:Output) &lt; 1">1</xsl:if>
					<xsl:if test="count(do3r:Output) &gt;= 1">
						<xsl:value-of select="count(do3r:Output)"/>
					</xsl:if>
				</xsl:variable>
				<tr>
					<!--1 №п/п-->
					<td class="graph" style="width:3mm">
						<xsl:attribute name="rowspan"><xsl:value-of select="$Output"/></xsl:attribute>
						<!--xsl:number value="position()"/-->
						<xsl:apply-templates select="do3r:Input/catWH_ru:GoodsNumber"/>
					</td>
					<!-- 2 Дата и время помещения на склад-->
					<td class="graph" style="width:11mm">
						<xsl:attribute name="rowspan"><xsl:value-of select="$Output"/></xsl:attribute>
						<xsl:apply-templates mode="russian_date" select="do3r:Input/do3r:KeepingLimit/do3r:AcceptDate"/>
						<br/>
						<xsl:apply-templates mode="russian_time" select="do3r:Input/do3r:KeepingLimit/do3r:AcceptTime"/>
					</td>
					<!--3 Номер отчета по форме ДО-1-->
					<td class="graph" style="width:8mm">
						<xsl:attribute name="rowspan"><xsl:value-of select="$Output"/></xsl:attribute>
						<xsl:apply-templates select="do3r:Input/do3r:DO1GoodLink/do3r:DO1Number"/>
                           от 
                           <xsl:apply-templates mode="russian_date" select="do3r:Input/do3r:DO1GoodLink/do3r:DO1Date"/>
					</td>
					<!--4 Порядковый номер товаров в отчете по форме ДО-1-->
					<td class="graph" style="width:10mm">
						<xsl:attribute name="rowspan"><xsl:value-of select="$Output"/></xsl:attribute>
						<xsl:apply-templates select="do3r:Input/do3r:DO1GoodLink/do3r:DO1GoodNumber"/>
					</td>
					<!--5 Наименование товара-->
					<td class="graph" style="width:18mm">
						<xsl:attribute name="rowspan"><xsl:value-of select="$Output"/></xsl:attribute>
						<xsl:apply-templates select="do3r:Input/catWH_ru:GoodsDescriptionFull/catWH_ru:GoodsDescription"/>
					</td>
					<!--6 вид дата и номер транспортного документа-->
					<td class="graph" style="width:15mm">
						<xsl:attribute name="rowspan"><xsl:value-of select="$Output"/></xsl:attribute>
						<xsl:apply-templates select="do3r:Input/do3r:TransportDocument/cat_ru:PrDocumentName"/>
										№<xsl:apply-templates select="do3r:Input/do3r:TransportDocument/cat_ru:PrDocumentNumber"/>
										от<xsl:apply-templates mode="russian_date" select="do3r:Input/do3r:TransportDocument/cat_ru:PrDocumentDate"/>
					</td>
					<!--7 складской номер-->
					<td class="graph" style="width:11mm">
						<xsl:attribute name="rowspan"><xsl:value-of select="$Output"/></xsl:attribute>
						<xsl:apply-templates select="do3r:Input/do3r:GoodsWHNumber"/>
					</td>
					<!--8 Количество грузовых мест -->
					<td class="graph" style="width:7mm">
						<xsl:attribute name="rowspan"><xsl:value-of select="$Output"/></xsl:attribute>
						<xsl:apply-templates select="do3r:Input/catWH_ru:CargoPlace/catWH_ru:PlaceNumber"/>
					</td>
					<!--9  Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения)-->
					<td class="graph" style="width:16mm">
						<xsl:attribute name="rowspan"><xsl:value-of select="$Output"/></xsl:attribute>
						<xsl:apply-templates select="do3r:Input/catWH_ru:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="do3r:Input/catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="do3r:Input/catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
						<br/>
						<xsl:apply-templates select="do3r:Input/catWH_ru:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="do3r:Input/catWH_ru:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="do3r:Input/catWH_ru:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
					</td>
					<!--10 Код товара ГС или ТН ВЭД ЕАЭС-->
					<td class="graph" style="width:15mm">
						<xsl:attribute name="rowspan"><xsl:value-of select="$Output"/></xsl:attribute>
						<xsl:apply-templates select="do3r:Input/catWH_ru:GoodsTNVEDCode"/>
					</td>
					<!--11  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
					<td class="graph" style="width:17mm">
						<xsl:attribute name="rowspan"><xsl:value-of select="$Output"/></xsl:attribute>
						<xsl:apply-templates select="do3r:Input/catWH_ru:InvoiceCost"/>
					</td>
					<!--12 Буквенный код валюты-->
					<td class="graph" style="width:10mm">
						<xsl:attribute name="rowspan"><xsl:value-of select="$Output"/></xsl:attribute>
						<xsl:apply-templates select="do3r:Input/catWH_ru:CurrencyCode"/>
					</td>
					<!--13 Наименование получателя-->
					<td class="graph" style="width:12mm">
						<xsl:attribute name="rowspan"><xsl:value-of select="$Output"/></xsl:attribute>
						<xsl:apply-templates select="do3r:Input/do3r:Recipient/cat_ru:OrganizationName"/>
					</td>
					<!--14 Дата окончания временного хранения-->
					<!--td class="graph" style="width:12mm">
						<xsl:attribute name="rowspan"><xsl:value-of select="$Output"/></xsl:attribute>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="do3r:Input/do3r:KeepingLimit/do3r:DeadLineDate"/>
						</xsl:call-template>
					</td-->
					<!-- Вызов шаблона для расхода гр.14-гр.20-->
					<xsl:call-template name="DO3_Output">
						<xsl:with-param name="outputNode" select="do3r:Output[1]"/>
					</xsl:call-template>
				</tr>
				<xsl:for-each select="do3r:Output">
					<xsl:if test="position()!=1">
						<tr>
							<xsl:call-template name="DO3_Output">
								<xsl:with-param name="outputNode" select="."/>
							</xsl:call-template>
						</tr>
					</xsl:if>
				</xsl:for-each>
			</xsl:for-each>
		</table>
		<xsl:apply-templates select="do3r:EmptyGoodsFlag"/>
	</xsl:template>
	<xsl:template name="DO3_Output">
		<xsl:param name="outputNode"/>
		<!--14 Дата и время выдачи товара со склада-->
		<td class="graph" style="width:12mm">
			<xsl:apply-templates mode="russian_date" select="$outputNode/do3r:OutputDate"/>
			<br/>
			<xsl:apply-templates mode="russian_time" select="$outputNode/do3r:OutputTime"/>
		</td>
		<!--15 Номер отчета по форме ДО-2-->
		<td class="graph" style="width:12mm">
			<xsl:apply-templates select="$outputNode/do3r:DO2GoodLink/do3r:DO2Number"/>
		</td>
		<!--16 Количество грузовых мест -->
		<td class="graph" style="width:17mm">
			<xsl:apply-templates select="$outputNode/do3r:CargoPlace/catWH_ru:PlaceNumber"/>
		</td>
		<!--17 Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения)-->
		<td class="graph" style="width:16mm">
			<xsl:choose>
				<xsl:when test="$outputNode/do3r:BruttoVolQuant">
					<xsl:apply-templates select="$outputNode/do3r:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
					<xsl:apply-templates select="$outputNode/do3r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
					<xsl:apply-templates select="$outputNode/do3r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="$outputNode/do3r:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
					<xsl:apply-templates select="$outputNode/do3r:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
					<xsl:apply-templates select="$outputNode/do3r:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
				</xsl:otherwise>
			</xsl:choose>
		</td>
		<!--18  Вес товара брутто (в кг) или объем товара (в куб.м), исключая контейнеры и другое транспортное оборудование -->
		<td class="graph" style="width:17mm">
			<xsl:apply-templates select="$outputNode/do3r:BruttoVolQuant2/catWH_ru:GoodsQuantity"/> 
			<xsl:apply-templates select="$outputNode/do3r:BruttoVolQuant2/catWH_ru:MeasureUnitQualifierName"/> 
			<xsl:apply-templates select="$outputNode/do3r:BruttoVolQuant2/catWH_ru:MeasureUnitQualifierCode"/>
		</td>
		<!--19  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
		<td class="graph" style="width:17mm">
			<xsl:apply-templates select="$outputNode/do3r:Cost"/> 
			<xsl:apply-templates select="$outputNode/do3r:CurrencyCode"/>
		</td>
		<!--20 Вид,дата и номер документа, по которому разрешена выдача товаров со склада-->
		<td class="graph" style="width:17mm">
			<xsl:apply-templates select="$outputNode/do3r:OrderCustDoc/cat_ru:PrDocumentName"/>
			<br/>
			<xsl:apply-templates select="$outputNode/do3r:OrderCustDoc/cat_ru:PrDocumentNumber"/>
			<br/>
			<xsl:apply-templates mode="russian_date" select="$outputNode/do3r:OrderCustDoc/cat_ru:PrDocumentDate"/>
		</td>
	</xsl:template>
	<xsl:template name="DO3R_title">
		<table width="270mm">
			<tbody>
				<tr align="center">
					<td>
						<b>Отчетность по разовому требованию таможенного органа от </b>
						<u>
							<xsl:apply-templates mode="russian_date" select="do3r:ReportDate"/>
						</u>
						<b> № </b>
						<u>
							<xsl:apply-templates select="do3r:ReportNumber"/> </u>
						
					 <br/>
						<b>о товарах, помещенных на склад и выданных с него</b>
						<br/>
						<b>c</b> <u>
							<xsl:apply-templates mode="russian_date" select="do3r:ReportBegingDate"/>
							</u>
						<b> по </b>
					 <u>
							<xsl:apply-templates mode="russian_date" select="do3r:ReportEndDate"/>
						</u>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="DO3Radd">
		<tr>
			<td align="center">
				<b>Добавочный лист №</b>
				<u>
					<xsl:apply-templates select="do3r:AddedListNumber"/>
					<xsl:text> </xsl:text>
				</u>
				<b>к отчетности по разовому требованию таможенного органаот</b>
				<u>
					<xsl:apply-templates select="catWH_ru:ReportDate"/>
					<xsl:text> </xsl:text>
				</u>
				<b> №</b>
				<u>
					<xsl:apply-templates select="catWH_ru:ReportNumber"/>
					<xsl:text> </xsl:text>
				</u>
				<b>о товарах, помещенных на склад и выданных с него</b>
				<b>c</b> <u>
					<xsl:apply-templates mode="russian_date" select="do3r:ReportBegingDate"/>
					 </u>
				<b>по</b>
					 <u>
					<xsl:apply-templates mode="russian_date" select="do3r:ReportEndDate"/>
				</u>
				<br/>
				<br/>
			</td>
		</tr>
		<br/>
		<tr>
			<td>
				<table width="270mm">
					<tbody>
						<tr>
							<td>
								<table border="1" width="250mm">
									<tr>
										<td>  </td>
										<td align="center" colspan="13">
											<b>Приход</b>
										</td>
										<td align="center" colspan="5">
											<b>Расход</b>
										</td>
									</tr>
									<tr>
										<!--1-->
										<td style="width:5mm">№п/п</td>
										<!--2-->
										<td style="width:11mm">Дата и время поме-щения на склад</td>
										<!--3-->
										<td style="width:8mm">Номер отчета по форме ДО-1</td>
										<!--4-->
										<td style="width:10mm">Поряд-ковый номер товаров в отч-ете по форме ДО-1</td>
										<!--5-->
										<td style="width:18mm">Наиме-нование товара</td>
										<!--6-->
										<td style="width:15mm">Вид дата и номер транспортного документа</td>
										<!--7-->
										<td style="width:11mm">Склад-ской номер товара</td>
										<!--8-->
										<td style="width:7mm">Коли-чество грузовых мест</td>
										<!--9-->
										<td style="width:16mm">Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. еди-ницах из-мерения) </td>
										<!--10-->
										<td style="width:15mm">Код товара в соответствии с ГС или ТН ВЭД ЕАЭС</td>
										<!--11-->
										<td style="width:17mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td>
										<!--12-->
										<td style="width:10mm">Буквенный код валюты</td>
										<!--13-->
										<td style="width:12mm">Наиме-нование полу-чателя</td>
										<!--14-->
										<td style="width:12mm">Дата истечения срока временного хранения</td>
										<!--15-->
										<td style="width:12mm">Дата и время выдачи товара со склада</td>
										<!--16-->
										<td style="width:7mm">Коли-чество грузовых мест</td>
										<!--17-->
										<td style="width:16mm">Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. еди-ницах из-мерения) </td>
										<!--18-->
										<td style="width:17mm">Стоимость товара в валюте указанной в транспортных или коммерческих документах</td>
										<!--19-->
										<td style="width:17mm">Вид,дата и номер документа, по которому разрешена выдача то-варов со склада</td>
									</tr>
									<tr>
										<td align="center">1</td>
										<td align="center">2</td>
										<td align="center">3</td>
										<td align="center">4</td>
										<td align="center">5</td>
										<td align="center">6</td>
										<td align="center">7</td>
										<td align="center">8</td>
										<td align="center">9</td>
										<td align="center">10</td>
										<td align="center">11</td>
										<td align="center">12</td>
										<td align="center">13</td>
										<td align="center">14</td>
										<td align="center">15</td>
										<td align="center">16</td>
										<td align="center">17</td>
										<td align="center">18</td>
										<td align="center">19</td>
									</tr>
									<xsl:for-each select="do3r:Goods">
										<tr>
											<!--1 №п/п-->
											<td>
												<xsl:number value="position()"/>
											</td>
											<!-- 2 Дата и время помещения на склад-->
											<td>
												<xsl:apply-templates mode="russian_date" select="do3r:Input/do3r:KeepingLimit/do3r:AcceptDate"/>
												<br/>
												<xsl:apply-templates mode="russian_time" select="do3r:Input/do3r:KeepingLimit/do3r:AcceptTime"/>
											</td>
											<!--3 Номер отчета по форме ДО-1-->
											<td>
												<xsl:apply-templates select="do3r:Input/do3r:DO1GoodLink/do3r:DO1Number"/>
                                 	от 
                                 	<xsl:apply-templates mode="russian_date" select="do3r:Input/do3r:DO1GoodLink/do3r:DO1Date"/>
											</td>
											<!--4 Порядковый номер товаров в отчете по форме ДО-1-->
											<td>
												<xsl:apply-templates select="do3r:Input/do3r:DO1GoodLink/do3r:DO1GoodNumber"/>
											</td>
											<!--5 Наименование товара-->
											<td>
												<xsl:apply-templates select="do3r:Input/catWH_ru:GoodsDescriptionFull/catWH_ru:GoodsDescription"/>
											</td>
											<!--6 вид дата и номер транспортного документа-->
											<td>
												<xsl:apply-templates select="do3r:Input/do3r:TransportDocument/cat_ru:PrDocumentName"/>
										№ <xsl:apply-templates select="do3r:Input/do3r:TransportDocument/cat_ru:PrDocumentNumber"/>
										от<xsl:apply-templates mode="russian_date" select="do3r:Input/do3r:TransportDocument/cat_ru:PrDocumentDate"/>
											</td>
											<!--7 складской номер-->
											<td>
												<xsl:apply-templates select="do3r:Input/do3r:GoodsWHNumber"/>
											</td>
											<!--8 Количество грузовых мест -->
											<td>
												<xsl:apply-templates select="do3r:Input/catWH_ru:CargoPlace/catWH_ru:PlaceNumber"/>
											</td>
											<!--9  Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения)-->
											<td>
												<xsl:apply-templates select="do3r:Input/catWH_ru:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="do3r:Input/catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="do3r:Input/catWH_ru:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
												<br/>
												<xsl:apply-templates select="do3r:Input/catWH_ru:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="do3r:Input/catWH_ru:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="do3r:Input/catWH_ru:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
											</td>
											<!--10 Код товара ГС или ТН ВЭД ЕАЭС-->
											<td>
												<xsl:apply-templates select="do3r:Input/catWH_ru:GoodsTNVEDCode"/>
											</td>
											<!--11  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
											<td>
												<xsl:apply-templates select="do3r:Input/catWH_ru:InvoiceCost"/>
											</td>
											<!--12 Буквенный код валюты-->
											<td>
												<xsl:apply-templates select="do3r:Input/catWH_ru:CurrencyCode"/>
											</td>
											<!--13 Наименование получателя-->
											<td>
												<xsl:apply-templates select="do3r:Input/do3r:Recipient/cat_ru:OrganizationName"/>
											</td>
											<!--14 Дата окончания временного хранения-->
											<td>
												<xsl:apply-templates mode="russian_date" select="do3r:Input/do3r:KeepingLimit/do3r:DeadLineDate"/>
											</td>
											<!--15 Дата и время выдачи товара со склада-->
											<td>
												<xsl:apply-templates mode="russian_date" select="do3r:Output/do3r:OutputDate"/>
												<br/>
												<xsl:apply-templates mode="russian_time" select="do3r:Output/do3r:OutputTime"/>
											</td>
											<!--16 Количество грузовых мест -->
											<td>
												<xsl:apply-templates select="do3r:Output/do3r:CargoPlace/catWH_ru:PlaceNumber"/>
											</td>
											<!--17 Вес товара брутто (в кг) или объем товара (в куб.м) (либо в доп. единицах измерения)-->
											<td>
												<xsl:apply-templates select="do3r:Output/do3r:BruttoVolQuant/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="do3r:Output/do3r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="do3r:Output/do3r:BruttoVolQuant/catWH_ru:MeasureUnitQualifierCode"/>
												<br/>
												<xsl:apply-templates select="do3r:Output/do3r:MeasureQuantity/catWH_ru:GoodsQuantity"/> 
						<xsl:apply-templates select="do3r:Output/do3r:MeasureQuantity/catWH_ru:MeasureUnitQualifierName"/> 
						<xsl:apply-templates select="do3r:Output/do3r:MeasureQuantity/catWH_ru:MeasureUnitQualifierCode"/>
											</td>
											<!--18  Стоимость товара в валюте указанной в транспортных или коммерческих документах-->
											<td>
												<xsl:apply-templates select="do3r:Output/do3r:Cost"/> 
						<xsl:apply-templates select="do3r:Output/do3r:CurrencyCode"/>
											</td>
											<!--19 Вид,дата и номер документа, по которому разрешена выдача товаров со склада-->
											<td>
												<xsl:apply-templates select="do3r:Output/do3r:OrderCustDoc/cat_ru:PrDocumentName"/>
												<br/>
												<xsl:apply-templates select="do3r:Output/do3r:OrderCustDoc/cat_ru:PrDocumentNumber"/>
												<br/>
												<xsl:apply-templates mode="russian_date" select="do3r:Output/do3r:OrderCustDoc/cat_ru:PrDocumentDate"/>
											</td>
										</tr>
									</xsl:for-each>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="SignatureAndSheets">
		<table width="250mm">
			<tr>
				<td style="width:135mm">Количество добавочных листов отчета
					<xsl:apply-templates select="do3r:AddedListsCount"/>
				</td>
				<td>
					<xsl:apply-templates mode="russian_date" select="catWH_ru:ReportDate"/>
				</td>
				<td>
					<xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonSurname"/> 
					<xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonName"/> 
					<xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonMiddleName"/> 
					<xsl:apply-templates select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonPost"/> 
				</td>
			</tr>
			<tr align="right">
				<td/>
				<td>(дата)
				</td>
				<td>(подпись, инициалы, фамилия, и должность уполномоченного работника склада)
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="Signature">
		<table width="250mm">
			<!--tr align="right">
					<td style="width:185mm">
					</td>
					<td>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="catWH_ru:ReportDate"/>
						</xsl:call-template>
					</td>
					<td>
						<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonSurname"/>&#160;
						<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonName"/>&#160;
						<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonMiddleName"/>&#160;
						<xsl:value-of select="catWH_ru:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonPost"/>&#160;
					</td>
				</tr>
				<tr  align="right">
					<td>
					</td>
					<td>(дата)
					</td>
					<td>(подпись, инициалы, фамилия, и должность уполномоченного работника склада)
					</td>
				</tr-->
			<tbody>
				<tr>
					<td align="center" class="underlined">
						<xsl:apply-templates mode="russian_date" select="do3r:ReportDate"/>
					</td>
					<td align="center" class="underlined">
						<xsl:apply-templates select="do3r:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonName"/>
						<xsl:text> </xsl:text> 
						<xsl:apply-templates select="do3r:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonMiddleName"/>
						<xsl:text> </xsl:text> 
						<xsl:apply-templates select="do3r:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonSurname"/> 
						<xsl:if test="do3r:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonPost">
							<xsl:apply-templates select="do3r:WarehouseOwner/catWH_ru:WarehousePerson/cat_ru:PersonPost"/> 
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td align="center" class="graph">(дата)</td>
					<td align="center" class="graph">(подпись, инициалы, фамилия и должность уполномоченного работника склада)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="do3r:EmptyGoodsFlag">
		<table>
			<tbody>
				<tr>
					<td>
						<strong>В запрошенный период на складе не находилось товаров, принятых по указанному разрешительному документу <xsl:apply-templates select="../do3r:WarehouseOwner/catWH_ru:WarehouseLicense/catWH_ru:CertificateNumber"/></strong>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="//*[local-name()='DO3Report']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
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
	<xsl:template match="*" mode="russian_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="substring(., 1, 8)"/>
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
</xsl:stylesheet>
