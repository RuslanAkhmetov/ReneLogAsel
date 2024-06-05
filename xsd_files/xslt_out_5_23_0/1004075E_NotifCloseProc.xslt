<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:cltExch_ru="urn:customs.ru:Information:ExchangeDocuments:ExchangeCommonLeafTypes:5.0.8" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:ncdp="urn:customs.ru:Information:ExchangeDocuments:NotifCloseProc:5.22.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа NotifCloseProcType -->
	<xsl:template match="ncdp:NotifCloseProc">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
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
										<b>Уведомление о закрытии процедуры.</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор закрытой процедуры.</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="ncdp:CloseProcedureID"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата / время закрытия процедуры</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="ncdp:CloseDateTime"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<xsl:if test="ncdp:Comment">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Комментарии</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="ncdp:Comment"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ncdp:WorkingTimeSchedule">
						<div class="title marg-top">Информация о рабочем времени поста</div>
						<xsl:apply-templates select="ncdp:WorkingTimeSchedule"/>
					</xsl:if>
					<xsl:if test="ncdp:RefReason">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:100%">
									<br/>
								</td>
							</tr>
						</table>
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Основание для отказа в приеме документов на бумажном носителе для сканирования</td>
								<td class="value graphMain" style="width:50%">
									<xsl:if test="ncdp:RefReason='0' or ncdp:RefReason='false' or ncdp:RefReason='f'">отсутствие технической возможности сканирования</xsl:if>
									<xsl:if test="ncdp:RefReason='1' or ncdp:RefReason='true' or ncdp:RefReason='t'">представление в ТО документа на бумажном носителе не требуется и отсутствует запрос ТО на представление документа на бумажном носителе</xsl:if>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ncdp:WorkingTimeScheduleType -->
	<xsl:template match="ncdp:WorkingTimeSchedule">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата и время начала ближайшего рабочего дня</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="ncdp:OpenWorkday"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата и время завершения ближайшего рабочего дня</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="ncdp:CloseWorkDay"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
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
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="substring($dateIn,12,8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
