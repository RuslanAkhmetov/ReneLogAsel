<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:dcr="urn:customs.ru:Information:ExchangeDocuments:DeclChangeRequest:5.22.0">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
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
	<xsl:template match="//*[local-name()='DeclChangeRequest']//*" priority="-1">
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
	<xsl:template match="dcr:DeclChangeRequest">
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
				<title>Обращение декларанта о внесении изменений (дополнений) в таможенную декларацию</title>
				<style type="text/css">
					body {
					background: #cccccc;
					}

					div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					//padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
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
					.graphMain {
					font-family: Arial;
					font-size: 10pt;
					font-weight: normal;
					}
					.graphLittle {
					font-family: Arial;
					font-size: 7pt;
					}

					.normal{
					font-weight: bold;
					font-family:Arial;
					font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<table style="border:solid 0pt;width:190mm">
						<tbody>
							<tr>
								<td align="center" class="graphMain" style="border:solid 0pt">
									<font size="4">
										<b>
											<xsl:variable name="xpath_RegistrationDate">
												<xsl:call-template name="get_xpath">
													<xsl:with-param name="node" select="dcr:RegNumberDT/cat_ru:RegistrationDate"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:variable name="xpath_RequestDate">
												<xsl:call-template name="get_xpath">
													<xsl:with-param name="node" select="dcr:RequestDate"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:text>Обращение (заявление)</xsl:text><br/><xsl:text>декларанта о внесении изменений (дополнений) в</xsl:text><br/>
											<xsl:text>таможенную декларацию № </xsl:text>
											<xsl:apply-templates select="dcr:RegNumberDT/cat_ru:CustomsCode"/>
											<xsl:text>/</xsl:text>
											<element xml_node="{$xpath_RegistrationDate}">
												<xsl:value-of select="substring(dcr:RegNumberDT/cat_ru:RegistrationDate, 9, 2)"/>
												<xsl:value-of select="substring(dcr:RegNumberDT/cat_ru:RegistrationDate, 6, 2)"/>
												<xsl:value-of select="substring(dcr:RegNumberDT/cat_ru:RegistrationDate, 3, 2)"/>
											</element>	
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="dcr:RegNumberDT/cat_ru:GTDNumber"/>
											<br/><xsl:text>от "</xsl:text>
											<element xml_node="{$xpath_RequestDate}">
												<xsl:value-of select="substring(dcr:RequestDate, 9, 2)"/>"&#160;
												<xsl:choose>
													<xsl:when test="substring(dcr:RequestDate, 6, 2)='01'">января</xsl:when>
													<xsl:when test="substring(dcr:RequestDate, 6, 2)='02'">февраля</xsl:when>
													<xsl:when test="substring(dcr:RequestDate, 6, 2)='03'">марта</xsl:when>
													<xsl:when test="substring(dcr:RequestDate, 6, 2)='04'">апреля</xsl:when>
													<xsl:when test="substring(dcr:RequestDate, 6, 2)='05'">мая</xsl:when>
													<xsl:when test="substring(dcr:RequestDate, 6, 2)='06'">июня</xsl:when>
													<xsl:when test="substring(dcr:RequestDate, 6, 2)='07'">июля</xsl:when>
													<xsl:when test="substring(dcr:RequestDate, 6, 2)='08'">августа</xsl:when>
													<xsl:when test="substring(dcr:RequestDate, 6, 2)='09'">сентября</xsl:when>
													<xsl:when test="substring(dcr:RequestDate, 6, 2)='10'">октября</xsl:when>
													<xsl:when test="substring(dcr:RequestDate, 6, 2)='11'">ноября</xsl:when>
													<xsl:when test="substring(dcr:RequestDate, 6, 2)='12'">декабря</xsl:when>
												</xsl:choose>&#160;
												<xsl:value-of select="substring(dcr:RequestDate, 1, 4)"/>
											</element>	
											<xsl:text>г.</xsl:text>
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table style="width:190mm;border:solid 0pt">
						<tr>
							<td class="graphMain" colspan="2" style="width:190mm;border:solid 0pt">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
						</tr>
						<tr>
							<td class="graphMain" style="width:95mm;border:solid 0pt">
								<xsl:if test="dcr:Customs/cat_ru:OfficeName">
									<xsl:apply-templates select="dcr:Customs/cat_ru:OfficeName"/>&#160;
								</xsl:if>
								Код ТО:<xsl:apply-templates select="dcr:Customs/cat_ru:Code"/><br/>
							</td>
							<td class="graphMain" style="width:95mm;border:solid 0pt">
								<xsl:apply-templates select="dcr:Declarant"/>
							</td>
						</tr>
						<tr>
							<td class="graphMain" colspan="2" style="width:190mm;border:solid 0pt">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
						</tr>
						<tr>
							<td align="left" class="graphMain" colspan="2" style="width:190mm;border:solid 0pt">
								&#160;&#160;&#160;&#160;На основании Порядка внесения изменений и (или)
								дополнений в сведения, указанные в декларации на товары, утвержденного Решением Коллегии Евразийской экономической комиссии от 10 декабря 2013г. №289, в связи с
							</td>
						</tr>
						<tr>
							<td align="left" class="graphMain" colspan="2" style="width:190mm;border:solid 0pt;border-bottom:solid 1pt #000000">
								<xsl:for-each select="dcr:Reasons">
									<xsl:apply-templates select="."/>
									<xsl:if test="position()!=last()">&#160;</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td align="center" class="graphLittle" colspan="2" style="width:190mm;border:solid 0pt;">
								(Обоснование необходимости внесения изменений (дополнений))
							</td>
						</tr>
						<tr>
							<td class="graphMain" colspan="2" style="width:190mm;border:solid 0pt;">
								необходимо внести следующие изменения и (или) дополнения в декларацию №
								<xsl:apply-templates select="dcr:RegNumberDT/cat_ru:GTDNumber" /> от
								<xsl:apply-templates select="dcr:RegNumberDT/cat_ru:RegistrationDate" mode="russian_date"/>
								<xsl:text>, зарегистрированную таможенным органом с кодом </xsl:text>
								<xsl:apply-templates select="dcr:RegNumberDT/cat_ru:CustomsCode"/>
							</td>
						</tr>
						<tr>
							<td class="graphMain" style="width:190mm;border:solid 0pt" colspan="2">
								<table cellpadding="0" cellspacing="0" style="width:180mm;border:solid 1pt #000000">
									<tr>
										<td align="center" class="graphMain" style="width:40mm; border:solid 1pt #000000">
											Обозначение графы<br/> (подраздела графы)
										</td>
										<td align="center" class="graphMain" style="width:70mm; border:solid 1pt #000000">
											Ранее указанные сведения
										</td>
										<td align="center" class="graphMain" style="width:70mm; border:solid 1pt #000000">
											Измененные и (или) дополненные сведения
										</td>
									</tr>
									<xsl:for-each select="dcr:ChangesDescription">
										<tr>
											<td class="graphMain" align="center" style="border:solid 1pt #000000;width:40mm;">
												<xsl:apply-templates select="dcr:GRNumber"/>
											</td>
											<td class="graphMain" style="border:solid 1pt #000000; " align="left">
												<div style="word-wrap: break-word;width: 70mm;">
													<xsl:for-each select="dcr:PreviousData">
														<xsl:apply-templates select="."/>
														<xsl:if test="position()!=last()">
															<xsl:text> </xsl:text>
														</xsl:if>
													</xsl:for-each>
												</div>
												<br/>
												<br/>
											</td>
											<td class="graphMain" style="border:solid 1pt #000000;" align="left">
												<div style="word-wrap: break-word;width: 70mm;">
													<xsl:for-each select="dcr:CorrectData">
														<xsl:apply-templates select="."/>
														<xsl:if test="position()!=last()">
															<xsl:text> </xsl:text>
														</xsl:if>
													</xsl:for-each>
												</div>
											</td>
										</tr>
									</xsl:for-each>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of
				select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="cat_ru:CUOrganizationType | dcr:Declarant">
		<!--<xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:apply-templates select="cat_ru:OrganizationLanguage"/><br/>
	</xsl:if>-->
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName">(</xsl:if>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>&#160;

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

		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<br/>
				Адрес: <xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<br/>
			<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			Контактные сведения:
			<xsl:for-each select="RUScat_ru:CommunicationDetails">
				<xsl:if test="cat_ru:Phone">
					тел.: <xsl:for-each select="cat_ru:Phone">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()">,&#160;</xsl:if>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="cat_ru:Fax">
					факс: <xsl:apply-templates select="cat_ru:Fax"/>&#160;
				</xsl:if>
				<xsl:if test="cat_ru:Telex">
					телекс: <xsl:apply-templates select="cat_ru:Telex"/>&#160;
				</xsl:if>
				<xsl:if test="cat_ru:E_mail">
					эл. почта: <xsl:for-each select="cat_ru:E_mail">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()">,&#160;</xsl:if>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>

	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<span>
				ОГРН: <xsl:apply-templates select="cat_ru:OGRN" />
			</span>&#160;
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<span>
				ИНН: <xsl:apply-templates select="cat_ru:INN" />
			</span>&#160;
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<span>
				КПП: <xsl:apply-templates select="cat_ru:KPP" />
			</span>&#160;
		</xsl:if>
	</xsl:template>

	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span>
				УНП: <xsl:apply-templates select="cat_ru:UNP" />
			</span>&#160;
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span>
				Идентификационный номер: <xsl:apply-templates select="cat_ru:RBIdentificationNumber" />
			</span>&#160;
		</xsl:if>
	</xsl:template>

	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span>
				БИН: <xsl:apply-templates select="cat_ru:BIN" />
			</span>&#160;
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<span>
				ИИН: <xsl:apply-templates select="cat_ru:IIN" />
			</span>&#160;
		</xsl:if>
		<xsl:for-each select="cat_ru:ITN">
			<span>
				ИТН:
				<xsl:apply-templates select="cat_ru:CategoryCode" />/<xsl:apply-templates select="cat_ru:KATOCode" />/<xsl:apply-templates select="cat_ru:RNN" /><xsl:if test="cat_ru:ITNReserv">
					/<xsl:apply-templates select="cat_ru:ITNReserv"/>
				</xsl:if>
			</span>&#160;
		</xsl:for-each>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:variable name="xpath_AddressKindCode">
						<xsl:call-template name="get_xpath">
							<xsl:with-param name="node" select="RUScat_ru:AddressKindCode"/>
						</xsl:call-template>
					</xsl:variable>
					<element xml_node="{$xpath_AddressKindCode}">
						<xsl:choose>
							<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
							<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
						</xsl:choose>
					</element>
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
							<xsl:variable name="xpath_AddressKindCode1">
								<xsl:call-template name="get_xpath">
									<xsl:with-param name="node" select="."/>
								</xsl:call-template>
							</xsl:variable>
							<element xml_node="{$xpath_AddressKindCode1}">
								<xsl:choose>
									<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
									<xsl:when test=".='2'">Фактический адрес: </xsl:when>
									<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
									<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
								</xsl:choose>
							</element>	
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

	<xsl:template match="dcr:Address | dcr:PostalAddress">
		<xsl:if test="cat_ru:PostalCode">
			<xsl:apply-templates select="cat_ru:PostalCode"/>,&#160;
		</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:apply-templates select="cat_ru:CounryName" />
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode">
			(<xsl:apply-templates select="cat_ru:CountryCode"/>)
		</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
			<xsl:apply-templates select="cat_ru:Region" />
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
			<xsl:apply-templates select="cat_ru:City" />
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
			<xsl:apply-templates select="cat_ru:StreetHouse"/>
		</xsl:if>

		<br/>
	</xsl:template>

	<xsl:template match="RUScat_ru:IdentityCard">
		<u>Документ, удостоверяющий личность:</u>&#160;
		<xsl:if test="RUScat_ru:IdentityCardName">
			<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardCode">
			(код вида документа <xsl:apply-templates select="RUScat_ru:IdentityCardCode"/>)
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardName or RUScat_ru:IdentityCardCode">&#160;</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
			<span>
				Серия номер:
				<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
				<xsl:text disable-output-escaping="yes" >&amp;nbsp;</xsl:text>
				<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
			</span>
			&#160;
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName"	>
			Выдан
			<xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="russian_date"/>
			<xsl:text disable-output-escaping="yes" >&amp;nbsp;</xsl:text>
			<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="dcr:DeclRegNumber">
		<!--код/дата/номер-->
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:variable name="xpath_RegistrationDate">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="cat_ru:RegistrationDate"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_RegistrationDate}">
			<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/><xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/><xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>
		</element>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
</xsl:stylesheet>
