<?xml version="1.0" encoding="UTF-8"?>
<!-- Приказ ФТС России № 489 от 25 марта 2019 года "Об утверждении порядка разработки, опубликования и внесения изменений в форматы и структуры электронных документов, участвующих в обмене при взаимодействии таможенных органов Российской Федерации и заинтересованных лиц" -->
<xsl:stylesheet exclude-result-prefixes="vpd  cat_ru" version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:vpd="urn:customs.ru:Information:CustomsDocuments:VehiclePresentDemand:5.22.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<!-- Шаблон для типа VehiclePresentDemand -->
	<xsl:template match="vpd:VehiclePresentDemand">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Требование о представлении транспортного средства для целей осмотра и (или) идентификационной сверки</title>
				<style type="text/css">
					body
					{background: #cccccc;
					font-family: Arial;}

					div.page
					{width: 190mm;
					max-width: 190mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.marg-top
					{margin-top:5mm;}

					table
					{width: 100%;
					max-width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					.inlinetable
					{border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display: -moz-inline-stack;/*Firefox 2*/
					display: inline-table; /*Хорошие браузеры*/
					_overflow: hidden;/*IE6, IE7*/
					*zoom: 1;/*включаем hasLayout для IE6, IE7*/
					*display: inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;}

					table.border tr td
					{border: 1px solid gray;}

					.graph
					{font-family: Arial;
					font-size: 10pt;}

					.value
					{border-bottom: solid 1px black;
					font-style: italic;
					vertical-align:bottom;}

					div.title, tr.title td
					{font-weight:bold;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}

					.descr
					{font-size: 7pt;
					text-align: center;
					vertical-align:top;}

					.graphLittle
					{font-family: Arial;
					font-size: 7pt;}

					.delim
					{height: 7pt;}

					.delim_3
					{height: 3pt;}

					.indent
					{text-indent: 1.5em;}
				</style>
			</head>
			<body>
				<div class="page">
					<!-- Шапка -->
					<table style="width:150mm">
						<tbody>
							<tr>
								<td style="width:55mm" valign="top">
									<table style="width:55mm">
										<tbody>
											<tr>
												<td class="value" align="center">
													<xsl:value-of select="vpd:CustomsDetails/cat_ru:Code"/>
												</td>
											</tr>
											<tr>
												<td class="graphLittle" align="center">(код и наименование</td>
											</tr>
											<tr>
												<td class="value" align="center">
													<xsl:value-of select="vpd:CustomsDetails/cat_ru:OfficeName"/>
												</td>
											</tr>
											<tr>
												<td class="graphLittle" align="center">таможенного органа)</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td style="width:20mm">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
								</td>
								<td style="width:90mm" valign="top">
									<table style="width:90mm">
										<tbody>
											<tr>
												<td class="value" align="center">
													<xsl:value-of select="vpd:PayerInfo/cat_ru:OrganizationName"/>
												</td>
											</tr>
											<tr>
												<td class="graphLittle" align="center">(наименование юридического лица, фамилия, имя, отчество (при наличии)</td>
											</tr>
											<tr>
												<td class="value" align="center">
													<xsl:if test="vpd:PayerInfo/cat_ru:ShortName">
														(<xsl:value-of select="vpd:PayerInfo/cat_ru:ShortName"/>)
													</xsl:if>
												</td>
											</tr>
											<tr>
												<td class="graphLittle" align="center">индивидуального предпринимателя или физического лица)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr align="center" valign="top">
								<td>
									<b><xsl:text>Требование о представлении транспортного средства для целей осмотра</xsl:text></b>
								</td>
							</tr>
							<tr align="center" valign="top">
								<td>
									<b><xsl:text>и (или) идентификационной сверки</xsl:text></b>
								</td>
							</tr>
							<tr align="center" valign="top">
								<td>
									<xsl:text>от </xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="vpd:DemandFormDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!-- Основная информация -->
					<div style="text-align: justify">
						<table>
							<tbody>
								<tr style="text-align: justify">
									<td>
										<xsl:text>На основании пункта 17 (5) Правил взимания, исчисления, уплаты и взыскания утилизационного сбора в отношении самоходных машин и (или) и прицепов к ним, а также возврата и зачета излишне уплаченных или излишне взысканных сумм этого сбора (далее – Правила)</xsl:text>
									</td>
								</tr>
								<tr align="justify">
									<td>
										<xsl:text>Вам необходимо представить </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:choose>
													<xsl:when test="vpd:VehicleInfo/vpd:VehicleKind='0'">
														<xsl:text>самоходную машину</xsl:text>
													</xsl:when>
													<xsl:when test="vpd:VehicleInfo/vpd:VehicleKind='1'">
														<xsl:text>прицеп</xsl:text>
													</xsl:when>
												</xsl:choose>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(самоходную машину/прицеп)'"/>
											<xsl:with-param name="width" select="'97mm'"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr align="justify">
									<td>
										<xsl:text>Производитель: </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="vpd:VehicleInfo/vpd:Manufacturer"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="width" select="'126mm'"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr align="justify">
									<td>
										<xsl:text>Марка, модель: </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="vpd:VehicleInfo/vpd:Model"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="width" select="'126mm'"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr align="justify">
									<td>
										<xsl:text>Идентификационный номер (заводской номер): </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="vpd:VehicleInfo/vpd:VINID"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="width" select="'65mm'"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr align="justify">
									<td>
										<xsl:text>в зону таможенного контроля таможенного поста </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:if test="vpd:ZTKCustoms/cat_ru:OfficeName">
													<xsl:value-of select="vpd:ZTKCustoms/cat_ru:OfficeName"/>
													<xsl:text> (</xsl:text>
												</xsl:if>
												<xsl:value-of select="vpd:ZTKCustoms/cat_ru:Code"/>
												<xsl:if test="vpd:ZTKCustoms/cat_ru:OfficeName">
													<xsl:text>)</xsl:text>
												</xsl:if>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(наименование таможенного поста)'"/>
											<xsl:with-param name="width" select="'62mm'"/>
										</xsl:call-template>
										<xsl:text>, расположенную по адресу: </xsl:text>
									</td>
								</tr>
								<tr align="justify">
									<td>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="vpd:ZTKAddress"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(адрес)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr align="justify">
									<td>
										<xsl:text>в срок до </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="vpd:VehiclePresentationTerm"/>
												</xsl:call-template>
												<xsl:if test="vpd:VehiclePresentationTerm">
													<xsl:text>, </xsl:text>
													<xsl:value-of select="substring(vpd:VehiclePresentationTerm, 12, 5)"/>
												</xsl:if>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="dot" select="1"/>
											<xsl:with-param name="description" select="'(время, дата)'"/>
											<xsl:with-param name="width" select="'50mm'"/>
										</xsl:call-template>
										<sup>1</sup>
									</td>
								</tr>
								<tr style="text-align: justify">
									<td>
										<xsl:text>О дате и времени представления транспортного средства или невозможности его представить в установленный срок сообщить по телефону (адресу электронной почты) </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:if test="vpd:CustomsContact/cat_ru:Phone">
													<xsl:text>тел: </xsl:text>
													<xsl:for-each select="vpd:CustomsContact/cat_ru:Phone">
														<xsl:if test="position()!=1">, </xsl:if>
														<xsl:value-of select="."/>
													</xsl:for-each>
												</xsl:if>
												<xsl:if test="not(vpd:CustomsContact/cat_ru:Phone) and vpd:CustomsContact/cat_ru:E_mail">
													<xsl:text>e-mail: </xsl:text>
													<xsl:for-each select="vpd:CustomsContact/cat_ru:E_mail">
														<xsl:if test="position()!=1">, </xsl:if>
														<xsl:value-of select="."/>
													</xsl:for-each>
												</xsl:if>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="dot" select="1"/>
											<xsl:with-param name="width" select="'100mm'"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- Подписи -->
					<div>
						<table style="page-break-inside: avoid;">
							<tbody>
								<tr>
									<td width="40%" class="value" align="center">
										<xsl:apply-templates select="vpd:CustomsPerson" mode="fio"/>
									</td>
									<td width="5%"/>
									<td width="25%" class="value" align="center">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="vpd:DemandDirectionDate"/>
										</xsl:call-template>
									</td>
									<td width="5%"/>
									<td width="25%" class="value" align="center">
										<xsl:text>   </xsl:text>
									</td>
								</tr>
								<tr>
									<td width="40%" class="descr" align="center">
										<xsl:text>(инициалы и фамилия уполномоченного должностного лица ТО)</xsl:text>
									</td>
									<td width="5%"/>
									<td width="25%" class="descr" align="center">
										<xsl:text>(дата направления требования)</xsl:text>
									</td>
									<td width="5%"/>
									<td width="25%" class="descr" align="center">
										<xsl:text>(подпись)</xsl:text>
									</td>
								</tr>
								<tr>
									<td width="40%" class="value" align="center">
										<xsl:apply-templates select="vpd:VehicleOwner" mode="fio"/>
									</td>
									<td width="5%"/>
									<td width="25%" class="value" align="center">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="vpd:DemandReceivingDate"/>
										</xsl:call-template>
									</td>
									<td width="5%"/>
									<td width="25%" class="value" align="center">
										<xsl:text>   </xsl:text>
									</td>
								</tr>
								<tr>
									<td width="40%" class="descr" align="center">
										<xsl:text>(инициалы и фамилия лица, получившего требование)</xsl:text>
									</td>
									<td width="5%"/>
									<td width="25%" class="descr" align="center">
										<xsl:text>(дата получения требования)</xsl:text>
									</td>
									<td width="5%"/>
									<td width="25%" class="descr" align="center">
										<xsl:text>(подпись)</xsl:text>
									</td>
								</tr>
								<tr>
									<td width="100%" colspan="5">
										<br/>
									</td>
								</tr>
								<tr>
									<td width="100%" colspan="5">
										<xsl:text>При направлении требования по почте или иным способом:</xsl:text>
									</td>
								</tr>
								<tr>
									<td width="40%" class="value" align="center">
										<xsl:apply-templates select="vpd:OtherWayDirection"/>
									</td>
									<td width="5%"/>
									<td width="25%" class="value" align="center">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="vpd:DemandDirectionDate"/>
										</xsl:call-template>
									</td>
									<td width="5%"/>
									<td width="25%" class="value" align="center">
										<xsl:text>   </xsl:text>
									</td>
								</tr>
								<tr>
									<td width="40%" class="descr" align="center">
										<xsl:text>(сведения о месте, куда направлено требование, и способе его направления)</xsl:text>
									</td>
									<td width="5%"/>
									<td width="25%" class="descr" align="center">
										<xsl:text>(дата направления требования)</xsl:text>
									</td>
									<td width="5%"/>
									<td width="25%" class="descr" align="center">
										<xsl:text>(инициалы, фамилия и подпись должностного лица ТО, направившего требование)</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<br/><br/><br/>
					<!-- Примечания -->
					<div class="descr" style="text-align: justify">
						<hr/>
						<sup>1</sup>
						<xsl:text> Транспортное средство должно быть размещено в зоне таможенного контроля в период работы таможенного органа.</xsl:text>
					</div>
				</div>
				<div class="page">
					<!-- Раздел I -->
					<div style="text-align: justify">
						<p class="head"><b>Раздел I. Результат осмотра (идентификационной сверки)</b></p>
						<table>
							<tbody>
								<tr style="text-align: justify">
									<td>
										<xsl:text>Идентификационные данные транспортного средства соответствуют/не соответствуют сведениям, представленным в расчете утилизационного сбора </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="vpd:DemandReceivingDate"/>
												</xsl:call-template>
												<xsl:text>, № </xsl:text>
												<xsl:apply-templates select="vpd:InspectionResult/vpd:RegUtil/cat_ru:PrDocumentNumber"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(дата и регистрационный номер расчета утилизационного сбора)'"/>
											<xsl:with-param name="width" select="'100mm'"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr style="text-align: justify">
									<td>
										<xsl:text>При выявлении признаков несоответствия указать корректные данные </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:for-each select="vpd:InspectionResult/vpd:AdjustedData">
													<xsl:if test="position()!=1">; </xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<br/>
					<!-- Подписи -->
					<div>
						<table style="page-break-inside: avoid;">
							<tbody>
								<tr>
									<td width="40%" class="value" align="center">
										<xsl:apply-templates select="vpd:InspectionResult/vpd:InspectionPerson" mode="fio"/>
										<xsl:text>, </xsl:text>
										<xsl:value-of select="vpd:InspectionResult/vpd:InspectionPerson/cat_ru:PersonPost"/>
									</td>
									<td width="5%"/>
									<td width="25%" class="value" align="center">
										<xsl:text>   </xsl:text>
									</td>
									<td width="5%"/>
									<td width="25%" class="value" align="center">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="vpd:InspectionResult/vpd:InspectionEnd"/>
										</xsl:call-template>
										<xsl:if test="vpd:VehiclePresentationTerm">
											<xsl:text>, </xsl:text>
											<xsl:value-of select="substring(vpd:InspectionResult/vpd:InspectionEnd, 12, 5)"/>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td width="40%" class="descr" align="center">
										<xsl:text>(ФИО и должность должностного лица таможенного органа, проводившего осмотр (идентификационную сверку))</xsl:text>
									</td>
									<td width="5%"/>
									<td width="25%" class="descr" align="center">
										<xsl:text>(подпись)</xsl:text>
									</td>
									<td width="5%"/>
									<td width="25%" class="descr" align="center">
										<xsl:text>(дата и время окончания осмотра (идентификационной сверки))</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<br/><br/>
					<!-- Раздел II -->
					<div style="text-align: justify">
						<p class="head"><b>Раздел II. Проведение осмотра (идентификационной сверки) самоходной
машины и или прицепа по месту их фактического нахождения<sup>2</sup></b></p>
						<table>
							<tbody>
								<tr align="justify">
									<td>
										<xsl:text>На основании обращения </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:if test="vpd:InspectionInfo/vpd:PayerInfo/cat_ru:OrganizationName">
													<xsl:value-of select="vpd:InspectionInfo/vpd:PayerInfo/cat_ru:OrganizationName"/>
												</xsl:if>
												<xsl:if test="vpd:InspectionInfo/vpd:PayerInfo/cat_ru:ShortName">
													<xsl:if test="vpd:InspectionInfo/vpd:PayerInfo/cat_ru:OrganizationName">
														<xsl:text> (</xsl:text>
													</xsl:if>
													<xsl:value-of select="vpd:InspectionInfo/vpd:PayerInfo/cat_ru:ShortName"/>
													<xsl:if test="vpd:InspectionInfo/vpd:PayerInfo/cat_ru:OrganizationName">
														<xsl:text>)</xsl:text>
													</xsl:if>
												</xsl:if>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(наименование юридического лица, фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица)'"/>
											<xsl:with-param name="width" select="'107mm'"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr style="text-align: justify">
									<td>
										<xsl:text>от </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="vpd:InspectionInfo/vpd:RequestInfo/cat_ru:PrDocumentDate"/>
												</xsl:call-template>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="width" select="'40mm'"/>
										</xsl:call-template>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:text>№ </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="vpd:InspectionInfo/vpd:RequestInfo/cat_ru:PrDocumentNumber"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="width" select="'50mm'"/>
										</xsl:call-template>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:text>таможенным органом принято решение о проведении осмотра (идентификационной сверки) </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:choose>
													<xsl:when test="vpd:InspectionInfo/vpd:VehicleKind='0'">
														<xsl:text>самоходной машины</xsl:text>
													</xsl:when>
													<xsl:when test="vpd:InspectionInfo/vpd:VehicleKind='1'">
														<xsl:text>прицепа</xsl:text>
													</xsl:when>
												</xsl:choose>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(самоходной машины/прицепа)'"/>
											<xsl:with-param name="width" select="'60mm'"/>
										</xsl:call-template>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:text>по месту их фактического нахождения </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="vpd:InspectionInfo/vpd:VehicleAddress"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="dot" select="1"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr style="text-align: justify">
									<td>
										<xsl:text>Дата и время проведения осмотра (идентификационной сверки) </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="vpd:InspectionInfo/vpd:InspectionDateTime"/>
												</xsl:call-template>
												<xsl:if test="vpd:InspectionInfo/vpd:InspectionDateTime">
													<xsl:text>, </xsl:text>
													<xsl:value-of select="substring(vpd:InspectionInfo/vpd:InspectionDateTime, 12, 5)"/>
												</xsl:if>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="dot" select="1"/>
											<xsl:with-param name="width" select="'50mm'"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- Подписи -->
					<div>
						<table style="page-break-inside: avoid;">
							<tbody>
								<tr>
									<td>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="vpd:InspectionInfo/vpd:DecisionCustomsPerson" mode="fio"/>
												<xsl:text>, </xsl:text>
												<xsl:value-of select="vpd:InspectionInfo/vpd:DecisionCustomsPerson/cat_ru:PersonPost"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'(ФИО и должность должностного лица таможенного органа)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<br/><br/><br/>
					<!-- Примечания -->
					<div class="descr" style="text-align: justify">
						<hr/>
						<sup>2</sup>
						<xsl:text> Абзац второй пункта 17 (5) Правил.</xsl:text>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="vpd:ZTKAddress | vpd:InspectionInfo/vpd:VehicleAddress">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
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
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="fio">
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonName" mode="initial"/>
		<xsl:apply-templates select="cat_ru:PersonMiddleName" mode="initial"/>
	</xsl:template>
	<xsl:template match="*" mode="initial">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="concat(substring(., 1, 1), '.')"/>
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
	<xsl:template match="//*[local-name()='VehiclePresentDemand']//*" priority="-1">
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
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="list" select="0"/>
		<xsl:param name="comma" select="0"/>
		<xsl:param name="dot" select="0"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0 and $list=0 and $dot=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
			</xsl:choose>.
		</xsl:variable>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value" width="{$width_td1}">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="$data"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</td>
					<xsl:if test="$comma != 0">
						<td width="1%" valign="bottom">,</td>
					</xsl:if>
					<xsl:if test="$list != 0">
						<td width="1%" valign="bottom">;</td>
					</xsl:if>
					<xsl:if test="$dot != 0">
						<td width="1%" valign="bottom">.</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$description"/>
					</td>
					<xsl:if test="$comma != 0 or $list != 0 or $dot != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>