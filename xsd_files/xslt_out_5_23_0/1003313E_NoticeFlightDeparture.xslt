<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.23.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:nfd="urn:customs.ru:Information:TransportDocuments:Air:NoticeFlightDeparture:5.23.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dategtd"/>
		<xsl:choose>
			<xsl:when test="substring($dategtd,5,1)='-' and substring($dategtd,8,1)='-'">
				<xsl:value-of select="substring($dategtd,9,2)"/>
				<xsl:value-of select="substring($dategtd,6,2)"/>
				<xsl:value-of select="substring($dategtd,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dategtd"/>
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
	<xsl:template match="nfd:NoticeFlightDeparture">
		<html>
			<head>
				<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<title>Уведомление о выполнении международного рейса</title>
				<style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 210mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}						
						td {
							font-family:Courier;
							}
						.normal{
							font-weight: normal;
							font-family:Courier;
							}
						.bold{
							font-weight: bold;
							font-family:Courier;
							}
						.italic{
							font-style: italic;
							font-family:Courier;
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;
						}
					.graphMain {
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph9Bold {
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						}				
						.bordered {
					border: solid 1pt #000000;
										}			
					</style>
			</head>
			<body>
				<div class="page">
					<table border="0" style="width:190mm">
						<tbody>
							<tr>
								<td align="center" colspan="2">
									<span style="font-weight:bold; ">УВЕДОМЛЕНИЕ О ВЫПОЛНЕНИИ МЕЖДУНАРОДНОГО РЕЙСА<br/>
										<br/>
									</span>
								</td>
							</tr>
							<tr>
								<td align="left" valign="top">
									<span class="graph">
										<u>Наименование перевозчика:</u>
									</span>
								</td>
								<td align="left" valign="top">
									<span class="graph">
										<xsl:apply-templates select="nfd:Carrier"/>
									</span>
								</td>
							</tr>
							<tr style="height:6mm">
								<td align="left" colspan="2" valign="top">
									<xsl:text> </xsl:text>
								</td>
							</tr>
							<tr>
								<td align="left" valign="top">
									<span class="graph">
										<u>Таможенный орган, в регионе деятельности <br/>которого находится воздушный пункт пропуска:</u>
									</span>
								</td>
								<td align="left" valign="top">
									<span class="graph">
										<xsl:apply-templates select="nfd:CustomsOffice"/>
									</span>
								</td>
							</tr>
							<tr style="height:4mm">
								<td align="left" colspan="2" valign="top">
									<xsl:text> </xsl:text>
								</td>
							</tr>
							<tr>
								<td align="left" colspan="2" valign="top">
									<span class="graph">
										<u>Сведения об убытии воздушного судна</u>
									</span>
								</td>
							</tr>
							<xsl:for-each select="nfd:DepartureInfo">
								<tr>
									<td align="left" valign="top">
										<span class="graph">
											Номер рейса:
										</span>
									</td>
									<td align="left" valign="top">
										<span class="graph">
											<xsl:value-of select="catTrans_ru:FlightNumber"/>
										</span>
									</td>
								</tr>
								<tr>
									<td align="left" valign="top">
										<span class="graph">
											Дата рейса:
										</span>
									</td>
									<td align="left" valign="top">
										<span class="graph">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="catTrans_ru:FlightDate"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<xsl:if test="catTrans_ru:Mark">
									<tr>
										<td align="left" valign="top">
											<span class="graph">
											Тип воздушного судна:
										</span>
										</td>
										<td align="left" valign="top">
											<span class="graph">
												<xsl:value-of select="catTrans_ru:Mark"/>
											</span>
											<br/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="catTrans_ru:AirPlaneRegNum">
									<tr>
										<td align="left" valign="top">
											<span class="graph">
											Бортовой номер воздушного судна:
										</span>
										</td>
										<td align="left" valign="top">
											<span class="graph">
												<xsl:value-of select="catTrans_ru:AirPlaneRegNum"/>
											</span>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="catTrans_ru:FlightTime">
									<tr>
										<td align="left" valign="top">
											<span class="graph">
											Время вылета рейса:
										</span>
										</td>
										<td align="left" valign="top">
											<span class="graph">
												<xsl:value-of select="catTrans_ru:FlightTime"/>
											</span>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td align="left" valign="top">
										<span class="graph">
											Аэропорт отправления:
										</span>
									</td>
									<td align="left" valign="top">
										<span class="graph">
											<xsl:value-of select="catTrans_ru:DepartureAirport/catTrans_ru:IATACode"/>
											<xsl:if test="catTrans_ru:DepartureAirport/catTrans_ru:Name"> (<xsl:value-of select="catTrans_ru:DepartureAirport/catTrans_ru:Name"/>)</xsl:if>
										</span>
									</td>
								</tr>
								<tr>
									<td align="left" valign="top">
										<span class="graph">
											Расчетное время вылета рейса:
										</span>
									</td>
									<td align="left" valign="top">
										<span class="graph">
											<xsl:value-of select="nfd:EstimatedFlightTime"/>
										</span>
									</td>
								</tr>
								<tr>
									<td align="left" colspan="2" valign="top">
										<span class="graph9Bold">
											<br/>Маршрут следования:
										</span>
									</td>
								</tr>
								<xsl:for-each select="nfd:RouteInfo">
									<tr>
										<td align="left" valign="top">
											<xsl:value-of select="position()"/>) <xsl:value-of select="catTrans_ru:NumPP"/>
										</td>
										<td align="left" valign="top">
											<xsl:text> </xsl:text>
										</td>
									</tr>
									<xsl:if test="catTrans_ru:CarrierName">
										<tr>
											<td align="left" valign="top">
												<span class="graph">Наименование перевозчика</span>
											</td>
											<td align="left" valign="top">
												<span class="graph">
													<xsl:value-of select="catTrans_ru:CarrierName"/>
												</span>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="catTrans_ru:CarrierCode">
										<tr>
											<td align="left" valign="top">
												<span class="graph">Двухсимвольный код перевозчика</span>
											</td>
											<td align="left" valign="top">
												<span class="graph">
													<xsl:value-of select="catTrans_ru:CarrierCode"/>
												</span>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="catTrans_ru:FlightNumber">
										<tr>
											<td align="left" valign="top">
												<span class="graph">Номер рейса</span>
											</td>
											<td align="left" valign="top">
												<span class="graph">
													<xsl:value-of select="catTrans_ru:FlightNumber"/>
												</span>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="catTrans_ru:FlightDate">
										<tr>
											<td align="left" valign="top">
												<span class="graph">Дата рейса</span>
											</td>
											<td align="left" valign="top">
												<span class="graph">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="catTrans_ru:FlightDate"/>
													</xsl:call-template>
												</span>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="catTrans_ru:Airport">
										<tr>
											<td align="left" valign="top">
												<span class="graph">Следующий  аэропорт</span>
											</td>
											<td align="left" valign="top">
												<span class="graph">
													<xsl:value-of select="catTrans_ru:Airport/catTrans_ru:IATACode"/>
													<xsl:if test="catTrans_ru:Airport/catTrans_ru:Name"> (<xsl:value-of select="catTrans_ru:Airport/catTrans_ru:Name"/>)
													</xsl:if>
												</span>
											</td>
										</tr>
									</xsl:if>
									<tr/>
									<tr style="height:6mm">
										<td align="left" colspan="2" valign="top">
											<xsl:text> </xsl:text>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:for-each>
							<tr style="height:4mm">
								<td align="left" colspan="2" valign="top">
									<xsl:text> </xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="nfd:CustomsOffice">
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
		(<xsl:value-of select="cat_ru:OfficeName"/>)
	</xsl:if>
	</xsl:template>
	<xsl:template match="nfd:Carrier">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName">(</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
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
		<xsl:if test="RUScat_ru:CountryA2Code">
			<br/>
		Код страны:
		<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<br/>
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<br/>
		Наименование ОПФ:
		<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<br/>
		УИТН:
			<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<br/>
		УИ ФЛ:
		<xsl:value-of select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<br/>
			<span class="header">Адрес:</span>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">
					<br/>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<br/>
			<xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<br/>
			<span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<br/>
			<span>ИНН: <xsl:value-of select="cat_ru:INN"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<br/>
			<span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<br/>
			<span>УНП: <xsl:value-of select="cat_ru:UNP"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<br/>
			<span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<br/>
			<span>БИН: <xsl:value-of select="cat_ru:BIN"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<br/>
			<span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
			</span>
		</xsl:if>
		<xsl:for-each select="cat_ru:ITN">
			<br/>
			<span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
				<xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
				</xsl:if>
			</span>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">Код ОПФ: <xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId"> (по справ. <xsl:value-of select="RUScat_ru:CodeListId"/>)</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">&#160;(<xsl:value-of select="RUScat_ru:CountryCode"/>)</xsl:if>
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
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
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
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when>
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
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template mode="identity" match="*">
		<xsl:text> Документ, удостоверяющий личность: </xsl:text>
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.), 'Date')">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
