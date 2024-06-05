<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0" xmlns:rifos_notif="urn:customs.ru:Information:CustomsDocuments:RefusalInFavorOfStateNotif:5.22.0">
	<!-- Шаблон для типа RefusalInFavorOfStateNotifType -->
	<xsl:template match="rifos_notif:RefusalInFavorOfStateNotif">
		<xsl:param name="w" select="180"/>
		<html>
			<head>
				<style>
					body
					{background: #cccccc;
					font-family: Arial;}

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
					font-style: Italic;}

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

					.indent
					{text-indent: 1.5em;}

					.underlined
					{border-bottom: 1px solid windowtext;}

					.delim_3
					{height: 3pt;}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="3">
										<b>Уведомление<br/>о намерении помещения иностранных товаров<br/>под таможенную процедуру отказа в пользу государства</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody style="font-size: 10pt">
							<tr style="text-align: justify">
								<td>
									<b><xsl:text>1. Наименование декларанта: </xsl:text></b>
									<u>
										<xsl:value-of select="rifos_notif:Declarant/cat_ru:OrganizationName"/>
										<xsl:if test="rifos_notif:Declarant/cat_ru:ShortName">
											<xsl:text> (</xsl:text>
											<xsl:value-of select="rifos_notif:Declarant/cat_ru:ShortName"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
									</u>
									<xsl:text>;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr style="text-align: justify">
								<td>
									<b><xsl:text>2. Наименование иностранных товаров: </xsl:text></b>
									<u>
										<xsl:for-each select="rifos_notif:RIFOSGood">
											<xsl:sort data-type="number" order="ascending" select="rifos_notif:GoodsNumeric"/>
											<xsl:if test="position()!=1">
												<xsl:text>; </xsl:text>
											</xsl:if>
											<xsl:value-of select="rifos_notif:GoodsNumeric"/>
											<xsl:text> - </xsl:text>
											<xsl:apply-templates select="rifos_notif:GoodDescription"/>
										</xsl:for-each>
									</u>
									<xsl:text>;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr style="text-align: justify">
								<td>
									<b><xsl:text>3. Код иностранных товаров в соответствии с ТН ВЭД ЕАЭС: </xsl:text></b>
									<u>
										<xsl:for-each select="rifos_notif:RIFOSGood">
											<xsl:sort data-type="number" order="ascending" select="rifos_notif:GoodsNumeric"/>
											<xsl:if test="position()!=1">
												<xsl:text>; </xsl:text>
											</xsl:if>
											<xsl:value-of select="rifos_notif:GoodsNumeric"/>
											<xsl:text> - </xsl:text>
											<xsl:apply-templates select="rifos_notif:GoodTNVEDCode"/>
										</xsl:for-each>
									</u>
									<xsl:text>;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr style="text-align: justify">
								<td>
									<b><xsl:text>4. Количество иностранных товаров с указанием единиц измерения: </xsl:text></b>
									<u>
										<xsl:for-each select="rifos_notif:RIFOSGood">
											<xsl:sort data-type="number" order="ascending" select="rifos_notif:GoodsNumeric"/>
											<xsl:if test="position()!=1">
												<xsl:text>; </xsl:text>
											</xsl:if>
											<xsl:value-of select="rifos_notif:GoodsNumeric"/>
											<xsl:text> - </xsl:text>
											<xsl:choose>
												<xsl:when test="rifos_notif:GoodQuantity">
													<xsl:value-of select="rifos_notif:GoodQuantity/cat_ru:GoodsQuantity"/>
													<xsl:if test="rifos_notif:GoodQuantity/cat_ru:MeasureUnitQualifierName">
														<xsl:text> </xsl:text>
														<xsl:value-of select="rifos_notif:GoodQuantity/cat_ru:MeasureUnitQualifierName"/>
													</xsl:if>
													<xsl:if test="rifos_notif:GoodQuantity/cat_ru:MeasureUnitQualifierCode">
														<xsl:text> (</xsl:text>
														<xsl:value-of select="rifos_notif:GoodQuantity/cat_ru:MeasureUnitQualifierCode"/>
														<xsl:text>)</xsl:text>
													</xsl:if>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>нет данных</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:for-each>
									</u>
									<xsl:text>;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr style="text-align: justify">
								<td>
									<b><xsl:text>5. Стоимость иностранных товаров с указанием единиц измерения: </xsl:text></b>
									<u>
										<xsl:for-each select="rifos_notif:RIFOSGood">
											<xsl:sort data-type="number" order="ascending" select="rifos_notif:GoodsNumeric"/>
											<xsl:if test="position()!=1">
												<xsl:text>; </xsl:text>
											</xsl:if>
											<xsl:value-of select="rifos_notif:GoodsNumeric"/>
											<xsl:text> - </xsl:text>
											<xsl:value-of select="rifos_notif:GoodCost/RUScat_ru:Amount"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="rifos_notif:GoodCost/RUScat_ru:CurrencyCode"/>
										</xsl:for-each>
									</u>
									<xsl:text>;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr style="text-align: justify">
								<td>
									<b><xsl:text>6. Место нахождения иностранных товаров: </xsl:text></b>
									<u>
										<xsl:apply-templates select="rifos_notif:GoodLocation"/>
									</u>
									<xsl:text>.</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="rifos_notif:GoodLocation">
		<xsl:for-each select="*">
			<xsl:if test="local-name()='PostalCode'">Почтовый индекс: </xsl:if>
			<xsl:if test="local-name()='TerritoryCode'">Код административно - территориальной единицы: </xsl:if>
			<xsl:choose>
				<xsl:when test="local-name()='CountryCode'">
					<xsl:if test="not(../cat_ru:CounryName)">
						<xsl:value-of select="."/>
					</xsl:if>	
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
					<xsl:if test="local-name()='CounryName'">
						<xsl:if test="../cat_ru:CountryCode"> (<xsl:value-of select="../cat_ru:CountryCode"/>)</xsl:if>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last() and ((local-name()!='CountryCode') or (local-name()='CountryCode' and not(../cat_ru:CounryName)))">, </xsl:if>
		</xsl:for-each>
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
</xsl:stylesheet>
