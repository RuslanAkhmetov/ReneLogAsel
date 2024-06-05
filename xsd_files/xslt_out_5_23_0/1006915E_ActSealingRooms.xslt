<?xml version="1.0" encoding="utf-8"?>
<!--Приказ ФТС России  от 14.02.2019 г. № 258 "Об утверждении форм документов, составляемых таможенными органами при проведении таможенных проверок, 
порядков их заполнения и порядка внесения изменений в решение о проведении выездной таможенной проверки" 
Приложение № 27 - Акт опечатывания помещений, складов, архивов и иных мест нахождения (хранения) документов и товаров, в отношении которых проводится выездная таможенная проверка -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.23.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0" xmlns:asr="urn:customs.ru:Information:CustomsAuditDocuments:ActSealingRooms:5.23.0">
	<!-- Шаблон для типа ActSealingRoomsType -->
	<xsl:template match="asr:ActSealingRooms">
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
					font-style: italic;
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
					font-size: 11pt;
					}
					td.value.graphMain
					{
					vertical-align:bottom;
					}

					.descr{
					font-size: 7pt;
					text-align: center;
					vertical-align:top;
					}

					.indent{
					text-indent: 1.5em;
					}

					.delim_3 {
					height: 3pt;
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
										МИНИСТЕРСТВО ФИНАНСОВ РОССИЙСКОЙ ФЕДЕРАЦИИ<br/>(МИНФИН РОССИИ)<br/>
										<br/>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА<br/>
									</font>
								</td>
							</tr>
							<tr>
								<td class="value" align="center">
									<xsl:value-of select="asr:Customs/cat_ru:OfficeName"/>
									<xsl:if test="asr:Customs/cat_ru:Code and asr:Customs/cat_ru:OfficeName">
										<xsl:text> (</xsl:text>
									</xsl:if>
									<xsl:value-of select="asr:Customs/cat_ru:Code"/>
									<xsl:if test="asr:Customs/cat_ru:Code and asr:Customs/cat_ru:OfficeName">
										<xsl:text>)</xsl:text>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="descr">(наименование таможенного органа)</td>
							</tr>
							<tr align="center" valign="top">
								<td>
									<br/>
									<br/>
									<b>АКТ</b>
									<br/>опечатывания помещений, складов, архивов и иных мест нахождения (хранения) документов и товаров, в отношении которых проводится выездная таможенная проверка
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<table>
										<tbody>
											<tr valign="bottom" align="center">
												<td align="center" width="35%">
													<xsl:call-template name="Date">
														<xsl:with-param name="date" select="asr:ActDate"/>
													</xsl:call-template>
												</td>
												<td width="30%"/>
												<td width="35%" class="value">
													<xsl:value-of select="asr:ActPlace"/>
												</td>
											</tr>
											<tr>
												<td class="descr">(дата)</td>
												<td/>
												<td class="descr">(место составления)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>В ходе выездной таможенной проверки, проводимой на основании решения о проведении выездной таможенной проверки от&#160;</xsl:text>
									<xsl:call-template name="DateStr">
										<xsl:with-param name="date" select="asr:DecisionPerformAudit/adt_cat:Date"/>
									</xsl:call-template>
									<xsl:text>&#160;№&#160;</xsl:text><u>&#160;<xsl:value-of select="asr:DecisionPerformAudit/adt_cat:Number"/></u>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr>
								<td>
								<xsl:text>в отношении</xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="asr:AuditOrganization/cat_ru:OrganizationName"/>
										<xsl:if test="not(asr:AuditOrganization/cat_ru:OrganizationName) and asr:AuditOrganization/cat_ru:ShortName">
											<xsl:value-of select="asr:AuditOrganization/cat_ru:ShortName"/></xsl:if>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'(сведения о проверяемом лице)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>							
							<tr>
								<td>
								<xsl:text>должностным лицом таможенного органа:</xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
									<xsl:apply-templates mode="customs_person" select="asr:Customs"></xsl:apply-templates>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'(фамилия, имя, отчество (отчество указывается при наличии, должность должностного лица таможенного органа, произведшего опечатывание)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>							
							<tr>
								<td>
									<xsl:text>в присутствии:</xsl:text><br/>
									<xsl:text>проверяемого лица либо его представителя:</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:choose>
												<xsl:when test="asr:Owner">
													<xsl:apply-templates mode="person" select="asr:Owner"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates mode="identity" select="asr:Owner/adt_cat:Passport"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates mode="address" select="asr:Owner/adt_cat:ResidencePlace"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates mode="AuthoritesDocument" select="asr:Owner/asr:AuthoritesDocument"></xsl:apply-templates>
												</xsl:when>
												<xsl:otherwise><xsl:text disable-output-escaping="yes">&amp;mdash;</xsl:text></xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность)'"/>
										<xsl:with-param name="comma" select="'1'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>							
							<tr>
								<td>
									<xsl:text>понятых:</xsl:text>
									<xsl:if test="not(asr:Witnesses)">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:text disable-output-escaping="yes">&amp;mdash;</xsl:text>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'(фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность, место жительства)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:for-each select="asr:Witnesses">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="position()"/>
												<xsl:text>) </xsl:text>
												<xsl:apply-templates mode="person_nopost" select="."/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates mode="identity" select="adt_cat:Passport"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates mode="address" select="adt_cat:ResidencePlace"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'(фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность, место жительства)'"/>
											<xsl:with-param name="comma" select="'1'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>							
							<tr>
								<td>
									<xsl:text>иных лиц:</xsl:text>
									<xsl:if test="not(asr:Other)">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:text disable-output-escaping="yes">&amp;mdash;</xsl:text>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность, место жительства)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:for-each select="asr:Other">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="position()"/>
												<xsl:text>) </xsl:text>
												<xsl:apply-templates mode="person" select="."/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates mode="identity" select="adt_cat:Passport"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates mode="address" select="adt_cat:ResidencePlace"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность, место жительства)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>							
							<tr>
								<td style="text-align: justify">
									<xsl:text>на основании подпункта 7 пункта 2 статьи 335 Таможенного кодекса Евразийского экономического союза и статьи 234 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации»</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>							
							<tr>
								<td>
									<xsl:text>произведено опечатывание: </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:for-each select="asr:NamePlaceInfo">
												<xsl:value-of select="position()"/>
												<xsl:text>) </xsl:text>
												<xsl:apply-templates select="asr:NamePlace"/>
												<xsl:if test="position()!=last()"><xsl:text disable-output-escaping="yes">;&lt;br&gt;</xsl:text></xsl:if>
											</xsl:for-each>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(наименование помещения или иного места)'"/>
										<xsl:with-param name="width" select="'98%'"/>
									</xsl:call-template>
									<xsl:text>, </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>							
							<tr>
								<td>
									<xsl:text>находящегося по адресу:</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
										<xsl:for-each select="asr:NamePlaceInfo[not(./asr:AddressPlace = preceding-sibling::asr:NamePlaceInfo/asr:AddressPlace)]">
											<xsl:apply-templates mode="address" select="asr:AddressPlace"/>
											<xsl:if test="position()!=last()">; </xsl:if>
										</xsl:for-each>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(адрес объекта проверяемого лица, на котором произведено опечатывание)'"/>
										<xsl:with-param name="width" select="'98%'"/>
									</xsl:call-template>
									<xsl:text>, </xsl:text>							
								</td>
							</tr>		
							<tr>
								<td class="delim_3"><br/></td>
							</tr>												
							<tr>
								<td>
									<xsl:text>в котором находятся</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:if test="asr:Goods">
												<xsl:text disable-output-escaping="yes">Товары: &lt;br&gt;</xsl:text>
											</xsl:if>
											<xsl:for-each select="asr:Goods">
												<xsl:value-of select="cat_ru:GoodsNumeric"/>
												<xsl:text>. </xsl:text>
												<xsl:if test="cat_ru:GoodsTNVEDCode">
													<xsl:text> код ТН ВЭД ЕАЭС: </xsl:text>
													<xsl:value-of select="cat_ru:GoodsTNVEDCode"/>
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:apply-templates select="cat_ru:GoodsDescription"/>
												<xsl:if test="cat_ru:GrossWeightQuantity">
													<xsl:text>, вес брутто: </xsl:text>
													<xsl:value-of select="cat_ru:GrossWeightQuantity"/>
												</xsl:if>
												<xsl:if test="cat_ru:NetWeightQuantity">
													<xsl:text>, вес нетто: </xsl:text>
													<xsl:value-of select="cat_ru:NetWeightQuantity"/>
												</xsl:if>
												<xsl:if test="position()!=last()"><xsl:text disable-output-escaping="yes">;&lt;br&gt;</xsl:text></xsl:if>
											</xsl:for-each>
											<xsl:if test="asr:Docs">
												<xsl:if test="asr:Goods">
													<xsl:text disable-output-escaping="yes">;&lt;br&gt;</xsl:text>
												</xsl:if>
												<xsl:text disable-output-escaping="yes">Документы: &lt;br&gt;</xsl:text>
												<xsl:for-each select="asr:Docs">
													<xsl:apply-templates mode="document" select="."/>
													<xsl:if test="position()!=last()"><xsl:text disable-output-escaping="yes">;&lt;br&gt;</xsl:text></xsl:if>
												</xsl:for-each>
											</xsl:if>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(указываются документы и (или) товары, в отношении которых проводится выездная таможенная проверка)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>							
							<tr>
								<td>
									<xsl:text>в </xsl:text>
									<u>
										&#160;<xsl:value-of select="substring(asr:SealingTime, 1, 2)"/>
									&#160;</u>&#160;
									<xsl:text> часов </xsl:text>
									<u>
										&#160;<xsl:value-of select="substring(asr:SealingTime, 4, 2)"/>
									&#160;</u>&#160;
									<xsl:text> мин. </xsl:text>
									<xsl:call-template name="DateStr">
										<xsl:with-param name="date" select="asr:SealingDate"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>							
							<tr>
								<td>
									<xsl:text>описание способа опечатывания </xsl:text>
									<u>
										<xsl:apply-templates select="asr:SealingMethod"/>
									</u>
								</td>
							</tr>						
							<tr>
								<td>
									<br/>
									<xsl:text>Замечания, заявления, сделанные при опечатывании</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
										<xsl:choose>
											<xsl:when test="asr:Comment">
												<xsl:apply-templates select="asr:Comment"/>
											</xsl:when>
											<xsl:otherwise>отсутсвуют</xsl:otherwise>
										</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>							
							<tr>
								<td>
									Лицо, сделавшее замечание или заявление:
									 <xsl:apply-templates mode="signature_comment" select="asr:CommentSignature"></xsl:apply-templates>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Расписка проверяемого лица или его представителя о принятии под охрану опечатанного помещения, иного места</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">

											<xsl:if test="not(asr:OwnersSignature)">отказ проверяемого лица (его представителя) в подписании Акта</xsl:if>
											<xsl:if test="not(asr:Owner)">проверяемое лицо (его представитель) отсутствуют</xsl:if>																						
											<xsl:if test="asr:Owner"><xsl:apply-templates select="asr:OwnersSignature" mode="person"></xsl:apply-templates></xsl:if>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<br/>
									<xsl:text>Уничтожение, удаление, изменение либо замена средств идентификации, используемых таможенным органом, без разрешения таможенного органа или повреждение либо утрата таких средств идентификации влечет ответственность, предусмотренную статьей 16.11 Кодекса Российской Федерации об административных правонарушениях</xsl:text><span class="descr"><sup>1</sup></span><xsl:text>.</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>С мерами ответственности за вскрытие помещения, иного опечатанного места</xsl:text><xsl:if test="asr:ResponsibilityMeasures='0' or asr:ResponsibilityMeasures='f' or asr:ResponsibilityMeasures='false'"><b><xsl:text> НЕ</xsl:text></b></xsl:if><xsl:text> ознакомлен.</xsl:text>
									<table>
										<tbody>
											<tr valign="bottom" align="center">
												<td width="24%" class="value">
													<xsl:value-of select="asr:OwnersSignature/cat_ru:PersonPost"/>
												</td>
												<td></td>
												<td width="24%" class="value"></td>
												<td></td>
												<td width="24%" class="value">
													<xsl:for-each select="asr:OwnersSignature/cat_ru:PersonSurname|asr:OwnersSignature/cat_ru:PersonName|asr:OwnersSignature/cat_ru:PersonMiddleName">
														<xsl:apply-templates select="."/>
														<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
													</xsl:for-each>
												</td>
												<td></td>
												<td width="24%" class="value">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="asr:OwnersSignature/adt_cat:Date"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="descr">(должность проверяемого лица или его представителя)</td>
												<td></td>
												<td class="descr">(подпись)</td>
												<td></td>
												<td class="descr">(фамилия, инициалы имени и отчества (инициал отчетства указывается при наличии отчества))</td>
												<td></td>
												<td class="descr">(дата)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td><br/><xsl:text>Подписи:</xsl:text></td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>							
							<tr>
								<td>
									<xsl:text>Должностное лицо таможенного органа:</xsl:text>
									<xsl:apply-templates mode="signature" select="asr:Customs/adt_cat:ApproverPerson"/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>Проверяемое лицо или его представитель:</xsl:text>
									<xsl:apply-templates mode="signature" select="asr:OwnersSignature"/>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Понятые:</xsl:text>
									<xsl:for-each select="asr:Witnesses">
										<xsl:apply-templates mode="signature" select="."/>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Иные присутствующие лица:</xsl:text>
									<xsl:for-each select="asr:Other">
										<xsl:apply-templates mode="signature" select="."/>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td>
									<table class="descr">
										<tbody>
											<tr>
												<td width="30%" class="value"/>
												<td width="70%"/>
 											</tr>
 											<tr>
												<td colspan="2"><sup>1</sup> Собрание законодательства Российской Федерации, 2002, № 1, ст. 1; 2016, № 26, ст. 3882; 2019, № 4, ст. 360.</td>
												</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="document" match="*">
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
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="asr:DocsDescription"/>
		<xsl:text> </xsl:text>
		<xsl:if test="asr:DocsQuantity">
			<xsl:text>, кол-во: </xsl:text>
			<xsl:value-of select="asr:DocsQuantity"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="quantity" match="*">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template mode="signature2ndCopy" match="*">
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="35%" class="value">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
					<td/>
					<td width="20%" class="value">
					</td>
					<td/>
					<td width="35%" class="value">
						<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
						<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
						<xsl:if test="cat_ru:PersonName">.</xsl:if>
						<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
						<xsl:if test="cat_ru:PersonMiddleName">.</xsl:if>
					</td>
				</tr>
				<tr valign="top">
					<td class="descr">(должность)</td>
					<td/>
					<td class="descr">(подпись)</td>
					<td/>
					<td class="descr">(фамилия, инициалы имени и<br/>отчества (инициал отчества<br/>указывается при наличии отчества))</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template mode="customs_person" match="*">
		<xsl:if test="adt_cat:ApproverPerson/cat_ru:PersonPost">
			<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonPost"/>&#160;
		</xsl:if>
		<xsl:if test="asr:Rank">
			<xsl:value-of select="asr:Rank"/>,&#160;</xsl:if>
		<xsl:if test="adt_cat:CustomsSubUnit">
			<xsl:value-of select="adt_cat:CustomsSubUnit"/>,</xsl:if>&#160;<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:if test="cat_ru:Code">&#160;(
		</xsl:if>
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:Code">), &#160;
		</xsl:if>
		<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonSurname"/>&#160;<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonName"/>&#160;<xsl:value-of select="adt_cat:ApproverPerson/cat_ru:PersonMiddleName"/>
		<xsl:if test="asr:PersonCustomsID">&#160;номер служебного удостоверения:&#160;<xsl:value-of select="asr:PersonCustomsID"/>,</xsl:if>
		<xsl:if test="asr:LNP">&#160;ЛНП:&#160;<xsl:value-of select="asr:LNP"/>,</xsl:if>
		<xsl:if test="asr:Phone">&#160;Тел:&#160;<xsl:value-of select="asr:Phone"/>,</xsl:if>
		<xsl:if test="asr:Note">&#160;<xsl:value-of select="asr:Note"/></xsl:if>
	</xsl:template>
	
	<xsl:template mode="signature_comment" match="*">
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="35%" class="value"><xsl:value-of select="cat_ru:PersonPost"/></td>		
					<td width="5%"/>
					<td width="20%" class="value"/>
					<td width="5%"> </td>
					<td width="35%" class="value">
						<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
						<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
						<xsl:if test="cat_ru:PersonName">.</xsl:if>
						<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
						<xsl:if test="cat_ru:PersonMiddleName">.</xsl:if>
					</td>
				</tr>
				<tr valign="top">
					<td class="descr">(должность)</td>
					<td/>
					<td class="descr">(подпись)</td>
					<td/>
					<td class="descr">(фамилия, инициалы имени и<br/>отчества (инициал отчества<br/>указывается при наличии отчества))</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
		<xsl:template match="*" mode="AuthoritesDocument">
		<xsl:value-of select="cat_ru:PrDocumentName"/>&#160;
			<xsl:if test="cat_ru:PrDocumentNumber">&#160;№&#160;<xsl:value-of select="cat_ru:PrDocumentNumber"/></xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate">&#160;от&#160;<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/></xsl:call-template></xsl:if>
			<xsl:if test="cat_ru:ComplationAuthorityDate">&#160;(дата окончания полномочий:&#160;<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:ComplationAuthorityDate"/></xsl:call-template>)</xsl:if>
	</xsl:template>

	<xsl:template mode="signature" match="*">
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="35%"/>
					<td/>
					<td width="20%" class="value">
					</td>
					<td/>
					<td width="35%" class="value">
						<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
						<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
						<xsl:if test="cat_ru:PersonName">.</xsl:if>
						<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
						<xsl:if test="cat_ru:PersonMiddleName">.</xsl:if>
					</td>
				</tr>
				<tr valign="top">
					<td/>
					<td/>
					<td class="descr">(подпись)</td>
					<td/>
					<td class="descr">(фамилия, инициалы имени и<br/>отчества (инициал отчества<br/>указывается при наличии отчества))</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template mode="person_nopost" match="*">
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template mode="person" match="*">
		<xsl:value-of select="cat_ru:PersonPost"/>
		<xsl:text> </xsl:text>
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="comma" select="0"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value" width="{$width_td1}">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
					<xsl:if test="$comma != 0">
						<td width="1%" valign="bottom">,</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$description"/>
					</td>
					<xsl:if test="$comma != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
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
	
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="address">
		<xsl:for-each select="RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
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
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>" </xsl:text>
				<xsl:call-template name="month"><xsl:with-param name="number" select="substring($dateIn,6,2)"/></xsl:call-template> 
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> г.</xsl:text>
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
	
	<xsl:template name="Date">
		<xsl:param name="date"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">" </td>
					<td width="13%" class="value"><xsl:value-of select="substring($date,9,2)"/></td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="value">
						<xsl:variable name="month" select="substring($date, 6, 2)"/>
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
					</td>
					<td width="5%"> </td>
					<td width="2%" align="right"><xsl:value-of select="substring($date,1,2)"/></td>
					<td width="9%" class="value" align="left"><xsl:value-of select="substring($date,3,2)"/></td>
					<td width="4%"> </td>
					<td width="2%"> г.</td>
				</tr>
			</tbody>
		</table>	
	</xsl:template>

	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:choose>
			<xsl:when test="string-length($date) &gt; 0">
				<xsl:variable name="month" select="substring($date, 6, 2)"/>
				&#34;&#160;<u>&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</u>&#160;&#34;
				&#160;<u>&#160;
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
				</u>&#160;&#160;<xsl:value-of select="substring($date,1,2)"/><u><xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;г.&#160;
			</xsl:when>
			<xsl:otherwise>
				&#34;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#34;
				&#160;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#160;
				20<u>&#160;&#160;&#160;&#160;&#160;</u>&#160;г.&#160;
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>	
</xsl:stylesheet>