<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:DTSout="urn:customs.ru:Information:CustomsDocuments:DTSout:5.23.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0" xmlns:cat_EDTS_cu="urn:customs.ru:CUESADDTSCommonAggregateTypes:5.22.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.23.0" xmlns:cat_EDTS_ru="urn:customs.ru:RUESADDTSCommonAggregateTypes:5.23.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
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
	<xsl:template match="//*[local-name()='DTSout']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
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
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/><xsl:text></xsl:text><xsl:value-of select="substring($dateIn,6,2)"/><xsl:text></xsl:text><xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="GTD_Number">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber']"/>
	</xsl:template>
	<xsl:template match="DTSout:DTSout">
		<html>
			<head>
				<title>Декларация таможенной стоимости</title>
				<!--META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/-->
				<style type="text/css">
              body {
              text-align: center;
              background: #cccccc;
              }

              div.page {
              width: 210mm;
              height: 297mm;
              margin-top: 6pt;
              margin-bottom: 6pt;
              padding:	10mm;
              padding-left:	20mm;
              background: #ffffff;
              border: solid 1pt #000000;
              page-break-before: always;
              display: block;
              }

              /*Стиль для удаления чёрной границы вокруг нарисованной "страницы" при печати*/
              @media print {
				  div.page {border: none; margin: 0; padding: 0;}
				  div.page.nobreak {
					  page-break-before: avoid;
				  }
			  }

              div.goods {
              background: #ffffff;
              }

              .bordered {
              border: solid 1pt #000000;
              padding-top:4pt;
              padding-bottom:4pt;
              font-family: Arial;
              font-size: 9pt;
              font-weight: bold;
              }

              .underlined {
              border-bottom: solid 0.8pt #000000;
              }

              p.NumberDate {
              font-weight: bold;
              }

              .graph {
              font-family: Arial;
              font-size: 7pt;
              }

              .graphBold {
              font-family: Arial;
              font-size: 7pt;
              font-weight: bold;
              }

              td {
              font-family:Courier;
              }

              .graphMain {
              font-family: Arial;
              font-size: 9pt;
              font-weight: bold;
              }

              .graphNo {
              font-size: 10pt;
              font-weight: bold;
              }
            </style>
			</head>
			<body>
				<xsl:choose>
					<xsl:when test="DTSout:FormDTS=3">
						<div class="page nobreak">
							<table cellpadding="0" cellspacing="0" style="width:100%;border:solid-left 0.8pt #000000;border:solid-right 0.8pt #000000;border-bottom:solid 0.8pt #000000;">
								<tbody>
									<tr>
										<td class="graph" rowspan="2" style="width:100mm;">РОССИЙСКАЯ ФЕДЕРАЦИЯ</td>
										<td align="right" class="graphNo" style="width:80mm;">ДЕКЛАРАЦИЯ ТАМОЖЕННОЙ СТОИМОСТИ</td>
									</tr>
									<tr>
										<td align="right" class="graph" style="width:80mm;">Форма ДТС-3</td>
									</tr>
								</tbody>
							</table>
							<table cellpadding="0" cellspacing="0" style="width:100%;border:solid-left 0.8pt #000000;border:solid-right 0.8pt #000000;border-bottom:solid 0.8pt #000000;">
								<tbody>
									<tr>
										<td class="graph" style="width:100mm;border-left:solid 0.8pt #000000;border-top:solid 0.8pt #000000;">
											<span class="graphNo">1 </span>
											<span class="graph">Продавец </span>
											<br/>
											<xsl:apply-templates mode="org" select="DTSout:DTSoutSeller"/>
										</td>
										<td class="graph" rowspan="3" style="width:80mm;border-left:solid 2pt #000000;border-top:solid 1.5pt #000000;border-right:solid 0.8pt #000000;border-bottom:solid 1.5pt #000000;" valign="top">
											<span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100mm;border-left:solid 0.8pt #000000;border-top:solid 0.8pt #000000;">
											<span class="graphNo">2 </span>
											<span class="graph">(а) Покупатель </span>
											<br/>
											<xsl:apply-templates mode="org" select="DTSout:DTSoutBuyer"/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100mm;border-left:solid 0.8pt #000000;border-top:solid 0.8pt #000000;">
											<span class="graphNo">2 </span>
											<span class="graph">(б) Декларант</span>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100mm;border-left:solid 0.8pt #000000;">
											<xsl:apply-templates select="DTSout:DTSoutDeclarant" mode="org"/>
										</td>
										<td class="graph" style="width:80mm;border:solid 0.8pt #000000;" valign="top">
											<span class="graphNo">3 </span>
											<span class="graph">Условия поставки</span>
											<br/>
											<xsl:for-each select="DTSout:DeliveryTerms">
												<xsl:apply-templates select="cat_ru:DeliveryTermsStringCode"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:for-each select="cat_ru:DeliveryPlace">
													<xsl:apply-templates select="."/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:for-each>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="graphBold" rowspan="2" style="width:100mm;border-left:solid 1.5pt #000000;border-top:solid 2pt #000000;border-right:solid 1.5pt #000000;border-bottom:solid 1.5pt #000000;">
											<xsl:text>ВАЖНАЯ ИНФОРМАЦИЯ</xsl:text>
											<br/>
											<xsl:text>В соответствии с пунктом 2 статьи 84 ТК ЕАЭС декларант либо </xsl:text>
											<br/>
											<xsl:text>таможенный представитель несет</xsl:text>
											<br/>
											<xsl:text>ответственность за указание в декларации </xsl:text>
											<br/>
											<xsl:text>таможенной стоимости недостоверных сведений. Декларант обязан также </xsl:text>
											<br/>
											<xsl:text>представить при необходимости </xsl:text>
											<br/>
											<xsl:text>соответствующую дополнительную информацию </xsl:text>
											<br/>
											<xsl:text>и необходимые документы, подтверждающие  </xsl:text>
											<br/>
											<xsl:text>использованные для определения заявленной</xsl:text>
											<br/>
											<xsl:text>таможенной стоимости сведения</xsl:text>
										</td>
										<td class="graph" style="width:80mm;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000; border-bottom: solid 0.8pt  #000000" valign="top">
											<span class="graphNo">4 </span>
											<span class="graph">Номер и дата счета (счетов)</span>
											<br/>
											<xsl:for-each select="DTSout:DTSInvoiceDocuments">
												<xsl:if test="cat_EDTS_cu:PositionNumber = 4">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentName"/>
													<br/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:80mm;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;" valign="top">
											<span class="graphNo">5 </span>
											<span class="graph">Номер и дата контракта</span>
											<br/>
											<xsl:for-each select="DTSout:DTSInvoiceDocuments">
												<xsl:if test="cat_EDTS_cu:PositionNumber = 5">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentName"/>
													<br/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="graph" colspan="2" style="width:180mm;border:solid 0.8pt #000000;" valign="top">
											<span class="graphNo">6 </span>
											<span class="graph">Номер и дата документа с принятыми ранее таможенными органами решениями, применимыми к графам 7-9</span>
											<br/>
											<xsl:for-each select="DTSout:DTSInvoiceDocuments">
												<xsl:if test="cat_EDTS_cu:PositionNumber = 6">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentName"/>
													<br/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="graph" colspan="2" style="width:180mm;border:solid 0.8pt #000000;" valign="top">
											<table cellpadding="0" cellspacing="0" style="width:100%;border:solid-left 0.8pt #000000;border:solid-right 0.8pt #000000;border-bottom:solid 0.8pt #000000;">
												<tbody>
													<tr>
														<td class="graph" style="width:140mm;" valign="top">
															<span class="graphNo">7 </span>
															<span class="graph">(а) Имеется ли ВЗАИМОСВЯЗЬ между продавцом и покупателем в значении, указанном в статье 37 ТК ЕАЭС? &lt; * &gt; - В случае ответа Нет далее к графе 8 </span>
														</td>
														<td class="graph" colspan="4" style="width:40mm;" valign="top">
															<table cellpadding="0" cellspacing="0" style="width:100%;border:solid-left 0.8pt #000000;border:solid-right 0.8pt #000000;border-bottom:solid 0.8pt #000000;">
																<tbody>
																	<tr>
																		<td align="center" class="graph" style="width:30mm;border-left:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;" valign="top">
																			<span class="graphBold">Верное отметить</span>
																		</td>
																		<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
																			<span class="graphBold">х</span>
																		</td>
																		<td align="center" class="graph" style="width:5mm;border-bottom:solid 0.8pt #000000;">
																			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																		</td>
																	</tr>
																</tbody>
															</table>
														</td>
													</tr>
													<tr>
														<td class="graph" style="width:140mm;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<xsl:variable name="xpath_Column7A">
															<xsl:call-template name="get_xpath">
																<xsl:with-param name="node" select="DTSout:DTSBuyerSellerDependence/cat_EDTS_cu:Column7A"/>
															</xsl:call-template>
														</xsl:variable>
														<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
															<element xml_node="{$xpath_Column7A}">
																<xsl:choose>
																	<xsl:when test="(number(DTSout:DTSBuyerSellerDependence/cat_EDTS_cu:Column7A)=1) or (DTSout:DTSBuyerSellerDependence/cat_EDTS_cu:Column7A='t')">
																		<span class="graphBold">х</span>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</element>
														</td>
														<td class="graph" style="width:15mm;">
															<span class="graph">ДА</span>
														</td>
														<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
															<element xml_node="{$xpath_Column7A}">
																<xsl:choose>
																	<xsl:when test="(number(DTSout:DTSBuyerSellerDependence/cat_EDTS_cu:Column7A)=0) or (DTSout:DTSBuyerSellerDependence/cat_EDTS_cu:Column7A='f')">
																		<span class="graphBold">х</span>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</element>
														</td>
														<td class="graph" style="width:15mm;">
															<span class="graph">НЕТ</span>
														</td>
													</tr>
													<tr>
														<td class="graph" style="width:140mm;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<span class="graph">(б) Оказала ли взаимосвязь между продавцом и покупателем влияние на цену вывозимого товара</span>
														</td>
														<xsl:variable name="xpath_Column7B">
															<xsl:call-template name="get_xpath">
																<xsl:with-param name="node" select="DTSout:DTSBuyerSellerDependence/cat_EDTS_cu:Column7B"/>
															</xsl:call-template>
														</xsl:variable>
														<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
															<element xml_node="{$xpath_Column7B}">
																<xsl:choose>
																	<xsl:when test="(number(DTSout:DTSBuyerSellerDependence/cat_EDTS_cu:Column7B)=1) or (DTSout:DTSBuyerSellerDependence/cat_EDTS_cu:Column7B='t')">
																		<span class="graphBold">х</span>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</element>
														</td>
														<td class="graph" style="width:15mm;">
															<span class="graph">ДА</span>
														</td>
														<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
															<element xml_node="{$xpath_Column7B}">
																<xsl:choose>
																	<xsl:when test="(number(DTSout:DTSBuyerSellerDependence/cat_EDTS_cu:Column7B)=0) or (DTSout:DTSBuyerSellerDependence/cat_EDTS_cu:Column7B='f')">
																		<span class="graphBold">х</span>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</element>
														</td>
														<td class="graph" style="width:15mm;">
															<span class="graph">НЕТ</span>
														</td>
													</tr>
													<tr>
														<td class="graph" style="width:140mm;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<span class="graph">(в) Стоимость сделки с ввозимыми товарами близка к одной из возможных проверочных величин, указанных в пункте 5 статьи 39 ТК ЕАЭС?</span>
														</td>
														<td align="center" class="graph" style="width:5mm;" valign="middle">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td class="graph" style="width:15mm;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td align="center" class="graph" style="width:5mm;" valign="middle">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td class="graph" style="width:15mm;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="graph" style="width:140mm;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<span class="graph">Федерации, утвержденных Постановлением Правительства Российской Федерации от 13 августа 2006 г. N 500 </span>
														</td>
														<xsl:variable name="xpath_Column7C">
															<xsl:call-template name="get_xpath">
																<xsl:with-param name="node" select="DTSout:DTSBuyerSellerDependence/cat_EDTS_cu:Column7C"/>
															</xsl:call-template>
														</xsl:variable>
														<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
															<element xml_node="{$xpath_Column7C}">
																<xsl:choose>
																	<xsl:when test="(number(DTSout:DTSBuyerSellerDependence/cat_EDTS_cu:Column7C)=1) or (DTSout:DTSBuyerSellerDependence/cat_EDTS_cu:Column7C='t')">
																		<span class="graphBold">х</span>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</element>
														</td>
														<td class="graph" style="width:15mm;">
															<span class="graph">ДА</span>
														</td>
														<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
															<element xml_node="{$xpath_Column7C}">
																<xsl:choose>
																	<xsl:when test="(number(DTSout:DTSBuyerSellerDependence/cat_EDTS_cu:Column7C)=0) or (DTSout:DTSBuyerSellerDependence/cat_EDTS_cu:Column7C='f')">
																		<span class="graphBold">х</span>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</element>
														</td>
														<td class="graph" style="width:15mm;">
															<span class="graph">НЕТ</span>
														</td>
													</tr>
													<tr>
														<td class="graph" style="width:140mm;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<span class="graph">В случае ответа ДА, указываются подробности</span>
															<br/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td align="center" class="graph" style="width:5mm;" valign="middle">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td class="graph" style="width:15mm;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td align="center" class="graph" style="width:5mm;" valign="middle">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td class="graph" style="width:15mm;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="graph" style="width:140mm;" valign="top">
															<span class="graphNo">8 </span>
															<span class="graph">(а) Имеются ли прямо или косвенно установленные продавцом ОГРАНИЧЕНИЯ в отношении прав покупателя на пользование и распоряжение товарами, за исключением ограничений, которые:                        
