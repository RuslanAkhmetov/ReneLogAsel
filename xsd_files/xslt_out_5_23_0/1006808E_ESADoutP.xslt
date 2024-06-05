<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru catESAD_cu" version="1.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:soup="urn:customs.ru:Information:CustomsDocuments:ESADoutP:5.22.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="//*[local-name()='ESADoutP']//*" priority="-1">
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
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="soup:ESADoutP">
		<xsl:param name="k" select="1"/>
		<html>
			<head>
				<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<title>Предварительное уведомление о декларировании товаров</title>
				<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
							
						div.page {
							width: {210}mm;
							height: {297}mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	5mm;
							padding-left:	5mm;
							background: #ffffff;
							border: solid 1pt #000000;
							}
						
						div.goods {
							background: #ffffff;
							}
							
						.bordered {
							border: solid 1pt #000000;
							padding-top:4pt;
							padding-bottom:4pt;
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
							
						.underlined {
							border-bottom: solid 0.8pt #000000;
							}
							
						p.NumberDate {
							font-weight: bold;
							}
							
						.graph {
							font-family: Arial;
							font-size: 9pt;
							}
						.graphColumn {
							font-family: Arial;
							font-size: 9pt;
							}
						.graphTitleIt {
							font-family: Arial;
							font-size: 9pt;
							font-weight: italian;
							}
						td {
							font-family:Courier;
							}
		
						.graphMain {
							font-family: Arial;
							font-size: 11pt;
							font-weight: bold;
							}
							
						.graphMain8 {
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
								
						.graphNum {
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
							
						.graphNo {
							font-size: 9pt;
							font-weight: bold;
							}
					</style>
			</head>
			<body>
				<xsl:variable name="background_cell">
					<xsl:choose>
						<xsl:when test="soup:UTK">
							<xsl:choose>
								<xsl:when test="soup:UTK='1' or soup:UTK='true' or soup:UTK='t' or soup:UTK='True' or soup:UTK='TRUE'">green</xsl:when>
								<xsl:otherwise>red</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>#ffffff</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="color_cell">
					<xsl:choose>
						<xsl:when test="soup:UTK">yellow</xsl:when>
						<xsl:otherwise>windowtext</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<div class="page">
					<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
						<tbody>
							<tr>
								<td class="graphMain" style="width:{83}mm;">
									<xsl:choose>
										<xsl:when test="soup:ESADGoodsShipmentP/soup:ConsignmentIdentifier">
											<xsl:text>Таможенная информация иностранного государства</xsl:text>
										</xsl:when>
										<xsl:otherwise>РОССИЙСКАЯ ФЕДЕРАЦИЯ</xsl:otherwise>
									</xsl:choose>
								</td>
								<td style="width:{26.4}mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td class="graph" style="width:{50.6}mm;border-left:solid 0.8pt #000000;" valign="top">А ТАМОЖЕННЫЙ ОРГАН ОТПРАВЛЕНИЯ/ЭКСПОРТА</td>
							</tr>
							<tr>
								<td class="graphMain" style="width:{83}mm; background:{$background_cell}; color:{$color_cell};">
									<xsl:choose>
										<xsl:when test="not(soup:ESADGoodsShipmentP/soup:ConsignmentIdentifier)">ПРЕДВАРИТЕЛЬНАЯ ИНФОРМАЦИЯ В ЦЕЛЯХ ДЕКЛАРИРОВАНИЯ ТОВАРОВ
                           </xsl:when>
									</xsl:choose>
									<!--xsl:if test="soup:COMPLECTBL= 1">ТД1/ТД2</xsl:if>
							<xsl:if test="soup:COMPLECTBL =3">ТД3/ТД4</xsl:if-->
									<br/>
									<xsl:if test="soup:PI_URN">Уникальный идентификатор предварительной информации: <xsl:apply-templates select="soup:PI_URN"/>
									</xsl:if>
									<br/>
									<xsl:if test="soup:ESADGoodsShipmentP/soup:ConsignmentIdentifier">Уникальный номер перевозки: <xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ConsignmentIdentifier"/>
										<xsl:if test="soup:UTK">
											<br/>
										</xsl:if>
									</xsl:if>
									<xsl:if test="soup:UTK">
										<xsl:choose>
											<xsl:when test="soup:UTK='1' or soup:UTK='true' or soup:UTK='t' or soup:UTK='True' or soup:UTK='TRUE'">Предоставление ПИ для упрощенного таможенного коридора</xsl:when>
											<xsl:otherwise>Предоставление ПИ НЕ для упрощенного таможенного коридора</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
								</td>
								<td class="graph" style="width:{26.4}mm;border-top:solid 2pt #000000;border-left:solid 2pt #000000;border-right:solid 2pt #000000;">
									<span class="graphNo">1 </span>
									<span class="graph">ДЕКЛАРАЦИЯ</span>
								</td>
								<td class="graph" rowspan="3" style="width:{50.6}mm;border-left:solid 0pt #000000;border-bottom:solid 0.8pt #000000;" valign="top">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr valign="top">
								<!--td align="center" class="graphNum" style="width:17mm;border:solid 1.5pt #000000;">1</td-->
								<td rowspan="3" style="width:{83}mm;border:solid 0.8pt #000000;">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tbody>
											<tr valign="top">
												<td class="graph" style="width:{35}mm;">
													<span class="graphNo">2 </span>
													<span class="graph">Отправитель/</span>
													<span class="graphTitleIt">Экспортер</span>
												</td>
												<td class="graph" style="width:{31}mm;">
													<!--xsl:text>№ </xsl:text>
													<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutConsignorP/cat_ru:RBOrganizationFeatures/cat_ru:UNP">
														<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutConsignorP/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
													</xsl:if>
													<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutConsignorP/cat_ru:RKOrganizationFeatures/cat_ru:BIN">
														<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutConsignorP/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
													</xsl:if>
													<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutConsignorP/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
														<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutConsignorP/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
													</xsl:if>
													<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutConsignorP/cat_ru:RFOrganizationFeatures/cat_ru:INN">
														<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutConsignorP/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
													</xsl:if>
													<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutConsignorP/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
														<xsl:text> / </xsl:text>
														<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutConsignorP/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
													</xsl:if-->
												</td>
											</tr>
											<tr>
												<td class="graph" colspan="2" style="width:{86}mm;">
													<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutConsignorP">
														<xsl:apply-templates mode="org" select="soup:ESADGoodsShipmentP/soup:ESADoutConsignorP"/>
													</xsl:if>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td style="width:{26.4}mm;border-left:solid 2pt #000000;border-right:solid 2pt #000000;">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tbody>
											<tr>
												<td align="center" class="graph" rowspan="2" style="width:{8.8}mm;border-right:solid 0.8pt #000000;border-bottom:solid 2pt #000000;">
													<xsl:apply-templates select="soup:CustomsProcedure"/>
												</td>
												<td align="center" class="graph" rowspan="2" style="width:{4.4}mm;border-bottom:solid 2pt #000000;">
													<xsl:choose>
														<xsl:when test="soup:CustomsModeCode!=''">
															<xsl:apply-templates select="soup:CustomsModeCode"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td align="center" class="graph" rowspan="2" style="width:{13.2}mm;border-left:solid 0.8pt #000000;border-bottom:solid 2pt #000000;"/>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<!--td rowspan="10" style="width:{17}mm;border-bottom:solid 1.5pt #000000;border-left:solid 1.5pt #000000;border-right:solid 1.5pt #000000;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td-->
								<td style="width:{43.4}mm;border:solid 0.8pt #000000;">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tbody>
											<tr valign="top">
												<td class="graph" colspan="2" style="width:{13.2}mm;border-right:solid 0.8pt #000000;">
													<span class="graphNo">3 </span>
													<span class="graph">Формы</span>
												</td>
												<td class="graph" rowspan="2" style="width:{13.2}mm;border-left:solid 0.8pt #000000;">
													<span class="graphNo">4 </span>
													<span class="graph">Отгр. спец.</span>
													<br/>
												</td>
											</tr>
											<tr valign="top">
												<td align="center" class="graph" style="width:{6.6}mm;border-right:solid 0.8pt #000000;">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="graph" style="width:{6.6}mm;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="width:{94}mm;border:solid 0.8pt #000000;">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tbody>
											<tr valign="top">
												<td align="center" class="graph" style="width:{13.2}mm;border-right:solid 0.8pt #000000;">
													<span class="graphNo">5 </span>
													<span class="graph">Всего т-ов</span>
													<br/>
													<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:TotalGoodsNumber"/>
												</td>
												<td align="center" class="graph" style="width:{18.4}mm;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;">
													<span class="graphNo">6 </span>
													<span class="graph">Всего мест</span>
													<br/>
													<xsl:choose>
														<xsl:when test="soup:ESADGoodsShipmentP/soup:TotalPackageNumber!=''">
															<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:TotalPackageNumber"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<xsl:if test="soup:ESADGoodsShipmentP/soup:TotalGrossWeight">
													<td class="graph" style="width:{22.7}mm;border-left:solid 0.8pt #000000;">
														<span class="graphNo"/>
														<span class="graph">Общий вес товара брутто (кг)</span>
														<br/>
														<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:TotalGrossWeight"/>
														<!--xsl:value-of select="soup:DeclarationKind"/-->
													</td>
												</xsl:if>
												<td class="graph" style="width:{22.7}mm;border-left:solid 0.8pt #000000;">
													<span class="graphNo">7 </span>
													<span class="graph">Справочный номер</span>
													<br/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<!--xsl:value-of select="soup:DeclarationKind"/-->
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr valign="top">
								<td rowspan="2" style="width:{83}mm;border:solid 0.8pt #000000;">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tbody>
											<tr>
												<td class="graph" style="width:{35}mm;">
													<span class="graphNo">8 </span>
													<span class="graph">Получатель</span>
												</td>
												<td class="graph" style="width:{31}mm;">
													<!--xsl:text>№ </xsl:text>
													<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutConsigneeP/cat_ru:RBOrganizationFeatures/cat_ru:UNP">
														<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutConsigneeP/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
													</xsl:if>
													<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutConsigneeP/cat_ru:RKOrganizationFeatures/cat_ru:BIN">
														<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutConsigneeP/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
													</xsl:if>
													<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutConsigneeP/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
														<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutConsigneeP/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
													</xsl:if>
													<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutConsigneeP/cat_ru:RFOrganizationFeatures/cat_ru:INN">
														<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutConsigneeP/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
													</xsl:if>
													<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutConsigneeP/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
														<xsl:text> / </xsl:text>
														<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutConsigneeP/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
													</xsl:if-->
												</td>
											</tr>
											<tr>
												<td class="graph" colspan="2" style="width:{66}mm;">
													<xsl:apply-templates mode="org" select="soup:ESADGoodsShipmentP/soup:ESADoutConsigneeP"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td class="graph" colspan="2" style="width:{77}mm;border:solid 0.8pt #000000;" valign="top">
									<span class="graphNo">9 </span>
									<span class="graph">Лицо, ответственное за финансовое урегулирование N </span>
									<br/>
									<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutFinAdjustRespPersonP">
										<xsl:for-each select="soup:ESADGoodsShipmentP/soup:ESADoutFinAdjustRespPersonP">
											<!--xsl:choose>
												<xsl:when test="ESADout_CU:DeclarantEqualFlag='1' or ESADout_CU:DeclarantEqualFlag='True' or ESADout_CU:DeclarantEqualFlag='true' or ESADout_CU:DeclarantEqualFlag='t'">
													<br/>СМ. ГРАФУ 14 ДТ</xsl:when>
												<xsl:otherwise-->
											<xsl:apply-templates mode="org" select="."/>
											<!--/xsl:otherwise>
											</xsl:choose-->
										</xsl:for-each>
									</xsl:if>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr valign="top">
								<td colspan="2" style="width:{77}mm;border:solid 0.8pt #000000;">
									<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
										<tbody>
											<tr valign="top">
												<td class="graph" colspan="2" style="width:{15.4}mm;border-left:solid 1.5pt #000000;">
													<span class="graphNo">10 </span>
													<span class="graph">Страна первого</span>
												</td>
												<td class="graph" colspan="2" style="width:{16.2}mm;border-left:solid 2pt #000000;border-right:solid 0.8pt #000000;">
													<span class="graphNo">11 </span>
													<span class="graph">Торг. страна</span>
												</td>
												<td class="graph" rowspan="2" style="width:{33.6}mm;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;">
													<span class="graphNo">12 </span>
													<span class="graph">Сведения о стоимости</span>
													<br/>
													<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:TotalCustCost"/>
												</td>
												<td class="graph" rowspan="2" style="width:{11.8}mm;border-left:solid 0.8pt #000000;">
													<span class="graphNo">13 </span>
													<span class="graph">ЕСП</span>
												</td>
											</tr>
											<tr>
												<td align="center" class="graph" style="width:{8.8}mm;border-left:solid 1.5pt #000000;border-right:solid 2pt #000000;border-bottom:solid 1.5pt #000000;">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td class="graph" style="width:{6.6}mm;">
													<span class="graph">назнач.</span>
												</td>
												<td align="center" class="graph" style="width:{8.8}mm;border-bottom:solid 1.5pt #000000;border-left:solid 2pt #000000;border-right:solid 2pt #000000;">
													<xsl:choose>
														<xsl:when test="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:TradeCountryCode!=''">
															<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:TradeCountryCode"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="graph" style="width:{7.4}mm;border-right:solid 0.8pt #000000;">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr valign="top">
								<td rowspan="2" style="width:{83}mm;border:solid 0.8pt #000000;">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tbody>
											<tr>
												<td class="graph" style="width:{35}mm;">
													<span class="graphNo">14 </span>
													<span class="graph">Декларант/Представитель</span>
												</td>
												<td class="graph" style="width:{31}mm;">
													<!--xsl:text>№ </xsl:text>
													<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/cat_ru:RBOrganizationFeatures/cat_ru:UNP">
														<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
													</xsl:if>
													<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/cat_ru:RKOrganizationFeatures/cat_ru:BIN">
														<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
													</xsl:if>
													<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
														<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
													</xsl:if>
													<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/cat_ru:RFOrganizationFeatures/cat_ru:INN">
														<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
													</xsl:if>
													<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
														<xsl:text> / </xsl:text>
														<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
													</xsl:if-->
												</td>
											</tr>
											<tr valign="top">
												<td class="graph" colspan="2" style="width:{66}mm;">
													<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP">
														<xsl:apply-templates mode="org" select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP"/>
													</xsl:if>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td colspan="2" style="width:{77}mm;border:solid 0.8pt #000000;" valign="top">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tbody>
											<tr valign="top">
												<td class="graph" style="width:{30.4}mm;">
													<span class="graphNo">15 </span>
													<span class="graph">Страна отправления/</span>
													<span class="graphTitleIt">экспорта</span>
													<br/>
													<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:DispatchCountryName"/>
												</td>
												<td class="graph" style="width:{21.8}mm;border-left:solid 2pt #000000;border-right:solid 2pt #000000;border-bottom:solid 1.5pt #000000;">
													<span class="graphNo">15 </span>
													<span class="graph">Код страны отпр./</span>
													<span class="graphTitleIt">эксп.</span>
													<br/>
													<xsl:choose>
														<xsl:when test="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:DispatchCountryCode!=''">
															<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:DispatchCountryCode"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="graph" style="width:{24.8}mm;border-bottom:solid 1.5pt #000000;">
													<span class="graphNo">17 </span>
													<span class="graph">Код страны назнач.</span>
													<br/>
													<xsl:choose>
														<xsl:when test="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:DestinationCountryCode!=''">
															<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:DestinationCountryCode"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="width:{77}mm;border:solid 0.8pt #000000;" valign="top">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tbody>
											<tr valign="top">
												<td class="graph" style="width:{30.4}mm;border-right:solid 0.8pt #000000;">
													<span class="graphNo">16 </span>
													<span class="graph">Страна происхождения</span>
													<br/>
													<xsl:if test="soup:ESADGoodsShipmentP/soup:OriginCountryName!=''">
														<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:OriginCountryName"/>
													</xsl:if>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td class="graph" style="width:{46.6}mm;border-left:solid 0.8pt #000000;">
													<span class="graphNo">17 </span>
													<span class="graph">Страна назначения</span>
													<br/>
													<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:DestinationCountryName!=''">
														<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:DestinationCountryName"/>
													</xsl:if>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<xsl:if test="soup:ESADGoodsShipmentP/soup:ConfirmingOrganization or soup:ESADGoodsShipmentP/soup:TransportDocument or soup:ESADGoodsShipmentP/soup:ESADoutCarrierP">
									<td align="justify" class="graph" colspan="3" style="width:{143}mm; border:solid 0.8pt #000000;">
										<xsl:for-each select="soup:ESADGoodsShipmentP/soup:ConfirmingOrganization">
											<span class="graphMain8">
												<xsl:choose>
													<xsl:when test="soup:OrganizationSign='0'">Удостоверяющий с иностранной стороны</xsl:when>
													<xsl:otherwise>Удостоверяющий с российской стороны</xsl:otherwise>
												</xsl:choose>
											</span>: дата отправления информации
								<!--<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="soup:Date"/>
											</xsl:call-template>-->
											<xsl:apply-templates select="soup:Date" mode="date"/>, 
						        <xsl:apply-templates select="soup:OrganizationName"/>
											<xsl:if test="soup:SenderName"> (<xsl:apply-templates select="soup:SenderName/soup:PersonName"/>
												<xsl:if test="soup:SenderName/soup:PersonPost">,<xsl:apply-templates select="soup:SenderName/soup:PersonPost"/>
												</xsl:if>  
						        )</xsl:if>
											<br/>
										</xsl:for-each>
										<xsl:if test="soup:ESADGoodsShipmentP/soup:TransportDocument">
											<span class="graphMain8">Информация о транспортных документах:</span>
											<br/>
										</xsl:if>
										<xsl:for-each select="soup:ESADGoodsShipmentP/soup:TransportDocument">
											<xsl:value-of select="position()"/>.
								<xsl:if test="cat_ru:PrDocumentName">
												<xsl:apply-templates select="cat_ru:PrDocumentName"/> </xsl:if>
											<xsl:if test="cat_ru:PrDocumentNumber">№<xsl:apply-templates select="cat_ru:PrDocumentNumber"/> </xsl:if>
											<xsl:if test="cat_ru:PrDocumentDate"> от
									<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="date"/>, 
								<!--<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
												</xsl:call-template>-->
											</xsl:if> Держатель <xsl:apply-templates select="soup:Holder"/>
											<br/>
										</xsl:for-each>
										<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutCarrierP">
											<span class="graphMain8">Перевозчик</span>
											<br/>
											<xsl:apply-templates mode="org" select="soup:ESADGoodsShipmentP/soup:ESADoutCarrierP"/>
										</xsl:if>
									</td>
								</xsl:if>
								<xsl:if test="not(soup:ESADGoodsShipmentP/soup:ConfirmingOrganization) and not(soup:ESADGoodsShipmentP/soup:TransportDocument) and not(soup:ESADGoodsShipmentP/soup:ESADoutCarrierP)">
									<td class="graph" colspan="3" style="width:{143}mm; border-bottom:solid 0pt #000000;border-right:solid 0.8pt #000000;border-left:solid 0.8pt #000000;border-top:solid 0pt #000000;"> 
								</td>
								</xsl:if>
							</tr>
							<!--<tr>
							<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutCarrierP">
								<td style="width:{143}mm; border:solid 0.8pt #000000;" colspan="3" class="graph">
								Перевозчик<br/>
									<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutCarrierP" mode="org"/>
								</td></xsl:if>
								<xsl:if test="not(soup:ESADGoodsShipmentP/soup:ESADoutCarrierP)"><td style="width:{143}mm; border:solid 0pt #000000;" colspan="3" class="graph">&#160;</td></xsl:if>
							</tr>-->
							<tr>
								<td colspan="3" style="width:{143}mm;border-bottom:solid 0.8pt #000000;border-right:solid 0.8pt #000000;border-left:solid 0.8pt #000000;">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tbody>
											<tr valign="top">
												<td class="graph" colspan="2" style="width:{58.4}mm;">
													<span class="graphNo">18 </span>
													<span class="graph">Идентификация и страна регистрации трансп.средства при отправлении/прибытии</span>
												</td>
												<td align="center" class="graph" style="width:{8.5}mm;border-left:solid 2pt #000000;border-right:solid 1pt #000000;">
													<span class="graphNo">19 </span>
													<span class="graph">Конт.</span>
													<br/>
													<br/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td class="graph" colspan="3" style="width:{76.1}mm;border-left:solid 1pt #000000;">
													<span class="graphNo">20 </span>
													<span class="graph">Условия поставки</span>
												</td>
											</tr>
											<tr>
												<td class="graph" style="width:{46.6}mm;">
													<xsl:choose>
														<xsl:when test="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:DepartureArrivalTransportP">
															<!--xsl:value-of select="ESADout_CU:ESADout_CUConsigment/ESADout_CU:ESADout_CUDepartureArrivalTransport/ESADout_CU:TransportMeansQuantity"/>
															<xsl:text>:</xsl:text-->
															<xsl:for-each select="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:DepartureArrivalTransportP/soup:TransportMeans">
																<xsl:if test="position() &gt; 1">; </xsl:if>
																<xsl:apply-templates select="cat_ru:TransportIdentifier"/>
																<!--xsl:if test="catESAD_cu:FirstTrailerRegId">
																	<xsl:text> / </xsl:text>
																	<xsl:apply-templates select="catESAD_cu:FirstTrailerRegId"/>
																</xsl:if>
																<xsl:if test="catESAD_cu:SecondTrailerRegId">
																	<xsl:text> / </xsl:text>
																	<xsl:apply-templates select="catESAD_cu:SecondTrailerRegId"/>
																</xsl:if-->
															</xsl:for-each>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="graph" style="width:{8.8}mm;border-left:solid 2pt #000000;border-bottom:solid 1.5pt #000000;">
													<xsl:choose>
														<xsl:when test="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:DepartureArrivalTransportP/cat_ru:TransportNationalityCode!=''">
															<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:DepartureArrivalTransportP/cat_ru:TransportNationalityCode"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td align="center" class="graph" style="width:{10*$k}mm;border-left:solid 2pt black;border-bottom:solid 1.5pt black;border-right:solid 1pt black;" valign="bottom">
													<xsl:choose>
														<xsl:when test="(number(soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:ContainerIndicator)=1) or (soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:ContainerIndicator='t') or (soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:ContainerIndicator='true')">
                                        1
                                    </xsl:when>
														<xsl:when test="(number(soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:ContainerIndicator)=0) or (soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:ContainerIndicator='f') or (soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:ContainerIndicator='false')">
                                        0
                                    </xsl:when>
														<xsl:otherwise>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td align="center" class="graph" style="width:{8.8}mm;border-left:solid 1pt #000000;border-bottom:solid 1.5pt #000000;border-right:solid 2pt #000000;">
													<xsl:choose>
														<xsl:when test="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:CUESADDeliveryTerms/cat_ru:DeliveryTermsStringCode!=''">
															<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:CUESADDeliveryTerms/cat_ru:DeliveryTermsStringCode"/>
														</xsl:when>
													</xsl:choose>
												</td>
												<td class="graph" style="width:{67.2}mm;">
													<xsl:choose>
														<xsl:when test="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:CUESADDeliveryTerms/cat_ru:DeliveryPlace!=''">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:for-each select="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:CUESADDeliveryTerms/cat_ru:DeliveryPlace">
																<xsl:apply-templates select="."/>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															</xsl:for-each>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:CUESADDeliveryTerms/cat_ru:TransferPlace"/>
												</td>
												<td class="graph" style="width:{0.1}mm;border-bottom:solid 1.5pt #000000;border-left:solid 2pt #000000;">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="3" style="width:{143}mm;border:solid 0.8pt #000000;" valign="top">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tbody>
											<tr valign="top">
												<td class="graph" colspan="2" style="width:{71.9}mm;border-right:solid 1pt #000000;">
													<span class="graphNo">21 </span>
													<span class="graph">Идентификация и страна регистрации активного трансп.средства на границе</span>
												</td>
												<td class="graph" colspan="2" style="width:{33.5}mm;border-left:solid 1pt #000000;border-right:solid 0.8pt #000000;">
													<span class="graphNo">22 </span>
													<span class="graph">Валюта и общая фактурная стоимость</span>
												</td>
												<td align="center" class="graph" rowspan="2" style="width:{13}mm;border-left:solid 1pt #000000;border-right:solid 0.8pt #000000;">
													<span class="graphNo">23 </span>
													<span class="graph">Курс валюты</span>
													<br/>
													<br/>
													<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:ContractCurrencyRate"/>
												</td>
												<td class="graph" colspan="3" style="width:{20.5}mm;border-left:solid 2pt #000000;">
													<span class="graphNo">24 </span>
													<span class="graph">Характер сделки</span>
												</td>
											</tr>
											<tr>
												<td class="graph" style="width:{60.4}mm;">
													<xsl:choose>
														<xsl:when test="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:BorderTransportP">
															<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:BorderTransportP/soup:TransportMeansQuantity">
																<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:BorderTransportP/soup:TransportMeansQuantity"/>
																<xsl:text>: </xsl:text>
															</xsl:if>
															<xsl:for-each select="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:BorderTransportP/soup:TransportMeans">
																<xsl:if test="cat_ru:TransportIdentifier">
																	<xsl:apply-templates select="cat_ru:TransportIdentifier"/>
																</xsl:if>
																<xsl:if test="position()!=last()"> ,</xsl:if>
															</xsl:for-each>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td align="center" class="graph" style="width:{11.5}mm;border-bottom:solid 1.5pt #000000;border-left:solid 2pt #000000;border-right:solid 1pt #000000;">
													<xsl:choose>
														<xsl:when test="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:BorderTransportP/cat_ru:TransportNationalityCode!=''">
															<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:BorderTransportP/cat_ru:TransportNationalityCode"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td align="center" class="graph" style="width:{8.8}mm;border-left:solid 1pt #000000;border-bottom:solid 1.5pt #000000;border-right:solid 2pt #000000;">
													<xsl:choose>
														<xsl:when test="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:ContractCurrencyCode!=''">
															<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:ContractCurrencyCode"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td align="center" class="graph" style="width:{24.7}mm;border-right:solid 0.8pt #000000;">
													<xsl:choose>
														<xsl:when test="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:TotalInvoiceAmount!=''">
															<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:TotalInvoiceAmount" mode="format_number_2"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td align="center" class="graph" style="width:{9}mm;border-left:solid 2pt #000000;border-bottom:solid 1.5pt #000000;border-right:solid 0.8pt #000000;">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td class="graph" style="width:{4.5}mm;border-bottom:solid 1.5pt #000000;border-right:solid 2pt #000000;">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td class="graph" style="width:{7}mm;">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td style="width:{83}mm;border:solid 0.8pt #000000;">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tbody>
											<tr valign="top">
												<td class="graph" colspan="2" style="width:{13.8}mm;">
													<span class="graphNo">25 </span>
													<span class="graph">Вид транспорта</span>
												</td>
												<td class="graph" colspan="2" style="width:{13.8}mm;border-left:solid 2pt #000000;border-right:solid 0.8pt #000000;">
													<span class="graphNo">26 </span>
													<span class="graph">Вид транспорта</span>
												</td>
												<td class="graph" style="width:{38.4}mm;border-left:solid 0.8pt #000000;">
													<span class="graphNo">27 </span>
													<span class="graph">Место погрузки</span>
												</td>
											</tr>
											<tr>
												<td align="center" class="graph" style="width:{4.6}mm;border-bottom:solid 1.5pt #000000;border-right:solid 2pt #000000;">
													<xsl:choose>
														<xsl:when test="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:BorderTransportP/cat_ru:TransportModeCode!=''">
															<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:BorderTransportP/cat_ru:TransportModeCode"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="graph" style="width:{9.2}mm;">
													<span class="graph">на границе</span>
												</td>
												<td align="center" class="graph" style="width:{4.6}mm;border-left:solid 2pt #000000;border-bottom:solid 1.5pt #000000;border-right:solid 2pt #000000;">
													<xsl:choose>
														<xsl:when test="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:DepartureArrivalTransportP/cat_ru:TransportModeCode!=''">
															<xsl:for-each select="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:DepartureArrivalTransportP/cat_ru:TransportModeCode">
																<xsl:apply-templates select="."/>
															</xsl:for-each>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="graph" style="width:{9.2}mm;border-right:solid 0.8pt #000000;">
													<span class="graph">внутри страны</span>
												</td>
												<td class="graph" style="width:{38.4}mm;border-left:solid 0.8pt #000000;">
													<xsl:choose>
														<xsl:when test="soup:ESADGoodsShipmentP/soup:DepartureCustomsCode">
															<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:DepartureCustomsCode"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td class="graph" colspan="2" rowspan="3" style="width:{77}mm;border:solid 0.8pt #000000;border-bottom:solid 1.5pt #000000;" valign="top">
									<span class="graphNo">28 </span>
									<span class="graph">Финансовые и банковские сведения</span>
									<br/>
									<!--xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:FinancialDocuments/catESAD_cu:FinDocumentCode='1'">
													1.1- 
													<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:FinancialDocuments/catESAD_cu:FinDocumentNumber"/>
										<br/>
									</xsl:if>
									<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:FinancialDocuments/catESAD_cu:FinDocumentCode='2'">
													1.2-
													<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:FinancialDocuments/catESAD_cu:FinDocumentNumber"/>
										<br/>
									</xsl:if>
									<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:FinancialDocuments/catESAD_cu:FinDocumentCode='3'">
													1.3 -
													<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:FinancialDocuments/catESAD_cu:FinDocumentNumber"/>
										<br/>
									</xsl:if>
									<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:BankOrganization">
										<xsl:choose>
											<xsl:when test="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:BankOrganization/catESAD_cu:OrganizationKind='1'">
												<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:BankOrganization/catESAD_cu:INN!=''">
													1.4- 
													<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:BankOrganization/catESAD_cu:INN"/>
													<br/>
												</xsl:if>
											</xsl:when>
											<xsl:otherwise>
												1-
												<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:BankOrganization/catESAD_cu:OKPO"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
									<xsl:if test="(soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:DealFeatures) or (soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:BankOrganization/catESAD_cu:BankName)">
										<br/>
										2-
										<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:BankOrganization/catESAD_cu:BankName"/>
										<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:DealFeatures">
											<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:DealFeatures/catESAD_cu:PaymentFormCode"/>
											<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:DealFeatures/catESAD_cu:DealFeatureCode"/>
											/
											<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:DealFeatures/catESAD_cu:DealNatureCode"/>
											<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:DealFeatures/catESAD_cu:PaymentFeature"/>
											/
											<xsl:choose>
												<xsl:when test="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:DealFeatures/catESAD_cu:FirstPaymentDate">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:DealFeatures/catESAD_cu:FirstPaymentDate"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise> - </xsl:otherwise>
											</xsl:choose>
											/
											<xsl:choose>
												<xsl:when test="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:DealFeatures/catESAD_cu:LastPaymentDate">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:DealFeatures/catESAD_cu:LastPaymentDate"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise> - </xsl:otherwise>
											</xsl:choose>
											/
											<xsl:choose>
												<xsl:when test="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:DealFeatures/catESAD_cu:AgreementCurrencyCode">
													<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutMainContractTermsP/catESAD_cu:DealFeatures/catESAD_cu:AgreementCurrencyCode"/>
												</xsl:when>
												<xsl:otherwise> - </xsl:otherwise>
											</xsl:choose>
										</xsl:if>
									</xsl:if-->
								</td>
							</tr>
							<tr>
								<!--td align="center" class="graphNum" style="width:{17}mm;border:solid 1.5pt #000000;">1</td-->
								<td style="width:{83}mm;border:solid 0.8pt #000000;">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tbody>
											<tr valign="top">
												<td class="graph" style="width:{15.7}mm;border-right:solid 0.8pt #000000;">
													<span class="graphNo">29 </span>
													<span class="graph">Таможенный орган выезда/вывоза</span>
													<br/>
													<xsl:if test="soup:ESADGoodsShipmentP/soup:BorderCustomsOffice">
														<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:BorderCustomsOffice"/>
													</xsl:if>
												</td>
												<xsl:if test="soup:ESADGoodsShipmentP/soup:DepartureCustomsCode">
													<td class="graph" style="width:{15.7}mm;border-right:solid 0.8pt #000000;">
														<span class="graphNo"/>
														<span class="graph">Код таможенного органа отправления</span>
														<br/>
														<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:DepartureCustomsCode"/>
													</td>
												</xsl:if>
												<td class="graph" style="width:{34.6}mm;border-left:solid 0.8pt #000000;">
													<span class="graphNo">30 </span>
													<span class="graph">Местонахождение товаров</span>
													<br/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<!--td align="center" class="graphNum" style="width:{17}mm;border-bottom:solid 1.5pt #000000;border-right:solid 0pt #000000;border-top:solid 1.5pt #000000;border-left:solid 1.5pt #000000;"> </td-->
								<td align="left" class="graph" style="width:{83}mm;border-bottom:solid 1.5pt #000000;border-right:solid 1pt #000000;">
													Сведения о транспортных средствах:
													<xsl:for-each select="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:BorderTransportP/soup:TransportMeans">
														Вид <xsl:apply-templates select="../cat_ru:TransportModeCode"/>
															 <xsl:apply-templates select="cat_ru:TransportIdentifier"/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:for-each select="soup:ESADGoodsShipmentP/soup:ESADoutGoodsP">
						<div class="goods">
							<xsl:attribute name="id"><xsl:text>generate-id(.)</xsl:text></xsl:attribute>
							<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
								<tbody>
									<tr>
										<td class="graph" rowspan="4" style="width:{17}mm;border-right:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;" valign="top">
											<span class="graphNo">31</span>
											<span class="graphColumn">Грузовые места и описание товаров</span>
										</td>
										<td class="graph" style="width:{66}mm;border-top:solid 0.8pt #000000;" valign="top">
											<span class="graph">Маркировка и количество - Номера контейнеров - Количество и виды товаров</span>
										</td>
										<td class="graph" style="width:{10}mm;">
											<table cellpadding="0" cellspacing="0" style="width:100%;">
												<tbody>
													<tr>
														<td class="graph" colspan="2" style="width:{10}mm;border-top:solid 0.8pt #000000;border-left:solid 2pt #000000;">
															<span class="graphNo">32 </span>
															<span class="graph">Товар</span>
														</td>
													</tr>
													<tr>
														<td align="center" class="graph" style="width:{6.5}mm;border-left:solid 2pt #000000;border-bottom:solid 2pt #000000;border-right:solid 2pt #000000;">
															<xsl:choose>
																<xsl:when test="catESAD_cu:GoodsNumeric!=''">
																	<xsl:apply-templates select="catESAD_cu:GoodsNumeric"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
														</td>
														<td style="width:{3.5}mm;border-bottom:solid 0.8pt #000000;">
															<span class="graph">
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:apply-templates select="catESAD_cu:GoodFeatures"/>
															</span>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
										<td align="center" class="graph" style="width:{17}mm;border-top:solid 0.8pt #000000;border-left:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;">
											<span class="graphNo">33 </span>
											<span class="graph">Код товара</span>
											<br/>
											<xsl:apply-templates select="soup:GoodsTNVEDCode"/>
										</td>
										<td class="graph" colspan="2" style="width:{50}mm;border:solid 0.8pt #000000;">
											<table cellpadding="0" cellspacing="0" style="width:100%;">
												<tbody>
													<tr>
														<td class="graph" colspan="2" style="width:{20}mm;border-top:solid 0pt #000000;border-right:solid 1pt #000000;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td class="graph" colspan="2" style="width:{30}mm;border-top:solid 0pt #000000;border-right:solid 0pt #000000;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
													</tr>
													<tr>
														<!--td style="width:{6.6}mm;border-left:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;border-right:solid 0.8pt #000000;" class="graph" align="center">
															<xsl:choose>
																<xsl:when test="substring(soup:GoodsTNVEDCode,7,2)!=''">
																	<xsl:value-of select="substring(soup:GoodsTNVEDCode,7,2)"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
														</td>
														<td style="width:{11}mm;border-bottom:solid 0.8pt #000000;border-right:solid 0.8pt #000000;" class="graph" align="center">
															<xsl:choose>
																<xsl:when test="substring(soup:GoodsTNVEDCode,9)!=''">
																	<xsl:value-of select="substring(soup:GoodsTNVEDCode,9)"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
														</td-->
														<td align="center" class="graph" style="width:{15}mm;border-bottom:solid 0pt #000000;border-right:solid 1pt #000000;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td align="center" class="graph" style="width:{15}mm;border-bottom:solid 0pt #000000;border-right:solid 1pt #000000;">
															<xsl:choose>
																<xsl:when test="soup:GoodsAddTNVEDCode!=''">
																	<xsl:apply-templates select="soup:GoodsAddTNVEDCode"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
														</td>
														<td align="center" class="graph" style="width:{10}mm;border-bottom:solid 0pt #000000;border-right:solid 1pt #000000;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td align="center" class="graph" style="width:{10}mm;border-bottom:solid 0pt #000000;border-right:solid 0pt #000000;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="graph" colspan="2" rowspan="3" style="width:{76}mm;border-bottom:solid 0.8pt #000000;" valign="top">
											<span class="graph">1)</span>
											<xsl:for-each select="catESAD_cu:GoodsDescription">
												<xsl:apply-templates select="."/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</xsl:for-each>
											<xsl:if test="soup:Container">
												<br/>Информация о контейнерах в количестве
										<xsl:apply-templates select="soup:Container/soup:ContainerQuantity"/>: 
										<xsl:for-each select="soup:Container/soup:ContainerInfo">
										№<xsl:apply-templates select="soup:ContainerNumber"/>
													<xsl:if test="soup:ContainerKind">,<xsl:apply-templates select="soup:ContainerKind"/>
													</xsl:if>
													<xsl:if test="soup:Seals">
													(<xsl:for-each select="soup:Seals">
															<xsl:apply-templates select="."/>
															<xsl:if test="position()!=last()">,</xsl:if>
														</xsl:for-each>)</xsl:if>
													<xsl:if test="position()!=last()">;</xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:for-each select="soup:GoodsGroupDescription">
												<br/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:for-each select="catESAD_cu:GoodsDescription">
													<xsl:apply-templates select="."/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:for-each>
												<xsl:if test="catESAD_cu:ObjectOrdinal"> / <xsl:apply-templates select="catESAD_cu:ObjectOrdinal"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:if>
												<xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:Manufacturer">
                                Изготовитель
                            </xsl:if>
												<xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:Manufacturer">
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
												<xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:TradeMark">
                                Тов.знак
                            </xsl:if>
												<xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:TradeMark">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
												<!--xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:MilitaryProductCategoryCode">
                                Катег.прод.
                            </xsl:if>
                                    <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:MilitaryProductCategoryCode">
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <<xsl:apply-templates select="."/>
                                    </xsl:for-each-->
												<xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsMark">
                                Торг. знак, марка
                            </xsl:if>
												<xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsMark">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
												<xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsModel">
                                Модель
                            </xsl:if>
												<xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsModel">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
												<xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:InfoDescription">
                                Наименование артикула
                            </xsl:if>
												<xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:InfoDescription">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
												<xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsMarking">
                                Артикул
                            </xsl:if>
												<xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsMarking">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
												<xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsStandard">
                                Стандарт
                            </xsl:if>
												<xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsStandard">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
												<xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsSort">
                                Сорт
                            </xsl:if>
												<xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsSort">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
												<xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:WoodDescriptionDetails">
										Сведения о лесоматериалах
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates mode="WoodDescriptionDetails" select="catESAD_cu:GoodsGroupInformation/catESAD_cu:WoodDescriptionDetails"/>
												</xsl:if>
												<xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:Dimensions">
                                Размеры
                                <xsl:apply-templates mode="Dimensions" select="catESAD_cu:GoodsGroupInformation/catESAD_cu:Dimensions"/>
												</xsl:if>
												<xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:DateIssue">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                Дата выпуска
                            </xsl:if>
												<xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:DateIssue">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="." mode="date"/>
													<!--<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="."/>
													</xsl:call-template>-->
												</xsl:for-each>
												<xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:SerialNumber">
													<br/>Серийный номер:
									<xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:SerialNumber">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="."/>;
							</xsl:for-each>
												</xsl:if>
												<xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsGroupQuantity">
                                Кол-во
                            </xsl:if>
												<xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsGroupQuantity">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="catESAD_cu:GoodsQuantity"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName"/>
													<xsl:if test="catESAD_cu:MeasureUnitQualifierCode">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(
                                    <xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierCode"/>)
                                </xsl:if>
												</xsl:for-each>
											</xsl:for-each>
											<xsl:if test="soup:OriginCountryName">
												<br/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="soup:OriginCountryName"/>
											</xsl:if>
											<xsl:if test="soup:SupplementaryQuantity">
												<br/>
												<xsl:apply-templates select="soup:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="soup:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="soup:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>
											</xsl:if>
											<xsl:if test="soup:ESADGoodsPackaging">
												<br/>
												<span class="graph">2) </span>
												<!--xsl:if test="soup:ESADGoodsPackaging/catESAD_cu:PakageTypeCode=1"-->
												<xsl:if test="soup:ESADGoodsPackaging/catESAD_cu:PakageQuantity!=''">
													<xsl:apply-templates select="soup:ESADGoodsPackaging/catESAD_cu:PakageQuantity"/>&#160;
								<xsl:if test="soup:ESADGoodsPackaging/catESAD_cu:PakagePartQuantity">
                                        (<xsl:apply-templates select="soup:ESADGoodsPackaging/catESAD_cu:PakagePartQuantity"/>-часть
                                        места)
                           <!--/xsl:if-->
                                    ,
                                </xsl:if>
													<xsl:if test="soup:ESADGoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='0' or catESAD_cu:InfoKindCode='1' or catESAD_cu:InfoKindCode='2']">
														<xsl:for-each select="soup:ESADGoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='0' or catESAD_cu:InfoKindCode='1' or catESAD_cu:InfoKindCode='2']">
															<xsl:apply-templates select="catESAD_cu:PalleteCode"/>
															<xsl:if test="catESAD_cu:PalleteQuantity">
																<span class="graph">-</span>
																<xsl:apply-templates select="catESAD_cu:PalleteQuantity"/>
															</xsl:if>
															<span class="graph">,</span>
														</xsl:for-each>
													</xsl:if>
													<xsl:if test="soup:ESADGoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='3']">
                                    Поддоны:
									<xsl:for-each select="soup:ESADGoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='3']">
															<xsl:if test="catESAD_cu:CargoDescriptionText">
																<xsl:apply-templates select="catESAD_cu:CargoDescriptionText"/>
															</xsl:if>
															<span class="graph">,</span>
															<xsl:apply-templates select="catESAD_cu:PalleteQuantity"/> /
										<xsl:apply-templates select="catESAD_cu:PalleteCode"/>
														</xsl:for-each>
													</xsl:if>
													<xsl:if test="soup:ESADGoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='4']">
														<br/>2.1
									<xsl:for-each select="soup:ESADGoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='4']">
															<xsl:apply-templates select="catESAD_cu:PalleteCode"/>
															<xsl:if test="catESAD_cu:PalleteQuantity">
																<span class="graph">-</span>
																<xsl:apply-templates select="catESAD_cu:PalleteQuantity"/>
															</xsl:if>
															<span class="graph">,</span>
														</xsl:for-each>
													</xsl:if>
												</xsl:if>
												<xsl:if test="soup:ESADGoodsPackaging/catESAD_cu:PakageTypeCode=0">
                                без упаковки
                            </xsl:if>
												<xsl:if test="soup:ESADGoodsPackaging/catESAD_cu:PakageTypeCode=2">
                                без упаковки/
								<xsl:for-each select="soup:ESADGoodsPackaging/catESAD_cu:PackagePalleteInformation[catESAD_cu:InfoKindCode='2']">
														<xsl:apply-templates select="catESAD_cu:PalleteCode"/>
														<span class="graph">,</span>
													</xsl:for-each>
												</xsl:if>
											</xsl:if>
										</td>
										<td style="width:{17}mm;">
											<table cellpadding="0" cellspacing="0" style="width:100%;">
												<tbody>
													<tr>
														<td class="graph" colspan="4" style="width:{17}mm;border-left:solid 1.5pt #000000;border-right:solid 0pt #000000;">
															<span class="graphNo">34 </span>
															<span class="graph">Код страны происх.</span>
														</td>
													</tr>
													<tr>
														<td class="graph" style="width:{2.5}mm;border-left:solid 1.5pt #000000;border-right:solid 0.8pt #000000;border-bottom:solid 1pt #000000;">a</td>
														<td align="center" class="graph" style="width:{6}mm;border-right:solid 0.8pt #000000;border-bottom:solid 1pt #000000;">
															<xsl:choose>
																<xsl:when test="soup:OriginCountryCode">
																	<xsl:apply-templates select="soup:OriginCountryCode"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td class="graph" style="width:{2.5}mm;border-right:solid 0.8pt #000000;border-bottom:solid 1pt #000000;">b</td>
														<td class="graph" style="width:{6}mm;border-right:solid 0pt #000000;border-bottom:solid 1pt #000000;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
										<td class="graph" style="width:{20}mm;border:solid 0.8pt #000000;" valign="top">
											<span class="graphNo">35 </span>
											<span class="graph">Вес брутто (кг)</span>
											<br/>
											<xsl:apply-templates select="catESAD_cu:GrossWeightQuantity"/>
										</td>
										<td class="graph" style="width:{30}mm;border:solid 0.8pt #000000;" valign="top">
											<span class="graphNo">36 </span>
											<span class="graph">Преференции</span>
											<br/>
											<xsl:apply-templates select="soup:Preferencii"/>
										</td>
									</tr>
									<tr>
										<td style="width:{17}mm;">
											<table cellpadding="0" cellspacing="0" style="width:100%;">
												<tbody>
													<tr>
														<td class="graph" colspan="2" style="width:{17}mm;border-left:solid 1.5pt #000000;border-right:solid 0pt #000000;border-top:solid 0pt #000000;">
															<span class="graphNo">37 </span>
															<span class="graph">Процедура</span>
														</td>
													</tr>
													<tr>
														<td align="center" class="graph" style="width:{10}mm;border-left:solid 1.5pt #000000;border-right:solid 0.8pt #000000;border-bottom:solid 1.5pt #000000;">
															<xsl:choose>
																<xsl:when test="soup:ESADCustomsProcedure">
																	<xsl:apply-templates select="soup:ESADCustomsProcedure/catESAD_cu:MainCustomsModeCode"/>
																	<xsl:apply-templates select="soup:ESADCustomsProcedure/catESAD_cu:PrecedingCustomsModeCode"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
														</td>
														<td align="center" class="graph" style="width:{7}mm;border-right:solid 0pt #000000;border-bottom:solid 1.5pt #000000;">
															<xsl:choose>
																<xsl:when test="soup:ESADCustomsProcedure">
																	<xsl:apply-templates select="soup:ESADCustomsProcedure/catESAD_cu:GoodsTransferFeature"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
										<td class="graph" style="width:{30}mm;border:solid 0.8pt #000000;" valign="top">
											<span class="graphNo">38 </span>
											<span class="graph">Вес нетто (кг)</span>
											<br/>
											<xsl:apply-templates select="catESAD_cu:NetWeightQuantity"/>
											<xsl:if test="catESAD_cu:NetWeightQuantity2">
						/<xsl:apply-templates select="catESAD_cu:NetWeightQuantity2"/>
											</xsl:if>
										</td>
										<td class="graph" style="width:{20}mm;border:solid 0.8pt #000000;" valign="top">
											<span class="graphNo">39 </span>
											<span class="graphTitleIt">Квота</span>
											<br/>
											<xsl:if test="soup:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota">
												<xsl:apply-templates select="soup:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota/catESAD_cu:QuotaCurrencyQuantity"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="soup:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota/catESAD_cu:QuotaCurrencyName"/>
								(<xsl:apply-templates select="soup:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota/catESAD_cu:QuotaCurrencyCode"/>)
						</xsl:if>
											<br/>
											<xsl:if test="soup:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota">
												<xsl:apply-templates select="soup:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota/catESAD_cu:QuotaQuantity"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="soup:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota/catESAD_cu:QuotaMeasurementName"/>
								(<xsl:apply-templates select="soup:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota/catESAD_cu:QuotaMeasureUnitQualifierCode"/>)
						
						</xsl:if>
											<!--xsl:choose>
												<xsl:when test="soup:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota">
													<xsl:apply-templates select="soup:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota/catESAD_cu:QuotaCurrencyQuantity"/>
												</xsl:when>
												<xsl:when test="soup:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota">
													<xsl:apply-templates select="soup:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota/catESAD_cu:QuotaQuantity"/>
												</xsl:when>
											</xsl:choose-->
										</td>
									</tr>
									<tr>
										<td class="graph" colspan="3" style="width:{67}mm;border:solid 0.8pt #000000;">
											<span class="graphNo">40 </span>
											<span class="graph">Краткая декларация/предшествующий документ</span>
											<br/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr valign="top">
										<td class="graph" rowspan="3" style="width:{17}mm;border-right:solid 0.8pt #000000;border-top:solid 0.8pt #000000;" valign="top">
											<span class="graphNo">44</span>
											<span class="graphColumn">Дополнит. информация/ Представл. документы/ Сертификаты и разрешения</span>
										</td>
										<td class="graph" colspan="2" rowspan="3" style="width:{76}mm;border-bottom:solid 0.8pt #000000;border-top:solid 0.8pt #000000;">
											<xsl:if test="soup:ESADoutPresentedDocumentP">
												<xsl:for-each select="soup:ESADoutPresentedDocumentP">
													<xsl:choose>
														<xsl:when test="catESAD_cu:PresentedDocumentModeCode='00000'">
															<xsl:apply-templates select="soup:ForeignDocCode"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:apply-templates select="catESAD_cu:PresentedDocumentModeCode"/>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:if test="catESAD_cu:ProvidingIndicationMark">
														<xsl:text>/</xsl:text>
														<xsl:apply-templates select="catESAD_cu:ProvidingIndicationMark"/>
													</xsl:if>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
													<xsl:if test="cat_ru:PrDocumentDate">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="date"/>
														<!--<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
														</xsl:call-template>-->
													</xsl:if>
													<!--xsl:if test="cat_ru:PrDocumentName">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:apply-templates select="cat_ru:PrDocumentName"/>
                                       </xsl:if-->
													<xsl:if test="catESAD_cu:DocumentBeginActionsDate">
														<xsl:text> с </xsl:text>
														<xsl:apply-templates select="catESAD_cu:DocumentBeginActionsDate" mode="date"/>
														<!--<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="catESAD_cu:DocumentBeginActionsDate"/>
														</xsl:call-template>-->
													</xsl:if>
													<xsl:if test="catESAD_cu:DocumentEndActionsDate">
														<xsl:text> по </xsl:text>
														<xsl:apply-templates select="catESAD_cu:DocumentEndActionsDate" mode="date"/>
														<!--<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="catESAD_cu:DocumentEndActionsDate"/>
														</xsl:call-template>-->
													</xsl:if>
													<xsl:if test="catESAD_cu:PresentingLackingDate and catESAD_cu:ProvidingIndicationMark='3'">
														<xsl:text> Обязуюсь предоставить до </xsl:text>
														<xsl:apply-templates select="catESAD_cu:PresentingLackingDate" mode="date"/>
														<!--<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="catESAD_cu:PresentingLackingDate"/>
														</xsl:call-template>-->
													</xsl:if>
													<xsl:if test="catESAD_cu:CountryCode">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="catESAD_cu:CountryCode"/>
													</xsl:if>
													<xsl:if test="catESAD_cu:CustomsPaymentModeCodeType">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="catESAD_cu:CustomsPaymentModeCodeType"/>
													</xsl:if>
													<xsl:if test="catESAD_cu:TemporaryStorageImportDate">
														<xsl:text> Срок временного ввоза </xsl:text>
														<xsl:apply-templates select="catESAD_cu:TemporaryStorageImportDate" mode="date"/>
														<!--<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="catESAD_cu:TemporaryStorageImportDate"/>
														</xsl:call-template>-->
													</xsl:if>
													<xsl:if test="catESAD_cu:TemporaryImportCode">
														<xsl:text> /</xsl:text>
														<xsl:apply-templates select="catESAD_cu:TemporaryImportCode"/>
													</xsl:if>
													<xsl:if test="catESAD_cu:SupplyStatus">
														<xsl:text> /Опережающая поставка </xsl:text>
													</xsl:if>
													<!--<xsl:if test="catESAD_cu:SpecialSimplifiedCode">
														<xsl:text> /</xsl:text>
														<xsl:apply-templates select="catESAD_cu:SpecialSimplifiedCode"/>
													</xsl:if>-->
													<br/>
												</xsl:for-each>
											</xsl:if>
										</td>
										<td class="graph" colspan="3" style="width:{67}mm;">
											<table cellpadding="0" cellspacing="0" style="width:100%;">
												<tbody>
													<tr>
														<td class="graph" style="width:{27}mm;border:solid 0.8pt #000000;">
															<span class="graphNo">41 </span>
															<span class="graph">Дополнит.единицы</span>
															<br/>
															<xsl:choose>
																<xsl:when test="soup:SupplementaryQuantity">
																	<xsl:apply-templates select="soup:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	<xsl:apply-templates select="soup:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>
																</xsl:when>
															</xsl:choose>
														</td>
														<td class="graph" style="width:{40}mm;border:solid 0.8pt #000000;">
															<span class="graphNo">42 </span>
															<span class="graph">Цена товара</span>
															<br/>
															<xsl:if test="catESAD_cu:InvoicedCost">
																<xsl:apply-templates select="catESAD_cu:InvoicedCost" mode="format_number_2"/>
																<!--xsl:value-of select="format-number(catESAD_cu:InvoicedCost,'0.00')"/-->
															</xsl:if>
															<xsl:if test="catESAD_cu:InvoicedCurrencyCode">/<xsl:apply-templates select="catESAD_cu:InvoicedCurrencyCode"/>
															</xsl:if>
															<xsl:if test="catESAD_cu:InvoicedCurrencyRate">/<xsl:apply-templates select="catESAD_cu:InvoicedCurrencyRate" mode="format_number_4"/>
																<!--xsl:value-of select="format-number(catESAD_cu:InvoicedCurrencyRate,'0.0000')"/-->
															</xsl:if>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr valign="top">
										<td class="graph" colspan="3" style="width:{67}mm;">
											<table cellpadding="0" cellspacing="0" style="width:100%;">
												<tbody>
													<tr>
														<td class="graph" rowspan="2" style="width:{27}mm;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td class="graph" style="width:{10}mm;border-right:solid 2pt #000000;">
															<span class="graph">Код доп. инф.</span>
														</td>
														<td class="graph" rowspan="2" style="width:{30}mm;border:solid 0.8pt #000000;" valign="top">
															<span class="graphNo">45 </span>
															<span class="graph">Таможенная стоимость</span>
															<br/>
															<xsl:apply-templates select="catESAD_cu:CustomsCost" mode="format_number_2"/>
															<xsl:if test="soup:CustomsCostCorrectMethod">
																/<xsl:apply-templates select="soup:CustomsCostCorrectMethod"/>
															</xsl:if>
														</td>
													</tr>
													<tr>
														<td class="graph" style="width:{10}mm;border-right:solid 2pt #000000;border-bottom:solid 1.5pt #000000;border-left:solid 2pt #000000;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="graph" colspan="3" style="width:{67}mm;">
											<table cellpadding="0" cellspacing="0" style="width:100%;">
												<tbody>
													<tr>
														<td class="graph" style="width:{27}mm;border:solid 0.8pt #000000;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td class="graph" style="width:{40}mm;border:solid 0.8pt #000000;">
															<span class="graphNo">46 </span>
															<span class="graph">Статистическая стоимость</span>
															<br/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:if test="catESAD_cu:StatisticalCost">
																<xsl:apply-templates select="catESAD_cu:StatisticalCost" mode="format_number_2"/>
																<!--<xsl:value-of select="format-number(catESAD_cu:StatisticalCost,'0.00')"/>-->
															</xsl:if>
															<xsl:if test="catESAD_cu:TotalStatisticValueAmount"> / <xsl:apply-templates select="catESAD_cu:TotalStatisticValueAmountt" mode="format_number_2"/>
																<!--<xsl:value-of select="format-number(catESAD_cu:TotalStatisticValueAmount,'0.00')"/>-->
															</xsl:if>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr valign="top">
										<td class="graph" style="width:{17}mm;border-right:solid 0.8pt #000000;border-top:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;" valign="top">
											<span class="graphNo">47</span>
											<span class="graphColumn">Исчисление платежей</span>
										</td>
										<td class="graph" colspan="5" style="width:{143}mm;">
											<table cellpadding="0" cellspacing="0" style="width:100%;">
												<tbody>
													<tr>
														<td class="graph" style="width:{12}mm;border-right:solid 1pt #000000;border-bottom:solid 0.8pt #000000;">Вид</td>
														<td class="graph" style="width:{40}mm;border-right:solid 1pt #000000;border-bottom:solid 0.8pt #000000;">Основа начисления</td>
														<td class="graph" style="width:{40}mm;border-right:solid 1pt #000000;border-bottom:solid 0.8pt #000000;">Ставка</td>
														<td class="graph" style="width:{40}mm;border-right:solid 1pt #000000;border-bottom:solid 0.8pt #000000;">Сумма</td>
														<td class="graph" style="width:{11}mm;border-right:solid 1pt #000000;border-bottom:solid 0.8pt #000000;">СП</td>
													</tr>
													<xsl:for-each select="soup:CustomsPaymentCalcP">
														<tr>
															<td class="graph" style="width:{12}mm;border-right:solid 1pt #000000;border-bottom:solid 0.8pt #000000;">
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:apply-templates select="catESAD_cu:PaymentModeCode"/>
															</td>
															<td class="graph" style="width:{40}mm;border-right:solid 1pt #000000;border-bottom:solid 0.8pt #000000;">
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:apply-templates select="catESAD_cu:TaxBase"/>
															</td>
															<td class="graph" style="width:{40}mm;border-right:solid 1pt #000000;border-bottom:solid 0.8pt #000000;">
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:apply-templates select="catESAD_cu:Rate"/>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:if test="catESAD_cu:PaymentModeCode!='10'">
																	<xsl:choose>
																		<xsl:when test="catESAD_cu:RateTypeCode='*'">
																			<xsl:apply-templates select="catESAD_cu:RateTNVEDQualifierCode"/>
																		</xsl:when>
																		<xsl:otherwise>%</xsl:otherwise>
																	</xsl:choose>
																</xsl:if>
															</td>
															<td class="graph" style="width:{40}mm;border-right:solid 1pt #000000;border-bottom:solid 0.8pt #000000;">
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:apply-templates select="catESAD_cu:PaymentAmount"/>
															</td>
															<td class="graph" style="width:{11}mm;border-right:solid 1pt #000000;border-bottom:solid 0.8pt #000000;">
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:apply-templates select="catESAD_cu:PaymentCode"/>
															</td>
														</tr>
													</xsl:for-each>
													<tr>
														<td class="graph" colspan="2" style="width:{52}mm;border-bottom:solid 0.8pt #000000;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td class="graph" style="width:{40}mm;border-bottom:solid 0.8pt #000000;">Всего:</td>
														<td class="graph" style="width:{40}mm;border-bottom:solid 0.8pt #000000;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:value-of select="sum(soup:CustomsPaymentCalcP/catESAD_cu:PaymentAmount)"/>
														</td>
														<td class="graph" style="width:{11}mm;border:solid 0.8pt #000000;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</xsl:for-each>
					<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
						<tbody>
							<xsl:choose>
								<xsl:when test="(soup:CustomsProcedure='ЭК') or (soup:CustomsProcedure='ИМ')">
									<tr valign="top">
										<td class="graph" style="width:{17}mm;border-right:solid 0.8pt #000000;" valign="top">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
										<td class="graph" colspan="5" style="width:{143}mm;border:solid 0.8pt #000000;">
											<span class="graphNo">B </span>
											<span class="graph">ПОДРОБНОСТИ ПОДСЧЕТА</span>
											<table cellpadding="0" cellspacing="0" style="width:100%;">
												<tbody>
													<tr>
														<td class="graph" style="width:{53}mm;" valign="top">
															<xsl:for-each select="soup:ESADGoodsShipmentP/soup:CustomsPaymentsP/soup:CustomsPayment">
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:apply-templates select="catESAD_cu:PaymentModeCode"/>
																<span class="graph"> - </span>
																<xsl:apply-templates select="catESAD_cu:PaymentAmount"/>
																<xsl:if test="catESAD_cu:PaymentCurrencyCode">
																	<span class="graph"> - </span>
																	<xsl:apply-templates select="catESAD_cu:PaymentCurrencyCode"/>
																</xsl:if>
																<br/>
															</xsl:for-each>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</xsl:when>
								<xsl:otherwise>
									<tr valign="top">
										<td class="graph" style="width:{17}mm;border-right:solid 1pt #000000;border-bottom:solid 0.8pt #000000;" valign="top">
											<span class="graphNo">F</span>
											<span class="graphColumn">ПОДТВЕР- ЖДЕНИЕ КОМПЕТЕН- ТНЫХ ОРГАНОВ</span>
										</td>
										<td class="graph" colspan="5" style="width:{143}mm;border:solid 0pt #000000;">
											<table cellpadding="0" cellspacing="0" style="width:100%;">
												<tbody>
													<tr>
														<td class="graph" style="width:{33}mm;" valign="top">
															<span class="graph">Новые пломбы:Количество:</span>
														</td>
														<td class="graph" colspan="2" style="width:{33}mm;border-right:solid 0.8pt #000000;" valign="top">
															<span class="graph">Номер:</span>
														</td>
														<td class="graph" style="width:{27}mm;" valign="top">
															<span class="graph">Новые пломбы:Количество:</span>
														</td>
														<td class="graph" colspan="2" style="width:{50}mm;" valign="top">
															<span class="graph">Номер:</span>
														</td>
													</tr>
													<tr>
														<td class="graph" colspan="3" style="width:{66}mm;border-right:solid 0.8pt #000000;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td class="graph" colspan="3" style="width:{77}mm;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="graph" style="width:{33}mm;" valign="top">
															<span class="graph">Подпись:</span>
														</td>
														<td class="graph" style="width:{13}mm;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td class="graph" style="width:{20}mm;border-right:solid 0.8pt #000000;" valign="top">
															<span class="graph">Печать:</span>
														</td>
														<td class="graph" style="width:{27}mm;" valign="top">
															<span class="graph">Подпись:</span>
														</td>
														<td class="graph" style="width:{20}mm;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td class="graph" style="width:{30}mm;" valign="top">
															<span class="graph">Печать:</span>
														</td>
													</tr>
													<!-- удалить, когда заполнится-->
													<!--
												<tr>
													<td colspan="3" style="width:{90}mm;border-right:solid 0.8pt #000000;" class="graph" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</td>
													<td colspan="3" style="width:{87}mm;" class="graph" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</td>
												</tr>
												<tr>
													<td colspan="3" style="width:{90}mm;border-right:solid 0.8pt #000000;" class="graph" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</td>
													<td colspan="3" style="width:{87}mm;" class="graph" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</td>
												</tr>
												-->
													<!-- удалить, когда заполнится-->
												</tbody>
											</table>
										</td>
									</tr>
								</xsl:otherwise>
							</xsl:choose>
							<tr valign="top">
								<td class="graph" style="width:{17}mm;border-right:solid 1pt #000000;" valign="top">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td class="graph" colspan="5" style="width:{143}mm;border-top:solid 1pt #000000;">
									<table cellpadding="0" cellspacing="0" style="width:100%;">
										<tbody>
											<tr>
												<td class="graph" style="width:{30}mm;">
													<span class="graphNo">50 </span>
													<span class="graph">Принципал</span>
												</td>
												<td class="graph" style="width:{50}mm;">
													<span class="graph">№ </span>
													<!--xsl:value-of select="soup:ESADGoodsShipmentP/soup:Esouprincipal/cat_ru:OGRN"/-->
												</td>
												<td class="graph" style="width:{20}mm;">
													<span class="graph">Подпись: </span>
												</td>
												<td class="graph" rowspan="4" style="width:{43}mm;border-left:solid 0.8pt #000000;" valign="top">
													<span class="graphNo">С </span>
													<span class="graph">ТАМОЖЕННЫЙ ОРГАН ОТПРАВЛЕНИЯ</span>
													<br/>
												</td>
											</tr>
											<tr>
												<td class="graph" colspan="3" style="width:{100}mm;"/>
											</tr>
											<tr>
												<td class="graph" colspan="3" style="width:{100}mm;">
													<span class="graph">представленный </span>
												</td>
											</tr>
											<tr>
												<td class="graph" colspan="3" style="width:{100}mm;">
													<span class="graph">Место и дата: </span>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr valign="top">
								<td class="graph" colspan="6" style="width:{160}mm;">
									<table cellpadding="0" cellspacing="0" style="width:100%;">
										<tbody>
											<tr>
												<td class="graph" style="width:{17}mm;border-right:solid 0pt #000000;border-top:solid 0.8pt #000000;" valign="top">
													<span class="graphNo">51</span>
													<!--span class="graphColumn">Пред- пола- гаемые тамож-е органы транзита (и страна)</span-->
													<span class="graphColumn">Предпола- гаемые таможенные органы транзита (и страна)</span>
												</td>
												<td class="graph" style="width:{25}mm;border:solid 0.8pt #000000;">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td class="graph" style="width:{25}mm;border:solid 0.8pt #000000;">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td class="graph" style="width:{25}mm;border:solid 0.8pt #000000;">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td class="graph" style="width:{25}mm;border:solid 0.8pt #000000;">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td class="graph" style="width:{23}mm;border:solid 0.8pt #000000;">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td class="graph" style="width:{20}mm;border:solid 0.8pt #000000;">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr valign="top">
								<td class="graph" colspan="6" style="width:{160}mm;">
									<table cellpadding="0" cellspacing="0" style="width:100%;">
										<tbody>
											<tr>
												<td class="graph" rowspan="2" style="width:{17}mm;border-top:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;" valign="top">
													<span class="graphNo">52</span>
													<span class="graphColumn">Гарантия недействи- тельна для</span>
													<!--span class="graphColumn">Гаран-</span-->
												</td>
												<td class="graph" rowspan="2" style="width:{100}mm;border-top:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;" valign="top">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td class="graph" style="width:{10}mm;border-right:solid 2pt #000000;border-top:solid 0.8pt #000000;">
													<span class="graph">Код</span>
												</td>
												<td class="graph" rowspan="2" style="width:{57}mm;border-top:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;" valign="top">
													<span class="graphNo">53 </span>
													<span class="graph">Таможенный орган назначения (и страна)</span>
													<br/>
													<xsl:if test="(soup:CustomsProcedure='ТТ')">
														<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:DestinationCountryCode">
															<br/>
															<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:DestinationCountryCode"/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutConsigmenP/soup:DestinationCountryName"/>
														</xsl:if>
													</xsl:if>
												</td>
											</tr>
											<tr>
												<td class="graph" style="width:{10}mm;border-left:solid 2pt #000000;border-bottom:solid 1.5pt #000000;border-right:solid 2pt #000000;">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr valign="top">
								<td class="graph" colspan="6" style="width:{160}mm;border-top:solid 0.8pt #000000;">
									<table cellpadding="0" cellspacing="0" style="width:100%;">
										<tbody>
											<tr>
												<td class="graph" style="width:{37}mm;">
													<span class="graphNo">D </span>
													<span class="graph">ОТМЕТКИ ТАМОЖЕННОГО ОРГАНА ОТПРАВЛЕНИЯ</span>
												</td>
												<td class="graph" style="width:{50}mm;">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td class="graph" style="width:{15}mm;border-right:solid 0.8pt #000000;">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td class="graph" rowspan="7" style="width:{57}mm;border-left:solid 0.8pt #000000;">
													<span class="graphNo">54 </span>
													<span class="graph">Место и дата</span>
													<br/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<br/>
													<span class="graph">Подпись и фамилия декларанта/представителя</span>
													<br/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:choose>
														<xsl:when test="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson">
															<span class="graph">2)</span>
															<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/cat_ru:PersonSurname"/>
															<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/cat_ru:PersonName"/>
															<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/cat_ru:PersonMiddleName"/>
															<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/catESAD_cu:IdentityCard">
																<br/>
																<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/catESAD_cu:IdentityCard/catESAD_cu:IdentityCardName"/>
																<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/catESAD_cu:IdentityCard/catESAD_cu:IdentityCardSeries"/>
																<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/catESAD_cu:IdentityCard/catESAD_cu:IdentityCardNumber"/>
																<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/catESAD_cu:IdentityCard/catESAD_cu:IdentityCardDate" mode="date"/>
																<!--<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/catESAD_cu:IdentityCard/catESAD_cu:IdentityCardDate"/>
																</xsl:call-template>-->
																<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/catESAD_cu:IdentityCard/catESAD_cu:OrganizationName"/>
															</xsl:if>
															<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/cat_ru:PersonPost">
																<br/>
																<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/cat_ru:PersonPost"/>
															</xsl:if>
															<xsl:for-each select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/catESAD_cu:Contact/cat_ru:Phone">
																<xsl:apply-templates select="."/>, 
										</xsl:for-each>
															<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/catESAD_cu:AuthoritesDocument">
																<br/>
																<span class="graph">3)</span>
																<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentName">
																	<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentName"/>, 
											</xsl:if>
																<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentNumber"/>, 
											<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentDate">
																	<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentDate" mode="date"/>
																	<!--<xsl:call-template name="russian_date">
																		<xsl:with-param name="dateIn" select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentDate"/>
																	</xsl:call-template>-->
																</xsl:if>
																<xsl:if test="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:ComplationAuthorityDate">
																	<span class="graph">до </span>
																	<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:ComplationAuthorityDate" mode="date"/>
																	<!--<xsl:call-template name="russian_date">
																		<xsl:with-param name="dateIn" select="soup:ESADGoodsShipmentP/soup:ESADoutDeclarantP/soup:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:ComplationAuthorityDate"/>
																	</xsl:call-template>-->
																</xsl:if>
															</xsl:if>
														</xsl:when>
													</xsl:choose>
												</td>
											</tr>
											<tr>
												<td class="graph" colspan="3" style="width:{103}mm;border-right:solid 0.8pt #000000;">
													<span class="graph">Дата и время выпуска товаров: 
											<xsl:if test="soup:ESADGoodsShipmentP/soup:CustomsRemarks/soup:CustomsReleaseDateTime">
															<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:CustomsRemarks/soup:CustomsReleaseDateTime" mode="date"/>
															<!--<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="soup:ESADGoodsShipmentP/soup:CustomsRemarks/soup:CustomsReleaseDateTime"/>
															</xsl:call-template>-->
															<!--<xsl:text> </xsl:text>
															<xsl:value-of select="substring(soup:ESADGoodsShipmentP/soup:CustomsRemarks/soup:CustomsReleaseDateTime, 12, 8)"/>-->
														</xsl:if>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</span>
												</td>
											</tr>
											<tr>
												<td class="graph" colspan="3" style="width:{103}mm;border-right:solid 0.8pt #000000;">
													<span class="graph">Дата вывоза: 
											<xsl:if test="soup:ESADGoodsShipmentP/soup:ExitDate">
															<xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:ExitDate" mode="date"/>
															<!--<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="soup:ESADGoodsShipmentP/soup:ExitDate"/>
															</xsl:call-template>
															<xsl:text> </xsl:text>
															<xsl:value-of select="substring(soup:ESADGoodsShipmentP/soup:ExitDate, 12, 8)"/>-->
														</xsl:if>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</span>
												</td>
											</tr>
											<tr>
												<td class="graph" colspan="3" style="width:{65}mm;border-right:solid 0.8pt #000000;">
													<span class="graph">Специальные отметки таможенного органа: <xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:CustomsRemarks/soup:CustomsRemarksCode"/>
													</span>
												</td>
											</tr>
											<tr>
												<td class="graph" colspan="3" style="width:{103}mm;border-right:solid 0.8pt #000000;">
													<span class="graph">Код вида таможенного контроля: <xsl:apply-templates select="soup:ESADGoodsShipmentP/soup:CustomsRemarks/soup:ProcedureCode"/>
													</span>
												</td>
											</tr>
											<tr>
												<td class="graph" colspan="3" style="width:{103}mm;border-right:solid 0.8pt #000000;">
													<span class="graph">Номера средств идентификации: 
										   <xsl:for-each select="soup:ESADGoodsShipmentP/soup:CustomsRemarks/soup:SealIdentifier">
															<xsl:apply-templates select="."/>
															<xsl:if test="position()!=last()">
																<xsl:text>, </xsl:text>
															</xsl:if>
														</xsl:for-each>
													</span>
												</td>
											</tr>
											<tr>
												<td class="graph" colspan="3" style="width:{103}mm;border-right:solid 0.8pt #000000;">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="cat_ru:IdentityCard|RUScat_ru:IdentityCard|catESAD_cu:IdentityCard">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:apply-templates select="." mode="date"/>
					<!--xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template-->
				</xsl:when>
				<xsl:when test="local-name()='DocValidityDate'">
					<xsl:text>(окончание срока действия: </xsl:text>
					<xsl:apply-templates select="." mode="date"/>
					<!--xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template-->
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:WoodDescriptionDetailsType -->
	<xsl:template mode="WoodDescriptionDetails" match="*">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:if test="local-name()='WoodSortiment'">
				<xsl:text>Наим.сортимента: </xsl:text>
				<xsl:apply-templates select="."/>
			</xsl:if>
			<xsl:if test="local-name()='WoodKind'">
				<xsl:text>Порода древесины: </xsl:text>
				<xsl:apply-templates select="."/>
			</xsl:if>
			<xsl:if test="local-name()='ProductSortName'">
				<xsl:text>Наименование сорта:</xsl:text>
				<xsl:apply-templates select="."/>
			</xsl:if>
			<xsl:if test="local-name()='AllowanceDetails'">
				<xsl:text>Припуск по длине, ширине, высоте: </xsl:text>
				<xsl:apply-templates mode="Dimensions" select="."/>
			</xsl:if>
			<xsl:if test="local-name()='DeviationDetails'">
				<xsl:text>Отклонения по длине, ширине, высоте: </xsl:text>
				<xsl:apply-templates mode="Dimensions" select="."/>
			</xsl:if>
			<xsl:if test="local-name()='catESAD_cu:DiameterRangeDetails'">
				<xsl:text>Диапазон диаметров: </xsl:text>
				<xsl:apply-templates mode="Dimensions" select=".">
					<xsl:with-param name="separator" select="'-'"/>
				</xsl:apply-templates>
			</xsl:if>
			<xsl:if test="local-name()='ContractVolumeMeasure'">
				<xsl:text> Номинальный объем товара: </xsl:text>
				<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
			</xsl:if>
			<xsl:if test="local-name()='FactVolumeMeasure'">
				<xsl:text> Фактический объем товара: </xsl:text>
				<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:DimensionType и catESAD_cu:RangeMeasureType-->
	<xsl:template mode="Dimensions" match="*">
		<xsl:param name="separator" select="'x'"/>
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="$separator"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_cu:SupplementaryQuantityType и catESAD_cu:UnifiedPhysicalMeasureType-->
	<xsl:template mode="SupplementaryQuantity" match="*">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="local-name()='MeasureUnitQualifierCode'">
					<xsl:text>(</xsl:text>
					<xsl:apply-templates select="."/>
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<!-- Адрес -->
	<xsl:template match="*" mode="ru_address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:apply-templates select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="org">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<span class="graph"> (</span>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<span class="graph">)</span>
		</xsl:if>
		<!--xsl:if test="RUDECLcat:SubjectAdditionalCode='1'"> 'контрагент'</xsl:if>
		<xsl:if test="RUDECLcat:SubjectAdditionalCode='2'"> 'РАЗНЫЕ ПО СПИСКУ'</xsl:if-->
		<br/>
		<xsl:if test="cat_ru:RBOrganizationFeatures and (local-name(.)!='Declarant' or //soup:DTCountryCode='BY')">
			<xsl:text>№ </xsl:text>
			<xsl:if test="cat_ru:RBOrganizationFeatures/cat_ru:UNP">
				<xsl:apply-templates select="cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
			</xsl:if>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:RKOrganizationFeatures and (local-name(.)!='Declarant' or //soup:DTCountryCode='KZ')">
			<xsl:text>№ </xsl:text>
			<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:BIN">
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
			</xsl:if>
			<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:IIN">
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
			</xsl:if>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures and (local-name(.)!='Declarant' or //soup:DTCountryCode='RU')">
			<xsl:text>№ </xsl:text>
			<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
				<xsl:text> / </xsl:text>
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
			</xsl:if>
			<br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates mode="ru_address" select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails/cat_ru:E_mail">
			<xsl:if test="RUScat_ru:SubjectAddressDetails">
				<xsl:text>; </xsl:text>
			</xsl:if>
			<xsl:for-each select="RUScat_ru:CommunicationDetails/cat_ru:E_mail">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectBranch">
			<br/>
			<xsl:apply-templates select="RUScat_ru:SubjectBranch/cat_ru:OrganizationName"/>
			<br/>
			<xsl:if test="RUScat_ru:SubjectBranch/RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates mode="ru_address" select="RUScat_ru:SubjectBranch/RUScat_ru:SubjectAddressDetails"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="(cat_ru:RFOrganizationFeatures) or (cat_ru:RBOrganizationFeatures) or (cat_ru:RKOrganizationFeatures)">
			<br/>
			<xsl:text>№ </xsl:text>
			<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:ITN">
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
			</xsl:if>
		</xsl:if>
		<br/>
		<xsl:apply-templates mode="spaceSeparated" select="RUScat_ru:IdentityCard"/>
	</xsl:template>
	<xsl:template match="*" mode="spaceSeparated">
		<xsl:if test="position() > 1">
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:apply-templates select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:apply-templates select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:apply-templates select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
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
	<xsl:template match="*" mode="date">
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
	<xsl:template name="date_time">
		<xsl:param name="dateTimeIn"/>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring($dateTimeIn,12,5)"/>
	</xsl:template>
	<xsl:template match="*" mode="date_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="date_time">
				<xsl:with-param name="dateTimeIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="format_number_2">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="format-number(.,'0.00')"/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="format_number_4">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="format-number(.,'0.0000')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
