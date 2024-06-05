<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:apam="urn:customs.ru:Information:CommercialFinanceDocuments:ApplicationPersonalAccountingMerge:5.22.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ApplicationPersonalAccountingMergeType -->
	<xsl:template match="apam:ApplicationPersonalAccountingMerge">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
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
                  .descr{
					  font-size: 8pt;
					text-align:center;
                  }
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<b>Обращение правопреемника о создании (объединении) лицевого счета в случае<br/>реорганизации российского юридического лица</b>
								</td>
							</tr>
							<tr>
								<td align="center">
									<xsl:text>№ </xsl:text>
									<u>
									<xsl:apply-templates select="apam:RegistrationReqDoc/cat_ru:PrDocumentNumber"/>
									</u>
									<xsl:text> от </xsl:text>
									<u>
									<xsl:apply-templates select="apam:RegistrationReqDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
									</u>
								</td>
							</tr>
							<tr>
								<td class="descr">(указывается номер, дата обращения)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:text>в таможенный орган</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="apam:Customs"/>
								</td>
							</tr>
							<tr>
								<td class="descr">(наименование таможенного органа)</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td colspan="4" class="value">
									<xsl:choose>
										<xsl:when test="apam:ApplicantInfo/RUScat_ru:OrganizationFullDatas">
											<xsl:apply-templates select="apam:ApplicantInfo/RUScat_ru:OrganizationFullDatas"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:apply-templates select="apam:ApplicantInfo/RUScat_ru:OrganizationName"/>
											<xsl:if test="not(apam:ApplicantInfo/RUScat_ru:OrganizationName)">
												<xsl:apply-templates select="apam:ApplicantInfo/RUScat_ru:ShortName"/>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td colspan="4" class="descr">(наименование юридического лица (правопреемника), подавшего обращение</td>
							</tr>
							<tr>
								<td width="5%">ИНН</td>
								<td width="45%" class="value" align="center">
									<xsl:apply-templates select="apam:ApplicantInfo/RUScat_ru:RFOrganizationFeatures/cat_ru:INN"/>
								</td>
								<td width="5%">КПП</td>
								<td width="45%" class="value" align="center">
									<xsl:apply-templates select="apam:ApplicantInfo/RUScat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<xsl:text>сообщает о реорганицазии в форме </xsl:text>
									<xsl:apply-templates select="apam:ReorgForm"/>
								</td>
							</tr>
							<tr>
								<td colspan="4" class="value">
									<xsl:choose>
										<xsl:when test="apam:ReorgInfo/RUScat_ru:OrganizationFullDatas">
											<xsl:apply-templates select="apam:ReorgInfo/RUScat_ru:OrganizationFullDatas"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:apply-templates select="apam:ReorgInfo/RUScat_ru:OrganizationName"/>
											<xsl:if test="not(apam:ReorgInfo/RUScat_ru:OrganizationName)">
												<xsl:apply-templates select="apam:ReorgInfo/RUScat_ru:ShortName"/>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td colspan="4" class="descr">(наименование реорганизованного юридического лица</td>
							</tr>
							<tr>
								<td width="5%">ИНН</td>
								<td width="45%" class="value" align="center">
									<xsl:apply-templates select="apam:ReorgInfo/RUScat_ru:RFOrganizationFeatures/cat_ru:INN"/>
								</td>
								<td width="5%">КПП</td>
								<td width="45%" class="value" align="center">
									<xsl:apply-templates select="apam:ReorgInfo/RUScat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<xsl:text>и необходимости создания (объединения) лицевых счетов</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="apam:Customs">
		<xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:if test="cat_ru:OfficeName"> (</xsl:if>
		<xsl:apply-templates select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">)</xsl:if>				
	</xsl:template>
	<xsl:template match="apam:ReorgForm">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test="0">слияния</xsl:when>
				<xsl:when test="1">объединения</xsl:when>
				<xsl:when test="2">преобразования</xsl:when>
			</xsl:choose>
		</element>
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
	<xsl:template match="//*[local-name()='ApplicationPersonalAccountingMerge']//*" priority="-1">
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
