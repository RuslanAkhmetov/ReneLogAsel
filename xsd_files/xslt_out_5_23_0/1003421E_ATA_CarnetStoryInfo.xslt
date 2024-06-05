<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:ata_ct="urn:customs.ru:Information:TransportDocuments:ATA:ATA_CommonTypes:5.22.0" xmlns:ata_csi="urn:customs.ru:Information:TransportDocuments:ATA:ATA_CarnetStoryInfo:5.22.0">
	<!-- Шаблон для типа ATA_CarnetStoryInfoType -->
	<xsl:template match="ata_csi:ATA_CarnetStoryInfo">
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
									margin-top:6mm;
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
									<font size="5">
										<b>История операций по карнету АТА</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
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
					<xsl:if test="ata_csi:CarnetRevision">
						<table class="w190">
							<tbody>
								<tr>
									<td class="annot graphMain" style="width:50%">Версия карнета АТА</td>
									<td class="value graphMain" style="width:50%">
										<xsl:apply-templates select="ata_csi:CarnetRevision"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="ata_csi:CarnetCover">
						<div class="title marg-top">Обложка карнета АТА</div>
						<xsl:apply-templates select="ata_csi:CarnetCover"/>
					</xsl:if>
					<xsl:if test="ata_csi:AlteredCarnetCover">
						<div class="title marg-top">Измененные обложки карнета АТА</div>
						<xsl:for-each select="ata_csi:AlteredCarnetCover">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()"><br/><br/></xsl:if>
						</xsl:for-each>
					</xsl:if>
					
					<xsl:if test="ata_csi:CarnetOperationInfo">
						<div class="title marg-top">Информация по операции карнета АТА # <xsl:value-of select="position()"/></div>
						<xsl:for-each select="ata_csi:CarnetOperationInfo">
							<xsl:for-each select="ata_csi:CarnetOperation">
								<div class="title marg-top">&#160;&#160;&#160;Операция по карнету АТА/></div>
								<xsl:apply-templates select="."/>
							</xsl:for-each>
							<xsl:if test="ata_ct:RevealedRisks">
								<xsl:for-each select="ata_ct:RevealedRisks">
									<div class="title marg-top">&#160;&#160;&#160;Отчет по выявленным рискам # <xsl:value-of select="position()"/>/></div>
									<table class="w190">
										<tbody>
											<tr>
												<td class="annot graphMain" style="width:50%">&#160;&#160;&#160;&#160;&#160;Версия отчета по рискам</td>
												<td class="value graphMain" style="width:50%">
													<xsl:apply-templates select="ata_ct:Revision"/>
												</td>
											</tr>
										</tbody>
									</table>
									<xsl:for-each select="ata_ct:Body">
										<div class="title marg-top">&#160;&#160;&#160;&#160;&#160;Отчет по выявленным рискам/></div>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="ata_ct:MinCul">
								<xsl:for-each select="ata_ct:MinCul">
									<div class="title marg-top">&#160;&#160;&#160;Документы от Минкультуры/></div>
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>

					<xsl:if test="ata_csi:AlteredOperation">
						<div class="title marg-top">Измененные операции карнета АТА</div>
						<xsl:for-each select="ata_csi:AlteredOperation">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()"><br/><br/></xsl:if>
						</xsl:for-each>
					</xsl:if>
					
					<xsl:if test="ata_csi:AlterationOperation">
						<div class="title marg-top">Неподтвержденная корректировка операции карнета АТА</div>
						<xsl:for-each select="ata_csi:AlterationOperation">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()"><br/><br/></xsl:if>
						</xsl:for-each>
					</xsl:if>

					<xsl:if test="ata_csi:SubstituteCarnetNumber">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%"><div class="title marg-top">Номер заменяющего карнета АТА</div></td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="ata_csi:SubstituteCarnetNumber"/></td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
