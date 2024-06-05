<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rdrp="urn:customs.ru:Information:CommercialFinanceDocuments:RecDecisionRevokePayments:5.22.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа RecDecisionRevokePaymentsType -->
	<xsl:template match="rdrp:RecDecisionRevokePayments">
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
                  
                  .graph8{
					font-size:8pt;
					}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>
											<xsl:text>Квитанция</xsl:text>
											<xsl:text> № </xsl:text>
											<xsl:value-of select="rdrp:NumberRecDecision"/>
											<xsl:text> от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="rdrp:DateRecDecision"/>
											</xsl:call-template>
											<xsl:text> об исполнении </xsl:text>
											<br/>
											<xsl:choose>
												<xsl:when test="rdrp:OrderType='0' and rdrp:DocType='0'">
													<xsl:text>Поручения таможенного органа </xsl:text>
													<xsl:apply-templates select="rdrp:CustomsOffice"/>
													<xsl:text> на бесспорное взыскание</xsl:text>
												</xsl:when>
												<xsl:when test="rdrp:OrderType='0' and rdrp:DocType='1'">
													<xsl:text>Отзыва поручения таможенного органа </xsl:text>
													<xsl:apply-templates select="rdrp:CustomsOffice"/>
													<xsl:text> на бесспорное взыскание</xsl:text>
												</xsl:when>
												<xsl:when test="rdrp:OrderType='1' and rdrp:DocType='0'">
													<xsl:text>Поручения таможенного органа </xsl:text>
													<xsl:apply-templates select="rdrp:CustomsOffice"/>
													<xsl:text> на продажу иностранной валюты</xsl:text>
												</xsl:when>
												<xsl:when test="rdrp:OrderType='1' and rdrp:DocType='1'">
													<xsl:text>Отзыва поручения таможенного органа </xsl:text>
													<xsl:apply-templates select="rdrp:CustomsOffice"/>
													<xsl:text> на продажу иностранной валюты</xsl:text>
												</xsl:when>
												<xsl:when test="rdrp:OrderType='2' and rdrp:DocType='0'">
													<xsl:text>Поручения таможенного органа </xsl:text>
													<xsl:apply-templates select="rdrp:CustomsOffice"/>
													<xsl:text> на перевод электронных денежных средств</xsl:text>
												</xsl:when>
												<xsl:when test="rdrp:OrderType='2' and rdrp:DocType='1'">
													<xsl:text>Отзыва поручения таможенного органа </xsl:text>
													<xsl:apply-templates select="rdrp:CustomsOffice"/>
													<xsl:text> на перевод электронных денежных средств</xsl:text>
												</xsl:when>
												<xsl:when test="rdrp:OrderType='3' and rdrp:DocType='0'">
													<xsl:text>Поручения таможенного органа </xsl:text>
													<xsl:apply-templates select="rdrp:CustomsOffice"/>
													<xsl:text> на перечисление денежных средств с депозитного счета на расчетный</xsl:text>
												</xsl:when>
												<xsl:when test="rdrp:OrderType='3' and rdrp:DocType='1'">
													<xsl:text>Отзыва поручения таможенного органа </xsl:text>
													<xsl:apply-templates select="rdrp:CustomsOffice"/>
													<xsl:text> на перечисление денежных средств с депозитного счета на расчетный</xsl:text>
												</xsl:when>
												<xsl:when test="rdrp:OrderType='4' and rdrp:DocType='0'">
													<xsl:text>Решения о приостановлении операций по счетам плательщика</xsl:text>
												</xsl:when>
												<xsl:when test="rdrp:OrderType='4' and rdrp:DocType='1'">
													<xsl:text>Отзыва решения о приостановлении операций по счетам плательщика</xsl:text>
												</xsl:when>
												<xsl:when test="rdrp:OrderType='5' and rdrp:DocType='0'">
													<xsl:text>Поручения на продажу драгоценных металлов и перечисление денежных средств от продажи драгоценных металлов на расчетный</xsl:text>
												</xsl:when>
												<xsl:when test="rdrp:OrderType='5' and rdrp:DocType='1'">
													<xsl:text>Отзыва поручения на продажу драгоценных металлов и перечисление денежных средств от продажи драгоценных металлов на расчетный</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>чего-то</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
											<br/>
											<xsl:text> № </xsl:text>
											<xsl:apply-templates select="rdrp:DocumentReference"/>
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td class="value" align="center">
									<xsl:apply-templates mode="organization" select="rdrp:PayerInfo"/>
								</td>
							</tr>
							<tr align="center">
								<td class="graph8">(полное наименование плательщика-держателя счета, идентификационный номер налогоплательщика,<br/>код причины постановки на учет (если имеются))</td>
							</tr>
							<tr>
								<td class="graphMain">
									<br/>
									Банк и счет: <xsl:apply-templates select="rdrp:BankAndAccountInfo"/>
								</td>
							</tr>
							<xsl:if test="rdrp:PaymentInfo/rdrp:PaymentOrder">
								<tr>
									<td class="graphMain">
										<br/>
										Реквизиты платежного поручения: <xsl:apply-templates select="rdrp:PaymentInfo/rdrp:PaymentOrder"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="rdrp:PaymentInfo/rdrp:PaymentAmount">
								<tr>
									<td class="graphMain">
										<br/>
										Сумма платежного поручения: <xsl:value-of select="translate(translate(format-number(rdrp:PaymentInfo/rdrp:PaymentAmount, '#,###.00'), ',', ' '), '.', ',')"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="rdrp:PaymentInfo/rdrp:RemainingPaymentAmount">
								<tr>
									<td class="graphMain">
										<br/>
										Сумма остатка платежа: <xsl:value-of select="translate(translate(format-number(rdrp:PaymentInfo/rdrp:RemainingPaymentAmount, '#,###.00'), ',', ' '), '.', ',')"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<br/>
									Код результата: <xsl:value-of select="rdrp:ResultCode"/>
									<xsl:text> </xsl:text>
									<xsl:choose>
										<xsl:when test="rdrp:ResultCode='01'">01 - исполнено</xsl:when>
										<xsl:when test="rdrp:ResultCode='02'">02 - в банке отсутствует плательщик с указанным ИНН</xsl:when>
										<xsl:when test="rdrp:ResultCode='03'">03 - в банке отсутствует номер счета</xsl:when>
										<xsl:when test="rdrp:ResultCode='04'">04 - счет плательщика закрыт</xsl:when>
										<xsl:when test="rdrp:ResultCode='05'">05 - наименование плательщика не соответствует номеру счета плательщика</xsl:when>
										<xsl:when test="rdrp:ResultCode='06'">06 - блокировка по данному решению уже установлена</xsl:when>
										<xsl:when test="rdrp:ResultCode='07'">07 - очередь не исполненных в срок документов</xsl:when>
										<xsl:when test="rdrp:ResultCode='08'">08 - частично исполнено</xsl:when>
										<xsl:when test="rdrp:ResultCode='99'">99 - иное</xsl:when>
									</xsl:choose>
								</td>
							</tr>
							<xsl:if test="rdrp:ResultText">
								<tr>
									<td>
											Дополнительная информация о результате исполнения: <xsl:apply-templates select="rdrp:ResultText"/>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
					<br/>
					<br/>
					<xsl:apply-templates mode="executor" select="rdrp:Executor">
						<xsl:with-param name="hasPhone" select="'1'"/>
					</xsl:apply-templates>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="rdrp:PaymentOrder">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="rdrp:DocumentReference">
		<xsl:value-of select="rdrp:PrDocumentNumber"/>
		<!--xsl:value-of select="rdrp:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="rdrp:RegistrationYear"/>
		<xsl:for-each select="rdrp:DocNumber/*">
			<xsl:text>/</xsl:text>
			<xsl:choose>
				<xsl:when test="local-name()='PrDocumentDate'">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each-->
	</xsl:template>
	<xsl:template mode="executor" match="*">
		<xsl:param name="hasPhone"/>
		<table width="100%">
			<tbody>
				<tr valign="bottom">
					<td width="16%">Исполнитель</td>
					<td width="55%" class="value" align="center">
						<xsl:value-of select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
					<td/>
					<xsl:if test="$hasPhone='1'">
						<td align="right">
							<xsl:text>Телефон&#160;&#160;</xsl:text>
						</td>
						<td class="value" align="center">
							<xsl:value-of select="rdrp:ExecutivePhone"/>
						</td>
					</xsl:if>
				</tr>
				<tr align="center" valign="top">
					<td/>
					<td class="graph8">(инициалы, фамилия должностного исполнителя)</td>
					<td/>
					<xsl:if test="$hasPhone='1'">
						<td/>
						<td/>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="rdrp:BankAndAccountInfo">
		<xsl:text> № </xsl:text>
		<xsl:value-of select="rdrp:BankAccount"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="rdrp:BankAccountDescription"/>
		<!--xsl:value-of select="catComFin_ru:BankName"/-->
		<!--xsl:if test="cat_ru:OKPOID">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:OKPOID"/>
		</xsl:if-->
		<xsl:if test="rdrp:BICID">
			<xsl:text>, БИК: </xsl:text>
			<xsl:value-of select="rdrp:BICID"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:SWIFTID">
			<xsl:text>, SWIFT: </xsl:text>
			<xsl:value-of select="cat_ru:SWIFTID"/>
		</xsl:if-->
		<xsl:if test="rdrp:CorrAccount">
			<xsl:text>, корр.счет: </xsl:text>
			<xsl:value-of select="rdrp:CorrAccount"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:CurrentCurrencyAccount">
			<xsl:text>, валютный счет (текущий): </xsl:text>
			<xsl:for-each select="cat_ru:CurrentCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:TransitCurrencyAccount">
			<xsl:text>, валютный счет (транзитный): </xsl:text>
			<xsl:for-each select="cat_ru:TransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:SpecialTransitCurrencyAccount">
			<xsl:text>, валютный счет (специальный): </xsl:text>
			<xsl:for-each select="cat_ru:SpecialTransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:RoubleCurrencyAccount">
			<xsl:text>, рублевый счет: </xsl:text>
			<xsl:value-of select="cat_ru:RoubleCurrencyAccount"/>
		</xsl:if>
		<xsl:if test="cat_ru:BankPostalAddress">
			<xsl:text>, адрес: </xsl:text>
			<xsl:for-each select="cat_ru:BankPostalAddress/*">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="rdrp:CodeBank">
			<xsl:text>, Код банка по КГРКО: </xsl:text>
			<xsl:value-of select="rdrp:CodeBank"/>
		</xsl:if>
		<xsl:if test="rdrp:CEMPId">
			<xsl:text>, Идентификатор КЭСП: </xsl:text>
			<xsl:value-of select="rdrp:CEMPId"/>
		</xsl:if-->
	</xsl:template>
	<xsl:template mode="organization" match="*">
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
	<!-- Шаблон для типа cat_ru:CustomsType -->
  <xsl:template match="rdrp:CustomsOffice">
     <xsl:value-of select="cat_ru:Code" />
     <xsl:if test="cat_ru:OfficeName">
		<xsl:text> (</xsl:text>
		  <xsl:value-of select="cat_ru:OfficeName" />
			<xsl:text>)</xsl:text>
	 </xsl:if>
  </xsl:template>
 
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
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
</xsl:stylesheet>
