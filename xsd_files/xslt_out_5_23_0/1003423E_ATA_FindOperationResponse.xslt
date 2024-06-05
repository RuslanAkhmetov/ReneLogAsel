<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:ata_ct="urn:customs.ru:Information:TransportDocuments:ATA:ATA_CommonTypes:5.22.0" xmlns:ata_findor="urn:customs.ru:Information:TransportDocuments:ATA:ATA_FindOperationResponse:5.22.0">
	<!-- Шаблон для типа ATA_FindOperationResponseType -->
	<xsl:template match="ata_findor:ATA_FindOperationResponse">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					}

					div
					{
					white-space: nowrap;
					}

					div.page {
					width: 270mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
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
										<b>Результат поиска операций по карнетам АТА</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<xsl:if test="ata_findor:OperationInfo">
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Номер карнета АТА</td>
									<td class="graphMain bordered">Способ подачи карнета АТА</td>
									<td class="graphMain bordered">Cрок действия карнета АТА</td>
									<td class="graphMain bordered">Регистрационный номер</td>
									<td class="graphMain bordered">Тип операции с карнетом АТА</td>
									<td class="graphMain bordered">Период действия операции по карнету АТА</td>
									<td class="graphMain bordered">Количество товаров в группе</td>
									<td class="graphMain bordered">Решение по отрывному листу</td>
									<td class="graphMain bordered">ФИО должностного лица таможенного органа</td>
								</tr>
								<xsl:for-each select="ata_findor:OperationInfo">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ata_findor:OperationsInfoType -->
	<xsl:template match="ata_findor:OperationInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="ata_findor:CarnetNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ata_findor:SubmissionMode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="ata_findor:ValidUntil"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="ata_findor:RegistrationNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ata_findor:Type"/>
			</td>
			<td class="graphMain bordered">
				<xsl:text>c </xsl:text>
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="ata_findor:IssueDate"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring(ata_findor:IssueDate,12,8)"/>
				<xsl:if test="ata_findor:OperationPeriod">
					<xsl:text> по </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="ata_findor:OperationPeriod"/>
					</xsl:call-template>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ata_findor:GoodsQuantity"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ata_findor:DecisionText"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ata_findor:PersonName"/>
				<xsl:if test="ata_findor:LNP">
					<xsl:text> ЛНП: </xsl:text>
					<xsl:value-of select="ata_findor:LNP"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="ata_findor:RegistrationNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
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
	<xsl:template name="gtd_date">
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
</xsl:stylesheet>
