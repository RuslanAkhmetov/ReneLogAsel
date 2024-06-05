<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.23.0" xmlns:dca="urn:customs.ru:Information:CustomsAuditDocuments:DecisionCustomsAudit:5.23.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.23.0">
	<!-- Приказ ФТС России № 226 от 8 февраля 2019 года "Об утверждении формы решения по результатам таможенного контроля, порядка ее заполнения и внесения изменений (дополнений) в указанное решение, формы решения о внесении изменений (дополнений) в решение по результатам таможенного контроля, а также порядка ее заполнения"
DocKind=1 - Решение по результатам таможенного контроля
DocKind=2 - Решение о внесении изменений (дополнений) в решение по результатам таможенного контроля
-->
	<!-- Шаблон для типа DecisionCustomsAuditType -->
	<xsl:template match="dca:DecisionCustomsAudit">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
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
				</style>
			</head>
			<body>
				<div class="page">
					<xsl:choose>
						<xsl:when test="dca:DocKind='1'">
							<xsl:apply-templates select="." mode="decision"/>
						</xsl:when>
						<xsl:when test="dca:DocKind='2'">
							<xsl:apply-templates select="." mode="decisionChange"/>
						</xsl:when>
					</xsl:choose>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="dca:DecisionCustomsAudit" mode="decision">
		<table>
			<tbody>
				<tr>
					<td align="center">
						МИНИСТЕРСТВО ФИНАНСОВ РОССИЙСКОЙ ФЕДЕРАЦИИ<br/>
						(МИНФИН РОССИИ)
						<br/>
						<br/>
						ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА
					</td>
				</tr>
				<tr>
					<td class="value" align="center">
						<xsl:value-of select="dca:CustomsIssuedDecision/cat_ru:OfficeName"/>
						<xsl:if test="dca:CustomsIssuedDecision/cat_ru:Code">
							<xsl:text> (</xsl:text>
						</xsl:if>
						<xsl:value-of select="dca:CustomsIssuedDecision/cat_ru:Code"/>
						<xsl:if test="dca:CustomsIssuedDecision/cat_ru:Code">
							<xsl:text>)</xsl:text>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="descr">(наименование таможенного органа)</td>
				</tr>
				<tr>
					<td align="center">
						<br/>
						<br/>
						РЕШЕНИЕ
						<br/>
						<br/>
						по результатам таможенного контроля
						<br/>
						<br/>
						№ <span style="border-bottom:1px solid black; width:50mm;">
							<xsl:value-of select="dca:DecisionNumber/adt_cat:Number"/>
						</span>
						<br/>
						<br/>
						<xsl:call-template name="russian_date_month">
							<xsl:with-param name="dateIn" select="dca:DecisionNumber/adt_cat:Date"/>
						</xsl:call-template> г.
					</td>
				</tr>
				<tr>
					<td>
						<br/>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="indent">
						<xsl:text>1. Вводная часть.</xsl:text>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="indent">
						<xsl:text>1.1. Должностное лицо таможенного органа, принявшее решение:</xsl:text>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="value">
						<xsl:apply-templates select="dca:CustomsIssuedDecision/adt_cat:ApproverPerson" mode="ApproverPerson"/>
					</td>
				</tr>
				<tr>
					<td>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="indent" style="text-align: justify">
						<xsl:text>1.2. Лицо, в отношении товаров, документов, сооружений, помещений (частей помещений), открытых площадок (частей открытых площадок) и (или) деятельности которого проведена </xsl:text>
						<xsl:choose>
							<xsl:when test="dca:IdentKindAudit=1">
								<u>таможенная проверка</u> / <!--s-->проверка таможенных, иных документов и (или) сведений<!--/s-->
							</xsl:when>
							<xsl:when test="dca:IdentKindAudit=2">
								<!--s-->таможенная проверка<!--/s--> / <u>проверка таможенных, иных документов и (или) сведений</u>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>таможенная проверка / проверка таможенных, иных документов и (или) сведений</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:text>:</xsl:text>
					</td>
				</tr>
				<tr>
					<td class="value" style="text-align: justify">
						<xsl:apply-templates mode="organization" select="dca:AuditOrganization"/>
					</td>
				</tr>
				<tr>
					<td>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="indent">
						<xsl:text>2. Описательная часть.</xsl:text>
					</td>
				</tr>
				<tr>
					<td class="indent">
						<xsl:text>2.1. На основании </xsl:text>
						<xsl:choose>
							<xsl:when test="dca:IdentKindAudit=1">
								<u>акта таможенной проверки</u>
								<!--s-->
								<xsl:text> от </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="dca:ActNumber/adt_cat:Date"/>
										</xsl:call-template>
									</xsl:with-param>
									<xsl:with-param name="description">(дата)</xsl:with-param>
									<xsl:with-param name="width">20%</xsl:with-param>
								</xsl:call-template>
								<xsl:text> № </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="dca:ActNumber/adt_cat:Number"/>
									</xsl:with-param>
									<xsl:with-param name="description">(номер)</xsl:with-param>
									<xsl:with-param name="width">20%</xsl:with-param>
								</xsl:call-template> / по результатам проведенной проверки таможенных, иных документов и (или) сведений:<!--/s-->
							</xsl:when>
							<xsl:when test="dca:IdentKindAudit=2">
								<!--s-->акта таможенной проверки от<!--/s-->
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="dca:ActNumber/adt_cat:Date"/>
										</xsl:call-template>
									</xsl:with-param>
									<xsl:with-param name="description">(дата)</xsl:with-param>
									<xsl:with-param name="width">20%</xsl:with-param>
								</xsl:call-template>
								<xsl:text> № </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="dca:ActNumber/adt_cat:Number"/>
									</xsl:with-param>
									<xsl:with-param name="description">(номер)</xsl:with-param>
									<xsl:with-param name="width">20%</xsl:with-param>
								</xsl:call-template> / <u>по результатам проведенной проверки таможенных, иных документов и (или) сведений:</u>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>акта таможенной проверки от</xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="dca:ActNumber/adt_cat:Date"/>
										</xsl:call-template>
									</xsl:with-param>
									<xsl:with-param name="description">(дата)</xsl:with-param>
									<xsl:with-param name="width">20%</xsl:with-param>
								</xsl:call-template>
								<xsl:text> № </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="dca:ActNumber/adt_cat:Number"/>
									</xsl:with-param>
									<xsl:with-param name="description">(номер)</xsl:with-param>
									<xsl:with-param name="width">20%</xsl:with-param>
								</xsl:call-template>
								<xsl:text> / проверки таможенных, иных документов и (или) сведений</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
				<tr>
					<td>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="indent">2.2. УСТАНОВЛЕНО следующее:</td>
				</tr>
				<tr>
					<td style="text-align: justify">
						<xsl:call-template name="inlinetable">
							<xsl:with-param name="data">
								<xsl:for-each select="dca:AuditDisorders">
									<xsl:value-of select="position()"/>
									<xsl:text>) </xsl:text>
									<xsl:apply-templates select="."/>
									<xsl:if test="position() != last()">; </xsl:if>
								</xsl:for-each>
							</xsl:with-param>
							<xsl:with-param name="width">100%</xsl:with-param>
							<xsl:with-param name="data_align" select="'left'"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<br/>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="indent">
						<xsl:text>3. Резолютивная часть.</xsl:text>
					</td>
				</tr>
				<tr>
					<td class="indent" style="text-align: justify">
						<xsl:text>3.1. На основании изложенного, руководствуясь статьей 218 и </xsl:text>
						<xsl:choose>
							<xsl:when test="dca:IdentKindAudit=1">
								<u>частью 2 статьи 226</u> / <!--s-->частью 28 статьи 237 <!--/s-->
							</xsl:when>
							<xsl:when test="dca:IdentKindAudit=2">
								<!--s-->частью 2 статьи 226<!--/s--> / <u>частью 28 статьи 237 </u>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>частью 2 статьи 226 / частью 6 статьи 237</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:text>Федерального закона от 3 августа 2018 г. 
