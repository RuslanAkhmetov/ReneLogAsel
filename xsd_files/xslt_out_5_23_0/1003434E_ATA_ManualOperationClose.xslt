<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ata_ct="urn:customs.ru:Information:TransportDocuments:ATA:ATA_CommonTypes:5.22.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:ata_mancl="urn:customs.ru:Information:TransportDocuments:ATA:ATA_ManualOperationClose:5.22.0">
	<!-- Шаблон для типа ATA_ManualOperationCloseType -->
	<xsl:template match="ata_mancl:ATA_ManualOperationClose">
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
										<b>Информация о предоставлении уплаты/доказательсва соблюдения условий таможенной процедуры</b>
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
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Номер карнета АТА</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ata_mancl:CarnetNumber"/>
							</td>
						</tr>
						<xsl:if test="ata_mancl:CarnetRevision">
							<tr>
								<td class="annot graphMain" style="width:50%">Версия карнета АТА</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="ata_mancl:CarnetRevision"/>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td class="annot graphMain" style="width:50%">Регистрационный номер операции</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="ata_mancl:RegistrationNumber"/>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Тип операций по карнетам АТА</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ata_mancl:OperationType"/>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Номера товаров для завершения операции</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ata_mancl:GoodsNumbers"/>
							</td>
						</tr>
						<xsl:if test="ata_mancl:PartiallyClosedGoodsNum">
							<tr>
								<td class="annot graphMain" style="width:50%">Перечень товаров, снимаемых частично</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="ata_mancl:PartiallyClosedGoodsNum"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="ata_mancl:LetterRequisites">
							<tr>
								<td class="annot graphMain" style="width:50%">Реквизиты письма ТПП России о представлении доказательств</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="ata_mancl:LetterRequisites"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="ata_mancl:AcceptLetterRequisites">
							<tr>
								<td class="annot graphMain" style="width:50%">Реквизиты письма в ТПП России о принятии доказательств</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="ata_mancl:AcceptLetterRequisites"/>
								</td>
							</tr>
							<tr>
								<td class="annot graphMain" style="width:50%">Сумма уплаченных таможенных платежей</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="translate(ata_mancl:PaymentAmmount, '.', ',')"/>
								</td>
							</tr>
						</xsl:if>
					</table>	
					<div class="title marg-top">Данные о таможенном инспекторе, оформившем таможенную процедуру</div>
					<xsl:apply-templates select="ata_mancl:CustomsPersonRequisites"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="ata_ct:CustomsInfo">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Таможенный орган</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:Code"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="cat_ru:OfficeName"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа GTDIDType -->
	<xsl:template match="ata_mancl:RegistrationNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа ata_ct:CustomsPersonSignatureType -->
	<xsl:template match="ata_ct:CustomsPersonSignature">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonName"/>
					<xsl:if test="cat_ru:LNP">
						<xsl:text> ЛНП: </xsl:text>
						<xsl:value-of select="cat_ru:LNP"/>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата и время подписания</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="ata_ct:IssueDate"/>
					</xsl:call-template>
					<xsl:text> </xsl:text>
					<xsl:value-of select="substring(ata_ct:IssueDate,12,8)"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ata_ct:CustomsPersonRequisitesType -->
	<xsl:template match="ata_mancl:CustomsPersonRequisites">
		<xsl:apply-templates select="ata_ct:CustomsInfo"/>
		<xsl:for-each select="ata_ct:CustomsPersonSignature">
			<xsl:apply-templates select="."/>
		</xsl:for-each>	
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="ata_mancl:LetterRequisites| ata_mancl:AcceptLetterRequisites">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
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
