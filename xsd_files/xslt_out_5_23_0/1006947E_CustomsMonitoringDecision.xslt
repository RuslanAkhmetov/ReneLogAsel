<?xml version="1.0" encoding="utf-8" ?>
<!-- Проект приказа ФТС России "О технологии проведения таможенного мониторинга" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:cmd="urn:customs.ru:Information:CustomsAuditDocuments:CustomsMonitoringDecision:5.22.0">
<!-- Шаблон для типа CustomsMonitoringDecisionType -->
	<xsl:template match="cmd:CustomsMonitoringDecision">
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
					width: 180mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					page-break-after: always;
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
		
					.graph {
					font-family: Arial;
					font-size: 10pt;
					}
		
					.value
					{
					border-bottom: solid 1px black;
					font-style: italic;
					}
		
					div.title, tr.title td { font-weight:bold;  }
					.bordered { border-collapse: collapse; }
					td.bordered
					{
					border: solid 1px windowtext;
					}
		
					.border_bottom
					{
					border-bottom: 1px solid black;
					}
		
					.graphMain
					{
					font-family: Arial;
					font-size: 11pt;
					}
		
					.graphLittle 
					{
					font-family: Arial;
					font-size: 7pt;
					}
			
					.graphDelim 
					{
					font-family: Arial;
					font-size: 4pt;
					}
		
					td.graphMain
					{
					vertical-align:top;
					}
					td.value.graphMain
					{
					vertical-align:top;
					}
		
					.graphHeader
					{
					font-family: Arial;
					font-size: 11pt;
					font-weight:bold;
					}
		
					td.graphHeader
					{
					vertical-align:top;
					}
					td.value.graphHeader
					{
					vertical-align:bottom;
					}
		
					.normal
					{
					font-size: 11pt;
					font-family:Arial;
					}			
		
					.bold
					{
					font-weight: bold;
					font-family:Arial;
					font-size: 9pt;
					}			
		
					.italic
					{
					font-style: italic;
					font-family:Arial;
					font-size: 11pt;
					}		
					
					.delim {
						height: 7pt;
					}
		
					.delim_3 {
						height: 3pt;
					}
		
				</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tbody align="center" class="graphMain">
							<tr>
								<td width="10%"></td>
								<td width="80%" class="value">
									<xsl:if test="cmd:Customs/cat_ru:OfficeName"><xsl:apply-templates select="cmd:Customs/cat_ru:OfficeName"/> (</xsl:if>
									<xsl:apply-templates select="cmd:Customs/cat_ru:Code"/>
									<xsl:if test="cmd:Customs/cat_ru:OfficeName">)</xsl:if>
								</td>
								<td width="10%"></td>
							</tr>
							<tr class="graphLittle">
								<td width="10%"></td>
								<td  width="80%" align="center">(наименование таможенного органа)</td>
								<td width="10%"></td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr  align="center" class="graphHeader">
								<td class="graphMain">РЕШЕНИЕ</td>
							</tr>
							<tr class="delim"><td> </td></tr>
							<tr align="center">
								<td>о проведении таможенного мониторинга</td>
							</tr>
							<tr class="delim_3"><td> </td></tr>
							<tr align="center">
								<td>
									<xsl:value-of select="cmd:DocNumber/cmd:CustomsCode"/>/<xsl:value-of select="cmd:DocNumber/cmd:Part_2"/>/<xsl:call-template name="gtd_date"><xsl:with-param name="dateIn" select="cmd:DocNumber/cmd:RegistrationDate"/></xsl:call-template>/<xsl:value-of select="cmd:DocNumber/cmd:GTDNumber"/>/<xsl:value-of select="cmd:DocNumber/cmd:Part_5"/>
								</td>
							</tr>
							<tr class="delim_3"><td> </td></tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr class="delim"><td> </td></tr>
							<tr style="text-align:justify">
								<td>На основании пункта <u>  <xsl:for-each select="cmd:OrderDetails/cmd:OrderPoint"><xsl:if test="position()!=1">, </xsl:if><xsl:apply-templates select="."/></xsl:for-each>  </u> приказа ФТС России от <u>  <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cmd:OrderDetails/cmd:PrDocumentDate"/></xsl:call-template>  </u> № <u>  <xsl:apply-templates select="cmd:OrderDetails/cmd:PrDocumentNumber"/>  </u> «Об утверждении технологии проведения таможенного мониторинга»</td>
							</tr>
							<tr class="delim"><td> </td></tr>
							<tr>
								<td class="value">
									<xsl:for-each select="cmd:CustomsDecisionPerson">
										<xsl:if test="cat_ru:PersonPost">
											<xsl:apply-templates select="cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:apply-templates select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
										<xsl:text>.</xsl:text>
										<xsl:if test="cat_ru:PersonMiddleName">
											<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
											<xsl:text>.</xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr class="graphLittle" align="center">
								<td>(должность, фамилия, инициалы имени и отчества начальника (заместителя начальника) таможенного органа или лица, им уполномоченного)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr>
								<td>РЕШИЛ:</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr style="text-align:justify">
								<td>1. В срок до <u>  <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cmd:DeadlineDate"/></xsl:call-template>  </u> провести таможенный мониторинг в отношении:</td>
							</tr>
							<tr class="delim"><td> </td></tr>
							<tr>
								<td class="value">
									<xsl:for-each select="cmd:FEAPerson">
										<xsl:apply-templates select="cmd:OrganizationName"/>
										<xsl:text>, ИНН - </xsl:text>
										<xsl:apply-templates select="cmd:INN"/>
										<xsl:text>, КПП - </xsl:text>
										<xsl:apply-templates select="cmd:KPP"/>
										<xsl:text>, ОГРН - </xsl:text>
										<xsl:apply-templates select="cmd:OGRN"/>
										<xsl:text>, </xsl:text>
										<xsl:apply-templates select="cmd:Address"/>
									</xsl:for-each>
								</td>
							</tr>
							<tr class="graphLittle" align="center">
								<td>(наименование, ОГРН, ИНН/КПП юридического лица, место государственной регистрации)</td>
							</tr>
							<tr class="delim"><td> </td></tr>
							<tr style="text-align:justify">
								<td>показатели, послужившие основанием для принятия решения о проведении таможенного мониторинга:</td>
							</tr>
							<tr class="delim"><td> </td></tr>
							<tr>
								<td class="value">
									<xsl:for-each select="cmd:Marks">
										<xsl:if test="position()!=1"><br/></xsl:if>
										<xsl:apply-templates select="cmd:Number"/>
										<xsl:text>. </xsl:text>
										<xsl:apply-templates select="cmd:Description"/>
									</xsl:for-each>
								</td>
							</tr>
							<tr class="graphLittle" align="center">
								<td>(согласно приложению № 3 к приказу ФТС России ФТС России от <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cmd:OrderDetails/cmd:PrDocumentDate"/></xsl:call-template> № <xsl:apply-templates select="cmd:OrderDetails/cmd:PrDocumentNumber"/> «Об утверждении технологии проведения таможенного мониторинга»)</td>
							</tr>
							<tr class="delim"><td> </td></tr>
							<tr>
								<td style="text-align:justify">анализируемый период: <u>  с <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cmd:Term/cmd:BeginDate"/></xsl:call-template> по <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cmd:Term/cmd:EndDate"/></xsl:call-template>  </u></td>
							</tr>
							<tr class="delim"><td> </td></tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody align="left" class="graphMain">
							<tr class="delim"><td> </td></tr>
							<tr style="text-align:justify">
								<td>2. Поручить проведение таможенного мониторинга должностным лицам таможенного органа:</td>
							</tr>
							<tr class="delim"><td> </td></tr>
							<tr>
								<td class="value">
									<xsl:for-each select="cmd:CustomsMonitoringPerson">
										<xsl:if test="position()!=1">
											<xsl:text>; </xsl:text>
										</xsl:if>
										<xsl:if test="cat_ru:PersonPost">
											<xsl:apply-templates select="cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:apply-templates select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonName"/>
										<xsl:if test="cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr class="graphLittle" align="center">
								<td>(должность, ФИО должностных(ого) лиц(а) таможенного органа)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>
					<xsl:for-each select="cmd:CustomsDecisionPerson">
						<table>
							<tbody class="graphMain">
								<tr align="center">
									<td width="35%" class="value">
										<xsl:apply-templates select="cat_ru:PersonPost"/>
									</td>
									<td width="5%"> </td>
									<td width="20%" class="value"> </td>
									<td width="5%"> </td>
									<td width="35%" class="value">
										<xsl:apply-templates select="." mode="signature"/>
									</td>
								</tr>
								<tr class="graphLittle" align="center">
									<td width="35%">(должность должностного лица таможенного органа, принявшего решение)</td>
									<td width="5%"> </td>
									<td width="20%">(подпись)</td>
									<td width="5%"> </td>
									<td width="35%">(фамилия, инициалы имени и отчества)</td>
								</tr>
							</tbody>
						</table>
					</xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="cmd:DTNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="cmd:Address">
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

	<xsl:template mode="signature" match="*">
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
		<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
		<xsl:if test="cat_ru:PersonName">.</xsl:if>
		<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
		<xsl:if test="cat_ru:PersonMiddleName">.</xsl:if>
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

	<xsl:template name="russian_date">
		<xsl:param name="dateIn" />
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<span class="normal">
					<xsl:value-of select="substring($dateIn,9,2)" />
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,6,2)" />
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,1,4)" />
				</span>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:choose>
			<xsl:when test="string-length($date) &gt; 0">
				<xsl:variable name="month" select="substring($date, 6, 2)"/>
				&#34;&#160;<u>&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</u>&#34;
				&#160;&#160;<u>&#160;
				<xsl:choose>
					<xsl:when test="$month=1">января</xsl:when>
					<xsl:when test="$month=2">февраля</xsl:when>
					<xsl:when test="$month=3">марта</xsl:when>
					<xsl:when test="$month=4">апреля</xsl:when>
					<xsl:when test="$month=5">мая</xsl:when>
					<xsl:when test="$month=6">июня</xsl:when>
					<xsl:when test="$month=7">июля</xsl:when>
					<xsl:when test="$month=8">августа</xsl:when>
					<xsl:when test="$month=9">сентября</xsl:when>
					<xsl:when test="$month=10">октября</xsl:when>
					<xsl:when test="$month=11">ноября</xsl:when>
					<xsl:when test="$month=12">декабря</xsl:when>
				</xsl:choose> 					
				&#160;</u>&#160;&#160;<xsl:value-of select="substring($date,1,2)"/><u><xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;г.&#160;
			</xsl:when>
			<xsl:otherwise>
				&#34;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#34;
				&#160;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#160;
				20<u>&#160;&#160;&#160;&#160;&#160;</u>&#160;г.&#160;
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>