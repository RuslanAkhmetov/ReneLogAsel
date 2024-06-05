<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:ani="urn:customs.ru:Information:ExchangeDocuments:AnsInventory:5.22.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа AnsInventoryType -->
	<xsl:template match="ani:AnsInventory">
		<html>
			<head>
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
					border: 1px solid gray;
					}

					.graph {
					font-family: Arial;
					font-size: 10pt;
					}

					.value
					{
					border-bottom: solid 1px black;
					}

					div.title, tr.title td { font-weight:bold;  }
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
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>ОТВЕТ НА ЗАПРОС ДОКУМЕНТОВ И (ИЛИ) СВЕДЕНИЙ</b><br/>
										<b>для подтверждения сведений, заявленных в таможенной декларации</b><br/>
										<xsl:text> от </xsl:text>
										<xsl:apply-templates mode="russian_date" select="ani:ResolDate"/>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:text>Направленный в соответсвии с п. 4 статьи 325 ТК ЕАЭС, от </xsl:text>
									<xsl:apply-templates mode="russian_date" select="ani:ResolDate"/>
									<xsl:text> по ДТ </xsl:text>
									<xsl:apply-templates select="ani:GTDID"/>
									<xsl:if test="ani:Declarant">
										<xsl:text>, отправленной </xsl:text>
										<xsl:apply-templates select="ani:Declarant"/>
									</xsl:if>
									<xsl:text>.</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:text>Данные, подтверждающие сведения, заявленные в таможенной декларации</xsl:text>
					<table width="100%">
						<tbody>
							<tr valign="top" align="center">
								<td class="bordered" width="5%">№ п/п</td>
								<td class="bordered">Перечень заявленных сведений, требующих подтверждения/уточнения</td>
								<td class="bordered">Перечень запрашиваемых документов и (или) сведений</td>
								<td class="bordered">Примечание</td>
							</tr>
							<tr align="center">
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<td class="bordered">3</td>
								<td class="bordered">4</td>
							</tr>
							<xsl:for-each select="ani:CustomsCostInf">
								<xsl:sort select="ani:Position" data-type="number" order="ascending"/>
								<tr valign="top">
									<td class="bordered">
										<xsl:value-of select="ani:Position"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="ani:CustCostInf"/>
									</td>
									<td class="bordered">
										<xsl:for-each select="ani:ReqDocuments">
											<xsl:sort select="ani:PositionDoc" data-type="number" order="ascending"/>
											<xsl:value-of select="ani:PositionDoc"/>
											<xsl:text>. </xsl:text>
											<xsl:value-of select="ani:PrDocumentName"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="ani:PrDocumentNumber"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates mode="russian_date" select="ani:PrDocumentDate"/>
											<xsl:text> </xsl:text>
											<!--xsl:text> ИД позиции в запросе: </xsl:text>
											<xsl:value-of select="ani:RequestPositionID"/-->
											<xsl:text>, код вида </xsl:text>
											<xsl:value-of select="ani:DocCode"/>
											<xsl:if test="ani:ArchDocInfo">
												<br/>
												<xsl:text>Информация о док-те в архиве: </xsl:text><br/>
												<xsl:text>ИД архива </xsl:text><xsl:value-of select="ani:ArchDocInfo/ani:ArchID"/><br/>
												<!--xsl:text>ИД декларанта </xsl:text><xsl:value-of select="ani:ArchDocInfo/ani:ArchDeclID"/><br/-->
												<xsl:text>арх ИД док-та </xsl:text><xsl:value-of select="ani:ArchDocInfo/ani:ArchDocID"/><br/>
												<xsl:if test="ani:ArchDocInfo/ani:ArchDocStatus">
													<xsl:text>статус док-та в архиве </xsl:text><xsl:value-of select="ani:ArchDocInfo/ani:ArchDocStatus"/><br/>
												</xsl:if>
											</xsl:if>
											<!--xsl:if test="ani:ScanCustoms and count(ani:ScanCustoms/*) != 0">
												<br/>
												<xsl:text>Инф. о сканировании док-та: </xsl:text><br/>
												<xsl:if test="ani:ScanCustoms/ani:CustomsCode">
													<xsl:text>Код ТО: </xsl:text><xsl:value-of select="ani:ScanCustoms/ani:CustomsCode"/><br/>
												</xsl:if>
												<xsl:if test="ani:ScanCustoms/ani:ScanDate">
													<xsl:text>планируемая дата: </xsl:text><xsl:apply-templates mode="russian_date" select="ani:ScanCustoms/ani:ScanDate"/><br/>
												</xsl:if>
												<xsl:if test="ani:ScanCustoms/ani:ScanID">
													<xsl:text>ИД ранее сканированного док-та: </xsl:text><xsl:value-of select="ani:ScanCustoms/ani:ScanID"/><br/>
												</xsl:if>
												<xsl:if test="ani:ScanCustoms/ani:ReasonPaper">
													<xsl:text>Причина: </xsl:text><xsl:value-of select="ani:ScanCustoms/ani:ReasonPaper"/><br/>
												</xsl:if>
												<xsl:if test="ani:ScanCustoms/ani:Commentr">
													<xsl:text>Комментарии: </xsl:text><xsl:value-of select="ani:ScanCustoms/ani:Comment"/><br/>
												</xsl:if>
											</xsl:if-->
											<xsl:if test="ani:Reason">
												<br/>
												<xsl:text>Причина непредоставления: </xsl:text><b><xsl:value-of select="ani:Reason"/></b><br/>
											</xsl:if>
											<xsl:if test="ani:Comment">
												<xsl:text>Примечание: </xsl:text><b><xsl:apply-templates select="ani:Comment"/></b>
											</xsl:if>
											<xsl:if test="position()!=last()"><br/><br/></xsl:if>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="ani:Comment"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<xsl:if test="ani:Documents">
						<xsl:text>Дополнительные не запрошенные документы</xsl:text>
						<table width="100%">
							<tbody>
								<tr valign="top" align="center">
									<td class="bordered" width="5%">№ п/п</td>
									<td class="bordered">Наименование</td>
									<td class="bordered">Код вида</td>
									<td class="bordered">Инф. о документе в архиве</td>
									<td class="bordered">Примечание</td>
								</tr>
								<tr align="center">
									<td class="bordered">1</td>
									<td class="bordered">2</td>
									<td class="bordered">3</td>
									<td class="bordered">4</td>
									<td class="bordered">5</td>
								</tr>
								<xsl:for-each select="ani:Documents">
									<xsl:sort select="ani:PositionDoc" data-type="number" order="ascending"/>
									<tr valign="top">
										<td class="bordered" align="center">
											<xsl:value-of select="ani:PositionDoc"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="ani:PrDocumentName"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="ani:PrDocumentNumber"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates mode="russian_date" select="ani:PrDocumentDate"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="ani:DocCode"/>
										</td>
										<td class="bordered">
											<xsl:for-each select="ani:ArchDocInfo/*">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()"><br/></xsl:if>
											</xsl:for-each>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="ani:Comment"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<xsl:apply-templates select="ani:ResponcePerson"/>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="ani:ResponcePerson">
		<table>
			<tbody>
				<tr valign="top">
					<td align="center" valign="bottom" width="33%">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
					<td width="34%" style="border-bottom: 1px solid black;"></td>
					<td align="center" valign="bottom" width="33%">
						<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text> </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="ani:Declarant">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
	</xsl:template>
	
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="ani:GTDID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="num_date" select="cat_ru:RegistrationDate"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	
	<xsl:template mode="num_date" match="*">
		<xsl:choose>
			<xsl:when test="substring(.,5,1)='-' and substring(.,8,1)='-'">
				<xsl:value-of select="substring(.,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring(.,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring(.,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template mode="russian_date" match="*">
		<xsl:choose>
			<xsl:when test="substring(.,5,1)='-' and substring(.,8,1)='-'">
				<xsl:value-of select="substring(.,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring(.,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring(.,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
