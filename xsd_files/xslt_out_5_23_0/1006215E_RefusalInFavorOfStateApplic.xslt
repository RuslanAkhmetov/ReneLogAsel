<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:rsfa="urn:customs.ru:Information:CustomsDocuments:RefusalInFavorOfStateApplic:5.22.0">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="rsfa:RefusalInFavorOfStateApplic">
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>Заявление на помещение товаров под таможенную процедуру отказа в пользу государства</title>
				<style>
					body {
					background: #cccccc;
					}


					div.page {
					width: 190mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}
					p.ConsPlusNonformat, li.ConsPlusNonformat, div.ConsPlusNonformat
					{mso-style-name:ConsPlusNonformat;
					margin:0cm;
					margin-bottom:.0001pt;
					text-autospace:none;
					font-size:10.0pt;
					font-family:"Arial";}
				</style>
			</head>
			<body>
				<div class="page">

					<p class='ConsPlusNonformat' style='text-align:center; margin-bottom:5mm'>
						<font size="4">
							<b>
								<xsl:value-of select="rsfa:Customs/cat_ru:OfficeName" />
							</b>
						</font>
					</p>

					<p class='ConsPlusNonformat' style='text-align:center; margin-bottom:5mm'>
						<font size="3">
							<b>
								Заявление на помещение товаров <br/>
								под таможенную процедуру отказа в пользу государства
							</b>
						</font>
					</p>

					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						1. Выдано (наименование,  адрес  и  место государственной  регистрации заявителя)
					</p>
					<p class='ConsPlusNonformat'>
						<xsl:apply-templates mode="organization" select="rsfa:Declarant"/><br/>
						<xsl:if test="rsfa:Declarant/RUScat_ru:SubjectAddressDetails">
							<xsl:for-each select="rsfa:Declarant/RUScat_ru:SubjectAddressDetails">
								<xsl:apply-templates select="."/>
								<br/>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="rsfa:Declarant/rsfa:FactAddress">
						Фактический адрес: <xsl:apply-templates mode="address" select="rsfa:Declarant/rsfa:FactAddress"/>
						</xsl:if>
					</p>

					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						2. Наименование товаров
					</p>
					<p class='ConsPlusNonformat'>
						<xsl:variable name='GoodDescription'>
							<xsl:for-each select='rsfa:Goods/rsfa:GoodDescription'>
								<xsl:if test='position()!=1'>
									<xsl:text>, </xsl:text>
								</xsl:if>
								<xsl:value-of select='.'/>
							</xsl:for-each>
						</xsl:variable>
						<xsl:call-template name='PrintSplittedStr'>
							<xsl:with-param name='strIn' select='$GoodDescription' />
						</xsl:call-template>
					</p>

					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						3. Классификационный(ые) код(ы) по ТН ВЭД ЕАЭС на
						уровне  десяти  знаков
					</p>
					<p class='ConsPlusNonformat'>
						<xsl:variable name='GoodsTNVEDCode'>
							<xsl:for-each select='rsfa:Goods/rsfa:GoodsTNVEDCode'>
								<xsl:if test='position()!=1'>
									<xsl:text>, </xsl:text>
								</xsl:if>
								<xsl:value-of select='.'/>
							</xsl:for-each>
						</xsl:variable>
						<xsl:call-template name='PrintSplittedStr'>
							<xsl:with-param name='strIn' select='$GoodsTNVEDCode' />
						</xsl:call-template>
					</p>


					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						4. Количество товаров
						<span style='width:30mm;display:inline-block;border-bottom: solid 1px black'>
							<xsl:value-of select='count(rsfa:Goods)'/>
						</span>
					</p>

					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						5. Стоимость товаров
						<span style='width:30mm;display:inline-block;border-bottom: solid 1px black'>
							<xsl:value-of select='rsfa:TotalCost'/>
						</span>
					</p>

					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						6. Фактическое   местонахождение  товаров  на  территории   Российской Федерации
					</p>
					<p class='ConsPlusNonformat'>
					<xsl:apply-templates mode="address" select="rsfa:GoodsPlace"/>
					</p>

					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						7. Место, определенное для размещения товаров
					</p>
					<p class='ConsPlusNonformat'>
						<xsl:apply-templates mode="address" select="rsfa:StoragePlace"/>
					</p>

					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						8. Причины отказа от товаров в пользу государства
					</p>

					<p class='ConsPlusNonformat'>
						<xsl:variable name='Reasons'>
							<xsl:for-each select='rsfa:Reasons'>
								<xsl:if test='position()!=1'>
									<xsl:text>, </xsl:text>
								</xsl:if>
								<xsl:value-of select='.'/>
							</xsl:for-each>
						</xsl:variable>
						<xsl:call-template name='PrintSplittedStr'>
							<xsl:with-param name='strIn' select='$Reasons' />
						</xsl:call-template>
					</p>


				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template mode="organization" match="*">
		<span style='border-bottom: solid 1px black;width:100%;display:inline-block'>
			<xsl:if test="cat_ru:OrganizationName">
				<xsl:value-of select="cat_ru:OrganizationName"/>
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="cat_ru:ShortName">
				<xsl:value-of select="cat_ru:ShortName"/>
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures">
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<xsl:value-of select="concat('ИНН ', cat_ru:RFOrganizationFeatures/cat_ru:INN)"/>,
				</xsl:if>
			</xsl:if>
		</span>
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
					<br/>
				</xsl:if>
				<xsl:if test="not(RUScat_ru:AddressKindCode)">
					Адрес: <br/>
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
							<br/>
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

	<xsl:template mode="address" match="*">
		<span style='border-bottom: solid 1px black;width:100%;display:inline-block'>
			<xsl:if test="cat_ru:PostalCode">
				<xsl:value-of select="cat_ru:PostalCode"/>,
			</xsl:if>
			<xsl:if test="cat_ru:CountryCode">
				<xsl:value-of select="cat_ru:CountryCode"/>,
			</xsl:if>
			<xsl:if test="cat_ru:CounryName">
				<xsl:value-of select="cat_ru:CounryName"/>,
			</xsl:if>
			<xsl:if test="cat_ru:Region">
				<xsl:value-of select="cat_ru:Region"/>,
			</xsl:if>
			<xsl:if test="cat_ru:City">
				<xsl:value-of select="cat_ru:City"/>,
			</xsl:if>
			<xsl:if test="cat_ru:StreetHouse">
				<xsl:value-of select="cat_ru:StreetHouse"/>
			</xsl:if>
		</span>
	</xsl:template>
	
	<xsl:template name="PrintSplittedStr">
		<xsl:param name="strIn" />
		<xsl:param name="len" select="125" />
		<xsl:choose>
			<xsl:when test="string-length($strIn) &lt; $len">
				<xsl:if test="string-length($strIn) != 0">
					<span style='border-bottom: solid 1px black;width:100%;display:inline-block'>
						<xsl:value-of select="$strIn"/>
					</span>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="left">
					<xsl:call-template name="reverse">
						<xsl:with-param name="pStr" select="substring($strIn, 1, $len)" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="SpacePos" select="string-length($left) - string-length(substring-before($left, ' '))"/>
				<xsl:message>
					<xsl:value-of select="$SpacePos" />
				</xsl:message>

				<span style='border-bottom: solid 1px black;width:100%;display:inline-block'>
					<xsl:value-of select="substring($strIn, 1, $SpacePos)"/>
				</span>
				<xsl:call-template name="PrintSplittedStr">
					<xsl:with-param name="strIn" select="substring($strIn, $SpacePos + 1)" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>

	<xsl:template name="reverse">
		<xsl:param name="pStr"/>

		<xsl:variable name="vLength" select="string-length($pStr)"/>
		<xsl:choose>
			<xsl:when test="$vLength = 1">
				<xsl:value-of select="$pStr"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="vHalfLength" select="floor($vLength div 2)"/>
				<xsl:variable name="vrevHalf1">
					<xsl:call-template name="reverse">
						<xsl:with-param name="pStr"
								 select="substring($pStr, 1, $vHalfLength)"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="vrevHalf2">
					<xsl:call-template name="reverse">
						<xsl:with-param name="pStr"
								 select="substring($pStr, $vHalfLength+1)"/>
					</xsl:call-template>
				</xsl:variable>

				<xsl:value-of select="concat($vrevHalf2, $vrevHalf1)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


</xsl:stylesheet>