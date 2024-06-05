<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" 
	xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0" 
	xmlns:exnot="urn:customs.ru:Information:CustomsDocuments:OEZ_ExportNotif:5.22.0" 
	xmlns:oeznr="urn:customs.ru:Information:CustomsDocuments:OEZ_NotifReg:5.22.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	
	<xsl:param name="OEZ_NotifReg"/>
	
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
	<xsl:template match="//*[local-name()='OEZ_ExportNotif']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
				<xsl:with-param name="dateIn2" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date_dt">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_dt">
				<xsl:with-param name="dateIn3" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="exnot:OEZ_ExportNotif">
		<html>
			<head>
				<title>Уведомление о вывозе товаров с территории особой экономической зоны</title>
				<style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 297mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}						
						table
							{
							table-layout: fixed;
							width: 100%;
							border: 0;
							/*empty-cells: show;*/
							border-collapse: collapse;
							margin-top: 0px;
							}
						td {
							font-family:Arial;
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 15pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
						.graph {
							font-family: Arial;
							font-size: 10pt;
							font-weight: bold;
							}
						.graphMain {
							font-family: Arial;
							font-size: 10pt;
							font-weight: normal;
							}
						
						.graphMainbold {
							font-family: Arial;
							font-size: 10pt;
							font-weight:bold;
							}
						.graphLittle {
							font-family: Arial;
							font-size: 7pt;
							}
						.graph8Bold {
							font-family: Arial;
							font-size: 10pt;
							font-weight: bold;
							}				
						.bordered {
							border-bottom: solid 1pt #000000;
							font-weight: bold;
							}	
						.borderednormal {
							border-bottom: solid 1pt #000000;
							font-weight: normal;
							}
					
						.tdBorder {
							border: 1px solid black;
							}
						.incline{
							font-style: italic;
						}
                </style>
			</head>
			<body>
				<div class="page">
					<table border="0" style="width:297mm;">
						<tbody>
							<xsl:if test="exnot:DocSign='3' or exnot:DocSign='4'">
								<tr>
									<td align="center" style="width:297mm" valign="top" colspan="2">
										<xsl:choose>
											<xsl:when test="exnot:DocSign='3'"><b>Уведомление<br/>о вывозе товаров с территории портового, логистического участка Арктической зоны Российской Федерации</b><br/><br/></xsl:when>
											<xsl:when test="exnot:DocSign='4'"><b>Уведомление<br/>о вывозе товаров с территории участка<br/>резидента Арктической зоны Российской Федерации,<br/>на котором создана зона таможенного контроля для целей<br/>применения таможенной процедуры свободной таможенной зоны</b><br/><br/></xsl:when>
										</xsl:choose>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<!--Head-->
								<td align="left" style="width:167mm" valign="top">
									<xsl:if test="exnot:DocSign='0'">Предварительное уведомление<br/>о вывозе товаров с территории особой экономической зоны<br/>№ </xsl:if>
									<xsl:if test="exnot:DocSign='1'">Уведомление о вывозе товаров<br/>с территории портовой особой экономической зоны<br/>№ </xsl:if>
									<xsl:if test="exnot:DocSign='2'">Уведомление о вывозе товаров<br/>с территории опережающего социально-экономического развития<br/>№ </xsl:if>
									<xsl:if test="exnot:DocSign='3' or exnot:DocSign='4'">Уведомление<br/>№ </xsl:if>
									<u>
										<xsl:choose>
											<xsl:when test="$OEZ_NotifReg">
												<xsl:apply-templates select="$OEZ_NotifReg/*[local-name() = 'RegistrationNumber']" mode="reg_num"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates select="exnot:RegistrationNumber" mode="reg_num"/>
											</xsl:otherwise>
										</xsl:choose>
									</u>
									<xsl:if test="exnot:DocSign='3'"><br/>(на <u><xsl:apply-templates select="exnot:DocPages"/></u> л.)</xsl:if>
									<xsl:if test="exnot:DocSign='4'"><br/>Количество листов: <u><xsl:apply-templates select="exnot:DocPages"/></u></xsl:if>
								</td>
								<td>
									<table style="width:130mm">
										<tbody>
											<tr>
												<td align="left">
													<span class="incline">B </span>
													<xsl:apply-templates select="exnot:Customs/cat_ru:Code"/> 
													<!--xsl:if test="exnot:DocSign!='4'"-->
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="exnot:Customs/cat_ru:OfficeName"/>
													<!--/xsl:if-->
												</td>
											</tr>
											<tr align="center">
												<td class="graphLittle" style="border-top:1pt solid black">(наименование таможенного органа<xsl:if test="exnot:DocSign!='4'"> с указанием кода таможенного органа</xsl:if>)</td>
											</tr>
											<tr>
												<td align="left">
													<span class="incline">От </span>
													<xsl:choose>
														<xsl:when test="exnot:Resident">
															<xsl:apply-templates select="exnot:Resident/cat_ru:OrganizationName"/> 
															<xsl:if test="exnot:Resident/RUScat_ru:SubjectAddressDetails">
																<xsl:for-each select="exnot:Resident/RUScat_ru:SubjectAddressDetails">
																	<xsl:apply-templates select="."/>
																</xsl:for-each> 
															</xsl:if>
															<xsl:if test="exnot:Resident/cat_ru:RFOrganizationFeatures">
																<xsl:if test="exnot:Resident/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:apply-templates select="exnot:Resident/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
																<xsl:if test="exnot:Resident/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:apply-templates select="exnot:Resident/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
																<xsl:if test="exnot:Resident/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:apply-templates select="exnot:Resident/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
															</xsl:if>
															<xsl:if test="exnot:Resident/exnot:CertificateNumber">
																свидетельство о включении в реестр резидентов Арктической зоны № 
																<xsl:apply-templates select="exnot:Resident/exnot:CertificateNumber/cat_ru:PrDocumentNumber"/> от 
																<xsl:apply-templates select="exnot:Resident/exnot:CertificateNumber/cat_ru:PrDocumentDate" mode="russian_date"/>
															</xsl:if>
														</xsl:when>
														<xsl:otherwise>
															<xsl:apply-templates select="exnot:IncidentNotif/cat_ru:OrganizationName"/> 
															<xsl:if test="exnot:IncidentNotif/exnot:Address">
																<xsl:for-each select="exnot:IncidentNotif/exnot:Address">
																	<xsl:apply-templates select="."/>
																</xsl:for-each> 
															</xsl:if>
															<xsl:if test="exnot:IncidentNotif/cat_ru:RFOrganizationFeatures">
																<xsl:if test="exnot:IncidentNotif/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН <xsl:apply-templates select="exnot:IncidentNotif/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> </xsl:if>
																<xsl:if test="exnot:IncidentNotif/cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН <xsl:apply-templates select="exnot:IncidentNotif/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> </xsl:if>
																<xsl:if test="exnot:IncidentNotif/cat_ru:RFOrganizationFeatures/cat_ru:KPP">КПП <xsl:apply-templates select="exnot:IncidentNotif/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
															</xsl:if>
															<xsl:if test="exnot:IncidentNotif/exnot:CertificateNumber">
																свидетельство о включении в реестр резидентов Арктической зоны № 
																<xsl:apply-templates select="exnot:IncidentNotif/exnot:CertificateNumber/cat_ru:PrDocumentNumber"/> от 
																<xsl:apply-templates select="exnot:IncidentNotif/exnot:CertificateNumber/cat_ru:PrDocumentDate" mode="russian_date"/>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											<tr>
												<td class="graphLittle" align="center" style="border-top:1pt solid black">
													<xsl:if test="exnot:DocSign='0'">(наименование или фамилия, имя, отчество (для физического лица), подающего предварительное уведомление)</xsl:if>
													<xsl:if test="exnot:DocSign='1'">(наименование/адрес резидента портовой особой экономической зоны, ОГРН, ИНН, КПП)</xsl:if>
													<xsl:if test="exnot:DocSign='2'">(наименование /адрес резидента ТОСЭР, ОГРН, ИНН, КПП) или фамилия, имя, отчество (для физических лиц, ИНН, ОГРНИП)</xsl:if>
													<xsl:if test="exnot:DocSign='3'">(резидент портового, логистического участка Арктической зоны Российской Федерации или лицо, им уполномоченное)</xsl:if>
													<xsl:if test="exnot:DocSign='4'">(резидент Арктической зоны Российской Федерации или лицо, им уполномоченное)</xsl:if>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="exnot:DocSign='0' or exnot:DocSign='1' or exnot:DocSign='2'">
						<table style="width:297mm">
							<tbody>
								<xsl:if test="exnot:PassKind">
									<tr>
										<td align="left">
											<xsl:variable name="xpath_PassKind">
												<xsl:call-template name="get_xpath">
													<xsl:with-param name="node" select="exnot:PassKind"/>
												</xsl:call-template>
											</xsl:variable>
											<element xml_node="{$xpath_PassKind}">
												<xsl:choose>
													<xsl:when test="exnot:PassKind='0' or exnot:PassKind='false' or exnot:PassKind='f'">уведомление о разовом вывозе</xsl:when>
													<xsl:when test="exnot:PassKind='1' or exnot:PassKind='true' or exnot:PassKind='t'">запрос на многоразовый пропуск</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="exnot:PassKind"/>
													</xsl:otherwise>
												</xsl:choose>
											</element>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td align="left">
										<br/>
										<br/>
										<table style="table-layout:auto" width="100%">
											<tbody>
												<tr align="left" valign="top" width="1">
													<td class="incline" style="padding-right:6px;">Отправитель</td>
													<td>
														<xsl:apply-templates select="exnot:Consignor/cat_ru:OrganizationName"/> 
														<xsl:if test="exnot:Consignor/exnot:Address">
															<xsl:for-each select="exnot:Consignor/exnot:Address">
																<xsl:apply-templates select="."/>
															</xsl:for-each> 
														</xsl:if>
														<xsl:apply-templates select="exnot:Consignor/cat_ru:RFOrganizationFeatures"/>
													</td>
												</tr>
												<tr>
													<td></td>
													<td class="graphLittle" align="center" style="border-top:1pt solid black">(наименование, адрес)</td>
												</tr>
												<tr align="left">
													<td class="incline">Дата</td>
													<td>
														<u>
															<xsl:apply-templates select="exnot:ExportDate" mode="russian_date"/>
														</u>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr align="left">
									<td>
										<br/>
										<span class="incline">Средство транспорта </span> <u>
											<xsl:if test="exnot:TransportMeans/exnot:TransportMode='1'">a/м </xsl:if>
											<xsl:if test="exnot:TransportMeans/exnot:TransportMode='2'">ж/д </xsl:if>
											<xsl:if test="exnot:TransportMeans/exnot:TransportMode='3'">авиа </xsl:if>
											<xsl:if test="exnot:TransportMeans/exnot:TransportMode='4'">в/т </xsl:if>
											<xsl:if test="exnot:TransportMeans/exnot:TransportMode='5'">спецтехника </xsl:if>
											<xsl:if test="exnot:TransportMeans/exnot:TransportMode='6'">ручная кладь </xsl:if>
											<xsl:if test="exnot:TransportMeans/exnot:TransportMark">
												<xsl:apply-templates select="exnot:TransportMeans/exnot:TransportMark"/> </xsl:if>
										</u> <span class="incline"> регистрационный номер </span> <u>
											<xsl:apply-templates select="exnot:TransportMeans/exnot:ActiveTransportIdentifier"/>
											<xsl:if test="exnot:DocSign='1'">
												<xsl:if test="exnot:TransportMeans/exnot:TransportRegNumber">
													<span class="incline">, прицеп/полуприцеп </span> 
													<xsl:for-each select="exnot:TransportMeans/exnot:TransportRegNumber">
															<xsl:apply-templates select="."/> 
													</xsl:for-each>
												</xsl:if>
												<xsl:if test="exnot:TransportMeans/exnot:EmptyTransportRegNumber">
													<span class="incline">, порожний прицеп/полуприцеп</span> 
													<xsl:for-each select="exnot:TransportMeans/exnot:EmptyTransportRegNumber">
														<xsl:apply-templates select="."/> 
													</xsl:for-each>
												</xsl:if>
											</xsl:if>
										</u>
									</td>
								</tr>
								<tr>
									<td align="left" class="graphLittle" style="width:110mm; padding-left:200px;">(тип/марка)</td>
								</tr>
								<xsl:if test="exnot:DocSign='0' and (exnot:TransportMeans/exnot:TransportRegNumber or exnot:TransportMeans/exnot:EmptyTransportRegNumber)">
									<tr>
										<td align="left"><span class="incline">Регистрационный номер прицепа/полуприцепа </span> <u>
												<xsl:for-each select="exnot:TransportMeans/exnot:TransportRegNumber">
													<xsl:if test="position() != 1">; </xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
												<xsl:if test="exnot:TransportMeans/exnot:TransportRegNumber and exnot:TransportMeans/exnot:EmptyTransportRegNumber">; </xsl:if>
												<xsl:for-each select="exnot:TransportMeans/exnot:EmptyTransportRegNumber">
													<xsl:if test="position() != 1">; </xsl:if>
													<xsl:apply-templates select="."/> 
												</xsl:for-each>
											</u>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td align="left">
										<br/>
										<span class="incline">Дополнительные сведения </span><u>
											<xsl:for-each select="exnot:AddInformation">
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</u>
									</td>
								</tr>
								<xsl:if test="exnot:DocSign='1'">
									<tr>
										<td align="left">К уведомлению прилагается опись и документы на <u>       </u> л.
									</td>
									</tr>
								</xsl:if>
								<tr>
									<td align="center">
										<br/>Сведения о товарах<br/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="exnot:DocSign='3'">
						<table style="width:297mm">
							<tbody>
								<tr>
									<td align="left">
										<br/>Вывоз товаров будет осуществлен с территории портового, логистического участка резидента Арктической зоны Российской Федерации <u><xsl:apply-templates select="exnot:AddressZone"/></u>
									</td>
								</tr>
								<tr>
									<td align="left">
										<br/>
										<br/>
										<table style="table-layout:auto" width="100%">
											<tbody>
												<tr align="left" valign="top" width="1">
													<td>
														<span class="incline">Отправитель</span>
														<br/>
														<xsl:apply-templates select="exnot:Consignor/cat_ru:OrganizationName"/> 
														<xsl:if test="exnot:Consignor/exnot:Address">
															<xsl:for-each select="exnot:Consignor/exnot:Address">
																<xsl:apply-templates select="."/>
															</xsl:for-each> 
														</xsl:if>
														<xsl:apply-templates select="exnot:Consignor/cat_ru:RFOrganizationFeatures"/>
													</td>
													<td width="5%"/>
													<td>
														<span class="incline">Дата планируемого вывоза </span> <u><xsl:apply-templates select="exnot:ExportDate" mode="russian_date"/></u>
													</td>
												</tr>
												<tr>
													<td class="graphLittle" align="center" style="border-top:1pt solid black">(наименование, адрес)</td>
													<td width="5%"/>
													<td/>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr align="left">
									<td>
										<br/>
										<table style="table-layout:auto" width="100%">
											<tbody>
												<tr align="left" valign="top" width="1">
													<td class="incline" style="padding-right:6px;">
														<span class="incline">Транспортное средство </span>
													</td>
													<td>
														<xsl:if test="exnot:TransportMeans/exnot:TransportMode='1'">a/м </xsl:if>
														<xsl:if test="exnot:TransportMeans/exnot:TransportMode='2'">ж/д </xsl:if>
														<xsl:if test="exnot:TransportMeans/exnot:TransportMode='3'">авиа </xsl:if>
														<xsl:if test="exnot:TransportMeans/exnot:TransportMode='4'">в/т </xsl:if>
														<xsl:if test="exnot:TransportMeans/exnot:TransportMode='5'">спецтехника </xsl:if>
														<xsl:if test="exnot:TransportMeans/exnot:TransportMode='6'">ручная кладь </xsl:if>
														<xsl:if test="exnot:TransportMeans/exnot:TransportMark">
															<xsl:apply-templates select="exnot:TransportMeans/exnot:TransportMark"/> </xsl:if>
													</td>
													<td width="5%"/>
													<td>
														<span class="incline">Регистрационный номер (наименование) </span> <u>
														<xsl:apply-templates select="exnot:TransportMeans/exnot:ActiveTransportIdentifier"/>
															<xsl:if test="exnot:TransportMeans/exnot:TransportRegNumber">
																<span class="incline">, прицеп/полуприцеп </span> 
																<xsl:for-each select="exnot:TransportMeans/exnot:TransportRegNumber">
																		<xsl:apply-templates select="."/> 
																</xsl:for-each>
															</xsl:if>
															<xsl:if test="exnot:TransportMeans/exnot:EmptyTransportRegNumber">
																<span class="incline">, порожний прицеп/полуприцеп</span> 
																<xsl:for-each select="exnot:TransportMeans/exnot:EmptyTransportRegNumber">
																	<xsl:apply-templates select="."/> 
																</xsl:for-each>
															</xsl:if>
														</u>
													</td>
												</tr>
												<tr>
													<td/>
													<td class="graphLittle" align="center" style="border-top:1pt solid black">(тип/марка)</td>
													<td width="5%"/>
													<td/>
												</tr>
												<tr align="left" valign="top" width="1">
													<td/>
													<td/>
													<td width="5%"/>
													<td>
														<xsl:if test="exnot:TransportMeans/exnot:FlightNumber">
															<span class="incline">Номер рейса </span> <u>
																<xsl:apply-templates select="exnot:TransportMeans/exnot:FlightNumber"/>
															</u>
														</xsl:if>
														<xsl:if test="exnot:TransportMeans/exnot:FlightNumber and exnot:TransportMeans/exnot:FlightDate">
															<br/>
														</xsl:if>
														<xsl:if test="exnot:TransportMeans/exnot:FlightDate">
															<span class="incline">Дата рейса </span> <u>
																<xsl:apply-templates select="exnot:TransportMeans/exnot:FlightDate" mode="russian_date"/>
															</u>
														</xsl:if>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td align="left">
										<br/>
										<span class="incline">Дополнительные сведения </span><u>
											<xsl:for-each select="exnot:AddInformation">
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</u>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>Таблица "Сведения о вывозимых товарах"<br/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="exnot:DocSign='4'">
						<table style="width:297mm">
							<tbody>
								<tr>
									<td align="left">
										<br/>
										<table style="table-layout:auto" width="100%">
											<tbody>
												<tr align="left" valign="top" width="1">
													<td rowspan="3">
														<span class="incline">Вывоз:</span>
														<br/><xsl:choose>
															<xsl:when test="exnot:GoodsInfo"><span class="tdBorder"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>X<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></span></xsl:when>
															<xsl:otherwise><span class="tdBorder"><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text></span></xsl:otherwise>
														</xsl:choose> товаров
														<br/><xsl:choose>
															<xsl:when test="exnot:TransportMeans/exnot:TransportKind='3'"><span class="tdBorder"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>X<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></span></xsl:when>
															<xsl:otherwise><span class="tdBorder"><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text></span></xsl:otherwise>
														</xsl:choose> порожнего ТС
														<br/><xsl:choose>
															<xsl:when test="exnot:TransportMeans/exnot:TransportKind='самоходная строительная техника'"><span class="tdBorder"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>X<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></span></xsl:when>
															<xsl:otherwise><span class="tdBorder"><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text></span></xsl:otherwise>
														</xsl:choose> самоходной строительной техники
														<br/><xsl:choose>
															<xsl:when test="exnot:PassKind='1'"><span class="tdBorder"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>X<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></span></xsl:when>
															<xsl:otherwise><span class="tdBorder"><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text></span></xsl:otherwise>
														</xsl:choose> многоразовый пропуск
														<br/><xsl:choose>
															<xsl:when test="exnot:TransportMeans/exnot:TransportKind='2'"><span class="tdBorder"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>X<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></span></xsl:when>
															<xsl:otherwise><span class="tdBorder"><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text></span></xsl:otherwise>
														</xsl:choose> без транспортного средства
													</td>
													<td>
														<span class="incline">Дата планируемого вывоза </span> <u><xsl:apply-templates select="exnot:ExportDate" mode="russian_date"/></u>
													</td>
												</tr>
												<tr>
													<td>
														<span class="incline">Получатель</span>
														<br/>
														<xsl:apply-templates select="exnot:Consignee/cat_ru:OrganizationName"/> 
														<xsl:if test="exnot:Consignee/exnot:Address">
															<xsl:for-each select="exnot:Consignee/exnot:Address">
																<xsl:apply-templates select="."/>
															</xsl:for-each> 
														</xsl:if>
														<xsl:apply-templates select="exnot:Consignee/cat_ru:RFOrganizationFeatures"/>
													</td>
												</tr>
												<tr>
													<td class="graphLittle" align="center" style="border-top:1pt solid black">(наименование, адрес)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr align="left">
									<td>
										<br/>
										<table style="table-layout:auto" width="100%">
											<tbody>
												<tr align="left" valign="top" width="1">
													<td class="incline" style="padding-right:6px;">
														<span class="incline">Транспортное средство </span>
													</td>
													<td>
														<xsl:if test="exnot:TransportMeans/exnot:TransportMode='1'">a/м </xsl:if>
														<xsl:if test="exnot:TransportMeans/exnot:TransportMode='2'">ж/д </xsl:if>
														<xsl:if test="exnot:TransportMeans/exnot:TransportMode='3'">авиа </xsl:if>
														<xsl:if test="exnot:TransportMeans/exnot:TransportMode='4'">в/т </xsl:if>
														<xsl:if test="exnot:TransportMeans/exnot:TransportMode='5'">спецтехника </xsl:if>
														<xsl:if test="exnot:TransportMeans/exnot:TransportMode='6'">ручная кладь </xsl:if>
														<xsl:if test="exnot:TransportMeans/exnot:TransportMark">
															<xsl:apply-templates select="exnot:TransportMeans/exnot:TransportMark"/> </xsl:if>
													</td>
													<td width="5%"/>
													<td>
														<span class="incline">Регистрационный номер </span> <u>
															<xsl:apply-templates select="exnot:TransportMeans/exnot:ActiveTransportIdentifier"/>
															<xsl:if test="exnot:TransportMeans/exnot:TransportRegNumber">
																<span class="incline">, прицеп/полуприцеп </span> 
																<xsl:for-each select="exnot:TransportMeans/exnot:TransportRegNumber">
																		<xsl:apply-templates select="."/> 
																</xsl:for-each>
															</xsl:if>
															<xsl:if test="exnot:TransportMeans/exnot:EmptyTransportRegNumber">
																<span class="incline">, порожний прицеп/полуприцеп</span> 
																<xsl:for-each select="exnot:TransportMeans/exnot:EmptyTransportRegNumber">
																	<xsl:apply-templates select="."/> 
																</xsl:for-each>
															</xsl:if>
														</u>
													</td>
												</tr>
												<tr>
													<td/>
													<td class="graphLittle" align="center" style="border-top:1pt solid black">(тип/марка)</td>
													<td width="5%"/>
													<td>
														<xsl:if test="exnot:TotalWeight">
															<span class="incline">Вес транспортного средства </span> <u>
																<xsl:apply-templates select="exnot:TotalWeight"/>
															</u>
														</xsl:if>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>Таблица "Сведения о вывозимых товарах"<br/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="exnot:DocSign='0' or exnot:DocSign='1' or exnot:DocSign='2'">
						<table cellpadding="0" cellspacing="0" style="width:100%; border: 1px solid black;">
							<tbody>
								<tr align="center" valign="top">
									<td class="tdBorder" width="4%">№ п/п</td>
									<td class="tdBorder" width="20%">Наименование товара</td>
									<td class="tdBorder" width="8%">Кол-во товаров</td>
									<td class="tdBorder" width="8%">Кол-во грузовых мест</td>
									<td class="tdBorder" width="8%">Вес товаров</td>
									<td class="tdBorder" width="8%">Вид упаковки</td>
									<td class="tdBorder" width="18%">Статус товаров</td>
									<xsl:choose>
										<xsl:when test="//*[local-name()='OEZ_ExportNotif']//*[local-name()='TechID']">
											<td class="tdBorder" width="15%">Примечание</td>
											<td class="tdBorder" width="11%">Технические идентификаторы</td>
										</xsl:when>
										<xsl:otherwise>
											<td class="tdBorder" width="26%">Примечание</td>
										</xsl:otherwise>
									</xsl:choose>
								</tr>
								<tr align="center">
									<td class="tdBorder">1</td>
									<td class="tdBorder">2</td>
									<td class="tdBorder">3</td>
									<td class="tdBorder">4</td>
									<td class="tdBorder">5</td>
									<td class="tdBorder">6</td>
									<td class="tdBorder">7</td>
									<td class="tdBorder">8</td>
									<xsl:if test="//*[local-name()='OEZ_ExportNotif']//*[local-name()='TechID']">
										<td class="tdBorder">9</td>
									</xsl:if>
								</tr>
								<xsl:variable name="docSign" select="exnot:DocSign"/>
								<xsl:for-each select="exnot:GoodsInfo">
									<xsl:variable name="pos" select="position()"/>
									<tr valign="top">
										<td class="tdBorder">
											<xsl:number value="position()"/>
										</td>
										<td class="tdBorder" style="word-break: break-all;">
											<xsl:for-each select="exnot:GoodsDescription">
												<xsl:apply-templates select="."/> 
											</xsl:for-each>
										</td>
										<td class="tdBorder">
											<xsl:for-each select="exnot:SupplementaryQuantity">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
											</xsl:for-each>
										</td>
										<td class="tdBorder" align="right">
											<xsl:apply-templates select="exnot:PackagesQuantity"/> 
										</td>
										<td class="tdBorder" align="right">
											<xsl:apply-templates select="exnot:WeighQuantity"/> 
										</td>
										<td class="tdBorder" align="center">
											<xsl:apply-templates select="exnot:PackagingKind"/> 
										</td>
										<td class="tdBorder" align="center">
											<xsl:for-each select="exnot:GoodsStatus">
												<xsl:choose>
													<!--xsl:when test="$docSign != '0'"-->
													<xsl:when test="not(exnot:DTInfo/exnot:DTGoods)">
														<xsl:apply-templates select="exnot:StatusSymbolicValue"/>
														<xsl:if test="exnot:CustomsModeCode">
															<xsl:text>/</xsl:text>
															<xsl:apply-templates select="exnot:CustomsModeCode"/>
														</xsl:if>
													</xsl:when>
													<xsl:otherwise>
														<xsl:for-each select="exnot:DTInfo/exnot:DTGoods">
															<xsl:if test="position() != 1"><br/><br/></xsl:if>
															<xsl:apply-templates select="../../exnot:StatusSymbolicValue"/>
															<xsl:if test="../../exnot:CustomsModeCode">
																<xsl:text>/ </xsl:text>
																<xsl:apply-templates select="../../exnot:CustomsModeCode"/>
															</xsl:if>
															<xsl:if test="../exnot:GTDID">
																<xsl:text>/ </xsl:text>
																<xsl:apply-templates select="../exnot:GTDID/cat_ru:CustomsCode"/>
																<xsl:text>/ </xsl:text>
																<xsl:apply-templates select="../exnot:GTDID/cat_ru:RegistrationDate" mode="russian_date_dt"/>
																<xsl:text>/ </xsl:text>
																<xsl:apply-templates select="../exnot:GTDID/cat_ru:GTDNumber"/>
															</xsl:if>
															<xsl:if test="exnot:GoodsNumeric">
																<xsl:text>/ </xsl:text>
																<xsl:apply-templates select="exnot:GoodsNumeric"/>
															</xsl:if>
															<xsl:choose>
																<xsl:when test="exnot:SupplementaryQuantity">
																	<xsl:for-each select="exnot:SupplementaryQuantity">
																		<xsl:text>/ </xsl:text>
																		<xsl:value-of select="cat_ru:GoodsQuantity"/> <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
																		<xsl:if test="cat_ru:MeasureUnitQualifierCode">(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
																	</xsl:for-each>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:if test="exnot:NetWeightQuantity">
																		<xsl:text>/ </xsl:text>
																		<xsl:value-of select="exnot:NetWeightQuantity"/>
																		<xsl:text> кг</xsl:text>
																	</xsl:if>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:for-each>
													</xsl:otherwise>
												</xsl:choose>
												<br/>
											</xsl:for-each>
										</td>
										<td class="tdBorder">
											<xsl:for-each select="exnot:Note">
												<xsl:apply-templates select="."/> 
											</xsl:for-each>
										</td>
										<xsl:if test="//*[local-name()='OEZ_ExportNotif']//*[local-name()='TechID']">
											<td class="tdBorder" style="word-break: break-all;">
												<xsl:choose>
													<xsl:when test="exnot:TechID">
														<xsl:for-each select="exnot:TechID">
															<xsl:apply-templates select="."/>
															<xsl:if test="position()!=last()">; </xsl:if>
														</xsl:for-each>
													</xsl:when>
													<xsl:otherwise>
														<!--br/-->
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="exnot:DocSign='3' or exnot:DocSign='4'">
						<table cellpadding="0" cellspacing="0" style="width:100%; border: 1px solid black;">
							<tbody>
								<tr align="center" valign="top">
									<td class="tdBorder" width="4%">№ п/п</td>
									<td class="tdBorder" width="20%">Наименование товара</td>
									<td class="tdBorder" width="8%">Кол-во товаров</td>
									<td class="tdBorder" width="8%">Кол-во грузовых мест</td>
									<td class="tdBorder" width="8%">Вес товаров</td>
									<td class="tdBorder" width="8%">Вид упаковки</td>
									<td class="tdBorder" width="18%">Статус товаров</td>
									<td class="tdBorder" width="26%">Примечание</td>
								</tr>
								<tr align="center">
									<td class="tdBorder">1</td>
									<td class="tdBorder">2</td>
									<td class="tdBorder">3</td>
									<td class="tdBorder">4</td>
									<td class="tdBorder">5</td>
									<td class="tdBorder">6</td>
									<td class="tdBorder">7</td>
									<td class="tdBorder">8</td>
								</tr>
								<xsl:variable name="docSign" select="exnot:DocSign"/>
								<xsl:for-each select="exnot:GoodsInfo">
									<xsl:variable name="pos" select="position()"/>
									<tr valign="top">
										<td class="tdBorder">
											<xsl:number value="position()"/>
										</td>
										<td class="tdBorder" style="word-break: break-all;">
											<xsl:for-each select="exnot:GoodsDescription">
												<xsl:apply-templates select="."/> 
											</xsl:for-each>
										</td>
										<td class="tdBorder">
											<xsl:for-each select="exnot:SupplementaryQuantity">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
											</xsl:for-each>
										</td>
										<td class="tdBorder" align="right">
											<xsl:apply-templates select="exnot:PackagesQuantity"/> 
										</td>
										<td class="tdBorder" align="right">
											<xsl:apply-templates select="exnot:WeighQuantity"/> 
										</td>
										<td class="tdBorder" align="center">
											<xsl:apply-templates select="exnot:PackagingKind"/> 
										</td>
										<td class="tdBorder" align="center">
											<xsl:for-each select="exnot:GoodsStatus">
												<xsl:choose>
													<!--xsl:when test="$docSign != '0'"-->
													<xsl:when test="not(exnot:DTInfo/exnot:DTGoods)">
														<xsl:apply-templates select="exnot:StatusSymbolicValue"/>
														<xsl:if test="exnot:CustomsModeCode">
															<xsl:text>/</xsl:text>
															<xsl:apply-templates select="exnot:CustomsModeCode"/>
														</xsl:if>
													</xsl:when>
													<xsl:otherwise>
														<xsl:for-each select="exnot:DTInfo/exnot:DTGoods">
															<xsl:if test="position() != 1"><br/><br/></xsl:if>
															<xsl:apply-templates select="../../exnot:StatusSymbolicValue"/>
															<xsl:if test="../../exnot:CustomsModeCode">
																<xsl:text>/ </xsl:text>
																<xsl:apply-templates select="../../exnot:CustomsModeCode"/>
															</xsl:if>
															<xsl:if test="../exnot:GTDID">
																<xsl:text>/ </xsl:text>
																<xsl:apply-templates select="../exnot:GTDID/cat_ru:CustomsCode"/>
																<xsl:text>/ </xsl:text>
																<xsl:apply-templates select="../exnot:GTDID/cat_ru:RegistrationDate" mode="russian_date_dt"/>
																<xsl:text>/ </xsl:text>
																<xsl:apply-templates select="../exnot:GTDID/cat_ru:GTDNumber"/>
															</xsl:if>
															<xsl:if test="exnot:GoodsNumeric">
																<xsl:text>/ </xsl:text>
																<xsl:apply-templates select="exnot:GoodsNumeric"/>
															</xsl:if>
															<xsl:choose>
																<xsl:when test="exnot:SupplementaryQuantity">
																	<xsl:for-each select="exnot:SupplementaryQuantity">
																		<xsl:text>/ </xsl:text>
																		<xsl:value-of select="cat_ru:GoodsQuantity"/> <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
																		<xsl:if test="cat_ru:MeasureUnitQualifierCode">(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
																	</xsl:for-each>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:if test="exnot:NetWeightQuantity">
																		<xsl:text>/ </xsl:text>
																		<xsl:value-of select="exnot:NetWeightQuantity"/>
																		<xsl:text> кг</xsl:text>
																	</xsl:if>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:for-each>
													</xsl:otherwise>
												</xsl:choose>
												<br/>
											</xsl:for-each>
										</td>
										<td class="tdBorder">
											<xsl:for-each select="exnot:Note">
												<xsl:apply-templates select="."/> 
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table style="width:297mm">
							<tbody>
								<tr>
									<td align="center">
										<br/>Таблица "Опись документов"<br/>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<tr>
													<td class="tdBorder" width="10%">№ п/п</td>
													<td class="tdBorder" width="50%">Наименование документов</td>
													<td class="tdBorder" width="40%">Реквизиты (номер, дата) документа</td>
												</tr>
												<tr align="center">
													<td class="tdBorder">1</td>
													<td class="tdBorder">2</td>
													<td class="tdBorder">3</td>
												</tr>
												<xsl:for-each select="exnot:DocList">
													<xsl:variable name="pos" select="position()"/>
													<tr>
														<td class="tdBorder">
															<xsl:number value="position()"/>
														</td>
														<td class="tdBorder">
															<xsl:apply-templates select="cat_ru:PrDocumentName"/>
														</td>
														<td class="tdBorder" align="center">
															№ <xsl:apply-templates select="cat_ru:PrDocumentNumber"/> от <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<br/><br/><br/>
						<table border="0" style="width:297mm">
							<tbody>
								<tr>
									<td align="center" style="width:137mm; border-bottom: 1pt solid windowtext;" valign="top">
										<xsl:choose>
											<xsl:when test="exnot:Resident">
												<xsl:apply-templates select="exnot:Resident/cat_ru:OrganizationName"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates select="exnot:Consignee/cat_ru:OrganizationName"/>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td align="center" style="width:60mm;" valign="top">
										<br/>
									</td>
									<td style="width:100mm; border-bottom: 1pt solid windowtext;">
										<br/>
									</td>
								</tr>
								<tr>
									<td align="center" style="width:137mm" class="graphLittle">
										<xsl:if test="exnot:DocSign='3'">(резидент портового, логистического участка Арктической зоны Российской Федерации или лицо, им уполномоченное)</xsl:if>
										<xsl:if test="exnot:DocSign='4'">(резидент Арктической зоны Российской Федерации или лицо им уполномоченное)</xsl:if>
									</td>
									<td align="center" style="width:60mm;" valign="top">
										<br/>
									</td>
									<td align="center" style="width:100mm" class="graphLittle">
										(подпись)
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
   <xsl:template match="exnot:IncidentNotif/exnot:Address | exnot:Consignor/exnot:Address | exnot:Consignee/exnot:Address | exnot:Resident/RUScat_ru:SubjectAddressDetails | exnot:AddressZone">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<!--xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if-->
				<xsl:value-of select="RUScat_ru:AddressText"/>
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
						<!--xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when-->
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="not(local-name()='AddressKindCode')">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
   </xsl:template>
	<xsl:template match="*" mode="reg_num">
	   <xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
	   <xsl:text>/</xsl:text>
	   <xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="russian_date_gtd"/>
	   <xsl:text>/</xsl:text>
	   <xsl:apply-templates select="*[local-name() = 'Number']"/>
	   <xsl:if test="exnot:AddNumber|oeznr:DocKind">
		   <xsl:text>/</xsl:text>
		   <xsl:apply-templates select="exnot:AddNumber|oeznr:DocKind"/>
	   </xsl:if>
   </xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:apply-templates select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:apply-templates select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:apply-templates select="cat_ru:KPP"/> 
		</xsl:if>
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
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn2"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn2,5,1)='-' and substring($dateIn2,8,1)='-'">
				<xsl:value-of select="substring($dateIn2,9,2)"/>
				<xsl:value-of select="substring($dateIn2,6,2)"/>
				<xsl:value-of select="substring($dateIn2,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn2"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_dt">
		<xsl:param name="dateIn3"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn3,5,1)='-' and substring($dateIn3,8,1)='-'">
				<xsl:value-of select="substring($dateIn3,9,2)"/>
				<xsl:value-of select="substring($dateIn3,6,2)"/>
				<xsl:value-of select="substring($dateIn3,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn3"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="Address">
		<xsl:if test="cat_ru:PostalCode">
			<xsl:apply-templates select="cat_ru:PostalCode"/>, 
	</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:apply-templates select="cat_ru:CounryName"/>, 
	</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:apply-templates select="cat_ru:Region"/>, 
	</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:apply-templates select="cat_ru:City"/>, 
	</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:apply-templates select="cat_ru:StreetHouse"/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
