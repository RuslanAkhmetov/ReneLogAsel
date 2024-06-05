<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:csuo="urn:customs.ru:Information:SertifDocuments:ConfirmationOfSubsoilUserOrg:5.22.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ConfirmationOfSubsoilUserOrgType -->
	<xsl:template match="csuo:ConfirmationOfSubsoilUserOrg">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 20mm;
                  background: #ffffff;
                  border: solid 1pt #000000;
                  }

                  .marg-top
                  {
                  margin-top:5mm;
                  }

                  table
                  {
                  width: 100%;
                  border: 0;
                  empty-cells: show;
                  border-collapse: collapse;
                  margin-top: 1px;
                  }

                  table.border tr td
                  {
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  }

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Электронное подтверждение организации - пользователя недр </b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<xsl:if test="csuo:DocumentDetails">
						<div class="title marg-top">Сведения о документе</div>
						<div>
							<xsl:apply-templates select="csuo:DocumentDetails">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="csuo:SubsoilUserOrg">
						<div class="title marg-top">Организация - пользователь недр</div>
						<div>
							<xsl:apply-templates select="csuo:SubsoilUserOrg">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="csuo:Declarant">
						<div class="title marg-top">Декларант</div>
						<div>
							<xsl:apply-templates select="csuo:Declarant">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Наименование участка недр на котором получены (произведены) товары</td>
							<td class="graphMain value" style="width:50%">
								<xsl:for-each select="csuo:SubsoilPlotName">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()">
										<xsl:text>, </xsl:text>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Количество полученных (произведенных) и переданных декларанту товаров (тонн)</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="csuo:GoodsQuantity" mode="translate_number"/>
							</td>
						</tr>
					</table>
					<xsl:if test="csuo:PersonSignature">
						<div class="title marg-top">Сведения о лице, выдавшем документ (представитель организации - пользователя недр)</div>
						<div>
							<xsl:apply-templates select="csuo:PersonSignature">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="csuo:ContractDetails">
						<div class="title marg-top">Сведения о контракте</div>
						<div>
							<xsl:apply-templates select="csuo:ContractDetails">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="csuo:LicenseDetails">
						<div class="title marg-top">Сведения о лицензии на пользование недрами</div>
						<div>
							<xsl:apply-templates select="csuo:LicenseDetails">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа csuo:DocumentBaseType -->
	<xsl:template match="csuo:ContractDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="csuo:PrDocumentName"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="csuo:PrDocumentNumber"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="csuo:PrDocumentDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа csuo:OrganizationType -->
	<xsl:template match="csuo:Declarant">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="csuo:ShortName"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="csuo:INN"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа csuo:DocumentBaseType -->
	<xsl:template match="csuo:DocumentDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="csuo:PrDocumentName"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="csuo:PrDocumentNumber"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="csuo:PrDocumentDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа csuo:DocumentBaseType -->
	<xsl:template match="csuo:LicenseDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="csuo:PrDocumentName"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="csuo:PrDocumentNumber"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="csuo:PrDocumentDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа csuo:PersonBaseType -->
	<xsl:template match="csuo:PersonSignature">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="csuo:PersonSurname"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Имя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="csuo:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="csuo:PersonMiddleName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Отчество</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="csuo:PersonMiddleName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Должность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="csuo:PersonPost"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа csuo:OrganizationType -->
	<xsl:template match="csuo:SubsoilUserOrg">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="csuo:ShortName"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="csuo:INN"/>
					</td>
				</tr>
			</table>
		</div>
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
	<xsl:template match="//*[local-name()='ConfirmationOfSubsoilUserOrg']//*" priority="-1">
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
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
