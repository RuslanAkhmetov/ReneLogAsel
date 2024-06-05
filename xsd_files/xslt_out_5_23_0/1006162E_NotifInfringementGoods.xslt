<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:infrig="urn:customs.ru:Information:CustomsDocuments:NotifInfringementGoods:5.22.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
	<xsl:template match="//*[local-name()='NotifInfringementGoods']//*" priority="-1">
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
	<xsl:template name="date_time">
		<xsl:param name="dateTimeIn"/>
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="$dateTimeIn"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
			<xsl:value-of select="substring($dateTimeIn,12,5)"/>
		</element>
	</xsl:template>
	<xsl:template match="infrig:NotifInfringementGoods">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Уведомление о  соответствии/несоответствии товаров заявленным сведениям</title>
				<style type="text/css">
				body {
					background: #cccccc;
				}

				div.page {
					width: 210mm;
					height: 297mm;
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
					font-family: Arial, serif;
				}
				
				.auxiliary tbody tr td {
					border: 0;
				}
			</style>
			</head>
			<body>
				<div class="page">
					<xsl:call-template name="dateTimeRemark"/>
					<xsl:variable name="xpath_DocSign">
						<xsl:call-template name="get_xpath">
							<xsl:with-param name="node" select="infrig:DocSign"/>
						</xsl:call-template>
					</xsl:variable>
					<element xml_node="{$xpath_DocSign}">
						<xsl:choose>
							<xsl:when test="infrig:DocSign = '0' ">
								<h2>Уведомление о том, что прибывший  товар не соответствует заявленным сведениям</h2>
							</xsl:when>
							<xsl:otherwise>
								<h2>Уведомление о том, что прибывший  товар соответствует заявленным сведениям</h2>
							</xsl:otherwise>
						</xsl:choose>
					</element>
					<span class="header">Уполномоченный экономический оператор</span>
					<br/>
					<xsl:apply-templates select="infrig:EconomicOperator"/>
					<br/>
					<br/>
					<xsl:choose>
						<xsl:when test="infrig:DocSign = '0' ">
							<span class="header">Выявленное несоответствие прибывших товаров заявленным сведениям</span>
							<table>
								<tbody>
									<tr>
										<td align="center" class="low">Номер товара по ДТ/списку</td>
										<td align="center" class="low">Наименование и характеристика товара</td>
										<td align="center" class="low">Описание расхождения</td>
									</tr>
									<xsl:for-each select="infrig:FoundDiscrepancy">
										<tr>
											<td>
												<xsl:apply-templates select="infrig:GoodsNumeric"/>
											</td>
											<td>
												<xsl:for-each select="infrig:GoodsDescription">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</td>
											<td>
												<xsl:apply-templates select="infrig:Comment"/>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:when>
					</xsl:choose>
					<xsl:apply-templates select="infrig:AuthorizedPerson"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="dateTimeRemark">
		<div align="right">
			<table border="0" style="margin-top:50px; width:60mm">
				<tbody>
					<tr>
						<td align="center" style="border-right:0; border-left:0; border-top:0">
							<xsl:apply-templates select="infrig:Date" mode="russian_date"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:if test="infrig:Time">
								<xsl:value-of select="substring(infrig:Time, 1, 8)"/>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td align="center" style="border:0;">Дата, время принятия решения</td>
					</tr>
				</tbody>
			</table>
		</div>
	</xsl:template>
	<xsl:template match="infrig:EconomicOperator">
		<xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:apply-templates select="cat_ru:OrganizationLanguage"/>
			<br/>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
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
		<xsl:if test="RUScat_ru:CountryA2Code">
			<br/>
		Код страны:
		<xsl:apply-templates select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<br/>
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<br/>
		Наименование ОПФ:
		<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<br/>
		УИТН:
			<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<br/>
		УИ ФЛ:
		<xsl:apply-templates select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<br/>
			<span class="header">Адрес:</span>
			<br/>
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
			<span>ОГРН: <xsl:apply-templates select="cat_ru:OGRN"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<br/>
			<span>ИНН: <xsl:apply-templates select="cat_ru:INN"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<br/>
			<span>	КПП: <xsl:apply-templates select="cat_ru:KPP"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<br/>
			<span>УНП: <xsl:apply-templates select="cat_ru:UNP"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<br/>
			<span>Идентификационный номер: <xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<br/>
			<span>БИН: <xsl:apply-templates select="cat_ru:BIN"/>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<br/>
			<span>ИИН: <xsl:apply-templates select="cat_ru:IIN"/>
			</span>
		</xsl:if>
		<xsl:for-each select="cat_ru:ITN">
			<br/>
			<span>	
			ИТН: 
			<xsl:apply-templates select="cat_ru:CategoryCode"/>/<xsl:apply-templates select="cat_ru:KATOCode"/>/<xsl:apply-templates select="cat_ru:RNN"/>
				<xsl:if test="cat_ru:ITNReserv">/<xsl:apply-templates select="cat_ru:ITNReserv"/>
				</xsl:if>
			</span>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">Код ОПФ: <xsl:apply-templates select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId"> (по справ. <xsl:apply-templates select="RUScat_ru:CodeListId"/>)</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<xsl:apply-templates select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">&#160;(<xsl:apply-templates select="RUScat_ru:CountryCode"/>)</xsl:if>
	</xsl:template>
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
	<xsl:template mode="identity" match="*">
		<span class="header">
			<xsl:text> Документ, удостоверяющий личность: </xsl:text>
		</span>
		<br/>
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.), 'Date')">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="infrig:AuthorizedPerson">
		<!--ФИО - отдельные поля-->
		<table border="0" style="margin-top:50px; width:100%">
			<tbody>
				<tr>
					<td align="center" style="border-right:0; border-left:0; border-top:0">
						<xsl:apply-templates select="cat_ru:PersonSurname"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:apply-templates select="cat_ru:PersonName"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
					</td>
					<td style="border:0;" width="40px"/>
					<td align="center" style="border-right:0; border-left:0; border-top:0" width="25%">
						<xsl:apply-templates select="cat_ru:PersonPost"/>
					</td>
					<td style="border:0;" width="40px"/>
					<td align="center" style="border-right:0; border-left:0; border-top:0" width="25%">
						<xsl:apply-templates select="cat_ru:IssueDate" mode="russian_date"/>
					</td>
				</tr>
				<tr>
					<td align="center" class="low" style="border:0;">
						<xsl:choose>
							<xsl:when test="../infrig:DocSign = '1' ">
							Ф.И.О. лица, установившего факт нарушения средств идентификации
						</xsl:when>
							<xsl:otherwise>Ф.И.О. лица, установившего факт несоответствия заявленным сведениям</xsl:otherwise>
						</xsl:choose>
					</td>
					<td style="border:0;"/>
					<td align="center" class="low" style="border:0;">Должность</td>
					<td style="border:0;"/>
					<td align="center" class="low" style="border:0;">Дата подписания</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