№ 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации», </xsl:text>
						<br>РЕШЕНО:</br>
					</td>
				</tr>
				<tr>
					<td class="indent">
						<xsl:text>3.2.</xsl:text>
						<table width="100%">
							<tbody>
								<tr align="center">
									<td class="bordered" style="text-indent:0;">№ п/п</td>
									<td align="left" class="bordered" style="text-indent:0;">Решение в области таможенного дела,<br/>принимаемое в целях устранения выявленных нарушений</td>
								</tr>
								<xsl:for-each select="dca:Decisions">
									<tr valign="top">
										<td class="bordered" style="text-indent:0;">
											<xsl:value-of select="dca:NumberString"/>
										</td>
										<td class="bordered" style="text-align: justify">
											<xsl:choose>
												<xsl:when test="dca:Decision_Variant_0='true'">Решения в сфере таможенного дела, принимаемые по результатам таможенного контроля в форме таможенной проверки или проверки таможенных, иных документов и (или) сведений </xsl:when>
												<xsl:when test="dca:Decision_Variant_1='true'">Решение о выявлении нарушения регулирующих таможенные правоотношения международных договоров и актов, составляющих право Евразийского экономического союза, и (или) законодательства Российской Федерации о таможенном регулировании</xsl:when>
												<xsl:when test="dca:Decision_Variant_2='true'">Решение о признании товаров незаконно перемещенными через таможенную границу Евразийского экономического союза</xsl:when>
												<xsl:when test="dca:Decision_Variant_3='true'">Решение об обнаружении товаров, на оборот которых в Российской Федерации введен запрет в соответствии со статьей 212 ФЗ «О таможенном регулировании»</xsl:when>
												<xsl:when test="dca:Decision_Variant_4='true'">Решение об обнаружении товаров, подлежащих изъятию в соответствии с федеральными законами, актами Президента Российской Федерации, актами Правительства Российской Федерации, указанными в статье 254 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации", в рамках осуществления иных функций, возложенных на таможенные органы в соответствии с частью 4 статьи 254 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации</xsl:when>
												<xsl:when test="dca:Decision_Variant_5='true' or dca:Decision_Variant_6='true'">
													<xsl:if test="dca:Decision_Variant_5='true'">Решение о признании в соответствии с пунктом 2 статьи 56 Таможенного кодекса Евразийского экономического союза и частью 14 статьи 73 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" лица, участвовавшего в незаконном перемещении товара (товаров), </xsl:if>
													<xsl:if test="dca:Decision_Variant_6='true'">Решение о признании в соответствии с пунктом 2 статьи 56 Таможенного кодекса Евразийского экономического союза и частью 14 статьи 73 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" лица, которое приобрело в собственность или во владение незаконно ввезенный товар (незаконно ввезенные товары), -</xsl:if>
													<xsl:choose>
														<xsl:when test="dca:JointlyLiablePerson">
															<xsl:for-each select="dca:JointlyLiablePerson">
																<xsl:apply-templates mode="organization" select="."/>
																<xsl:if test="position()!=last()">; </xsl:if>
															</xsl:for-each>
														</xsl:when>
														<xsl:otherwise>_____________________</xsl:otherwise>
													</xsl:choose>
													<br>несущим солидарную с лицом, незаконно перемещающим товар (товары) через таможенную границу Евразийского экономического союза, обязанность по уплате таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пени, - </br>
													<xsl:choose>
														<xsl:when test="dca:DisorderPerson">
															<xsl:for-each select="dca:DisorderPerson">
																<xsl:apply-templates mode="organization" select="."/>
																<xsl:if test="position()!=last()">; </xsl:if>
															</xsl:for-each>
														</xsl:when>
														<xsl:otherwise>_____________________</xsl:otherwise>
													</xsl:choose>
													<br>Указанное решение принято в отношении товара (товаров) № </br>
													<xsl:choose>
														<xsl:when test="dca:GoodsNumeric">
															<xsl:for-each select="dca:GoodsNumeric">
																<u>
																	<xsl:apply-templates select="."/>
																</u>
																<xsl:if test="position()!=last()">,</xsl:if>
															</xsl:for-each>
														</xsl:when>
														<xsl:otherwise>_______</xsl:otherwise>
													</xsl:choose>, сведения о котором (которых) указаны в таблице, указанной в строке 3.3 решения по результатам таможенного контроля от <xsl:choose>
														<xsl:when test="dca:DecisionCustomsControl/cat_ru:PrDocumentDate">
															<u>
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="dca:DecisionCustomsControl/cat_ru:PrDocumentDate"/>
																</xsl:call-template>
															</u>
														</xsl:when>
														<xsl:otherwise>_______</xsl:otherwise>
													</xsl:choose> № <xsl:choose>
														<xsl:when test="dca:DecisionCustomsControl/cat_ru:PrDocumentNumber">
															<u>
																<xsl:apply-templates select="dca:DecisionCustomsControl/cat_ru:PrDocumentNumber"/>
															</u>
														</xsl:when>
														<xsl:otherwise>_______</xsl:otherwise>
													</xsl:choose>
												</xsl:when>
												<xsl:when test="dca:Decision_Variant_7='true'">Решение о внесении изменений и (или) дополнений в сведения об исчисленных и уплаченных платежах, указанных в таможенном приходном ордере, добавочных листах к таможенному приходному ордеру<xsl:apply-templates mode="TPORegNum" select="dca:TPORegNumber"/>
												</xsl:when>
												<xsl:when test="dca:Decision_Variant_8='true'">Решение об установлении точных сведений о товарах, указанных в таблице, указанной в строке  <xsl:choose>
														<xsl:when test="dca:LineNumber">
															<u>
																<xsl:apply-templates select="dca:LineNumber"/>
															</u>
														</xsl:when>
														<xsl:otherwise>_______</xsl:otherwise>
													</xsl:choose> решения по результатам таможенного контроля от <xsl:choose>
														<xsl:when test="dca:DecisionCustomsControl/cat_ru:PrDocumentDate">
															<u>
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="dca:DecisionCustomsControl/cat_ru:PrDocumentDate"/>
																</xsl:call-template>
															</u>
														</xsl:when>
														<xsl:otherwise>_______</xsl:otherwise>
													</xsl:choose> № <xsl:choose>
														<xsl:when test="dca:DecisionCustomsControl/cat_ru:PrDocumentNumber">
															<u>
																<xsl:apply-templates select="dca:DecisionCustomsControl/cat_ru:PrDocumentNumber"/>
															</u>
														</xsl:when>
														<xsl:otherwise>_______</xsl:otherwise>
													</xsl:choose>
												</xsl:when>
												<xsl:when test="dca:Decision_Variant_9='true'">Решение об установлении сведений о товарах, задержанных таможенными органами в соответствии с главой 51 Таможенного кодекса Евразийского экономического союза", которое принимается в отношении товаров, сроки хранения которых, предусмотренные статьей 380 ТК Союза, истекли<xsl:choose>
														<xsl:when test="dca:ExpiredDate"> (<xsl:for-each select="dca:ExpiredDate">
																<u>
																	<xsl:call-template name="russian_date">
																		<xsl:with-param name="dateIn" select="."/>
																	</xsl:call-template>
																	<xsl:if test="position()!=last()">, </xsl:if>
																</u>
															</xsl:for-each>)</xsl:when>
													</xsl:choose>
												</xsl:when>
												<xsl:when test="dca:Decision_Variant_10='true'">Иные решения в сфере таможенного дела, принимаемые в случае выявления нарушений регулирующих таможенные правоотношения международных договоров и актов, составляющих право Евразийского экономического союза, и (или) законодательства Российской Федерации о таможенном регулировании</xsl:when>
											</xsl:choose>
											<xsl:if test="dca:Text">
												<xsl:text>: </xsl:text>
												<xsl:for-each select="dca:Text">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="dca:LawArticle">
												<xsl:text>: </xsl:text>
												<xsl:for-each select="dca:LawArticle">
													<xsl:apply-templates mode="document" select="."/>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="dca:PaymentsInfo">
												<xsl:text>, </xsl:text>
												<xsl:for-each select="dca:PaymentsInfo">
													<xsl:value-of select="dca:PaymentCode"/>
													<xsl:text>/</xsl:text>
													<xsl:call-template name="number_date">
														<xsl:with-param name="dateIn" select="dca:PaymentTermDate"/>
													</xsl:call-template>
													<xsl:text>/</xsl:text>
													<xsl:call-template name="number_date">
														<xsl:with-param name="dateIn" select="dca:CalculationRatesDate"/>
													</xsl:call-template>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td class="indent">
						<xsl:text>3.3. В отношении следующих товаров:</xsl:text>
					</td>
				</tr>
				<xsl:for-each select="dca:GoodsInfo">
					<tr>
						<td>
							<table width="100%">
								<!--3 x 13-->
								<tbody>
									<tr valign="top">
										<td class="bordered" style="width:55%;">1. Плательщик
											<br/>
											<xsl:apply-templates mode="organization" select="dca:PayerDetails"/>
											<xsl:if test="not(dca:PayerDetails)">Не установлено</xsl:if>
										</td>
										<td class="bordered" colspan="2">2. Лица, несущие солидарную (субсидиарную) обязанность
											<br/>
											<xsl:for-each select="dca:JointlyLiablePersonDetails">
												<xsl:apply-templates mode="organization" select="."/>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="bordered">3. Страна происхождения
											<xsl:value-of select="dca:OriginCountryName"/>
										</td>
										<td class="bordered" colspan="2">4. Общая таможенная стоимость
											<br/>
											<xsl:value-of select="dca:TotalCustCost"/>
										</td>
									</tr>
									<tr>
										<td colspan="3" class="bordered" width="100%">
											<table>
												<tbody>
													<tr>
														<td colspan="3">5. Предоставленное обеспечение исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин</td>
													</tr>
													<tr>
														<td style="width:33%; border-right:1px solid black;" valign="top">
																5.1. Код документа
																<br/>
															<xsl:value-of select="dca:Guarantee/dca:DocCode"/>
														</td>
														<td style="width:33%; border-right:1px solid black;" valign="top">
																5.2. Реквизиты документа
																<br/>
															<xsl:if test="dca:Guarantee/dca:GuaranteeModeCodeType">(<xsl:value-of select="dca:Guarantee/dca:GuaranteeModeCodeType"/>)&#160;</xsl:if>
															<xsl:apply-templates mode="Decl" select="dca:Guarantee/dca:GuaranteeDocNumber/dca:DeclNumber"/>
															<xsl:apply-templates select="dca:Guarantee/dca:GuaranteeDocNumber/dca:DocNumber"/>
														</td>
														<td style="width:34%;" valign="top">
																5.3. Сумма обеспечения
																<br/>
															<xsl:value-of select="dca:Guarantee/dca:GuaranteeAmount"/>
															<xsl:if test="dca:Guarantee/dca:GuaranteeCurrencyCode">&#160;(<xsl:value-of select="dca:Guarantee/dca:GuaranteeCurrencyCode"/>)</xsl:if>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<xsl:for-each select="dca:Goods">
										<tr valign="top">
											<td class="bordered" rowspan="4">
												<table width="100%">
													<tbody>
														<tr valign="top">
															<td style="width:25%;border-right:1px solid black;border-bottom:1px solid black;margin:0;" colspan="2">
																6. Товар №
															</td>
															<td rowspan="2">
																7. Описание товара
															</td>
														</tr>
														<tr>
															<td style="width:150px;border-right:1px solid black;border-bottom:1px solid black;margin:0;">
																<xsl:value-of select="dca:GoodsNumeric"/>
															</td>
															<td style="width:150px;border-right:1px solid black;border-bottom:1px solid black;margin:0;">
																<xsl:value-of select="dca:GoodFeatures"/>
															</td>
														</tr>
													</tbody>
												</table>1. <xsl:apply-templates select="dca:GoodsDescription"/>
												<xsl:for-each select="dca:GoodsGroupDescription/catESAD_cu:GoodsGroupInformation">
													<br/>
													<xsl:apply-templates select="." mode="GoodsDetails"/>
												</xsl:for-each>
												<xsl:if test="dca:SupplementaryGoodsQuantity1">
													<br>2. </br>
													<xsl:for-each select="dca:SupplementaryGoodsQuantity1">
														<xsl:apply-templates mode="quantity" select="."/>
														<xsl:if test="position()!=last()">/</xsl:if>
													</xsl:for-each>
												</xsl:if>
												<xsl:if test="dca:OilField">
													<br>3. </br>
													<xsl:value-of select="dca:OilField"/>
												</xsl:if>
												<br/>
												<xsl:if test="dca:Excise">4.<xsl:for-each select="dca:Excise">
														<xsl:apply-templates select="catESAD_cu:ExciseSerieses"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:for-each select="catESAD_cu:ExciseList">
															<xsl:for-each select="catESAD_cu:ExciseNumber">
																<xsl:apply-templates select="."/>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:for-each select="catESAD_cu:ExciseRange">
															<xsl:apply-templates select="catESAD_cu:ExciseFirstNumber"/>
															<xsl:text disable-output-escaping="yes">-</xsl:text>
															<xsl:apply-templates select="catESAD_cu:ExciseLastNumber"/>
															<xsl:if test="position()!=last()">
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															</xsl:if>
														</xsl:for-each>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="catESAD_cu:ExciseQuantity"/>
														<span class="graph">;</span>
													</xsl:for-each>
												</xsl:if>
												<xsl:if test="dca:CIMIdDetails">5.<xsl:for-each select="dca:CIMIdDetails">
														<xsl:apply-templates select="catESAD_cu:CIMQuantity"/>
														<xsl:text>:</xsl:text>
														<xsl:for-each select="catESAD_cu:CIMList">
															<xsl:apply-templates select="catESAD_cu:CIMID"/>
															<xsl:if test="position()!=last()">
																<xsl:text>,</xsl:text>
															</xsl:if>
														</xsl:for-each>
														<xsl:if test="catESAD_cu:CIMList and catESAD_cu:CIMRange">
															<xsl:text>,</xsl:text>
														</xsl:if>
														<xsl:for-each select="catESAD_cu:CIMRange">
															<xsl:apply-templates select="catESAD_cu:FirstCIMID"/>
															<xsl:text>-</xsl:text>
															<xsl:apply-templates select="catESAD_cu:LastCIMID"/>
															<xsl:if test="position()!=last()">,</xsl:if>
														</xsl:for-each>
													</xsl:for-each>
												</xsl:if>
												<br/>
												<xsl:for-each select="catESAD_cu:CIMRange">
													<xsl:value-of select="catESAD_cu:FirstCIMID"/>
													<xsl:text> - </xsl:text>
													<xsl:value-of select="catESAD_cu:LastCIMID"/>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
											</td>
											<td class="bordered">8. Код товара
												<br/>
												<xsl:value-of select="dca:GoodsTNVEDCode"/>
											</td>
											<td class="bordered">9. Вес брутто(кг)
												<br/>
												<xsl:value-of select="dca:GrossWeightQuantity"/>
											</td>
										</tr>
										<tr>
											<td valign="top" class="bordered">
												10. Код страны происхождения
												<br/>
												<table>
													<tbody>
														<tr>
															<td style="width:10%;border-right:1px solid black;">a</td>
															<td style="width:50%;border-right:1px solid black;">
																<xsl:value-of select="dca:OriginCountryCode"/>
															</td>
															<td style="width:10%;border-right:1px solid black;">b</td>
															<td style="width:50%;"/>
														</tr>
													</tbody>
												</table>
											</td>
											<td valign="top" class="bordered">
												11. Вес нетто (кг)
												<br/>
												<xsl:value-of select="dca:NetWeightQuantity"/>
												<br/>
												<xsl:value-of select="dca:NetWeightQuantity2"/>
											</td>
										</tr>
										<tr>
											<td valign="top" class="bordered" colspan="2">12. Предшествующий документ
												<br/>
												<xsl:for-each select="dca:PrecedingDocuments">
													<br/>
													<xsl:value-of select="dca:LineNumber"/>
													<xsl:text> </xsl:text>
													<!--xsl:choose>
														<xsl:when test="dca:PrecedingDocumentModeCode='09035'">для декларации на товары</xsl:when>
														<xsl:when test="dca:PrecedingDocumentModeCode='09013'">для транзитной декларации</xsl:when>
														<xsl:when test="dca:PrecedingDocumentModeCode='09036'">для декларации на транспортное средство</xsl:when>
														<xsl:when test="dca:PrecedingDocumentModeCode='09037'">для заявления о выпуске товаров до подачи декларации на товары</xsl:when>
														<xsl:when test="dca:PrecedingDocumentModeCode='09999'">для иного документа</xsl:when>
													</xsl:choose-->
													<xsl:text>/</xsl:text>
													<xsl:value-of select="dca:PrecedingDocumentModeCode"/>
													<xsl:text>/</xsl:text>
													<xsl:apply-templates mode="Decl" select="dca:PrecedingDocumentNumber/dca:DeclNumber"/>
													<xsl:apply-templates select="dca:PrecedingDocumentNumber/dca:DocNumber"/>
													<xsl:text>/</xsl:text>
													<xsl:value-of select="dca:PrecedingDocumentGoodsNumeric"/>
													<xsl:if test="position()!=last()">
														<br/>
													</xsl:if>
												</xsl:for-each>
											</td>
										</tr>
										<tr valign="top">
											<td class="bordered">13. Дополнительные единицы измерения
												<br/>
												<xsl:for-each select="dca:SupplementaryGoodsQuantity">
													<xsl:apply-templates mode="quantity1" select="."/>
													<xsl:if test="position()!=last()">; </xsl:if>
												</xsl:for-each>
											</td>
											<td class="bordered">
												14. Таможенная стоимость
												<br/>
												<xsl:value-of select="dca:CustomsCost"/>
											</td>
										</tr>
										<tr>
											<td class="bordered" colspan="3">
												15. Дополнительная информация, представленные документы
												<br/>
												<xsl:for-each select="dca:PresentedDocuments">
													<br/>
													<xsl:apply-templates mode="document1" select="."/>
													<xsl:if test="position()!=last()">; </xsl:if>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<br/>
						</td>
					</tr>
				</xsl:for-each>
				<tr>
					<td class="indent">3.4. В отношении товаров для личного пользования<sup>1</sup>:&#160;</td>
				</tr>
				<xsl:for-each select="dca:GoodsInfoLP">
					<tr>
						<td>
							<table width="100%">
								<tbody>
									<tr>
										<td class="bordered" colspan="2" style="border-bottom:0;">1. Сведения о документе, в соответствии с которым товары находятся на таможенной территории ЕАЭС</td>
									</tr>
									<tr valign="top">
										<td class="bordered" style="border-top:0; width:55%;">номер
											<br/>
											<xsl:value-of select="dca:DocBase/adt_cat:Number"/>
										</td>
										<td class="bordered" style="border-top:0; width:45%;">дата
											<br/>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="dca:DocBase/adt_cat:Date"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered">2. Плательщик
											<br/>
											<xsl:apply-templates mode="PayerFL" select="dca:PayerDetails"/>
										</td>
										<td class="bordered">3. Лица, несущие солидарную обязанность
											<br/>
											<xsl:for-each select="dca:JointlyLiablePersonDetails">
												<xsl:apply-templates mode="organization" select="."/>
												<xsl:if test="position()!=last()">;<br/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered">
											<table width="100%">
												<tbody>
													<tr>
														<td style="border-right:1px solid black;">4. Курс евро
															<br/>
															<xsl:value-of select="dca:CurrencyEuroRate"/>
														</td>
														<td>5. Курс доллара
															<br/>
															<xsl:value-of select="dca:CurrencyDollarRate"/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
										<td class="bordered">
											<table width="100%">
												<tbody>
													<tr>
														<td colspan="3">6. Общая стоимость</td>
													</tr>
													<tr>
														<td style="border-right:1px solid black;">
															6.1. в рублях
															<br/>
															<xsl:value-of select="dca:TotalCostRUB"/>
														</td>
														<td style="border-right:1px solid black;">
															6.2. в долларах
															<br/>
															<xsl:value-of select="dca:TotalCostUSD"/>
														</td>
														<td>
															6.3. в евро
															<br/>
															<xsl:value-of select="dca:TotalCostEUR"/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<xsl:for-each select="dca:Goods">
										<tr valign="top">
											<td rowspan="3" class="bordered">
												<table width="100%">
													<tbody>
														<tr valign="top">
															<td style="border-right:1px solid black; border-bottom:1px solid black;width:25%;">
																7. Товар №
																<br/>
																<xsl:value-of select="dca:GoodsNumeric"/>
															</td>
															<td>8. Описание товара</td>
														</tr>
													</tbody>
												</table>
												<xsl:apply-templates select="dca:GoodsDescription"/>
											</td>
											<td class="bordered">
												9. Код ТН ВЭД ЕАЭС 
												<br/>
												<xsl:value-of select="dca:GoodsTNVEDCode"/>
											</td>
										</tr>
										<tr>
											<td class="bordered">
												<table width="100%">
													<tbody>
														<tr>
															<td style="border-right: 1px solid black;">
																10. Количество товара
																<br/>
																<xsl:apply-templates mode="quantity" select="dca:GoodsQuantity"/>
															</td>
															<td>
																11. Вес товара (кг)
																<br/>
																<xsl:value-of select="dca:WeightQuantity"/>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<td class="bordered">
												<table width="100%">
													<tbody>
														<tr>
															<td colspan="3">12. Стоимость товара</td>
														</tr>
														<tr>
															<td style="border-right:1px solid black;">
																12.1. в рублях
																<br/>
																<xsl:value-of select="dca:Cost/dca:Cost"/>
															</td>
															<td style="border-right:1px solid black;">
																12.2. в долларах
																<br/>
																<xsl:value-of select="dca:Cost/dca:DollarCost"/>
															</td>
															<td>
																12.3. в евро
																<br/>
																<xsl:value-of select="dca:Cost/dca:EuroCost"/>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<td class="bordered" colspan="2">
												13. Дополнительная информация, представленные документы
												<br/>
												<xsl:for-each select="dca:PresentedDocuments">
													<br/>
													<xsl:apply-templates mode="document_add" select="."/>
													<xsl:if test="position()!=last()">; </xsl:if>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<tr>
												<td colspan="3">
													<br/>
												</td>
											</tr>
											<tr>
												<td width="30%" class="value"/>
												<td width="30%" class="normal"/>
												<td class="normal" width="40%"/>
											</tr>
											<tr>
												<td class="descr" colspan="2">
													<sup>1</sup>
													<span>За исключением транспортных средств для личного пользования.</span>
												</td>
												<td>
													<br/>
													<br/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<br/>
						</td>
					</tr>
				</xsl:for-each>
				<tr>
					<td class="indent">3.5. В отношении транспортных средств для личного пользования (далее – ТСЛП):</td>
				</tr>
				<tr>
					<td>
						<xsl:for-each select="dca:GoodsInfoTSLP">
							<table width="100%">
								<tbody>
									<tr>
										<td class="bordered" colspan="2" style="border-bottom:0;">1. Сведения о документе, в соответствии с которым ТСЛП находятся на таможенной территории ЕАЭС</td>
									</tr>
									<tr valign="top">
										<td class="bordered" style="border-top:0;">номер
											<br/>
											<xsl:value-of select="dca:Statement/adt_cat:Number"/>
										</td>
										<td class="bordered" style="border-top:0;">дата
											<br/>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="dca:Statement/adt_cat:Date"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered">2. Сведения о лице, на которого возложена обязанность по уплате таможенных пошлин, налогов
											<br/>
											<xsl:apply-templates mode="PayerFL" select="dca:PayerDetails"/>
										</td>
										<td class="bordered">3. Лица, несущие солидарную обязанность
											<br/>
											<xsl:for-each select="dca:JointlyLiablePersonDetails">
												<xsl:apply-templates mode="organization" select="."/>
												<xsl:if test="position()!=last()">;<br/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered">
											<table width="100%">
												<tbody>
													<tr>
														<td style="border-right:1px solid black;">4. Курс евро
															<br/>
															<xsl:value-of select="dca:CurrencyEuroRate"/>
														</td>
														<td>5. Курс доллара
															<br/>
															<xsl:value-of select="dca:CurrencyDollarRate"/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
										<td class="bordered">
											<table width="100%">
												<tbody>
													<tr>
														<td colspan="3">6. Общая стоимость</td>
													</tr>
													<tr>
														<td style="border-right:1px solid black;">
															6.1. в рублях
															<br/>
															<xsl:value-of select="dca:TotalCostRUB"/>
														</td>
														<td style="border-right:1px solid black;">
															6.2. в долларах
															<br/>
															<xsl:value-of select="dca:TotalCostUSD"/>
														</td>
														<td>
															6.3. в евро
															<br/>
															<xsl:value-of select="dca:TotalCostEUR"/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="bordered" colspan="2" width="100%">
											<table>
												<tbody>
													<tr>
														<td colspan="3">7. Предоставленное обеспечение исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин</td>
													</tr>
													<tr>
														<td style="width:33%; border-right:1px solid black;" valign="top">
																7.1. Код документа
																<br/>
															<xsl:value-of select="dca:Guarantee/dca:DocCode"/>
														</td>
														<td style="width:33%; border-right:1px solid black;" valign="top">
																7.2. Реквизиты документа
																<br/>
															<xsl:value-of select="dca:Guarantee/dca:GuaranteeDocNumber"/>
														</td>
														<td style="width:34%;" valign="top">
																7.3. Сумма обеспечения
																<br/>
															<xsl:value-of select="dca:Guarantee/dca:GuaranteeAmount"/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<xsl:for-each select="dca:Goods">
										<tr>
											<td colspan="2" class="bordered">
												8. ТСЛП № <xsl:value-of select="dca:GoodsNumeric"/>
											</td>
										</tr>
										<tr>
											<td class="bordered">
												9. Марка, модель ТСЛП
												<br/>
												<xsl:value-of select="dca:MarkaModel"/>
											</td>
											<td class="bordered">
												10. Регистрационный номер ТСЛП
												<br/>
												<xsl:value-of select="dca:TransportRegNum"/>
											</td>
										</tr>
										<tr>
											<td class="bordered">
												11. VIN (№ кузова) ТСЛП
												<br/>
												<xsl:value-of select="dca:VIN"/>
											</td>
											<td class="bordered">
												12. Код ТН ВЭД ЕАЭС
												<br/>
												<xsl:value-of select="dca:GoodsTNVEDCode"/>
											</td>
										</tr>
										<tr>
											<td class="bordered">
												13. Дата выпуска ТСЛП
												<br/>
												<xsl:call-template name="russian_date">
													<xsl:with-param select="dca:Date" name="dateIn"/>
												</xsl:call-template>
											</td>
											<td class="bordered">
												14. Объем, мощность двигателя
												<table width="100%">
													<tbody>
														<tr>
															<td style="border-right:1px solid black;">
																14.1. Мощность двигателя
																<br/>
																<xsl:value-of select="dca:EnginePowerHpQuanity"/>&#160;л.с.
																</td>
															<td>
																14.2.Объем двигателя
																<br/>
																<xsl:value-of select="dca:EngineVolumeQuanity"/>&#160;куб. см
																</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<td class="bordered" colspan="2">
												15. Стоимость ТСЛП
												<table width="100%">
													<tbody>
														<tr>
															<td style="border-right:1px solid black;">
																15.1. в рублях
																<br/>
																<xsl:value-of select="dca:Cost/dca:Cost"/>
															</td>
															<td style="border-right:1px solid black;">
																15.2. в долларах
																<br/>
																<xsl:value-of select="dca:Cost/dca:DollarCost"/>
															</td>
															<td>
																15.3. в евро
																<br/>
																<xsl:value-of select="dca:Cost/dca:EuroCost"/>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<td class="bordered" colspan="2">
												16. Дополнительная информация, представленные документы
												<br/>
												<xsl:for-each select="dca:PresentedDocuments">
													<br/>
													<xsl:apply-templates mode="document_add" select="."/>
													<xsl:if test="position()!=last()">; </xsl:if>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:for-each>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="indent">3.6. В отношении товаров, которые задержаны в соответствии со статьей 379 Таможенного кодекса Евразийского экономического союза, сроки хранения которых, предусмотренные статьей 380 Таможенного кодекса Евразийского экономического союза, истекли:</td>
				</tr>
				<xsl:for-each select="dca:SuspendedGoodsInfo">
					<tr>
						<td>
							<table width="100%">
								<tbody>
									<tr>
										<td class="bordered" colspan="3" style="border-bottom:0;">1. Декларант / собственник товаров / лицо, во владении которого товары находились на момент задержания<br/>
											<xsl:apply-templates mode="organization" select="dca:Declarant"/>
										</td>
									</tr>
									<xsl:for-each select="dca:Goods">
										<tr valign="top">
											<td rowspan="4" width="50%" class="bordered">
												<table width="100%">
													<tbody>
														<tr valign="top">
															<td style="border-right:1px solid black; border-bottom:1px solid black;width:25%;">
																2. Товар №
																<br/>
																<xsl:value-of select="dca:GoodsNumeric"/>
															</td>
															<td>3. Описание товара</td>
														</tr>
													</tbody>
												</table>
												<xsl:apply-templates select="dca:GoodsDescription"/>
												<xsl:for-each select="dca:GoodsGroupDescription/catESAD_cu:GoodsGroupInformation">
													<br/>
													<xsl:apply-templates select="." mode="GoodsDetails"/>
												</xsl:for-each>
												<xsl:if test="dca:SupplementaryGoodsQuantity1">
													<br>2. </br>
													<xsl:for-each select="dca:SupplementaryGoodsQuantity1">
														<xsl:apply-templates mode="quantity" select="."/>
														<xsl:if test="position()!=last()">/</xsl:if>
													</xsl:for-each>
												</xsl:if>
												<xsl:if test="dca:OilField">
													<br>3. </br>
													<xsl:value-of select="dca:OilField"/>
												</xsl:if>
												<br/>
												<xsl:if test="dca:Excise">4.<xsl:for-each select="dca:Excise">
														<xsl:apply-templates select="catESAD_cu:ExciseSerieses"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:for-each select="catESAD_cu:ExciseList">
															<xsl:for-each select="catESAD_cu:ExciseNumber">
																<xsl:apply-templates select="."/>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															</xsl:for-each>
														</xsl:for-each>
														<xsl:for-each select="catESAD_cu:ExciseRange">
															<xsl:apply-templates select="catESAD_cu:ExciseFirstNumber"/>
															<xsl:text disable-output-escaping="yes">-</xsl:text>
															<xsl:apply-templates select="catESAD_cu:ExciseLastNumber"/>
															<xsl:if test="position()!=last()">
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															</xsl:if>
														</xsl:for-each>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:apply-templates select="catESAD_cu:ExciseQuantity"/>
														<span class="graph">;</span>
													</xsl:for-each>
												</xsl:if>
												<xsl:if test="dca:CIMIdDetails">5.<xsl:for-each select="dca:CIMIdDetails">
														<xsl:apply-templates select="catESAD_cu:CIMQuantity"/>
														<xsl:text>:</xsl:text>
														<xsl:for-each select="catESAD_cu:CIMList">
															<xsl:apply-templates select="catESAD_cu:CIMID"/>
															<xsl:if test="position()!=last()">
																<xsl:text>,</xsl:text>
															</xsl:if>
														</xsl:for-each>
														<xsl:if test="catESAD_cu:CIMList and catESAD_cu:CIMRange">
															<xsl:text>,</xsl:text>
														</xsl:if>
														<xsl:for-each select="catESAD_cu:CIMRange">
															<xsl:apply-templates select="catESAD_cu:FirstCIMID"/>
															<xsl:text>-</xsl:text>
															<xsl:apply-templates select="catESAD_cu:LastCIMID"/>
															<xsl:if test="position()!=last()">,</xsl:if>
														</xsl:for-each>
													</xsl:for-each>
												</xsl:if>
												<br/>
												<xsl:for-each select="catESAD_cu:CIMRange">
													<xsl:value-of select="catESAD_cu:FirstCIMID"/>
													<xsl:text> - </xsl:text>
													<xsl:value-of select="catESAD_cu:LastCIMID"/>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
											</td>
											<td width="25%" class="bordered">
												4. Код товара
												<br/>
												<xsl:value-of select="dca:GoodsTNVEDCode"/>
											</td>
											<td width="25%" class="bordered">
												5. База для исчисления
												<br/>
												<xsl:value-of select="dca:BasisCalculation"/>
											</td>
										</tr>
										<tr>
											<td style="border-right: 1px solid black;" valign="top">6. Страна происхождения<br/>
												<xsl:value-of select="dca:OriginCountryName"/>
											</td>
											<td class="bordered" valign="top">
												7. Код страны происхождения
												<br/>
												<table>
													<tbody>
														<tr>
															<td style="width:10%;border-right:1px solid black;">a</td>
															<td style="width:50%;border-right:1px solid black;">
																<xsl:value-of select="dca:OriginCountryCode"/>
															</td>
															<td style="width:10%;border-right:1px solid black;">b</td>
															<td style="width:50%;"/>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<td class="bordered" valign="top">8. Вес брутто(кг)
												<br/>
												<xsl:value-of select="dca:GrossWeightQuantity"/>
											</td>
											<td class="bordered" valign="top">
												9. Вес нетто (кг)
												<br/>
												<xsl:value-of select="dca:NetWeightQuantity"/>
												<br/>
												<xsl:value-of select="dca:NetWeightQuantity2"/>
											</td>
										</tr>
										<tr>
											<td class="bordered" valign="top">10. Дополнительные единицы измерения
												<br/>
												<xsl:for-each select="dca:SupplementaryGoodsQuantity">
													<xsl:apply-templates mode="quantity1" select="."/>
													<xsl:if test="position()!=last()">; </xsl:if>
												</xsl:for-each>
											</td>
											<td class="bordered" valign="top">11. Предшествующий документ
												<br/>
												<xsl:for-each select="dca:PrecedingDocuments">
													<xsl:value-of select="dca:LineNumber"/>
													<xsl:text> </xsl:text>
													<!--xsl:choose>
														<xsl:when test="dca:PrecedingDocumentModeCode='09035'">для декларации на товары</xsl:when>
														<xsl:when test="dca:PrecedingDocumentModeCode='09013'">для транзитной декларации</xsl:when>
														<xsl:when test="dca:PrecedingDocumentModeCode='09036'">для декларации на транспортное средство</xsl:when>
														<xsl:when test="dca:PrecedingDocumentModeCode='09037'">для заявления о выпуске товаров до подачи декларации на товары</xsl:when>
														<xsl:when test="dca:PrecedingDocumentModeCode='09999'">для иного документа</xsl:when>
													</xsl:choose-->
													<xsl:text>/</xsl:text>
													<xsl:value-of select="dca:PrecedingDocumentModeCode"/>
													<xsl:text>/</xsl:text>
													<xsl:apply-templates mode="Decl" select="dca:PrecedingDocumentNumber/dca:DeclNumber"/>
													<xsl:apply-templates select="dca:PrecedingDocumentNumber/dca:DocNumber"/>
													<xsl:text>/</xsl:text>
													<xsl:value-of select="dca:PrecedingDocumentGoodsNumeric"/>
													<xsl:if test="position()!=last()">
														<br/>
													</xsl:if>
												</xsl:for-each>
											</td>
										</tr>
										<tr>
											<td class="bordered" colspan="3">
												12. Дополнительная информация, представленные документы
												<br/>
												<xsl:for-each select="dca:PresentedDocuments">
													<br/>
													<xsl:apply-templates mode="document_add" select="."/>
													<xsl:if test="position()!=last()">; </xsl:if>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<br/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		<br/>
		<table width="100%">
			<tbody>
				<tr valign="top" align="center">
					<td width="35%" valign="bottom" class="value">
						<xsl:apply-templates mode="PersonPost" select="dca:CustomsIssuedDecision"/>
					</td>
					<td width="5%"/>
					<td width="20%" class="value"/>
					<td width="5%"/>
					<td width="35%" valign="bottom" class="value">
						<xsl:apply-templates mode="PersonName" select="dca:CustomsIssuedDecision"/>
					</td>
				</tr>
				<tr>
					<td valign="top" class="descr">(должность лица, принявшего решение)</td>
					<td/>
					<td valign="top" class="descr">(подпись)</td>
					<td/>
					<td valign="top" class="descr">(фамилия, имя, отчество (при наличии)</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<table>
			<tbody>
				<tr>
					<td width="42%">
						<xsl:text>4. Второй экземпляр решения с</xsl:text>
					</td>
					<td width="5%" class="value" align="center">
						<xsl:value-of select="dca:SecondExempReceived/adt_cat:AppendixNumber"/>
					</td>
					<td width="53%" align="left" valign="top">
						<xsl:text>&#160;&#160;приложениями на&#160;</xsl:text>
						<span class="value">
							<xsl:text>&#160;</xsl:text>
							<xsl:value-of select="dca:SecondExempReceived/adt_cat:SheetsNumber"/>
							<xsl:text>&#160;</xsl:text>
						</span>
						<xsl:text>&#160;листах получил:&#160;</xsl:text>
					</td>
				</tr>
				<tr>
					<td/>
					<td class="descr">(количество приложений)</td>
					<td/>
				</tr>
			</tbody>
		</table>
		<br/>
		<table width="100%">
			<tbody>
				<tr>
					<td align="center" width="50%" class="value">
						<xsl:value-of select="dca:SecondExempReceived/cat_ru:PersonSurname"/>&#160;
										<xsl:value-of select="substring(dca:SecondExempReceived/cat_ru:PersonName,1,1)"/>.
										<xsl:if test="dca:SecondExempReceived/cat_ru:PersonMiddleName">
											&#160;<xsl:value-of select="substring(dca:SecondExempReceived/cat_ru:PersonMiddleName,1,1)"/>.
										</xsl:if>
						<xsl:if test="dca:SecondExempReceived/cat_ru:PersonPost">
											&#160;<xsl:value-of select="dca:SecondExempReceived/cat_ru:PersonPost"/>&#160;</xsl:if>
						<br>
							<xsl:if test="dca:SecondExempReceived/adt_cat:Passport">
								<xsl:apply-templates select="dca:SecondExempReceived/adt_cat:Passport"/>
							</xsl:if>
						</br>
					</td>
					<td/>
					<td width="25%" class="value"/>
				</tr>
				<tr>
					<td valign="top" class="descr">(должность, фамилия, имя, отчество (при наличии), паспортные данные лица, получившего второй экземпляр решения)</td>
					<td/>
					<td valign="top" class="descr">(подпись)</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<table width="100%">
			<tbody>
				<tr>
					<td colspan="2" align="left">
						<xsl:call-template name="russian_date_month">
							<xsl:with-param name="dateIn" select="dca:SecondExempReceived/adt_cat:Date"/>
						</xsl:call-template>
					</td>
					<td width="60%"/>
				</tr>
				<tr>
					<td width="31%" class="descr">(дата получения второго экземпляра решения)</td>
					<td width="9%"/>
					<td width="60%"/>
				</tr>
			</tbody>
		</table>
		<br/>
		<table width="100%">
			<tbody>
				<tr>
					<td>5. При направлении решения по почте:<br/>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="value">
						<xsl:apply-templates mode="ru_address" select="dca:DirectionByPost/dca:PostAddress"/>
					</td>
				</tr>
				<tr>
					<td class="descr">(адрес направления решения)</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<br/>
		<table width="100%">
			<tbody>
				<tr>
					<td class="value_date" colspan="2">
						<xsl:call-template name="russian_date_month">
							<xsl:with-param name="dateIn" select="dca:DirectionByPost/dca:Date"/>
						</xsl:call-template>
					</td>
					<td width="10%"/>
					<td width="50%" align="center" class="value">
						<xsl:value-of select="dca:DirectionByPost/cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="dca:DirectionByPost/cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="dca:DirectionByPost/cat_ru:PersonMiddleName"/>
					</td>
				</tr>
				<tr>
					<td width="31%" valign="top" class="descr">(дата направления решения по почте)</td>
					<td width="9%"/>
					<td width="10%"/>
					<td width="50%" class="descr">(фамилия, имя, отчество (при наличии) и подпись должностного лица таможенного органа, направившего решение по почте)</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<br/>
		<table>
			<tbody>
				<tr>
					<td style="text-align: justify">
						<xsl:apply-templates mode="footer" select="."/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="dca:DecisionCustomsAudit" mode="decisionChange">
		<table>
			<tbody>
				<tr>
					<td align="center">
						МИНИСТЕРСТВО ФИНАНСОВ РОССИЙСКОЙ ФЕДЕРАЦИИ<br/>
						(МИНФИН РОССИИ)
						<br/>
						<br/>
						ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА
					</td>
				</tr>
				<tr>
					<td class="value" align="center">
						<xsl:value-of select="dca:CustomsIssuedDecision/cat_ru:OfficeName"/>
						<xsl:if test="dca:CustomsIssuedDecision/cat_ru:Code">
							<xsl:text> (</xsl:text>
						</xsl:if>
						<xsl:value-of select="dca:CustomsIssuedDecision/cat_ru:Code"/>
						<xsl:if test="dca:CustomsIssuedDecision/cat_ru:Code">
							<xsl:text>)</xsl:text>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="descr">(наименование таможенного органа)</td>
				</tr>
				<tr>
					<td align="center">
						<br/>
						РЕШЕНИЕ
						<br/>
						О ВНЕСЕНИИ ИЗМЕНЕНИЙ (ДОПОЛНЕНИЙ)
						<br/>
						в решение по результатам таможенного контроля
						<br/>
						№ <span style="border-bottom:1px solid black; width:50mm;">
							<xsl:value-of select="dca:DecisionNumber/adt_cat:Number"/>
						</span>
					</td>
				</tr>
				<tr>
					<td class="descr">
						(номер)
					</td>
				</tr>
				<tr>
					<td align="center">
						<xsl:call-template name="russian_date_month">
							<xsl:with-param name="dateIn" select="dca:DecisionNumber/adt_cat:Date"/>
						</xsl:call-template> г.
					</td>
				</tr>
				<xsl:if test="dca:DecisionNumber/adt_cat:Date">
					<tr>
						<td class="descr">
							(дата)
						</td>
					</tr>
				</xsl:if>
			</tbody>
		</table>
		<br/>
		<br/>
		<table width="100%">
			<tbody>
				<tr>
					<td>
						1. Вводная часть.
					</td>
				</tr>
				<tr>
					<td>
						1.1. Должностное лицо таможенного органа, принявшее решение:
					</td>
				</tr>
				<tr>
					<td class="value">
						<xsl:apply-templates select="dca:CustomsIssuedDecision/adt_cat:ApproverPerson" mode="ApproverPerson"/>
					</td>
				</tr>
				<tr>
					<td>
						<br/>
					</td>
				</tr>
				<tr>
					<td>
						1.2. Основание (основания) для внесения изменений:
					</td>
				</tr>
				<tr>
					<td style="text-align: justify" class="value">
						<xsl:value-of select="dca:Reason"/>
					</td>
				</tr>
				<tr>
					<td>
						<br/>
					</td>
				</tr>
				<tr>
					<td>
						2. Резолютивная часть.
					</td>
				</tr>
				<tr>
					<td>
						<br/>
					</td>
				</tr>
				<tr>
					<td style="text-align: justify">На основании изложенного, руководствуясь статьей 218 Федерального от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации", РЕШЕНО:</td>
				</tr>
				<tr>
					<td>
						<xsl:text>Внести решение по результатам таможенного контроля от </xsl:text>
						<xsl:call-template name="inlinetable">
							<xsl:with-param name="data">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="dca:PrevDecisionNumber/adt_cat:Date"/>
								</xsl:call-template>
							</xsl:with-param>
							<xsl:with-param name="description" select="'(дата)'"/>
							<xsl:with-param name="width" select="'20%'"/>
							<xsl:with-param name="data_align" select="'center'"/>
						</xsl:call-template>
						<br/>
						<xsl:text> № </xsl:text>
						<xsl:call-template name="inlinetable">
							<xsl:with-param name="data">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="dca:PrevDecisionNumber/adt_cat:Number"/>
								</xsl:call-template>
							</xsl:with-param>
							<xsl:with-param name="description" select="'(номер)'"/>
							<xsl:with-param name="width" select="'20%'"/>
							<xsl:with-param name="data_align" select="'center'"/>
						</xsl:call-template>
						<xsl:text>, принятое </xsl:text>
						<xsl:call-template name="inlinetable">
							<xsl:with-param name="data">
								<xsl:apply-templates mode="ApproverPerson" select="dca:CustomsIssuedDecision/adt_cat:ApproverPerson"/>
							</xsl:with-param>
							<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (при наличии) должностного лица таможенного органа, принявшего изменяемое (дополняемое) решение)'"/>
							<xsl:with-param name="width" select="'100%'"/>
							<xsl:with-param name="data_align" select="'center'"/>
						</xsl:call-template>
						<br>
							<xsl:text> следующие изменения (дополнения):</xsl:text>
						</br>
					</td>
				</tr>
				<tr>
					<td>
						<br/>
					</td>
				</tr>
				<tr>
					<td style="text-align: justify">2.1. Изменения (дополнения), вносимые в решение по результатам таможенного контроля (за исключением изменений (дополнений), вносимых в таблицы, указанные в строках 3.2, 3.3, 3.4, 3.5 решения по результатам таможенного контроля):</td>
				</tr>
				<tr>
					<td>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td class="bordered" width="10%">Номер строки решения по результатам таможенного контроля</td>
									<td class="bordered">Ранее указанные в строке сведения</td>
									<td class="bordered">Измененные (дополненные) сведения</td>
								</tr>
								<xsl:for-each select="dca:ChangeOther">
									<tr valign="top">
										<td class="bordered">
											<xsl:apply-templates select="dca:NumberString"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:PreviousText"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:ChangeText"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</td>
				</tr>
				<tr>
					<td style="text-align: justify">2.2. Изменения (дополнения), вносимые в таблицу, указанную в строке 3.2 решения по результатам таможенного контроля:</td>
				</tr>
				<tr>
					<td>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td class="bordered" width="10%">Номер строки таблицы, указанной в строке 3.2 решения по результатам таможенного контроля</td>
									<td class="bordered">Ранее указанные в строке сведения</td>
									<td class="bordered">Измененные (дополненные) сведения</td>
								</tr>
								<xsl:for-each select="dca:ChangeDecisions">
									<tr valign="top">
										<td class="bordered">
											<xsl:value-of select="dca:ChangeDecisions/dca:NumberString"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:PreviousDecision/dca:Text"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:ChangeDecisions/dca:Text"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</td>
				</tr>
				<tr>
					<td>2.3. Изменения (дополнения), вносимые в таблицу, указанную в строке 3.3 решения по результатам таможенного контроля:</td>
				</tr>
				<tr>
					<td>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td class="bordered" width="10%">Номер товара</td>
									<td class="bordered" width="10%">Номер графы таблицы, указанной в строке 3.3 решения по результатам таможенного контроля</td>
									<td class="bordered">Ранее указанные в строке сведения</td>
									<td class="bordered">Измененные (дополненные) сведения</td>
								</tr>
								<xsl:for-each select="dca:ChangeGoodsInfo">
									<tr valign="top">
										<td class="bordered">
											<xsl:value-of select="dca:GoodsNumeric"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="dca:NumberGrf"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:PreviousText"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:ChangeText"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</td>
				</tr>
				<tr>
					<td>2.4. Изменения (дополнения), вносимые в таблицу, указанную в строке 3.4 решения по результатам таможенного контроля:</td>
				</tr>
				<tr>
					<td>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td class="bordered" width="10%">Номер товара</td>
									<td class="bordered" width="10%">Номер графы таблицы, указанной в строке 3.4 решения по результатам таможенного контроля</td>
									<td class="bordered">Ранее указанные в строке сведения</td>
									<td class="bordered">Измененные (дополненные) сведения</td>
								</tr>
								<xsl:for-each select="dca:ChangeInfoLP">
									<tr valign="top">
										<td class="bordered">
											<xsl:value-of select="dca:GoodsNumeric"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="dca:NumberGrf"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:PreviousText"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:ChangeText"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</td>
				</tr>
				<tr>
					<td>2.5. Изменения (дополнения), вносимые в таблицу, указанную в строке 3.5 решения по результатам таможенного контроля:</td>
				</tr>
				<tr>
					<td>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td class="bordered" width="10%">Номер ТСЛП</td>
									<td class="bordered" width="10%">Номер графы таблицы, указанной в строке 3.5 решения по результатам таможенного контроля</td>
									<td class="bordered">Ранее указанные в строке сведения</td>
									<td class="bordered">Измененные (дополненные) сведения</td>
								</tr>
								<xsl:for-each select="dca:ChangeInfoTSLP">
									<tr valign="top">
										<td class="bordered">
											<xsl:value-of select="dca:GoodsNumeric"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="dca:NumberGrf"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:PreviousText"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:ChangeText"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</td>
				</tr>
				<tr>
					<td>2.6. Изменения (дополнения), вносимые в таблицу, указанную в строке 3.6 решения по результатам таможенного контроля:</td>
				</tr>
				<tr>
					<td>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td class="bordered" width="10%">Номер товара</td>
									<td class="bordered" width="10%">Номер графы таблицы, указанной в строке 3.6 решения по результатам таможенного контроля</td>
									<td class="bordered">Ранее указанные в строке сведения</td>
									<td class="bordered">Измененные (дополненные) сведения</td>
								</tr>
								<xsl:for-each select="dca:ChangeSuspendedGoodsInfo">
									<tr valign="top">
										<td class="bordered">
											<xsl:value-of select="dca:GoodsNumeric"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="dca:NumberGrf"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:PreviousText"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:ChangeText"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</td>
				</tr>
				<tr>
					<td>
						<br/>
					</td>
				</tr>
				<tr>
					<td>
						<table>
							<tbody>
								<tr>
									<td width="42%">
										<xsl:text>3. Второй экземпляр решения с</xsl:text>
									</td>
									<td width="5%" class="value" align="center">
										<xsl:value-of select="dca:SecondExempReceived/adt_cat:AppendixNumber"/>
									</td>
									<td width="53%" align="left" valign="top">
										<xsl:text>&#160;&#160;приложениями на&#160;</xsl:text>
										<span class="value">
											<xsl:text>&#160;</xsl:text>
											<xsl:value-of select="dca:SecondExempReceived/adt_cat:SheetsNumber"/>
											<xsl:text>&#160;</xsl:text>
										</span>
										<xsl:text>&#160;листах получил:&#160;</xsl:text>
									</td>
								</tr>
								<tr>
									<td/>
									<td class="descr">(количество приложений)</td>
									<td/>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<br/>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%">
							<tbody>
								<tr>
									<td align="center" width="50%" class="value">
										<xsl:value-of select="dca:SecondExempReceived/cat_ru:PersonSurname"/>&#160;
										<xsl:value-of select="substring(dca:SecondExempReceived/cat_ru:PersonName,1,1)"/>.
										<xsl:if test="dca:SecondExempReceived/cat_ru:PersonMiddleName">
											&#160;<xsl:value-of select="substring(dca:SecondExempReceived/cat_ru:PersonMiddleName,1,1)"/>.
										</xsl:if>
										<xsl:if test="dca:SecondExempReceived/cat_ru:PersonPost">
											&#160;<xsl:value-of select="dca:SecondExempReceived/cat_ru:PersonPost"/>&#160;</xsl:if>
										<br>
											<xsl:if test="dca:SecondExempReceived/adt_cat:Passport">
												<xsl:apply-templates select="dca:SecondExempReceived/adt_cat:Passport"/>
											</xsl:if>
										</br>
									</td>
									<td/>
									<td width="25%" class="value"/>
								</tr>
								<tr>
									<td valign="top" class="descr">(должность, фамилия, имя, отчество (при наличии), паспортные данные лица, получившего второй экземпляр решения)</td>
									<td/>
									<td valign="top" class="descr">(подпись)</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<br/>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%">
							<tbody>
								<tr>
									<td colspan="2" align="left">
										<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="dca:SecondExempReceived/adt_cat:Date"/>
										</xsl:call-template>
									</td>
									<td width="60%"/>
								</tr>
								<tr>
									<td width="31%" class="descr">(дата получения второго экземпляра решения)</td>
									<td width="9%"/>
									<td width="60%"/>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<br/>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%">
							<tbody>
								<tr>
									<td>4. При направлении решения по почте:<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:apply-templates mode="ru_address" select="dca:DirectionByPost/dca:PostAddress"/>
									</td>
								</tr>
								<tr>
									<td class="descr">(адрес направления решения)</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<br/>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%">
							<tbody>
								<tr>
									<td class="value_date" colspan="2">
										<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="dca:DirectionByPost/dca:Date"/>
										</xsl:call-template>
									</td>
									<td width="10%"/>
									<td width="50%" align="center" class="value">
										<xsl:value-of select="dca:DirectionByPost/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="dca:DirectionByPost/cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="dca:DirectionByPost/cat_ru:PersonMiddleName"/>
									</td>
								</tr>
								<tr>
									<td width="31%" valign="top" class="descr">(дата направления решения по почте)</td>
									<td width="9%"/>
									<td width="10%"/>
									<td width="50%" class="descr">(фамилия, имя, отчество (при наличии) и подпись должностного лица таможенного органа, направившего решение по почте)</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<br/>
					</td>
				</tr>
				<tr>
					<td>
						<table>
							<tbody>
								<tr>
									<td style="text-align: justify">
										<xsl:apply-templates mode="footer" select="."/>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<br/>
	</xsl:template>
	<xsl:template mode="footer" match="*">
		<xsl:choose>
			<xsl:when test="dca:AuditOrganization/RUScat_ru:IdentityCard and not(dca:AuditOrganization/cat_ru:RFOrganizationFeatures/cat_ru:KPP)">
				<xsl:text>Настоящее решение может быть обжаловано физическим лицом -</xsl:text>
				<br/>
				<br/>
				<xsl:call-template name="inlinetable">
					<xsl:with-param name="data">
						<xsl:apply-templates mode="person" select="dca:Appeals/dca:PersonName"/>
					</xsl:with-param>
					<xsl:with-param name="description" select="'(фамилия, имя, отчество (при наличии)'"/>
					<xsl:with-param name="width" select="'85%'"/>
				</xsl:call-template>
				<xsl:text>в течение </xsl:text>
				<xsl:text>3-х месяцев со дня, когда лицу стало известно или должно было стать известно о нарушении его прав, свобод и законных интересов, создании препятствий к их реализации либо незаконном возложении на него какой-либо обязанности, в соответствии со статьей 358 Таможенного кодекса Евразийского экономического союза, главой 51 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" в</xsl:text>
				<br/>
				<xsl:call-template name="inlinetable">
					<xsl:with-param name="data" select="concat(dca:Appeals/dca:CustomsSuperior/cat_ru:OfficeName,' ',dca:Appeals/dca:CustomsSuperior/cat_ru:Code)"/>
					<xsl:with-param name="description" select="'(наименование вышестоящего таможенного органа)'"/>
					<xsl:with-param name="width" select="'45%'"/>
				</xsl:call-template>
				<xsl:text> через </xsl:text>
				<xsl:call-template name="inlinetable">
					<xsl:with-param name="data" select="concat(dca:Appeals/dca:CustomsAppeal/cat_ru:OfficeName,' ',dca:Appeals/dca:CustomsAppeal/cat_ru:Code)"/>
					<xsl:with-param name="description" select="'(наименование таможенного органа, решение, действия (бездействие) которого обжалуются)'"/>
					<xsl:with-param name="width" select="'45%'"/>
				</xsl:call-template>
				<xsl:text>по адресу </xsl:text>
				<xsl:call-template name="inlinetable">
					<xsl:with-param name="data">
						<xsl:apply-templates mode="ru_address" select="dca:Appeals/dca:CustomsSuperior/dca:Address"/>
					</xsl:with-param>
					<xsl:with-param name="description" select="'(адрес таможенного органа)'"/>
					<xsl:with-param name="width" select="'85%'"/>
				</xsl:call-template>
				<xsl:text>либо в соответствии со статьей 218 Кодекса административного судопроизводства Российской Федерации в суд.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>Настоящее решение может быть обжаловано юридическим лицом -</xsl:text>
				<br/>
				<br/>
				<xsl:call-template name="inlinetable">
					<xsl:with-param name="data">
						<xsl:value-of select="dca:Appeals/dca:OrganizationName"/>
					</xsl:with-param>
					<xsl:with-param name="description" select="'(наименование организации)'"/>
					<xsl:with-param name="width" select="'100%'"/>
				</xsl:call-template>
				<br/>
				<br/>
				<xsl:text>в течение 3-х месяцев со дня, когда лицу стало известно или должно было стать известно о нарушении его прав, свобод и законных интересов, создании препятствий к их реализации либо незаконном возложении на него какой-либо обязанности, в соответствии со статьей 358 Таможенного кодекса Евразийского экономического союза, главой 51 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" в</xsl:text>
				<xsl:call-template name="inlinetable">
					<xsl:with-param name="data" select="concat(dca:Appeals/dca:CustomsSuperior/cat_ru:OfficeName,' ',dca:Appeals/dca:CustomsSuperior/cat_ru:Code)"/>
					<xsl:with-param name="description" select="'(наименование вышестоящего таможенного органа)'"/>
					<xsl:with-param name="width" select="'45%'"/>
				</xsl:call-template>
				<xsl:text> через </xsl:text>
				<xsl:call-template name="inlinetable">
					<xsl:with-param name="data" select="concat(dca:Appeals/dca:CustomsAppeal/cat_ru:OfficeName,' ',dca:Appeals/dca:CustomsAppeal/cat_ru:Code)"/>
					<xsl:with-param name="description" select="'(наименование таможенного органа, решение, действия (бездействие) которого обжалуются)'"/>
					<xsl:with-param name="width" select="'45%'"/>
				</xsl:call-template>
				<xsl:text>по адресу </xsl:text>
				<xsl:call-template name="inlinetable">
					<xsl:with-param name="data">
						<xsl:apply-templates mode="ru_address" select="dca:Appeals/dca:CustomsSuperior/dca:Address"/>
					</xsl:with-param>
					<xsl:with-param name="description" select="'(адрес таможенного органа)'"/>
					<xsl:with-param name="width" select="'85%'"/>
				</xsl:call-template>
				<br/>
				<br/>
				<xsl:text>либо в соответствии о статьей 198 Арбитражного процессуального кодекса Российской Федерации, статьей 218 Кодекса административного судопроизводства Российской Федерации в суд.</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="adt_cat:Passport">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.),'Date')">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="quantity" match="*">
		<xsl:value-of select="*[local-name() = 'GoodsQuantity']"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="*[local-name() = 'MeasureUnitQualifierName']"/>
		<xsl:text> </xsl:text>
		<xsl:if test="*[local-name() = 'MeasureUnitQualifierCode']">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="*[local-name() = 'MeasureUnitQualifierCode']"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="quantity1" match="*">
		<xsl:value-of select="*[local-name() = 'GoodsQuantity']"/>
		<xsl:text> </xsl:text>
		<xsl:if test="*[local-name() = 'MeasureUnitQualifierName']">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="*[local-name() = 'MeasureUnitQualifierName']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'MeasureUnitQualifierCode']">
			<xsl:text>/</xsl:text>
			<xsl:if test="*[local-name() = 'MeasureUnitQualifierCode']">
				<xsl:value-of select="*[local-name() = 'MeasureUnitQualifierCode']"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="dca:AuditDisorders">
		<xsl:apply-templates select="adt_cat:DisorderDescription"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="adt_cat:AKParts"/>
		<xsl:text> </xsl:text>
		<xsl:for-each select="adt_cat:LawArticle">
			<xsl:apply-templates select="." mode="document"/>
			<xsl:if test="position()!=last()">; </xsl:if>
		</xsl:for-each>
		<xsl:text> </xsl:text>
		<xsl:for-each select="adt_cat:AuditPayments">
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
		<xsl:if test="position()!=last()">
			<br/>
			<br/>
		</xsl:if>
	</xsl:template>
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
							<xsl:variable name="xpath_AddressKindCode1">
								<xsl:call-template name="get_xpath">
									<xsl:with-param name="node" select="."/>
								</xsl:call-template>
							</xsl:variable>
							<element xml_node="{$xpath_AddressKindCode1}">
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
	<xsl:template match="adt_cat:AuditPayments">
		<xsl:value-of select="adt_cat:PaymentModeCode"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="adt_cat:PaymentAmount"/>
		<xsl:if test="adt_cat:PaymentCurrencyCode"> (</xsl:if>
		<xsl:value-of select="adt_cat:PaymentCurrencyCode"/>
		<xsl:if test="adt_cat:PaymentCurrencyCode">)</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<span class="normal">, </span>
		<span class="italic">Код ОПФ: </span>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<span class="normal"> (</span>
			<span class="italic"> по справ. </span>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<span class="normal"> УИТН</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal"> (</span>
			<span class="normal">страна </span>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="person" match="*">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<xsl:if test="cat_ru:PersonPost">, </xsl:if>
		<xsl:value-of select="cat_ru:PersonPost"/>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="organization">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:choose>
			<xsl:when test="cat_ru:RFOrganizationFeatures/cat_ru:INN and cat_ru:RFOrganizationFeatures/cat_ru:KPP">
				<xsl:text>ИНН/КПП: </xsl:text>
				<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
			</xsl:when>
			<xsl:when test="cat_ru:RFOrganizationFeatures/cat_ru:INN and not(cat_ru:RFOrganizationFeatures/cat_ru:KPP)">
				<xsl:text>ИНН: </xsl:text>
				<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
			</xsl:when>
			<xsl:when test="not(cat_ru:RFOrganizationFeatures/cat_ru:INN) and cat_ru:RFOrganizationFeatures/cat_ru:KPP">
				<xsl:text>КПП: </xsl:text>
				<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
			<xsl:text> ОГРН/ОГРНИП: </xsl:text>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:text> </xsl:text>
		<xsl:if test="dca:OKPO">
			<span class="normal">, </span>
			<span class="italic">ОКПО</span>
			<span class="normal">: </span>
			<xsl:value-of select="dca:OKPO"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<span class="normal">, </span>
			<span class="italic">Код страны</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<span class="normal">, </span>
			<span class="italic">ОПФ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">,&#160;<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<span class="normal">, </span>
			<span class="italic">УИ ФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">,&#160;<xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:PersonId">,&#160;<xsl:apply-templates select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="details" select="RUScat_ru:CommunicationDetails"/>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text> адрес(а): </xsl:text>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="." mode="ru_address"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="dca:BrokerRegistryDocDetails">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="dca:BrokerRegistryDocDetails/RUDECLcat:RegisterDocumentDetails" mode="RegisterDocumentIdDetails"/>
		</xsl:if>
		<xsl:if test="dca:ActivityType">
			<xsl:text>, вид деятельности: </xsl:text>
			<xsl:for-each select="dca:ActivityType">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="dca:BirthDate">
			<xsl:text>, дата рождения: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="dca:BirthDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="PayerFL">
		<xsl:value-of select="dca:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="dca:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="dca:PersonMiddleName"/>
		<xsl:if test="dca:BirthDay">
			<xsl:text>, дата рождения: </xsl:text>
			<xsl:apply-templates select="dca:BirthDay" mode="russian_date"/>
		</xsl:if>
		<xsl:if test="dca:CounryName">,&#160;<xsl:apply-templates select="dca:CounryName"/>
		</xsl:if>
		<xsl:if test="dca:INN">,&#160; ИНН:<xsl:apply-templates select="dca:INN"/>
		</xsl:if>
		<xsl:if test="dca:IdentityCard">,&#160;<xsl:apply-templates mode="identity" select="dca:IdentityCard"/>
		</xsl:if>
		<xsl:if test="dca:SubjectAddressDetails">
			<xsl:text> адрес(а): </xsl:text>
			<xsl:for-each select="dca:SubjectAddressDetails">
				<xsl:apply-templates select="." mode="ru_address"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="dca:CommunicationDetails">,&#160;<xsl:apply-templates mode="details" select="dca:CommunicationDetails"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="RegisterDocumentIdDetails" match="*">св-во о включ.лица в реестр: <xsl:if test="RUScat_ru:CountryA2Code">страна: <xsl:value-of select="RUScat_ru:CountryA2Code"/>, </xsl:if>рег №: <xsl:value-of select="RUScat_ru:RegistrationNumberId"/>
		<xsl:if test="RUScat_ru:ReregistrationCode">, признак перерегистрации: <xsl:value-of select="RUScat_ru:ReregistrationCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AEORegistryKindCode">, код типа св-ва УЭО: <xsl:value-of select="RUScat_ru:AEORegistryKindCode"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="Decl">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="gtd_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template match="*" mode="TPORegNum">
		<xsl:apply-templates select="dca:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="dca:RegistrationDate" mode="gtd_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="dca:DocNumber"/>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:apply-templates select="cat_ru:KGINN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:apply-templates select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:apply-templates select="cat_ru:UNN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text>НЗОУ: </xsl:text>
			<xsl:apply-templates select="cat_ru:SocialServiceNumber"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text>Номер справки об НЗОУ: </xsl:text>
			<xsl:apply-templates select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:apply-templates select="cat_ru:UNP"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text>Идентификационный номер физ.лица: </xsl:text>
			<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:apply-templates select="cat_ru:OGRN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text>ИНН: </xsl:text>
			<xsl:apply-templates select="cat_ru:INN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text>КПП: </xsl:text>
			<xsl:apply-templates select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:apply-templates select="cat_ru:BIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text>ИИН: </xsl:text>
			<xsl:apply-templates select="cat_ru:IIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text>ИТН: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="catESAD_cu:Dimensions|catESAD_cu:AllowanceDetails|catESAD_cu:DeviationDetails">
		<xsl:apply-templates select="catESAD_cu:LengthMeasure/catESAD_cu:MeasuredAmount"/>&#160;<xsl:apply-templates select="catESAD_cu:LengthMeasure/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:apply-templates select="catESAD_cu:LengthMeasure/catESAD_cu:MeasureUnitQualifierCode"/>)<xsl:if test="catESAD_cu:WidthMeasure">
			<xsl:if test="catESAD_cu:LengthMeasure">
				<xsl:text> x </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="catESAD_cu:WidthMeasure/catESAD_cu:MeasuredAmount"/>&#160;<xsl:apply-templates select="catESAD_cu:WidthMeasure/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:apply-templates select="catESAD_cu:WidthMeasure/catESAD_cu:MeasureUnitQualifierCode"/>)</xsl:if>
		<xsl:if test="catESAD_cu:HeightMeasure">
			<xsl:if test="catESAD_cu:LengthMeasure or catESAD_cu:WidthMeasure">
				<xsl:text> x </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="catESAD_cu:HeightMeasure/catESAD_cu:MeasuredAmount"/>&#160;<xsl:apply-templates select="catESAD_cu:HeightMeasure/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:apply-templates select="catESAD_cu:HeightMeasure/catESAD_cu:MeasureUnitQualifierCode"/>)</xsl:if>
	</xsl:template>
	<xsl:template mode="GoodsDetails" match="*">
		<xsl:if test="catESAD_cu:InfoDescription">
			<xsl:text> Наименование артикула </xsl:text>
			<xsl:apply-templates select="catESAD_cu:InfoDescription"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:Manufacturer">
			<xsl:text> Производитель: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:Manufacturer"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:TradeMark">
			<xsl:text> Тов.знак: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:TradeMark"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsMark">
			<xsl:text> Торг. знак, марка: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsMark"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsModel">
			<xsl:text> Модель: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsModel"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsMarking">
			<xsl:text> Артикул:</xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsMarking"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsStandard">
			<xsl:text> Стандарт: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsStandard"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsSort">
			<xsl:text> Сорт: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsSort"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:WoodDescriptionDetails">
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodSortiment">
				<xsl:text> Наим.сортимента: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodSortiment"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodKind">
				<xsl:text> Порода древесины: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodKind"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ProductSortName">
				<xsl:text> Наименование сорта:</xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ProductSortName"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:AllowanceDetails">
				<xsl:text> Припуск по длине, ширине, высоте: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:AllowanceDetails"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DeviationDetails">
				<xsl:text> Отклонения по длине, ширине, высоте: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DeviationDetails"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails">
				<xsl:text> Диапазон диаметров: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails/catESAD_cu:MinRangeMeasure" mode="SupplementaryQuantity"/>
				<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails/catESAD_cu:MaxRangeMeasure"> - <xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails/catESAD_cu:MaxRangeMeasure" mode="SupplementaryQuantity"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ContractVolumeMeasure">
				<xsl:text> Номинальный объем товара: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ContractVolumeMeasure" mode="SupplementaryQuantity"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:FactVolumeMeasure">
				<xsl:text> Фактический объем товара: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:FactVolumeMeasure" mode="SupplementaryQuantity"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="catESAD_cu:Dimensions">
			<xsl:text> Размеры: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:Dimensions"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:DateIssue">
			<xsl:text> Дата выпуска: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:DateIssue" mode="russian_date"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:SerialNumber">
			<xsl:text> Серийный номер: </xsl:text>
			<xsl:for-each select="catESAD_cu:SerialNumber">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsGroupQuantity">
			<xsl:text> Кол-во </xsl:text>
			<xsl:for-each select="catESAD_cu:GoodsGroupQuantity">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:apply-templates select="catESAD_cu:GoodsQuantity"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName"/>
				<xsl:if test="catESAD_cu:MeasureUnitQualifierCode">
					<xsl:text> (</xsl:text>
					<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierCode"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="details" match="*">
		<xsl:if test="cat_ru:Phone">
			<xsl:text> т.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:text> факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:text> телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:text> e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="SupplementaryQuantity" match="*">
		<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">(<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
	</xsl:template>
	<xsl:template mode="identity" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.), 'Date')">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="address_catru">
		<xsl:for-each select="cat_ru:CounryName|cat_ru:Region|cat_ru:District|cat_ru:Town|cat_ru:City|cat_ru:StreetHouse|cat_ru:House|cat_ru:Room">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="document_add">
		<xsl:value-of select="dca:PresentedDocumentModeCode"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*" mode="document">
		<xsl:value-of select="dca:PresentedDocumentModeCode"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
		</xsl:if>
		<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="adt_cat:ArticleNumber">
			<xsl:text> статья </xsl:text>
			<xsl:value-of select="adt_cat:ArticleNumber"/>
		</xsl:if>
		<xsl:if test="adt_cat:PartNumber">
			<xsl:text> часть </xsl:text>
			<xsl:value-of select="adt_cat:PartNumber"/>
		</xsl:if>
		<xsl:if test="adt_cat:ClauseNumber">
			<xsl:text> пункт </xsl:text>
			<xsl:value-of select="adt_cat:ClauseNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="document1">
		<xsl:value-of select="dca:PresentedDocumentModeCode"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>/</xsl:text>
		</xsl:if>
		<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>/</xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="PersonPost">
		<xsl:if test="adt_cat:ApproverPerson/cat_ru:PersonPost">
			<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonPost"/>&#160;
								</xsl:if>
		<xsl:if test="dca:Rank">
			<xsl:value-of select="dca:Rank"/>,&#160;</xsl:if>
		<xsl:if test="adt_cat:CustomsSubUnit">
			<xsl:value-of select="adt_cat:CustomsSubUnit"/>,&#160;</xsl:if>
		<xsl:if test="adt_cat:FullOfficeName">
			<xsl:value-of select="adt_cat:FullOfficeName"/>
		</xsl:if>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:if test="string-length(adt_cat:FullOfficeName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:OfficeName"/>
			<xsl:if test="string-length(adt_cat:FullOfficeName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:Code">&#160; (<xsl:value-of select="cat_ru:Code"/>)&#160;</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="PersonName">
		<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonSurname"/>&#160;
								<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonName"/>&#160;
								<xsl:if test="adt_cat:ApproverPerson/cat_ru:PersonMiddleName">
			<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonMiddleName"/>,&#160;</xsl:if>
		<xsl:if test="dca:PersonCustomsID">&#160;номер служебного удостоверения:&#160;<xsl:value-of select="dca:PersonCustomsID"/>,&#160;</xsl:if>
		<xsl:if test="dca:LNP">&#160;ЛНП:&#160;<xsl:value-of select="dca:LNP"/>,</xsl:if>
		<xsl:if test="dca:Note">&#160;<xsl:value-of select="dca:Note"/>&#160;</xsl:if>
	</xsl:template>
	<xsl:template mode="ApproverPerson" match="*">
		<xsl:if test="position()!=1">
			<br/>
		</xsl:if>
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
								<xsl:value-of select="cat_ru:PersonName"/>&#160;
								<xsl:value-of select="cat_ru:PersonMiddleName"/>&#160;
								<xsl:value-of select="cat_ru:PersonPost"/>
		<xsl:if test="../adt_cat:CustomsAuthorizingOrder">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="../adt_cat:CustomsAuthorizingOrder/adt_cat:CustomsIssuedOrder/cat_ru:OfficeName"/>
			<xsl:if test="../adt_cat:CustomsAuthorizingOrder/adt_cat:CustomsIssuedOrder/cat_ru:Code">
				<xsl:text> (</xsl:text>
			</xsl:if>
			<xsl:value-of select="../adt_cat:CustomsAuthorizingOrder/adt_cat:CustomsIssuedOrder/cat_ru:Code"/>
			<xsl:if test="../adt_cat:CustomsAuthorizingOrder/adt_cat:CustomsIssuedOrder/cat_ru:Code">
				<xsl:text>)</xsl:text>
			</xsl:if>
			<xsl:apply-templates select="../adt_cat:CustomsAuthorizingOrder/adt_cat:Order" mode="document"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
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
	<xsl:template match="//*[local-name()='DecisionCustomsAudit']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template name="RUScat_ru:CommunicationDetails" match="RUScat_ru:CommunicationDetails">
		<span class="normal">, </span>
		<xsl:if test="cat_ru:Phone">
			<span class="italic">Тел</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:Phone">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<span class="italic">Факс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Fax"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<span class="italic">Телекс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Telex"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<span class="italic">Email</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:E_mail">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="gtd_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="gtd_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
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
	<xsl:template name="month_name">
		<xsl:param name="monthIn"/>
		<xsl:choose>
			<xsl:when test="$monthIn='01'">января</xsl:when>
			<xsl:when test="$monthIn='02'">февраля</xsl:when>
			<xsl:when test="$monthIn='03'">марта</xsl:when>
			<xsl:when test="$monthIn='04'">апреля</xsl:when>
			<xsl:when test="$monthIn='05'">мая</xsl:when>
			<xsl:when test="$monthIn='06'">июня</xsl:when>
			<xsl:when test="$monthIn='07'">июля</xsl:when>
			<xsl:when test="$monthIn='08'">августа</xsl:when>
			<xsl:when test="$monthIn='09'">сентября</xsl:when>
			<xsl:when test="$monthIn='10'">октября</xsl:when>
			<xsl:when test="$monthIn='11'">ноября</xsl:when>
			<xsl:when test="$monthIn='12'">декабря</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>"</xsl:text>
				<u>
					<xsl:text>&#160;&#160;</xsl:text>
					<xsl:value-of select="substring($dateIn,9,2)"/>
					<xsl:text>&#160;</xsl:text>
				</u>
				<xsl:text>" &#160;&#160;</xsl:text>
				<u>
					<xsl:text>&#160;&#160;</xsl:text>
					<xsl:call-template name="month_name">
						<xsl:with-param name="monthIn" select="substring($dateIn,6,2)"/>
					</xsl:call-template>
					<xsl:text>&#160;&#160;</xsl:text>
				</u>
				<xsl:text> &#160;&#160;</xsl:text>
				<xsl:value-of select="substring($dateIn,1,2)"/>
				<u>
					<xsl:value-of select="substring($dateIn,3,2)"/>
				</u>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="number_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