</span>
														</td>
														<td align="center" class="graph" style="width:5mm;" valign="middle">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td class="graph" style="width:15mm;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td align="center" class="graph" style="width:5mm;" valign="middle">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td class="graph" style="width:15mm;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="graph" style="width:140mm;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<span class="graph">- ограничивают географический регион, в котором товары могут быть перепроданы;</span>
														</td>
														<td align="center" class="graph" style="width:5mm;" valign="middle">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td class="graph" style="width:15mm;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td align="center" class="graph" style="width:5mm;" valign="middle">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td class="graph" style="width:15mm;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="graph" style="width:140mm;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<span class="graph">- существенно не влияют на стоимость товаров.</span>
														</td>
														<xsl:variable name="xpath_Column8A">
															<xsl:call-template name="get_xpath">
																<xsl:with-param name="node" select="DTSout:DTSSellingLimitation/cat_EDTS_cu:Column8A"/>
															</xsl:call-template>
														</xsl:variable>
														<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
															<element xml_node="{$xpath_Column8A}">
																<xsl:choose>
																	<xsl:when test="(number(DTSout:DTSSellingLimitation/cat_EDTS_cu:Column8A)=1) or (DTSout:DTSSellingLimitation/cat_EDTS_cu:Column8A='t')">
																		<span class="graphBold">х</span>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</element>
														</td>
														<td class="graph" style="width:15mm;">
															<span class="graph">ДА</span>
														</td>
														<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
															<element xml_node="{$xpath_Column8A}">
																<xsl:choose>
																	<xsl:when test="(number(DTSout:DTSSellingLimitation/cat_EDTS_cu:Column8A)=0) or (DTSout:DTSSellingLimitation/cat_EDTS_cu:Column8A='f')">
																		<span class="graphBold">х</span>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</element>
														</td>
														<td class="graph" style="width:15mm;">
															<span class="graph">НЕТ</span>
														</td>
													</tr>
													<tr>
														<td class="graph" colspan="5" style="width:140mm;" valign="top">
															<span class="graph">(б) Зависит ли продажа товаров или их цена от соблюдения УСЛОВИЙ или ОБЯЗАТЕЛЬСТВ, влияние которых на стоимость оцениваемых товаров не может быть количественно определено?</span>
														</td>
													</tr>
													<tr>
														<td class="graph" style="width:140mm;" valign="top">
															<span class="graph">Указывается вид и содержание, а также расчет стоимостной оценки таких условий или обязательств</span>
														</td>
														<xsl:variable name="xpath_Column8B">
															<xsl:call-template name="get_xpath">
																<xsl:with-param name="node" select="DTSout:DTSSellingLimitation/cat_EDTS_cu:Column8B"/>
															</xsl:call-template>
														</xsl:variable>
														<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
															<element xml_node="{$xpath_Column8B}">
																<xsl:choose>
																	<xsl:when test="(number(DTSout:DTSSellingLimitation/cat_EDTS_cu:Column8B)=1) or (DTSout:DTSSellingLimitation/cat_EDTS_cu:Column8B='t')">
																		<span class="graphBold">х</span>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</element>
														</td>
														<td class="graph" style="width:15mm;">
															<span class="graph">ДА</span>
														</td>
														<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
															<element xml_node="{$xpath_Column8B}">
																<xsl:choose>
																	<xsl:when test="(number(DTSout:DTSSellingLimitation/cat_EDTS_cu:Column8B)=0) or (DTSout:DTSSellingLimitation/cat_EDTS_cu:Column8B='f')">
																		<span class="graphBold">х</span>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</element>
														</td>
														<td class="graph" style="width:15mm;">
															<span class="graph">НЕТ</span>
														</td>
													</tr>
													<!--xsl:if test="DTSout:DTSSellingLimitation/cat_EDTS_cu:limitationDescription">
														<tr>
															<td class="graph" colspan="5" style="width:140mm;" valign="top">
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:apply-templates select="DTSout:DTSSellingLimitation/cat_EDTS_cu:limitationDescription"/>
															</td>
														</tr>
													</xsl:if-->
													<tr>
														<td class="graph" colspan="5" style="width:180mm;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<span class="graph">Если влияние таких условий или обязательств на стоимость товаров может быть количественно определено, сумма указывается в графе 11б</span>
														</td>
													</tr>
													<tr>
														<td class="graph" colspan="5" style="width:140mm;" valign="top">
															<span class="graphNo">9 </span>
															<span class="graph">(а) Предусмотрены ли ПЛАТЕЖИ за использование объектов ИНТЕЛЛЕКТУАЛЬНОЙ СОБСТВЕННОСТИ (за исключением платежей за право воспроизведения оцениваемых товаров вне таможенной территории Российской Федерации), которые относятся к оцениваемым товарам и которые покупатель прямо или косвенно должен уплатить в</span>
														</td>
													</tr>
													<tr>
														<td class="graph" style="width:140mm;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<span class="graph">качестве условия продажи таких товаров?</span>
														</td>
														<xsl:variable name="xpath_Column9A">
															<xsl:call-template name="get_xpath">
																<xsl:with-param name="node" select="DTSout:DTSAdditionalPayments/cat_EDTS_cu:Column9A"/>
															</xsl:call-template>
														</xsl:variable>
														<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
															<element xml_node="{$xpath_Column9A}">
																<xsl:choose>
																	<xsl:when test="(number(DTSout:DTSAdditionalPayments/cat_EDTS_cu:Column9A)=1) or (DTSout:DTSAdditionalPayments/cat_EDTS_cu:Column9A='t')">
																		<span class="graphBold">х</span>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</element>
														</td>
														<td class="graph" style="width:15mm;">
															<span class="graph">ДА</span>
														</td>
														<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
															<element xml_node="{$xpath_Column9A}">
																<xsl:choose>
																	<xsl:when test="(number(DTSout:DTSAdditionalPayments/cat_EDTS_cu:Column9A)=0) or (DTSout:DTSAdditionalPayments/cat_EDTS_cu:Column9A='f')">
																		<span class="graphBold">х</span>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</element>
														</td>
														<td class="graph" style="width:15mm;">
															<span class="graph">НЕТ</span>
														</td>
													</tr>
													<tr>
														<td class="graph" colspan="5" style="width:180mm;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<span class="graph">(б) Зависит ли продажа товаров от соблюдения условия, в соответствии с которым ЧАСТЬ ДОХОДА, полученного в результате ПОСЛЕДУЮЩИХ ПРОДАЖ товаров, РАСПОРЯЖЕНИЯ товарами иным способом или их</span>
														</td>
													</tr>
													<tr>
														<td class="graph" style="width:140mm;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<span class="graph">ИСПОЛЬЗОВАНИЯ, будет причитаться прямо или косвенно продавцу?</span>
														</td>
														<xsl:variable name="xpath_Column9B">
															<xsl:call-template name="get_xpath">
																<xsl:with-param name="node" select="DTSout:DTSAdditionalPayments/cat_EDTS_cu:Column9B"/>
															</xsl:call-template>
														</xsl:variable>
														<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
															<element xml_node="{$xpath_Column9B}">
																<xsl:choose>
																	<xsl:when test="(number(DTSout:DTSAdditionalPayments/cat_EDTS_cu:Column9B)=1) or (DTSout:DTSAdditionalPayments/cat_EDTS_cu:Column9B='t')">
																		<span class="graphBold">х</span>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</element>
														</td>
														<td class="graph" style="width:15mm;">
															<span class="graph">ДА</span>
														</td>
														<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
															<element xml_node="{$xpath_Column9B}">
																<xsl:choose>
																	<xsl:when test="(number(DTSout:DTSAdditionalPayments/cat_EDTS_cu:Column9B)=0) or (DTSout:DTSAdditionalPayments/cat_EDTS_cu:Column9B='f')">
																		<span class="graphBold">х</span>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</element>
														</td>
														<td class="graph" style="width:15mm;">
															<span class="graph">НЕТ</span>
														</td>
													</tr>
													<tr>
														<td class="graph" colspan="5" style="width:180mm;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<span class="graph">В случае ответа ДА на подпункт (а) и/или (б): указываются условия и в графах 15 и 16 приводятся соответствующие суммы.</span>
															<!--xsl:if test="DTSout:DTSAdditionalPayments/cat_EDTS_cu:PaymentDescription">
																<br/>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:apply-templates select="DTSout:DTSAdditionalPayments/cat_EDTS_cu:PaymentDescription"/>
															</xsl:if-->
															<!--xsl:if test="DTSout:DTSAdditionalPayments/cat_EDTS_cu:PaymentConditionDescription">
																<br/>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:for-each select="DTSout:DTSAdditionalPayments/cat_EDTS_cu:PaymentConditionDescription">
																	<xsl:apply-templates select="."/>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</xsl:for-each>
															</xsl:if-->
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="graphBold" rowspan="2" style="width:100mm;border-left:solid 1.5pt #000000;border-top:solid 2pt #000000;border-right:solid 1.5pt #000000;border-bottom:solid 1.5pt #000000;">
											<xsl:text>&lt; * &gt;ЛИЦА ЯВЛЯЮТСЯ ВЗАИМОСВЯЗАННЫМИ ИСКЛЮЧИТЕЛЬНО В ТОМ СЛУЧАЕ, ЕСЛИ</xsl:text>
											<br/>
											<xsl:text>(а) каждое из этих лиц является сотрудником или руководителем организации, созданной с участием другого лица;</xsl:text>
											<br/>
											<xsl:text>(б) они являются деловыми партнерами, т.е. связаны договорными отношениями, действуют в целях извлечения прибыли и совместно несут расходы и убытки, связанные с осуществлением совместной деятельности;</xsl:text>
											<br/>
											<xsl:text>(в) они являются работодателем и работником;</xsl:text>
											<br/>
											<xsl:text>(г) какое-либо лицо прямо или косвенно владеет пятью или более процентами выпущенных в обращение голосующих акций обоих лиц, контролирует пять или более процентов выпущенных в обращение голосующих акций обоих лиц или является номинальным держателем пяти и более процентов выпущенных в обращение голосующих акций обоих лиц;</xsl:text>
											<br/>
											<xsl:text>(д) одно из них прямо или косвенно контролирует другое;</xsl:text>
											<br/>
											<xsl:text>(е) оба они прямо или косвенно контролируются третьим лицом;</xsl:text>
											<br/>
											<xsl:text>(ж) вместе они прямо или косвенно контролируют третье лицо;</xsl:text>
											<br/>
											<xsl:text>(з) лица состоят в брачных отношениях, отношениях родства или свойства, усыновителя или усыновленного, а также попечителя и опекаемого.</xsl:text>
											<br/>
											<xsl:text>Факт взаимосвязи сам по себе не должен являться основанием для признания стоимости сделки неприемлемой для целей определения таможенной стоимости вывозимых товаров (п. 11 Правил определения таможенной стоимости товаров, вывозимых с таможенной территории Российской федерации, утвержденных Постановлением Правительства Российской Федерации от 13 августа 2005 г. N500).</xsl:text>
										</td>
										<td class="graph" style="width:80mm;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000; border-bottom: solid 0.8pt #000000" valign="top">
											<span class="graphNo">10 </span>
											<span class="graph">(а) Число дополнительных листов</span>
											<br/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates select="DTSout:AdditionalSheetNumber"/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:80mm;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;" valign="top">
											<span class="graphNo">10 </span>
											<span class="graph">(б) Место, дата, подпись, печать</span>
											<br/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates select="DTSout:DTSoutFilledPerson/cat_EDTS_cu:FilledDate" mode="russian_date"/>
											<br/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates select="DTSout:DTSoutFilledPerson/cat_ru:PersonSurname"/>&#160;
											<xsl:apply-templates select="DTSout:DTSoutFilledPerson/cat_ru:PersonName"/>&#160;
											<xsl:apply-templates select="DTSout:DTSoutFilledPerson/cat_ru:PersonMiddleName"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:if test="DTSout:DTSoutFilledPerson/catESAD_cu:IdentityCard">
												<xsl:apply-templates select="DTSout:DTSoutFilledPerson/catESAD_cu:IdentityCard/catESAD_cu:IdentityCardName"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="DTSout:DTSoutFilledPerson/catESAD_cu:IdentityCard/catESAD_cu:IdentityCardSeries"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="DTSout:DTSoutFilledPerson/catESAD_cu:IdentityCard/catESAD_cu:IdentityCardNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="DTSout:DTSoutFilledPerson/catESAD_cu:IdentityCard/catESAD_cu:IdentityCardDate" mode="russian_date"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="DTSout:DTSoutFilledPerson/catESAD_cu:IdentityCard/catESAD_cu:OrganizationName"/>
											</xsl:if>
											<xsl:apply-templates select="DTSout:DTSoutFilledPerson/catESAD_cu:Contact/cat_ru:Phone"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates select="DTSout:DTSoutFilledPerson/cat_ru:PersonPost"/>
											<xsl:if test="DTSout:DTSoutFilledPerson/cat_ru:AuthoritesDocument">
												<br/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:if test="DTSout:DTSoutFilledPerson/cat_ru:AuthoritesDocument/cat_ru:PrDocumentName">
													<xsl:apply-templates select="DTSout:DTSoutFilledPerson/cat_ru:AuthoritesDocument/cat_ru:PrDocumentName"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:if>
												<xsl:apply-templates select="DTSout:DTSoutFilledPerson/cat_ru:AuthoritesDocument/cat_ru:PrDocumentNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:if test="DTSout:DTSoutFilledPerson/cat_ru:AuthoritesDocument/cat_ru:PrDocumentDate">
													<xsl:apply-templates select="DTSout:DTSoutFilledPerson/cat_ru:AuthoritesDocument/cat_ru:PrDocumentDate" mode="russian_date"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:if>
												<xsl:apply-templates select="DTSout:DTSoutFilledPerson/cat_ru:AuthoritesDocument/cat_ru:ComplationAuthorityDate" mode="russian_date"/>
											</xsl:if>
											<br/>
											<xsl:apply-templates select="DTSout:DTSoutFilledPerson/DTSout:LNP"/>
											<xsl:if test="DTSout:DTSoutFilledPerson/DTSout:CustomsCode">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												(код ТО: <xsl:apply-templates select="DTSout:DTSoutFilledPerson/DTSout:CustomsCode"/>)
											</xsl:if>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<xsl:variable name="DTS" select="current()"/>
						<xsl:for-each select="DTSout:DTSGoodsCustomsCost">
							<div class="page">
								<table cellpadding="0" cellspacing="0 " style="width:100%; border:solid-left 0.8pt #000000;border:solid-right 0.8pt #000000;border-bottom:solid 0.8pt #000000;">
									<tbody>
										<tr>
											<td align="right" class="graph" style="width:145mm;">
												<span class="graph">Форма ДТС-3</span>
											</td>
											<td align="right" class="graph" style="width:35mm;">
												<span class="graph">Лист №  </span>
												<xsl:apply-templates select="cat_EDTS_ru:SheetNumber"/>
											</td>
										</tr>
										<tr>
											<td align="right" class="graph" style="width:145mm;">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
											<td align="right" class="graph" style="width:35mm;">
												<span class="graph">Метод 1</span>
											</td>
										</tr>
									</tbody>
								</table>
								<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.8pt #000000;">
									<tbody>
										<tr>
											<td align="center" class="graph" colspan="2" rowspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
												<span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
											</td>
											<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="top">
												<span class="graph">Товар № </span>
												<br/>
												<xsl:if test="cat_EDTS_ru:GTDGoodsNumber">
													<xsl:apply-templates select="cat_EDTS_ru:GTDGoodsNumber"/>
												</xsl:if>
											</td>
										</tr>
										<tr>
											<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="top">
												<span class="graph">Код ТН ВЭД ЕАЭС</span>
												<br/>
												<xsl:apply-templates select="cat_EDTS_ru:GoodsTNVEDCode"/>
												<xsl:apply-templates select="cat_EDTS_ru:GoodsAddTNVEDCode"/>
											</td>
										</tr>
										<tr>
											<td class="graph" rowspan="4" style="width:20mm;border:solid 0.8pt #000000;">
												<span class="graph">А. Основа для расчета</span>
											</td>
											<td align="center" class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
												<span class="graphNo">11 </span>
												<span class="graph">(a) Цена, фактически уплаченная или подлежащая уплате за товары в ВАЛЮТЕ СЧЕТА</span>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<br/>
												<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyCode"/>
											</td>
											<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyAmount" mode="format_number_2"/>
											</td>
											<tr>
												<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<span class="graph">в РУБЛЯХ</span>
													<br/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<span class="graph">(курс пересчета 
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyRate" mode="format_number_4"/>
														<xsl:if test="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyDate">
															, дата применения курса: <xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyDate" mode="russian_date"/>
														</xsl:if>
														<xsl:text>)</xsl:text>
													</span>
												</td>
												<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:DealNationalAmount" mode="format_number_2"/>
												</td>
											</tr>
										</tr>
										<tr>
											<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<span class="graph">(б) Косвенные платежи (условия или обязательства) в РУБЛЯХ - см. графу 8 (б)</span>
												<br/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<span class="graph">(курс пересчета 
													<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:IndirectCurrencyRate" mode="format_number_4"/>
													<xsl:if test="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:IndirectCurrencyDate">
														, дата применения курса: <xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:IndirectCurrencyDate" mode="russian_date"/>
													</xsl:if>
													<xsl:text>)</xsl:text>
												</span>
											</td>
											<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:IndirectNationalPayment" mode="format_number_2"/>
											</td>
										</tr>
										<tr>
											<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<span class="graphNo">12 </span>
												<span class="graph">Итого А в рублях</span>
											</td>
											<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:BasisNationalAmount" mode="format_number_2"/>
											</td>
										</tr>
										<tr>
											<td class="graph" rowspan="9" style="width:20mm;border:solid 0.8pt #000000;" valign="top">
												<span class="graph" style="align=left">Б. ДОПОЛНИТЕЛЬНЫЕ НАЧИСЛЕНИЯ: расходы в рублях, которые не включены в А &lt; * &gt;</span>
											</td>
											<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<span class="graphNo">13 </span>
												<span class="graph">Расходы, произведенные покупателем на:</span>
												<br/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<span class="graph">(а) выплату вознаграждения агенту (посреднику), за исключением вознаграждения за оказание услуг, связанных с покупкой товаров</span>
											</td>
											<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:DTS3Method1AdditionalSum/cat_EDTS_ru:AgentBonus" mode="format_number_2"/>
											</td>
										</tr>
										<tr>
											<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<span class="graph">(б) тару и упаковку</span>
											</td>
											<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:DTS3Method1AdditionalSum/cat_EDTS_ru:PackageExpenses" mode="format_number_2"/>
											</td>
										</tr>
										<tr>
											<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<span class="graphNo">14 </span>
												<span class="graph">Соответствующим образом распределенная стоимость следующих товаров и услуг, прямо или косвенно предоставленных покупателем бесплатно или по сниженной цене для использования в связи с  производством оцениваемых товаров и продажей их на вывоз из Российской Федерации в страну назначения:</span>
												<br/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<span class="graph">(а) сырья, материалов и комплектующих, которые являются составной частью вывозимых товаров</span>
											</td>
											<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:DTS3Method1AdditionalSum/cat_EDTS_ru:StoreCost" mode="format_number_2"/>
											</td>
										</tr>
										<tr>
											<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<span class="graph">(б) инструментов, штампов, форм и других подобных предметов, использованных при производстве вывозимых товаров</span>
											</td>
											<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:DTS3Method1AdditionalSum/cat_EDTS_ru:ProductionToolkitCost" mode="format_number_2"/>
											</td>
										</tr>
										<tr>
											<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<span class="graph">(в) материалов, израсходованных при производстве вывозимых товаров</span>
											</td>
											<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:DTS3Method1AdditionalSum/cat_EDTS_ru:WorkingStockCost" mode="format_number_2"/>
											</td>
										</tr>
										<tr>
											<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<span class="graph">(г) проектирования, разработки, инженерной, конструктивной работы, дизайна, художественного оформления, чертежей и эскизов, необходимых для производства оцениваемых товаров</span>
											</td>
											<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:DTS3Method1AdditionalSum/cat_EDTS_ru:DesignPayment" mode="format_number_2"/>
											</td>
										</tr>
										<tr>
											<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
												<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
												<span class="graphNo">15 </span>
												<span class="graph">Платежи за использование объектов интеллектуальной собственности - см. графу 9 (а)</span>
											</td>
											<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:DTS3Method1AdditionalSum/cat_EDTS_ru:IntellectualPropertyPayment" mode="format_number_2"/>
											</td>
										</tr>
										<tr>
											<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
												<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
												<span class="graphNo">16 </span>
												<span class="graph">Часть дохода, полученного в результате последующей продажи, распоряжения иным способом или использования товаров, которая прямо или косвенно причитается продавцу - см. графу 9 (б)</span>
											</td>
											<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:DTS3Method1AdditionalSum/cat_EDTS_ru:SellerIncome" mode="format_number_2"/>
											</td>
										</tr>
										<tr>
											<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
												<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
												<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
												<span class="graphNo">17 </span>
												<span class="graph"> Итого Б в рублях</span>
											</td>
											<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:DTS3Method1AdditionalSum/cat_EDTS_ru:TotalAdditionalSum" mode="format_number_2"/>
											</td>
										</tr>
										<tr>
											<td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
												<span class="graphNo">18 </span>
												<span class="graph">ЗАЯВЛЕННАЯ ТАМОЖЕННАЯ СТОИМОСТЬ (А + Б)</span>
												<br/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<span class="graph">(а) в РУБЛЯХ</span>
											</td>
											<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:if test="cat_EDTS_ru:SheetGoodsSerialNumber">
													<xsl:apply-templates select="cat_EDTS_ru:NationalDeclaredCustomsCost" mode="format_number_2"/>
												</xsl:if>
											</td>
										</tr>
										<tr>
											<td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<span class="graph">(б) в ДОЛЛАРАХ США (курс пересчета 
								<xsl:apply-templates select="$DTS/DTSout:CurrencyRate" mode="format_number_4"/>
								)</span>
											</td>
											<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:if test="cat_EDTS_ru:SheetGoodsSerialNumber">
													<xsl:apply-templates select="cat_EDTS_ru:DollarDeclaredCustomsCost" mode="format_number_2"/>
												</xsl:if>
											</td>
										</tr>
									</tbody>
								</table>
								<table cellpadding="0" cellspacing="0" style="width:100%;border:solid-left 0.8pt #000000;border:solid-right 0.8pt #000000;border-bottom:solid 0.8pt #000000;">
									<tbody>
										<tr>
											<td class="graph" style="width:180mm;border:solid 0.8pt #000000;" valign="top">
												<table cellpadding="0" cellspacing="0" style="width:100%;">
													<tbody>
														<tr>
															<td class="graph" style="width:180mm;" valign="top" colspan="4">
																<xsl:text>&lt;*&gt; Если сумма оплачена в иностранной валюте, здесь указывается сумма в иностранной валюте и курс пересчета по каждому товару и элементу стоимости</xsl:text>
															</td>
														</tr>
														<tr>
															<td class="graph" style="width:40mm;" valign="top">
																<span class="graph">Номер товара и позиции</span>
															</td>
															<td class="graph" style="width:40mm;" valign="top">
																<span class="graph">Код валюты, сумма</span>
															</td>
															<td class="graph" style="width:40mm;" valign="top">
																<span class="graph">Курс пересчета</span>
															</td>
															<td class="graph" style="width:40mm;" valign="top">
																<span class="graph">Дата применения курса</span>
															</td>
														</tr>
														<xsl:for-each select="cat_EDTS_ru:DTSCurrencyPayment">
															<tr>
																<td class="graph" style="width:40mm;" valign="top">
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	<xsl:apply-templates select="cat_EDTS_cu:PositionsNumber"/>
																</td>
																<td class="graph" style="width:40mm;" valign="top">
																	<xsl:apply-templates select="cat_EDTS_cu:CurrencyCode"/>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	<xsl:apply-templates select="cat_EDTS_cu:CurrencyAmount"/>
																</td>
																<td class="graph" style="width:40mm;" valign="top">
																	<xsl:choose>
																		<xsl:when test="cat_EDTS_cu:CurrencyRate">
																			<xsl:apply-templates select="cat_EDTS_cu:CurrencyRate"/>
																		</xsl:when>
																		<xsl:otherwise>
																			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																		</xsl:otherwise>
																	</xsl:choose>
																</td>
																<td class="graph" style="width:40mm;" valign="top">
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	<xsl:apply-templates select="cat_EDTS_cu:CurrencyDate" mode="russian_date"/>
																</td>
															</tr>
														</xsl:for-each>
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
								<table cellpadding="0" cellspacing="0" style="width:100%;border:solid-left 0.8pt #000000;border:solid-right 0.8pt #000000;border-bottom:solid 0.8pt #000000;">
									<tbody>
										<tr>
											<td class="graph" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
												<span class="graph">
												Дополнительные данные</span>
												<br/>
												<xsl:for-each select="cat_EDTS_ru:AdditionalData">
													<br/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="../cat_EDTS_ru:GTDGoodsNumber"/>
													<xsl:if test="cat_EDTS_cu:PositionNumber">
														<xsl:text> / </xsl:text>
														<xsl:apply-templates select="cat_EDTS_cu:PositionNumber"/>
													</xsl:if>
													<xsl:if test="cat_EDTS_cu:CVDAdditionalInformationKindCode">
														<xsl:text> / </xsl:text>
														<xsl:variable name="xpath_CVDAdditionalInformationKindCode">
															<xsl:call-template name="get_xpath">
																<xsl:with-param name="node" select="cat_EDTS_cu:CVDAdditionalInformationKindCode"/>
															</xsl:call-template>
														</xsl:variable>
														<element xml_node="{$xpath_CVDAdditionalInformationKindCode}">
															<xsl:choose>
																<xsl:when test="cat_EDTS_cu:CVDAdditionalInformationKindCode='1'">
																	<xsl:text>стоимость сделки близка к стоимости с идентичными товарами</xsl:text>
																</xsl:when>
																<xsl:when test="cat_EDTS_cu:CVDAdditionalInformationKindCode='2'">
																	<xsl:text>суммарная величина лицензионных и иных подобных платежей добавлена к цене, фактически уплаченной или поджежащей уплате за ввозимый товар</xsl:text>
																</xsl:when>
																<xsl:when test="cat_EDTS_cu:CVDAdditionalInformationKindCode='3'">
																	<xsl:text>лицензионные и иные подобные платежи (платежи за патенты, платежи за товарные знаки и т.д.) не включены в таможенную стоимость товара в связи с добавлением суммарной величины таких платежей к цене, фактически уплаченной или подлежащей уплате за товар</xsl:text>
																</xsl:when>
																<xsl:when test="cat_EDTS_cu:CVDAdditionalInformationKindCode='9'">
																	<xsl:text>иные дополнительные сведения или расчеты</xsl:text>
																</xsl:when>
															</xsl:choose>
														</element>
													</xsl:if>
													<xsl:if test="cat_EDTS_cu:CustomsDocIdDetails">
														<xsl:text> / </xsl:text>
														<xsl:apply-templates select="cat_EDTS_cu:CustomsDocIdDetails"/>
													</xsl:if>
													<xsl:if test="cat_EDTS_cu:DTConsignmentItemOrdinal">
														<xsl:text> / </xsl:text>
														<xsl:apply-templates select="cat_EDTS_cu:DTConsignmentItemOrdinal"/>
													</xsl:if>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:if test="cat_EDTS_cu:AdditionalInformation">
														<xsl:text>/ </xsl:text>
														<xsl:for-each select="cat_EDTS_cu:AdditionalInformation">
															<xsl:apply-templates select="."/>
															<xsl:if test="position()!=last()">
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															</xsl:if>
														</xsl:for-each>
													</xsl:if>
												</xsl:for-each>
												<xsl:if test="../cat_EDTS_ru:AdditionalData">
													<br/>
													<br>
														<xsl:text>Дополнительная информация, относящаяся ко всем товарам:</xsl:text>
													</br>
													<xsl:for-each select="../cat_EDTS_ru:AdditionalData">
														<br/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:if test="cat_EDTS_cu:CVDAdditionalInformationKindCode">
															<xsl:variable name="xpath_CVDAdditionalInformationKindCode2">
																<xsl:call-template name="get_xpath">
																	<xsl:with-param name="node" select="cat_EDTS_cu:CVDAdditionalInformationKindCode"/>
																</xsl:call-template>
															</xsl:variable>
															<element xml_node="{$xpath_CVDAdditionalInformationKindCode2}">
																<xsl:choose>
																	<xsl:when test="cat_EDTS_cu:CVDAdditionalInformationKindCode='1'">
																		<xsl:text>стоимость сделки близка к стоимости с идентичными товарами</xsl:text>
																	</xsl:when>
																	<xsl:when test="cat_EDTS_cu:CVDAdditionalInformationKindCode='9'">
																		<xsl:text>иные дополнительные сведения или расчеты</xsl:text>
																	</xsl:when>
																</xsl:choose>
															</element>
														</xsl:if>
														<xsl:if test="cat_EDTS_cu:CustomsDocIdDetails">
															<xsl:text> / </xsl:text>
															<xsl:apply-templates select="cat_EDTS_cu:CustomsDocIdDetails"/>
														</xsl:if>
														<xsl:if test="cat_EDTS_cu:DTConsignmentItemOrdinal">
															<xsl:text> / </xsl:text>
															<xsl:apply-templates select="cat_EDTS_cu:DTConsignmentItemOrdinal"/>
														</xsl:if>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:if test="cat_EDTS_cu:AdditionalInformation">
															<xsl:text>/ </xsl:text>
															<xsl:for-each select="cat_EDTS_cu:AdditionalInformation">
																<xsl:apply-templates select="."/>
																<xsl:if test="position()!=last()">
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</xsl:if>
															</xsl:for-each>
														</xsl:if>
													</xsl:for-each>
												</xsl:if>
											</td>
											<td class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="top">
												<span class="graph">Подпись, печать</span>
												<br/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="$DTS/DTSout:DTSoutFilledPerson/cat_ru:PersonSurname"/>&#160;
												<xsl:apply-templates select="$DTS/DTSout:DTSoutFilledPerson/cat_ru:PersonName"/>&#160;
												<xsl:apply-templates select="$DTS/DTSout:DTSoutFilledPerson/cat_ru:PersonMiddleName"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="$DTS/DTSout:DTSoutFilledPerson/cat_ru:PersonPost"/>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</xsl:for-each>
					</xsl:when>
					<xsl:when test="DTSout:FormDTS=4">
						<div class="page nobreak">
							<table cellpadding="0" cellspacing="0" style="width:100%;border:solid-left 0.8pt #000000;border:solid-right 0.8pt #000000;border-bottom:solid 0.8pt #000000;">
								<tbody>
									<tr>
										<td class="graph" rowspan="2" style="width:100mm;">РОССИЙСКАЯ ФЕДЕРАЦИЯ</td>
										<td align="right" class="graphNo" style="width:80mm;">ДЕКЛАРАЦИЯ ТАМОЖЕННОЙ СТОИМОСТИ</td>
									</tr>
									<tr>
										<td align="right" class="graph" style="width:80mm;">Форма ДТС-4</td>
									</tr>
								</tbody>
							</table>
							<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.8pt #000000;">
								<tbody>
									<tr>
										<td class="graph" style="width:100mm;border-left:solid 0.8pt #000000;border-top:solid 0.8pt #000000;">
											<span class="graphNo">1 </span>
											<span class="graph">Продавец (поставщик)</span>
											<br/>
											<xsl:apply-templates mode="org" select="DTSout:DTSoutSeller"/>
										</td>
										<td class="graph" rowspan="3" style="width:80mm;border-left:solid 2pt #000000;border-top:solid 1.5pt #000000;border-right:solid 0.8pt #000000;border-bottom:solid 1.5pt #000000;" valign="top">
											<span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100mm;border-left:solid 0.8pt #000000;border-top:solid 0.8pt #000000;">
											<span class="graphNo">2 </span>
											<span class="graph">(а) Покупатель (получатель)</span>
											<br/>
											<xsl:apply-templates mode="org" select="DTSout:DTSoutBuyer"/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100mm;border-left:solid 0.8pt #000000;border-top:solid 0.8pt #000000;">
											<span class="graphNo">2 </span>
											<span class="graph">(б) Декларант</span>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100mm;border-left:solid 0.8pt #000000;">
											<xsl:apply-templates select="DTSout:DTSoutDeclarant" mode="org"/>
										</td>
										<td class="graph" style="width:80mm;border:solid 0.8pt #000000;" valign="top">
											<span class="graphNo">3 </span>
											<span class="graph">Условия поставки</span>
											<br/>
											<xsl:apply-templates select="DTSout:DeliveryTerms/cat_ru:DeliveryTermsStringCode"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates select="DTSout:DeliveryTerms/cat_ru:DeliveryPlace"/>
										</td>
									</tr>
									<tr>
										<td class="graphBold" style="width:100mm;border-left:solid 1.5pt #000000;border-top:solid 2pt #000000;border-right:solid 1.5pt #000000;border-bottom:solid 1.5pt #000000;">
											<xsl:text>ВАЖНАЯ ИНФОРМАЦИЯ</xsl:text>
											<br/>
											<xsl:text>В соответствии с пунктом 2 статьи 84 ТК ЕАЭС декларант</xsl:text>
											<br/>
											<xsl:text>либо таможенный представитель несет </xsl:text>
											<br/>
											<xsl:text>ответственность за указание в декларации</xsl:text>
											<br/>
											<xsl:text>таможенной стоимости недостоверных</xsl:text>
											<br/>
											<xsl:text>сведений. Декларант обязан также</xsl:text>
											<br/>
											<xsl:text>представить при необходимости</xsl:text>
											<br/>
											<xsl:text>соответствующую дополнительную информацию</xsl:text>
											<br/>
											<xsl:text>и необходимые документы, подтверждающие</xsl:text>
											<br/>
											<xsl:text>использованные для определения заявленной</xsl:text>
											<br/>
											<xsl:text>таможенной стоимости сведения.</xsl:text>
										</td>
										<td class="graph" style="width:80mm;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;" valign="top">
											<span class="graphNo">4 </span>
											<span class="graph">Вид, номер и дата документа, являющегося основанием для поставки товара</span>
											<br/>
											<xsl:for-each select="DTSout:DTSInvoiceDocuments">
												<xsl:if test="cat_EDTS_cu:PositionNumber = 4">
													<xsl:if test="cat_ru:PrDocumentName">
														<xsl:apply-templates select="cat_ru:PrDocumentName"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</xsl:if>
													<xsl:if test="cat_EDTS_ru:PresentedDocumentModeCode">
														<xsl:apply-templates select="cat_EDTS_ru:PresentedDocumentModeCode"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</xsl:if>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentName"/>
													<br/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="graph" colspan="2" style="width:180mm;border:solid 0.8pt #000000;" valign="top">
											<span class="graphNo">5 </span>
											<span class="graph">Номер и дата документа с принятыми таможенными органами решениями по ранее вывезенным товарам по документу, указанному в графе 4</span>
											<br/>
											<xsl:for-each select="DTSout:DTSInvoiceDocuments">
												<xsl:if test="cat_EDTS_cu:PositionNumber = 5">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentName"/>
													<br/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="graph" colspan="2" style="width:180mm;border:solid 0.8pt #000000;" valign="top">
											<table cellpadding="0" cellspacing="0" style="width:100%;">
												<tbody>
													<tr>
														<td class="graph" style="width:130mm;" valign="top">
															<span class="graphNo">6 </span>
															<span class="graph">Таможенная стоимость декларируемых товаров определяется по методу</span>
														</td>
														<td class="graph" colspan="3" style="width:50mm;" valign="top">
															<table cellpadding="0" cellspacing="0" style="width:100%;">
																<tbody>
																	<tr>
																		<td align="center" class="graph" style="width:40mm;border-left:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;" valign="top">
																			<span class="graphBold">Верное отметить</span>
																		</td>
																		<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
																			<span class="graphBold">х</span>
																		</td>
																		<td align="center" class="graph" style="width:5mm;border-bottom:solid 0.8pt #000000;">
																			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																		</td>
																	</tr>
																</tbody>
															</table>
														</td>
													</tr>
													<tr>
														<td class="graph" style="width:130mm;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<span class="graph">(а) по стоимости сделки с идентичными товарами</span>
														</td>
														<td class="graph" style="width:22.5mm;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
															<xsl:choose>
																<xsl:when test="(DTSout:CustomsCostMethodCode=2) or (DTSout:BaseMethodCode=2)">
																	<span class="graphBold">х</span>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
														</td>
														<td class="graph" style="width:22.5mm;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="graph" style="width:130mm;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<span class="graph">(б) по стоимости сделки с однородными товарами</span>
														</td>
														<td class="graph" style="width:22.5mm;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
															<xsl:choose>
																<xsl:when test="(DTSout:CustomsCostMethodCode=3) or (DTSout:BaseMethodCode=3)">
																	<span class="graphBold">х</span>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
														</td>
														<td class="graph" style="width:22.5mm;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="graph" style="width:130mm;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<span class="graph">(в) сложения</span>
														</td>
														<td class="graph" style="width:22.5mm;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
															<xsl:choose>
																<xsl:when test="(DTSout:CustomsCostMethodCode=5) or (DTSout:BaseMethodCode=5)">
																	<span class="graphBold">х</span>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
														</td>
														<td class="graph" style="width:22.5mm;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="graph" style="width:130mm;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<span class="graph">(г) резервному &lt;*&gt;</span>
														</td>
														<td class="graph" style="width:22.5mm;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
															<xsl:variable name="xpath_CustomsCostMethodCode6">
																<xsl:call-template name="get_xpath">
																	<xsl:with-param name="node" select="DTSout:CustomsCostMethodCode"/>
																</xsl:call-template>
															</xsl:variable>
															<element xml_node="{$xpath_CustomsCostMethodCode6}">
																<xsl:choose>
																	<xsl:when test="(DTSout:CustomsCostMethodCode=6)">
																		<span class="graphBold">х</span>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</element>
														</td>
														<td class="graph" style="width:22.5mm;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="graph" style="width:130mm;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<span class="graph">(д) различным (если для разных товаров используются различные методы)</span>
														</td>
														<td class="graph" style="width:22.5mm;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td align="center" class="graph" style="width:5mm;border:solid 1.5pt #000000;" valign="middle">
															<xsl:variable name="xpath_CustomsCostMethodCode">
																<xsl:call-template name="get_xpath">
																	<xsl:with-param name="node" select="DTSout:CustomsCostMethodCode"/>
																</xsl:call-template>
															</xsl:variable>
															<element xml_node="{$xpath_CustomsCostMethodCode}">
																<xsl:choose>
																	<xsl:when test="(DTSout:CustomsCostMethodCode='*')">
																		<span class="graphBold">х</span>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</element>
														</td>
														<td class="graph" style="width:22.5mm;">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="graph" colspan="2" style="width:180mm;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;border-bottom:solid 0.8pt #000000;" valign="top">
											<span class="graphNo">7 </span>
											<span class="graph">Причины, по которым предшествующие методы определения таможенной стоимости не применимы</span>
											<br/>
											<xsl:for-each select="DTSout:ReasonApplyMethod/cat_EDTS_cu:ReasonDescription">
												<xsl:apply-templates select="."/>
												<xsl:text> </xsl:text>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="graph" colspan="2" style="width:180mm;border-left:solid 0.8pt #000000;border-right:solid 0.8pt #000000;" valign="top">
											<span class="graphNo">8 </span>
											<span class="graph">Наименование и реквизиты основных документов, представленных в подтверждение приводимых сведений</span>
											<br/>
											<xsl:apply-templates select="DTSout:CostConfirmationDocument/cat_EDTS_cu:PreviousCostAppriaseMethod"/>
											<br/>
											<xsl:for-each select="DTSout:CostConfirmationDocument/cat_EDTS_cu:MethodCondition">
												<xsl:apply-templates select="."/>
											</xsl:for-each>
											<br/>
											<xsl:for-each select="DTSout:DTSInvoiceDocuments">
												<xsl:if test="cat_EDTS_cu:PositionNumber = 8">
													<xsl:if test="cat_EDTS_cu:ConsignmentItemOrdinal">
														<xsl:text>Товар № </xsl:text>
														<xsl:apply-templates select="cat_EDTS_cu:ConsignmentItemOrdinal"/>
														<xsl:text> </xsl:text>
													</xsl:if>
													<xsl:apply-templates select="cat_ru:PrDocumentName"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
													<xsl:if test="cat_ru:PrDocumentDate">
														<xsl:text> от </xsl:text>
														<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
													</xsl:if>
													<xsl:if test="cat_EDTS_cu:CustomsDocIdDetails">
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="cat_EDTS_cu:CustomsDocIdDetails" mode="GTD_Number"/>
													</xsl:if>
													<xsl:if test="cat_EDTS_cu:DTConsignmentItemOrdinal">
														<xsl:text> т.</xsl:text>
														<xsl:apply-templates select="cat_EDTS_cu:DTConsignmentItemOrdinal"/>
													</xsl:if>
													<br/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="graph" rowspan="2" style="width:100mm;border:solid 0.8pt #000000;">
											<xsl:text>&lt;*&gt; В КАЧЕСТВЕ ОСНОВЫ ДЛЯ ОПРЕДЕЛЕНИЯ </xsl:text>
											<br/>
											<xsl:text>ТАМОЖЕННОЙ СТОИМОСТИ ТОВАРОВ ПО МЕТОДУ 6 В </xsl:text>
											<br/>
											<xsl:text>СООТВЕТСТВИИ СО СТАТЬЕЙ 45 ТК ЕАЭС</xsl:text>
											<br/>
											<xsl:text>НЕ МОГУТ БЫТЬ ИСПОЛЬЗОВАНЫ:</xsl:text>
											<br/>
											<xsl:text>-цены на товары на внутреннем рынке Таможенного союза, произведенные на таможенной территории Таможенного союза;</xsl:text>
											<br/>
											<xsl:text>- системы, предусматривающие принятие для таможенных целей более высокой из двухальтернативных стоимостей;</xsl:text>
											<br/>
											<xsl:text>- цена на товары на внутреннем рынке страны вывоза;</xsl:text>
											<br/>
											<xsl:text>- иные расходы, нежели расходы, включенныев  расчетную стоимость, которая была определена для идентичных или однородных товаров;</xsl:text>
											<br/>
											<xsl:text>- цены товаров, поставляемых из страны их вывоза в третьи страны;</xsl:text>
											<br/>
											<xsl:text>- минимальная таможенная стоимость;</xsl:text>
											<br/>
											<xsl:text>- произвольная или фиктивная стоимость.</xsl:text>
										</td>
										<td class="graph" style="width:80mm;border:solid 0.8pt #000000;" valign="top">
											<span class="graphNo">9 </span>
											<span class="graph">Число дополнительных листов</span>
											<br/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates select="DTSout:AdditionalSheetNumber"/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:80mm;border:solid 0.8pt #000000;" valign="top">
											<span class="graphNo">10 </span>
											<span class="graph">Место, дата, подпись, печать</span>
											<br/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											
											<xsl:apply-templates select="DTSout:DTSoutFilledPerson/cat_EDTS_cu:FilledDate" mode="russian_date"/>
											<br/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates select="DTSout:DTSoutFilledPerson/cat_ru:PersonSurname"/>&#160;
											<xsl:apply-templates select="DTSout:DTSoutFilledPerson/cat_ru:PersonName"/>&#160;
											<xsl:apply-templates select="DTSout:DTSoutFilledPerson/cat_ru:PersonMiddleName"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:if test="DTSout:DTSoutFilledPerson/catESAD_cu:IdentityCard">
												<xsl:apply-templates select="DTSout:DTSoutFilledPerson/catESAD_cu:IdentityCard/catESAD_cu:IdentityCardName"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="DTSout:DTSoutFilledPerson/catESAD_cu:IdentityCard/catESAD_cu:IdentityCardSeries"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="DTSout:DTSoutFilledPerson/catESAD_cu:IdentityCard/catESAD_cu:IdentityCardNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="DTSout:DTSoutFilledPerson/catESAD_cu:IdentityCard/catESAD_cu:IdentityCardDate" mode="russian_date"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:apply-templates select="DTSout:DTSoutFilledPerson/catESAD_cu:IdentityCard/catESAD_cu:OrganizationName"/>
											</xsl:if>
											<xsl:apply-templates select="DTSout:DTSoutFilledPerson/catESAD_cu:Contact/cat_ru:Phone"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates select="DTSout:DTSoutFilledPerson/cat_ru:PersonPost"/>
											<xsl:if test="DTSout:DTSoutFilledPerson/catESAD_cu:AuthoritesDocument">
												<br/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:if test="DTSout:DTSoutFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentName">
													<xsl:apply-templates select="DTSout:DTSoutFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentName"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:if>
												<xsl:apply-templates select="DTSout:DTSoutFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:if test="DTSout:DTSoutFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentDate">
													<xsl:apply-templates select="DTSout:DTSoutFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentDate" mode="russian_date"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:if>
												<xsl:apply-templates select="DTSout:DTSoutFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:ComplationAuthorityDate" mode="russian_date"/>
											</xsl:if>
											<br/>
											<xsl:apply-templates select="DTSout:DTSoutFilledPerson/DTSout:LNP"/>
											<xsl:if test="DTSout:DTSoutFilledPerson/DTSout:CustomsCode">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												(код ТО: <xsl:apply-templates select="DTSout:DTSoutFilledPerson/DTSout:CustomsCode"/>)
											</xsl:if>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<xsl:variable name="DTS" select="current()"/>
						<xsl:for-each select="DTSout:DTSGoodsCustomsCost">
							<xsl:choose>
								<xsl:when test="(cat_EDTS_ru:MethodNumberCode=1) or (cat_EDTS_ru:MethodNumberCode=6 and cat_EDTS_ru:BaseMethodNumberCode=1)">
									<div class="page">
										<table cellpadding="0" cellspacing="0" style="width:100%;border:solid-left 0.8pt #000000;border:solid-right 0.8pt #000000;border-bottom:solid 0.8pt #000000;">
											<tbody>
												<tr>
													<td align="right" class="graph" style="width:145mm;">
														<span class="graph">Форма ДТС-4</span>
													</td>
													<td align="right" class="graph" style="width:35mm;">
														<span class="graph">Лист №  </span>
														<xsl:apply-templates select="cat_EDTS_ru:SheetNumber"/>
													</td>
												</tr>
												<tr>
													<td align="right" class="graph" style="width:145mm;">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</td>
													<td align="right" class="graph" style="width:35mm;">
														<span class="graph">
															<xsl:choose>
																<xsl:when test="cat_EDTS_ru:MethodNumberCode=1">Метод 1</xsl:when>
																<xsl:when test="cat_EDTS_ru:MethodNumberCode=6 and cat_EDTS_ru:BaseMethodNumberCode=1">Метод 6 на основе метода 1</xsl:when>
															</xsl:choose>
														</span>
													</td>
												</tr>
											</tbody>
										</table>
										<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.8pt #000000;">
											<tbody>
												<tr>
													<td align="center" class="graph" colspan="2" rowspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
														<span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="top">
														<span class="graph">Товар № </span>
														<br/>
														<xsl:if test="cat_EDTS_ru:GTDGoodsNumber">
															<xsl:apply-templates select="cat_EDTS_ru:GTDGoodsNumber"/>
														</xsl:if>
													</td>
												</tr>
												<tr>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="top">
														<span class="graph">Код ТН ВЭД ЕАЭС</span>
														<br/>
														<xsl:apply-templates select="cat_EDTS_ru:GoodsTNVEDCode"/>
														<xsl:apply-templates select="cat_EDTS_ru:GoodsAddTNVEDCode"/>
													</td>
												</tr>
												<tr>
													<td class="graph" rowspan="4" style="width:20mm;border:solid 0.8pt #000000;">
														<span class="graph">А. Основа для расчета</span>
													</td>
													<td align="center" class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<span class="graphNo">11 </span>
														<span class="graph">(a) Цена, фактически уплаченная или подлежащая уплате за товары в ВАЛЮТЕ СЧЕТА</span>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<br/>
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyCode"/>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyAmount"/>
													</td>
													<tr>
														<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<span class="graph">в РУБЛЯХ</span>
															<br/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<span class="graph">(курс пересчета 
												<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:DealCurrencyRate"/>
											)</span>
														</td>
														<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:DealNationalAmount"/>
														</td>
													</tr>
												</tr>
												<tr>
													<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<span class="graph">(б) Косвенные платежи (условия или обязательства) в РУБЛЯХ - см. графу 8 (б)</span>
														<br/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<span class="graph">(курс пересчета 
											<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:IndirectCurrencyRate"/>
										)</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:IndirectNationalPayment"/>
													</td>
												</tr>
												<tr>
													<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<span class="graphNo">12 </span>
														<span class="graph">Итого А в рублях</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:Method1CalculationBasis/cat_EDTS_cu:BasisNationalAmount"/>
													</td>
												</tr>
												<tr>
													<td class="graph" rowspan="9" style="width:20mm;border:solid 0.8pt #000000;" valign="top">
														<span class="graph" style="align=left">Б. ДОПОЛНИТЕЛЬНЫЕ НАЧИСЛЕНИЯ: расходы в рублях, которые не включены в А &lt; * &gt;</span>
													</td>
													<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<span class="graphNo">13 </span>
														<span class="graph">Расходы, произведенные покупателем на:</span>
														<br/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<span class="graph">(а) выплату вознаграждения агенту (посреднику), за исключением вознаграждения за оказание услуг, связанных с покупкой товаров</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:DTS3Method1AdditionalSum/cat_EDTS_ru:AgentBonus"/>
													</td>
												</tr>
												<tr>
													<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<span class="graph">(б) тару и упаковку</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:DTS3Method1AdditionalSum/cat_EDTS_ru:PackageExpenses"/>
													</td>
												</tr>
												<tr>
													<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<span class="graphNo">14 </span>
														<span class="graph">Соответствующим образом распределенная стоимость следующих товаров и услуг, прямо или косвенно предоставленных покупателем бесплатно или по сниженной цене для использования в связи с  производством оцениваемых товаров и продажей их на вывоз из Российской Федерации в страну назначения:</span>
														<br/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<span class="graph">(а) сырья, материалов и комплектующих, которые являются составной частью вывозимых товаров</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:DTS3Method1AdditionalSum/cat_EDTS_ru:StoreCost"/>
													</td>
												</tr>
												<tr>
													<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<span class="graph">(б) инструментов, штампов, форм и других подобных предметов, использованных при производстве вывозимых товаров</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:DTS3Method1AdditionalSum/cat_EDTS_ru:ProductionToolkitCost"/>
													</td>
												</tr>
												<tr>
													<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<span class="graph">(в) материалов, израсходованных при производстве вывозимых товаров</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:DTS3Method1AdditionalSum/cat_EDTS_ru:WorkingStockCost"/>
													</td>
												</tr>
												<tr>
													<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<span class="graph">(г) проектирования, разработки, инженерной, конструктивной работы, дизайна, художественного оформления, чертежей и эскизов, необходимых для производства оцениваемых товаров</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:DTS3Method1AdditionalSum/cat_EDTS_ru:DesignPayment"/>
													</td>
												</tr>
												<tr>
													<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<span class="graphNo">15 </span>
														<span class="graph">Платежи за использование объектов интеллектуальной собственности - см. графу 9 (а)</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:DTS3Method1AdditionalSum/cat_EDTS_ru:IntellectualPropertyPayment"/>
													</td>
												</tr>
												<tr>
													<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<span class="graphNo">16 </span>
														<span class="graph">Часть дохода, полученного в результате последующей продажи, распоряжения иным способом или использования товаров, которая прямо или косвенно причитается продавцу - см. графу 9 (б)</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:DTS3Method1AdditionalSum/cat_EDTS_ru:SellerIncome"/>
													</td>
												</tr>
												<tr>
													<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<span class="graphNo">17 </span>
														<span class="graph"> Итого Б в рублях</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS3Method1/cat_EDTS_ru:DTS3Method1AdditionalSum/cat_EDTS_ru:TotalAdditionalSum"/>
													</td>
												</tr>
												<tr>
													<td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
														<span class="graphNo">18 </span>
														<span class="graph">ЗАЯВЛЕННАЯ ТАМОЖЕННАЯ СТОИМОСТЬ (А + Б)</span>
														<br/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<span class="graph">(а) в РУБЛЯХ</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:if test="cat_EDTS_ru:NationalDeclaredCustomsCost">
															<xsl:apply-templates select="cat_EDTS_ru:NationalDeclaredCustomsCost"/>
														</xsl:if>
													</td>
												</tr>
												<tr>
													<td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<span class="graph">(б) в ДОЛЛАРАХ США (курс пересчета 
									<xsl:apply-templates select="$DTS/DTSout:CurrencyRate"/>
									)</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:DollarDeclaredCustomsCost"/>
													</td>
												</tr>
											</tbody>
										</table>
										<table cellpadding="0" cellspacing="0" style="width:100%;border:solid-left 0.8pt #000000;border:solid-right 0.8pt #000000;border-bottom:solid 0.8pt #000000;">
											<tbody>
												<tr>
													<td class="graph" style="width:180mm;border:solid 0.8pt #000000;" valign="top">
														<table cellpadding="0" cellspacing="0" style="width:100%;">
															<tbody>
																<tr>
																	<td class="graph" style="width:180mm;" valign="top" colspan="3">
																		<xsl:text>&lt;*&gt; Если сумма оплачена в иностранной валюте, здесь указывается сумма в иностранной валюте и курс пересчета по каждому товару и элементу стоимости</xsl:text>
																	</td>
																</tr>
																<tr>
																	<td class="graph" style="width:40mm;" valign="top">
																		<span class="graph">Номер товара и позиции</span>
																	</td>
																	<td class="graph" style="width:40mm;" valign="top">
																		<span class="graph">Код валюты, сумма</span>
																	</td>
																	<td class="graph" style="width:40mm;" valign="top">
																		<span class="graph">Курс пересчета</span>
																	</td>
																	<td class="graph" style="width:40mm;" valign="top">
																		<span class="graph">Дата применения курса</span>
																	</td>
																</tr>
																<xsl:for-each select="cat_EDTS_ru:DTSCurrencyPayment">
																	<tr>
																		<td class="graph" style="width:80mm;" valign="top">
																			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																			<xsl:apply-templates select="cat_EDTS_cu:PositionsNumber"/>
																		</td>
																		<td class="graph" style="width:40mm;" valign="top">
																			<xsl:apply-templates select="cat_EDTS_cu:CurrencyCode"/>
																			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																			<xsl:apply-templates select="cat_EDTS_cu:CurrencyAmount"/>
																		</td>
																		<td class="graph" style="width:40mm;" valign="top">
																			<xsl:choose>
																				<xsl:when test="cat_EDTS_cu:CurrencyRate">
																					<xsl:apply-templates select="cat_EDTS_cu:CurrencyRate"/>
																				</xsl:when>
																				<xsl:otherwise>
																					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																				</xsl:otherwise>
																			</xsl:choose>
																		</td>
																		<td class="graph" style="width:40mm;" valign="top">
																			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																			<xsl:apply-templates select="cat_EDTS_cu:CurrencyDate" mode="russian_date"/>
																		</td>
																	</tr>
																</xsl:for-each>
															</tbody>
														</table>
													</td>
												</tr>
											</tbody>
										</table>
										<table cellpadding="0" cellspacing="0" style="width:100%;border:solid-left 0.8pt #000000;border:solid-right 0.8pt #000000;border-bottom:solid 0.8pt #000000;">
											<tbody>
												<tr>
													<td class="graph" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
														<span class="graph">Дополнительные данные</span>
														<br/>
														<xsl:for-each select="cat_EDTS_ru:AdditionalData">
															<br/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:apply-templates select="../cat_EDTS_ru:GTDGoodsNumber"/>
															<xsl:if test="cat_EDTS_cu:PositionNumber">
																<xsl:text> / </xsl:text>
																<xsl:apply-templates select="cat_EDTS_cu:PositionNumber"/>
															</xsl:if>
															<xsl:if test="cat_EDTS_cu:CVDAdditionalInformationKindCode">
																<xsl:text> / </xsl:text>
																<xsl:variable name="xpath_KindCode">
																	<xsl:call-template name="get_xpath">
																		<xsl:with-param name="node" select="cat_EDTS_cu:CVDAdditionalInformationKindCode"/>
																	</xsl:call-template>
																</xsl:variable>
																<element xml_node="{$xpath_KindCode}">
																	<xsl:choose>
																		<xsl:when test="cat_EDTS_cu:CVDAdditionalInformationKindCode='1'">
																			<xsl:text>стоимость сделки близка к стоимости с идентичными товарами</xsl:text>
																		</xsl:when>
																		<xsl:when test="cat_EDTS_cu:CVDAdditionalInformationKindCode='2'">
																			<xsl:text>суммарная величина лицензионных и иных подобных платежей добавлена к цене, фактически уплаченной или поджежащей уплате за ввозимый товар</xsl:text>
																		</xsl:when>
																		<xsl:when test="cat_EDTS_cu:CVDAdditionalInformationKindCode='3'">
																			<xsl:text>лицензионные и иные подобные платежи (платежи за патенты, платежи за товарные знаки и т.д.) не включены в таможенную стоимость товара в связи с добавлением суммарной величины таких платежей к цене, фактически уплаченной или подлежащей уплате за товар</xsl:text>
																		</xsl:when>
																		<xsl:when test="cat_EDTS_cu:CVDAdditionalInformationKindCode='9'">
																			<xsl:text>иные дополнительные сведения или расчеты</xsl:text>
																		</xsl:when>
																	</xsl:choose>
																</element>
															</xsl:if>
															<xsl:if test="cat_EDTS_cu:CustomsDocIdDetails">
																<xsl:text> / </xsl:text>
																<xsl:apply-templates select="cat_EDTS_cu:CustomsDocIdDetails"/>
															</xsl:if>
															<xsl:if test="cat_EDTS_cu:DTConsignmentItemOrdinal">
																<xsl:text> / </xsl:text>
																<xsl:apply-templates select="cat_EDTS_cu:DTConsignmentItemOrdinal"/>
															</xsl:if>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:if test="cat_EDTS_cu:AdditionalInformation">
																<xsl:text>/ </xsl:text>
																<xsl:for-each select="cat_EDTS_cu:AdditionalInformation">
																	<xsl:apply-templates select="."/>
																	<xsl:if test="position()!=last()">
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:if>
																</xsl:for-each>
															</xsl:if>
														</xsl:for-each>
														<xsl:if test="../cat_EDTS_ru:AdditionalData">
															<br/>
															<br>
																<xsl:text>Дополнительная информация, относящаяся ко всем товарам:</xsl:text>
															</br>
															<xsl:for-each select="../cat_EDTS_ru:AdditionalData">
																<br/>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:if test="cat_EDTS_cu:CVDAdditionalInformationKindCode">
																	<xsl:variable name="xpath_KindCode1">
																		<xsl:call-template name="get_xpath">
																			<xsl:with-param name="node" select="cat_EDTS_cu:CVDAdditionalInformationKindCode"/>
																		</xsl:call-template>
																	</xsl:variable>
																	<element xml_node="{$xpath_KindCode1}">
																		<xsl:choose>
																			<xsl:when test="cat_EDTS_cu:CVDAdditionalInformationKindCode='1'">
																				<xsl:text>стоимость сделки близка к стоимости с идентичными товарами</xsl:text>
																			</xsl:when>
																			<xsl:when test="cat_EDTS_cu:CVDAdditionalInformationKindCode='9'">
																				<xsl:text>иные дополнительные сведения или расчеты</xsl:text>
																			</xsl:when>
																		</xsl:choose>
																	</element>
																</xsl:if>
																<xsl:if test="cat_EDTS_cu:CustomsDocIdDetails">
																	<xsl:text> / </xsl:text>
																	<xsl:apply-templates select="cat_EDTS_cu:CustomsDocIdDetails"/>
																</xsl:if>
																<xsl:if test="cat_EDTS_cu:DTConsignmentItemOrdinal">
																	<xsl:text> / </xsl:text>
																	<xsl:apply-templates select="cat_EDTS_cu:DTConsignmentItemOrdinal"/>
																</xsl:if>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:if test="cat_EDTS_cu:AdditionalInformation">
																	<xsl:text>/ </xsl:text>
																	<xsl:for-each select="cat_EDTS_cu:AdditionalInformation">
																		<xsl:apply-templates select="."/>
																		<xsl:if test="position()!=last()">
																			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																		</xsl:if>
																	</xsl:for-each>
																</xsl:if>
															</xsl:for-each>
														</xsl:if>
													</td>
													<td class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="top">
														<span class="graph">Подпись, печать</span>
														<br/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="$DTS/DTSout:DTSoutFilledPerson/cat_ru:PersonSurname"/>&#160;
														<xsl:apply-templates select="$DTS/DTSout:DTSoutFilledPerson/cat_ru:PersonName"/>&#160;
														<xsl:apply-templates select="$DTS/DTSout:DTSoutFilledPerson/cat_ru:PersonMiddleName"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="$DTS/DTSout:DTSoutFilledPerson/cat_ru:PersonPost"/>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</xsl:when>
								<!--xsl:when test="($DTS/DTSout:CustomsCostMethodCode=2) or ($DTS/DTSout:CustomsCostMethodCode=3) or ($DTS/DTSout:CustomsCostMethodCode=5) or ($DTS/DTSout:CustomsCostMethodCode=6 and        $DTS/DTSout:BaseMethodCode!=1)"-->
								<xsl:when test="(cat_EDTS_ru:MethodNumberCode=2) or (cat_EDTS_ru:MethodNumberCode=3) or (cat_EDTS_ru:MethodNumberCode=5) or (cat_EDTS_ru:MethodNumberCode=6 and cat_EDTS_ru:BaseMethodNumberCode!=1)">									
								<div class="page">
										<table cellpadding="0" cellspacing="0" style="width:100%;border:solid-left 0.8pt #000000;border:solid-right 0.8pt #000000;border-bottom:solid 0.8pt #000000;">
											<tbody>
												<tr>
													<td align="right" class="graph" style="width:145mm;">
														<span class="graph">Форма ДТС-4</span>
													</td>
													<td align="right" class="graph" style="width:35mm;">
														<span class="graph">Лист № </span>
														<xsl:apply-templates select="cat_EDTS_ru:SheetNumber"/>
													</td>
												</tr>
												<tr>
													<td align="right" class="graph" style="width:145mm;">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</td>
													<td align="right" class="graph" style="width:35mm;">
														<span class="graph">Методы 2, 3, 5, 6</span>
													</td>
												</tr>
											</tbody>
										</table>
										<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0.8pt #000000;">
											<tbody>
												<tr>
													<td align="center" class="graph" colspan="2" rowspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
														<span class="graph">ДЛЯ ОТМЕТОК ТАМОЖЕННОГО ОРГАНА</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="top">
														<span class="graph">Товар № </span>
														<xsl:apply-templates select="cat_EDTS_ru:GTDGoodsNumber"/>
													</td>
												</tr>
												<tr>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="top">
														<span class="graph">Код ТН ВЭД ЕАЭС</span>
														<br/>
														<xsl:apply-templates select="cat_EDTS_ru:GoodsTNVEDCode"/>
														<xsl:apply-templates select="cat_EDTS_ru:GoodsAddTNVEDCode"/>
													</td>
												</tr>
												<tr>
													<td class="graph" rowspan="4" style="width:20mm;border:solid 0.8pt #000000;" valign="top">
														<span class="graph">А. Основа для расчета</span>
													</td>
													<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<span class="graphNo">11 </span>
														<span class="graph">Стоимость сделки с идентичными/однородными товарами в РУБЛЯХ (для методов 2, 3, 6)</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS4Method236/cat_EDTS_ru:Method2Basis/cat_EDTS_cu:IdenticalDealNationalAmount" mode="format_number_2"/>
													</td>
												</tr>
												<tr>
													<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<span class="graphNo">12 </span>
														<span class="graph">Расчетная стоимость вывозимых товаров, определяемая путем сложения в РУБЛЯХ (для методов 5, 6)</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS4Method56/cat_EDTS_ru:TotalBasisSum" mode="format_number_2"/>
													</td>
												</tr>
												<tr>
													<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<span class="graph">(a)</span>
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<span class="graph">суммы расходов,произведенных на изготовление  или приобретение материалов, и расходов на производство, а также иные операции, связанные с производством вывозимых товаров</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:if test="cat_EDTS_ru:SheetGoodsSerialNumber">
															<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS4Method56/cat_EDTS_ru:ProductionStoreExpense" mode="format_number_2"/>
														</xsl:if>
													</td>
												</tr>
												<tr>
													<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<span class="graph">(б)</span>
														<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
														<span class="graph">суммы прибыли и коммерческих и управленческих расходов</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:if test="cat_EDTS_ru:SheetGoodsSerialNumber">
															<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS4Method56/cat_EDTS_ru:CommerceExpense" mode="format_number_2"/>
														</xsl:if>
													</td>
												</tr>
												<tr>
													<td class="graph" rowspan="4" style="width:20mm;border:solid 0.8pt #000000;" valign="top">
														<span class="graph">Б. Корректировка стоимости сделки (+/-) *)</span>
													</td>
													<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<span class="graphNo">13 </span>
														<span class="graph">(а) корректировка на количество (+/-)</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS4Method236/cat_EDTS_ru:Method2DealCorrect/cat_EDTS_ru:QuantityCorrect" mode="format_number_2"/>
													</td>
												</tr>
												<tr>
													<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<span class="graph">(б) корректировка на коммерческий уровень (+/-)</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS4Method236/cat_EDTS_ru:Method2DealCorrect/cat_EDTS_ru:CommerceCorrect" mode="format_number_2"/>
													</td>
												</tr>
												<tr>
													<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<span class="graphNo">14 </span>
														<span class="graph">Итого графа 13 в рублях</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS4Method236/cat_EDTS_ru:Method2DealCorrect/cat_EDTS_ru:TotalSum" mode="format_number_2"/>
													</td>
												</tr>
												<tr>
													<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<span class="graphNo">15 </span>
														<span class="graph">Стоимость сделки с учетом корректировок (11 +/- 14) в рублях</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS4Method236/cat_EDTS_ru:Method2DealCorrect/cat_EDTS_ru:TotalDealCorrect" mode="format_number_2"/>
													</td>
												</tr>
												<tr>
													<td class="graph" rowspan="2" style="width:20mm;border:solid 0.8pt #000000;" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</td>
													<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<span class="graphNo">16 </span>
														<span class="graph">Количество</span>
														<br/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<span class="graph">(а) идентичных/однородных товаров</span>
														<xsl:if test=" (cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS4Method236/cat_EDTS_ru:IdenticalGoodsQuantity/cat_ru:MeasureUnitQualifierName)or (cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS4Method236/cat_EDTS_ru:IdenticalGoodsQuantity/cat_ru:MeasureUnitQualifierCode)">
															(
															<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS4Method236/cat_EDTS_ru:IdenticalGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS4Method236/cat_EDTS_ru:IdenticalGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
															)
														</xsl:if>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS4Method236/cat_EDTS_ru:IdenticalGoodsQuantity/cat_ru:GoodsQuantity"/>
													</td>
												</tr>
												<tr>
													<td class="graph" style="width:90mm;border:solid 0.8pt #000000;" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<span class="graph">(б) декларируемых товаров</span>
														<xsl:if test="(cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS4Method236/cat_EDTS_ru:DeclaratedGoodsQuantity/cat_ru:MeasureUnitQualifierName) or (cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS4Method236/cat_EDTS_ru:DeclaratedGoodsQuantity/cat_ru:MeasureUnitQualifierCode)">
															(
															<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS4Method236/cat_EDTS_ru:DeclaratedGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS4Method236/cat_EDTS_ru:DeclaratedGoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
															)
														</xsl:if>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:CustomsCostCalculation/cat_EDTS_ru:DTS4Method236/cat_EDTS_ru:DeclaratedGoodsQuantity/cat_ru:GoodsQuantity"/>
													</td>
												</tr>
												<tr>
													<td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
														<span class="graphNo">17 </span>
														<span class="graph">ЗАЯВЛЕННАЯ ТАМОЖЕННАЯ СТОИМОСТЬ (15/16а * 16б или 12)</span>
														<br/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<span class="graph">(а) в РУБЛЯХ</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:NationalDeclaredCustomsCost" mode="format_number_2"/>
													</td>
												</tr>
												<tr>
													<td class="graph" colspan="2" style="width:110mm;border:solid 0.8pt #000000;" valign="top">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<span class="graph">(б) в ДОЛЛАРАХ США (курс пересчета 
														<xsl:apply-templates select="$DTS/DTSout:CurrencyRate" mode="format_number_4"/>
														)</span>
													</td>
													<td align="center" class="graph" style="width:70mm;border:solid 0.8pt #000000;" valign="middle">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="cat_EDTS_ru:DollarDeclaredCustomsCost" mode="format_number_2"/>
													</td>
												</tr>
											</tbody>
										</table>
										<table cellpadding="0" cellspacing="0" style="width:100%;border:solid-left 0.8pt #000000;border:solid-right 0.8pt #000000;border-bottom:solid 0.8pt #000000;">
											<tbody>
												<td class="graph" colspan="2" style="width:100mm;border:solid 0.8pt #000000;" valign="top">
													<span class="graph">Дополнительные данные</span>
													<xsl:if test="cat_EDTS_ru:AdditionalData">
														<xsl:for-each select="cat_EDTS_ru:AdditionalData">
															<br/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:apply-templates select="../cat_EDTS_ru:GTDGoodsNumber"/>
															<xsl:if test="cat_EDTS_cu:PositionNumber">
																<xsl:text> / </xsl:text>
																<xsl:apply-templates select="cat_EDTS_cu:PositionNumber"/>
															</xsl:if>
															<xsl:if test="cat_EDTS_cu:CVDAdditionalInformationKindCode">
																<xsl:text> / </xsl:text>
																<xsl:variable name="xpath_KindCode2">
																	<xsl:call-template name="get_xpath">
																		<xsl:with-param name="node" select="cat_EDTS_cu:CVDAdditionalInformationKindCode"/>
																	</xsl:call-template>
																</xsl:variable>
																<element xml_node="{$xpath_KindCode2}">
																	<xsl:choose>
																		<xsl:when test="cat_EDTS_cu:CVDAdditionalInformationKindCode='1'">
																			<xsl:text>стоимость сделки близка к стоимости с идентичными товарами</xsl:text>
																		</xsl:when>
																		<xsl:when test="cat_EDTS_cu:CVDAdditionalInformationKindCode='2'">
																			<xsl:text>суммарная величина лицензионных и иных подобных платежей добавлена к цене, фактически уплаченной или поджежащей уплате за ввозимый товар</xsl:text>
																		</xsl:when>
																		<xsl:when test="cat_EDTS_cu:CVDAdditionalInformationKindCode='3'">
																			<xsl:text>лицензионные и иные подобные платежи (платежи за патенты, платежи за товарные знаки и т.д.) не включены в таможенную стоимость товара в связи с добавлением суммарной величины таких платежей к цене, фактически уплаченной или подлежащей уплате за товар</xsl:text>
																		</xsl:when>
																		<xsl:when test="cat_EDTS_cu:CVDAdditionalInformationKindCode='9'">
																			<xsl:text>иные дополнительные сведения или расчеты</xsl:text>
																		</xsl:when>
																		<xsl:otherwise><xsl:apply-templates select="cat_EDTS_cu:CVDAdditionalInformationKindCode"/></xsl:otherwise>
																	</xsl:choose>
																</element>
															</xsl:if>
															<xsl:if test="cat_EDTS_cu:CustomsDocIdDetails">
																<xsl:text> / </xsl:text>
																<xsl:apply-templates select="cat_EDTS_cu:CustomsDocIdDetails"/>
															</xsl:if>
															<xsl:if test="cat_EDTS_cu:DTConsignmentItemOrdinal">
																<xsl:text> / </xsl:text>
																<xsl:apply-templates select="cat_EDTS_cu:DTConsignmentItemOrdinal"/>
															</xsl:if>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:if test="cat_EDTS_cu:AdditionalInformation">
																<xsl:text>/ </xsl:text>
																<xsl:for-each select="cat_EDTS_cu:AdditionalInformation">
																	<xsl:apply-templates select="."/>
																	<xsl:if test="position()!=last()">
																		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																	</xsl:if>
																</xsl:for-each>
															</xsl:if>
														</xsl:for-each>
													</xsl:if>
												</td>
												<td class="graph" style="width:52mm;border:solid 0.8pt #000000;" valign="top">
													<span class="graph">Подпись, печать</span>
													<br/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="$DTS/DTSout:DTSoutFilledPerson/cat_ru:PersonSurname"/>&#160;
													<xsl:apply-templates select="$DTS/DTSout:DTSoutFilledPerson/cat_ru:PersonName"/>&#160;
													<xsl:apply-templates select="$DTS/DTSout:DTSoutFilledPerson/cat_ru:PersonMiddleName"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:apply-templates select="$DTS/DTSout:DTSoutFilledPerson/cat_ru:PersonPost"/>
												</td>
											</tbody>
										</table>
									</div>
								</xsl:when>
							</xsl:choose>
						</xsl:for-each>
					</xsl:when>
				</xsl:choose>
			</body>
		</html>
	</xsl:template>
	<!-- Реквизиты организации -->
	<xsl:template match="*" mode="org">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<span class="graph"> (</span>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<span class="graph">)</span>
		</xsl:if>
		<br/>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates mode="ru_address" select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails/cat_ru:E_mail">
			<xsl:if test="RUScat_ru:SubjectAddressDetails">
				<xsl:text>; </xsl:text>
			</xsl:if>
			<xsl:for-each select="RUScat_ru:CommunicationDetails/cat_ru:E_mail">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectBranch">
			<br/>
			<xsl:apply-templates select="RUScat_ru:SubjectBranch/cat_ru:OrganizationName"/>
			<br/>
			<xsl:if test="RUScat_ru:SubjectBranch/RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates mode="ru_address" select="RUScat_ru:SubjectBranch/RUScat_ru:SubjectAddressDetails"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="(cat_ru:RFOrganizationFeatures) or (cat_ru:RBOrganizationFeatures) or (cat_ru:RKOrganizationFeatures)">
			<br/>
			<xsl:text>№ </xsl:text>
			<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:ITN">
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
			</xsl:if>
		</xsl:if>
		<br/>
		<xsl:apply-templates mode="spaceSeparated" select="RUScat_ru:IdentityCard"/>
	</xsl:template>
	<!-- Адрес -->
	<xsl:template match="*" mode="ru_address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:variable name="xpath_AddressKindCode">
						<xsl:call-template name="get_xpath">
							<xsl:with-param name="node" select="RUScat_ru:AddressKindCode"/>
						</xsl:call-template>
					</xsl:variable>
					<element xml_node="{$xpath_AddressKindCode}">
						<xsl:choose>
							<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						</xsl:choose>
					</element>
				</xsl:if>
				<xsl:apply-templates select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:variable name="xpath_AddressKindCode2">
								<xsl:call-template name="get_xpath">
									<xsl:with-param name="node" select="."/>
								</xsl:call-template>
							</xsl:variable>
							<element xml_node="{$xpath_AddressKindCode2}">
								<xsl:choose>
									<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
									<xsl:when test=".='2'">Фактический адрес: </xsl:when>
									<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								</xsl:choose>
							</element>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="spaceSeparated">
		<xsl:if test="position() > 1">
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="format_number_2">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="format-number(.,'0.00')"/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="format_number_4">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="format-number(.,'0.0000')"/>
		</element>
	</xsl:template>
	
</xsl:stylesheet>
