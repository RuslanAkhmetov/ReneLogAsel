<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0" xmlns:lpc_id="urn:customs.ru:Information:CustomsDocuments:LongProcConclusionIdentify:5.22.0">
	<!-- Шаблон для типа LongProcConclusionIdentifyType -->
	<xsl:template match="lpc_id:LongProcConclusionIdentify">
		<xsl:param name="w" select="277" />
		<html>
			<head>
				<style>
					body
					{background: #cccccc;font-family: Arial;}

					div
					{white-space: normal;}

					div.page
					{margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.marg-top
					{margin-top:5mm;}

					table
					{width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					table.border tr td
					{border: 1px solid windowtext;}

					.value
					{border-bottom: solid 1px black;
					font-family: Arial;
					font-size: 11pt;
					font-style: italic;}

					.annot
					{font-family: Arial;
					font-size: 11pt;}

					.title
					{font-weight:bold;
					font-family: Arial;
					font-size: 11pt;}

					tr.title td
					{font-weight:bold;
					font-family: Arial;
					font-size: 9pt;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}
				</style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Уведомление о применении способа(ов) идентификации</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br />
					<!--table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="cat_ru:DocumentID" />
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:RefDocumentID" />
								</td>
							</tr>
						</table>
					</xsl:if-->
					<xsl:if test="lpc_id:Customs">
						<div class="title marg-top">Таможенный орган</div>
						<div>
							<xsl:apply-templates select="lpc_id:Customs">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="lpc_id:AppIdentifNumber">
						<div class="title marg-top">Регистрационный номер заявления о проведении идентификации товаров</div>
						<div>
							<xsl:apply-templates select="lpc_id:AppIdentifNumber">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<div class="title marg-top">Сведения о товарах и способах их идентификации и решение таможенного органа о возможности применения заявленного способа идентификации</div>
					<table class="bordered">
						<tbody>
							<tr class="title" valign="top">
								<td class="bordered">№ п/п</td>
								<td class="bordered">Описание товара</td>
								<td class="bordered">Сведения о производителе (изготовителе)</td>
								<td class="bordered">Сведения об иных технических и коммерческих характеристиках товара</td>
								<td class="bordered">Сведения о стране происхождения товара</td>
								<td class="bordered">Десятизначный код товара в соответствии с единой ТН ВЭД ЕАЭС</td>
								<td class="bordered">Вес товара</td>
								<td class="bordered">Количество товара с указанием дополнительной единицы измерения</td>
								<td class="bordered">Сведения о способе идентификации товара</td>
								<td class="bordered">Решение таможенного органа о (не)возможности применения заявленного способа идентификации</td>
								<td class="bordered">Описание причины принятия таможенным органом решения о невозможности идентификации товара в соответствии с заявленным способом идентификации</td>
							</tr>
							<xsl:for-each select="lpc_id:GoodsIdentif">
								<xsl:apply-templates select=".">
									<xsl:with-param name="wdth" select="$w" />
								</xsl:apply-templates>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:if test="lpc_id:CustomsPerson">
						<div class="title marg-top">Подпись должностного лица</div>
						<div>
							<xsl:apply-templates select="lpc_id:CustomsPerson">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="lpc_id:AppIdentifNumber">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<xsl:apply-templates select="cat_ru:CustomsCode" />
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="num_date" />
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber" />
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="lpc_id:Customs">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:Code" />
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:OfficeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OfficeName" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа lpc_id:CustomsPersonSignatureType -->
	<xsl:template match="lpc_id:CustomsPerson">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PersonName" />
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:LNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:LNP" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата подписания</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="lpc_id:IssueDate" mode="russian_date" />
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа lpc_id:DestinationCountryType -->
	<xsl:template match="lpc_id:DestinationCountry">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<xsl:for-each select="*">
			<xsl:if test="position() != 1"><br/></xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа lpc_id:GoodsIdentifType -->
	<xsl:template match="lpc_id:GoodsIdentif">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr valign="top">
				<td class="bordered">
					<xsl:apply-templates select="lpc_id:Position" />
				</td>
				<td class="bordered">
					<xsl:apply-templates select="lpc_id:GoodsDescription" />
					<xsl:if test="lpc_id:TrademarkDescription">
						<br/>
						<xsl:apply-templates select="lpc_id:TrademarkDescription" />
					</xsl:if>
					<xsl:if test="lpc_id:GoodsMark">
						<br/>
						<xsl:apply-templates select="lpc_id:GoodsMark" />
					</xsl:if>
					<xsl:if test="lpc_id:GoodsModel">
						<br/>
						<xsl:apply-templates select="lpc_id:GoodsModel" />
					</xsl:if>
					<xsl:if test="lpc_id:GoodsMarking">
						<br/>
						<xsl:apply-templates select="lpc_id:GoodsMarking" />
					</xsl:if>
					<xsl:if test="lpc_id:GoodsSort">
						<br/>
						<xsl:apply-templates select="lpc_id:GoodsSort" />
					</xsl:if>
					<xsl:if test="lpc_id:GoodsStandard">
						<br/>
						<xsl:apply-templates select="lpc_id:GoodsStandard" />
					</xsl:if>
					<xsl:if test="lpc_id:SerialNumber">
						<br/>
						<xsl:for-each select="lpc_id:SerialNumber">
							<xsl:if test="position()!=1"><xsl:text>, </xsl:text></xsl:if>
							<xsl:apply-templates select="." />
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="lpc_id:ProductionDate">
						<br/>
						<xsl:apply-templates select="lpc_id:ProductionDate" mode="russian_date" />
					</xsl:if>
				</td>
				<td class="bordered">
					<xsl:if test="lpc_id:ManufacturerPerson">
						<xsl:apply-templates select="lpc_id:ManufacturerPerson">
							<xsl:with-param name="wdth" select="$w" />
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="bordered">
					<xsl:apply-templates select="lpc_id:OtherCharacteristics" />
				</td>
				<td class="bordered">
					<xsl:apply-templates select="lpc_id:DestinationCountry">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</td>
				<td class="bordered">
					<xsl:apply-templates select="lpc_id:GoodsTNVEDCode" />
				</td>
				<td class="bordered">
					<xsl:text>Брутто: </xsl:text>
					<xsl:apply-templates select="lpc_id:GrossWeightQuantity" mode="translate_number" />
					<br/>
					<xsl:text>Нетто: </xsl:text>
					<xsl:apply-templates select="lpc_id:NetWeightQuantity" mode="translate_number" />
				</td>
				<td class="bordered">
					<xsl:if test="lpc_id:GoodsQuantity">
						<xsl:apply-templates select="lpc_id:GoodsQuantity">
							<xsl:with-param name="wdth" select="$w" />
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="bordered">
					<xsl:apply-templates select="lpc_id:IdentifMean">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</td>
				<td class="bordered">
					<xsl:choose>
						<xsl:when test="lpc_id:Decision='true' or lpc_id:Decision='1'">
							<xsl:text>идентификация заявленным способом возможна</xsl:text>
						</xsl:when>
						<xsl:when test="lpc_id:Decision='false' or lpc_id:Decision='0'">
							<xsl:text>идентификация заявленным способом невозможна</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="lpc_id:Decision" />
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="bordered">
					<xsl:if test="lpc_id:RefusalReason">
						<xsl:apply-templates select="lpc_id:RefusalReason">
							<xsl:with-param name="wdth" select="$w" />
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:SupplementaryQuantityType -->
	<xsl:template match="lpc_id:GoodsQuantity">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<xsl:apply-templates select="catESAD_cu:GoodsQuantity" mode="translate_number" />
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName" />
		<xsl:if test="catESAD_cu:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierCode" />
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа lpc_id:IdentifMeanType -->
	<xsl:template match="lpc_id:IdentifMean">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
			
			<xsl:choose>
				<xsl:when test="lpc_id:IdentifMeanPunkt='А'">
					<xsl:text>использование имеющейся маркировки товаров, в том числе в виде серийных номеров</xsl:text>
				</xsl:when>
				<xsl:when test="lpc_id:IdentifMeanPunkt='Б'">
					<xsl:text>подробное описание товаров</xsl:text>
				</xsl:when>
				<xsl:when test="lpc_id:IdentifMeanPunkt='В'">
					<xsl:text>использование товаросопроводительной и (или) иной документации</xsl:text>
				</xsl:when>
				<xsl:when test="lpc_id:IdentifMeanPunkt='Г'">
					<xsl:text>сопоставление результатов исследований товаров, в том числе их проб и (или) образцов</xsl:text>
				</xsl:when>
				<xsl:when test="lpc_id:IdentifMeanPunkt='Д'">
					<xsl:text>изготовление декларантом масштабных изображений</xsl:text>
				</xsl:when>
				<xsl:when test="lpc_id:IdentifMeanPunkt='Е'">
					<xsl:text>изготовление декларантом фотографий</xsl:text>
				</xsl:when>
				<xsl:when test="lpc_id:IdentifMeanPunkt='Ж'">
					<xsl:text>изготовление декларантом иллюстраций</xsl:text>
				</xsl:when>
				<xsl:when test="lpc_id:IdentifMeanPunkt='З'">
					<xsl:text>составление декларантом чертежей</xsl:text>
				</xsl:when>
				<xsl:when test="lpc_id:IdentifMeanPunkt='И'">
					<xsl:text>иной способ, который может быть применен исходя из характера товара</xsl:text>
				</xsl:when>
				<xsl:otherwise>
				<xsl:value-of select="lpc_id:IdentifMeanPunkt" />
				</xsl:otherwise>
			</xsl:choose>
			<br/>
			<xsl:apply-templates select="lpc_id:IdentifMeanName" />
			<br/>
			<xsl:apply-templates select="lpc_id:IdentifMeanDescription" />

	</xsl:template>
	<!-- Шаблон для типа lpc_id:ManufacturerPersonType -->
	<xsl:template match="lpc_id:ManufacturerPerson">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<xsl:for-each select="*">
			<xsl:if test="position() != 1"><br/></xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа lpc_id:RefusalReasonType -->
	<xsl:template match="lpc_id:RefusalReason">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<xsl:apply-templates select="lpc_id:ReasonDescription" />
		<xsl:if test="lpc_id:Note">
			<br/>
			<xsl:text>Примечание: </xsl:text>
			<xsl:apply-templates select="lpc_id:Note" />
		</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn" />
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)" />
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)" />
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="num_date">
		<xsl:param name="dateIn" />
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)" />
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)" />
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='LongProcConclusionIdentify']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()" />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates />
		</element>
	</xsl:template>
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="." />
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()" />
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])" />
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath" />
	</xsl:template>
	<xsl:template match="*" mode="date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="." />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="." />
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="." />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="." />
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="num_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="." />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="num_date">
				<xsl:with-param name="dateIn" select="." />
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="." />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')" />
		</element>
	</xsl:template>
</xsl:stylesheet>