<?xml version="1.0" encoding="utf-8"?>
<!--Приказ ФТС России от 18.03.2019 № 445 "Об утверждении формы заявления на совершение операций с товарами, помещенными под таможенную процедуру таможенного склада, и формы решения таможенного органа по результатам рассмотрения указанного заявления" Приложение №2-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.23.0" xmlns:dgocw="urn:customs.ru:Information:WarehouseDocuments:DecisionGoodsOperationCW:5.23.0">
	<!-- Шаблон для типа DecisionGoodsOperationCWType -->
	<xsl:template match="dgocw:DecisionGoodsOperationCW">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  	body {
					background: #cccccc;
					font-family: Arial;
					}

					div.page {
					width: 180mm;
					max-width: 180mm;
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
					max-width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}

					.inlinetable
					{
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;
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
					.descr{
						font-size: 8pt;
						text-align: center;
					}
					.indent{
						text-indent: 1.5em;
					}
					.underlined{
						border-bottom: 1px solid windowtext;
					}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td width="100%" align="center">
									<b>Федеральная таможенная служба</b>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="center">
												<td class="value">
													<xsl:apply-templates select="dgocw:Customs"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr">
													(наименование таможенного органа)
												</td>
											</tr>
										</tbody>
									</table>	
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr align="center" valign="top">
								<td>
									<br/>
									<br/>
									<b>Решение<br/>таможенного органа о выдаче (отказе в выдаче) разрешения на<br/>совершение операций с товарами, помещенными под таможенную процедуру<br/>таможенного склада</b>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					На основании заявления <br/>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="dgocw:Applicant" mode="organization"/>
									<xsl:text>, дата заявления: </xsl:text>
									<xsl:apply-templates select="dgocw:ApplicationDate" mode="russian_date"/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(наименование, идентификационный номер налогоплательщика, код причины постановки на учет,<br/>
									место нахождения организации или фамилия, имя, отчество (при наличии), идентификационный<br/>
									номер налогоплательщика (при наличии), адрес физического лица <sup>1</sup>;<br/>
									дата заявления)
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:text>в  соответствии с частями 3 и 4 статьи 121 Федерального закона от 3 августа 2018  г.  N  289-ФЗ  "О таможенном регулировании в Российской Федерации и о внесении  изменений  в отдельные законодательные акты Российской Федерации" принято решение в отношении товаров, помещенных по </xsl:text>
									<table class="inlinetable" style="width: 100mm;">
										<tbody>
											<tr align="center">
												<td class="value">
													<xsl:apply-templates select="dgocw:GTDNumber"/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr">
													(номер таможенной декларации)
												</td>
											</tr>
										</tbody>
									</table>
									<xsl:text> под таможенную процедуру таможенного склада:</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:text>1. О возможности совершения </xsl:text>
									<table class="inlinetable" style="width: 30mm;">
										<tbody>
											<tr align="center">
												<td class="value">
													<xsl:apply-templates select="dgocw:OperationDate" mode="russian_date"/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr">
													(дата <sup>2</sup>)
												</td>
											</tr>
										</tbody>
									</table>
									<xsl:text> операций с товарами:</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr valign="top" align="center">
								<td class="bordered">№ п/п</td>
								<td class="bordered">Наименование товара</td>
								<td class="bordered">Номер товара в таможенной декларации</td>
								<td class="bordered">Количество<sup>3</sup></td>
								<td class="bordered">Код товара в соответствии с ТН ВЭД ЕАЭС<sup>4</sup></td>
								<td class="bordered">Совершаемые операции<sup>5</sup></td>
							</tr>
							<xsl:for-each select="dgocw:AllowedCWGood">
								<tr valign="top">
									<td class="bordered">
										<xsl:apply-templates select="dgocw:Number"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="dgocw:Description"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="dgocw:DTNumber"/>
									</td>
									<td class="bordered">
										<xsl:for-each select="dgocw:Quantity">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="quantity"/>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:value-of select="dgocw:TNVEDCode"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="dgocw:Operation"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<xsl:text>2. Об отказе в выдаче разрешения на совершение операций с товарами:</xsl:text>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr valign="top" align="center">
								<td class="bordered">№ п/п</td>
								<td class="bordered">Наименование товара</td>
								<td class="bordered">Номер товара в таможенной декларации</td>
								<td class="bordered">Количество<sup>3</sup></td>
								<td class="bordered">Код товара в соответствии с ТН ВЭД ЕАЭС<sup>4</sup></td>
								<td class="bordered">Совершаемые операции<sup>5</sup></td>
							</tr>
							<xsl:for-each select="dgocw:ProhibitedCWGood">
								<tr valign="top">
									<td class="bordered">
										<xsl:apply-templates select="dgocw:Number"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="dgocw:Description"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="dgocw:DTNumber"/>
									</td>
									<td class="bordered">
										<xsl:for-each select="dgocw:Quantity">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="quantity"/>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:value-of select="dgocw:TNVEDCode"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="dgocw:Operation"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<xsl:text>на основании</xsl:text>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="left">
								<td class="value">
									<xsl:choose>
										<xsl:when test="dgocw:RefusalReason">
											<xsl:apply-templates select="dgocw:RefusalReason"/>
										</xsl:when>
										<xsl:otherwise><br/></xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(указывается основание для отказа в  выдаче  разрешения  на совершение операций с товарами, помещенными  под таможенную процедуру таможенного склада, со  ссылкой  на   Федеральный закон  от  3  августа  2018  г.  N  289-ФЗ  "О   таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации")
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table width="100%">
						<tbody>
							<tr>
								<td width="30%" valign="bottom">Начальник<br/>(заместитель начальника)</td>
								<td width="20%" class="underlined" valign="bottom">
									<xsl:apply-templates select="dgocw:Customs"/>
								</td>
								<td width="2%"/>
								<td width="16%" class="underlined" valign="bottom"></td>
								<td width="2%"/>
								<td width="30%" class="underlined" align="center" valign="bottom">
									<xsl:apply-templates select="dgocw:Customs/dgocw:CustomsPerson"/>
								</td>
							</tr>
							<tr valign="top" align="center">
								<td></td>
								<td class="descr">(наименование таможенного органа)</td>
								<td></td>
								<td class="descr">(подпись)</td>
								<td></td>
								<td class="descr">(инициалы, фамилия)</td>
							</tr>
							<tr>
								<td colspan="6"><br/><br/></td>
							</tr>
							<tr>
								<td colspan="6">
									<xsl:apply-templates select="dgocw:DecisionDate" mode="russian_date_month"/>								
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div>_____________________________________</div>
					<div class="descr" style="text-align:left;">
						<sup>1</sup>Для физического лица указываются фамилия, имя, отчество (при наличии), адрес места жительства, идентификационный номер налогоплательщика (при наличии). Для юридического лица указываются наименование организации, идентификационный номер налогоплательщика, местонахождение организации, код причины постановки на учет.<br/>
						<sup>2</sup>Указывается заявляемая дата совершения операций с товарами, помещенными под таможенную процедуру таможенного склада.<br/>
						<sup>3</sup>Указывается количество товара в основной и дополнительной единицах измерения, в отношении которого предполагается совершать операции.<br/>
						<sup>4</sup>Указывается десятизначный код товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза.<br/>
						<sup>5</sup>Указываются операции, совершаемые с товарами, помещенными под таможенную процедуру таможенного склада, предусмотренные пунктом 2 статьи 158 Таможенного кодекса Евразийского экономического союза (Федеральный закон от 14 ноября 2017 г. N 317-ФЗ "О ратификации Договора о Таможенном кодексе Евразийского экономического союза" (Собрание законодательства Российской Федерации, 2017, N 47, ст. 6843).<br/>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="dgocw:CustomsPerson">
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonName" mode="initials"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonMiddleName" mode="initials"/>
	</xsl:template>
	
	<xsl:template match="dgocw:RefusalReason">
		<xsl:apply-templates select="dgocw:Reason"/>
		<xsl:text>; </xsl:text>
		<xsl:text> ст. </xsl:text>
		<xsl:apply-templates select="dgocw:ArticleNumber"/>
		<xsl:if test="dgocw:PartNumber">
			<xsl:text> ч.</xsl:text>
			<xsl:apply-templates select="dgocw:PartNumber"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template mode="quantity" match="*">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="dgocw:GTDNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	
	<xsl:template match="*" mode="organization">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text> адрес(а): </xsl:text>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="." mode="address"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:apply-templates select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:apply-templates select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:for-each select="RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="dgocw:Customs">
		<xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text>(</xsl:text>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
	<xsl:template name="month">
		<xsl:param name="number"/>
		<xsl:if test="$number='01'">января</xsl:if>
		<xsl:if test="$number='02'">февраля</xsl:if>
		<xsl:if test="$number='03'">марта</xsl:if>
		<xsl:if test="$number='04'">апреля</xsl:if>
		<xsl:if test="$number='05'">мая</xsl:if>
		<xsl:if test="$number='06'">июня</xsl:if>
		<xsl:if test="$number='07'">июля</xsl:if>
		<xsl:if test="$number='08'">августа</xsl:if>
		<xsl:if test="$number='09'">сентября</xsl:if>
		<xsl:if test="$number='10'">октября</xsl:if>
		<xsl:if test="$number='11'">ноября</xsl:if>
		<xsl:if test="$number='12'">декабря</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>"</xsl:text>
				<u>&#160;
				<xsl:value-of select="substring($dateIn,9,2)"/>
				&#160;</u>
				<xsl:text>"&#160;</xsl:text>
				<u>&#160;
				<xsl:call-template name="month"><xsl:with-param name="number" select="substring($dateIn,6,2)"/></xsl:call-template> 
				&#160;</u>
				<xsl:text>&#160;</xsl:text>
				<xsl:value-of select="substring($dateIn,1,2)"/>
				<u>
					<xsl:value-of select="substring($dateIn, 3, 2)"/>
				</u>
				<xsl:text> г.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='DecisionGoodsOperationCW']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date_month">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_month">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	
	<xsl:template match="*" mode="num_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="num_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="initials">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="concat(substring(., 1, 1),'.')"/>
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
