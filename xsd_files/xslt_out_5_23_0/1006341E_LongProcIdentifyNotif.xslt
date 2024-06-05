<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.23.0" xmlns:lpid_notif="urn:customs.ru:Information:CustomsDocuments:LongProcIdentifyNotif:5.23.0">
	<!-- Шаблон для типа LongProcIdentifyNotifType -->
	<xsl:template match="lpid_notif:LongProcIdentifyNotif">
	<xsl:param name="w" select="190" />
		<html>
			<head>
				<style>
					body
					{background: #cccccc;}

					div
					{white-space: normal;}

					div.page
					{margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.marg-top
					{margin-top:5mm;}

					table
					{width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					table.border tr td
					{border: 1px solid windowtext;}

					.value
					{border-bottom: solid 1px black;
					font-family: Arial;
					font-size: 11pt;
					font-style: italic;}

					.annot
					{font-family: Arial;
					font-size: 11pt;}

					.title
					{font-weight:bold;
					font-family: Arial;
					font-size: 11pt;}

					tr.title td
					{font-weight:bold;
					font-family: Arial;
					font-size: 9pt;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}
				</style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Уведомления по идентификации товаров</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br />
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="cat_ru:DocumentID" />
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:RefDocumentID" />
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Тип документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="lpid_notif:TypeDoc='1'">
										<xsl:text>Уведомление об идентификации (невозможности идентификации) товаров заявленным способом</xsl:text>
									</xsl:when>
									<xsl:when test="lpid_notif:TypeDoc='2'">
										<xsl:text>Требование о представлении Заявления о проведении идентификации товаров</xsl:text>
									</xsl:when>
									<xsl:when test="lpid_notif:TypeDoc='3'">
										<xsl:text>Уведомление о невозможности идентификации товаров в продуктах их переработки</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="lpid_notif:TypeDoc" />
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="lpid_notif:Customs">
						<div class="title marg-top">Таможенный орган</div>
						<div>
							<xsl:apply-templates select="lpid_notif:Customs">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="lpid_notif:DeclaredMethod">
						<div class="title marg-top">Сведения, необходимые для Уведомления об идентификации (невозможности идентификации) товаров заявленным способом</div>
						<div>
							<xsl:apply-templates select="lpid_notif:DeclaredMethod">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="lpid_notif:ApplicationSubmission">
						<div class="title marg-top">Сведения, необходимые для Требования о представлении Заявления о проведении идентификации товаров</div>
						<div>
							<xsl:apply-templates select="lpid_notif:ApplicationSubmission">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="lpid_notif:ProductOfProcessing">
						<div class="title marg-top">Сведения, необходимые для Уведомления о невозможности идентификации товаров в продуктах их переработки</div>
						<div>
							<xsl:apply-templates select="lpid_notif:ProductOfProcessing">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="lpid_notif:CustomsPerson">
						<div class="title marg-top">Подпись должностного лица</div>
						<div>
							<xsl:apply-templates select="lpid_notif:CustomsPerson">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="lpid_notif:AppIdentif">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:CustomsCode" />
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date" />
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:GTDNumber" />
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа lpid_notif:ApplicationSubmissionType -->
	<xsl:template match="lpid_notif:ApplicationSubmission">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="lpid_notif:DTNumber">
				<div class="title marg-top">Номер ДТ, в которой заявлены товары, в отношении которых требуется представление Заявления о проведении идентификации товаров</div>
				<div>
					<xsl:apply-templates select="lpid_notif:DTNumber">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер товара в ДТ, в отношении которого требуется представление Заявления о проведении идентификации товаров</td>
					<td class="value graphMain" style="width:50%">
						<xsl:for-each select="lpid_notif:GoodsNumeric">
							<xsl:if test="position()!=1">, </xsl:if>
							<xsl:apply-templates select="." />
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="lpid_notif:CurrentDT">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:CustomsCode" />
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date" />
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:GTDNumber" />
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="lpid_notif:Customs">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:Code" />
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:OfficeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OfficeName" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа lpid_notif:CustomsPersonSignatureType -->
	<xsl:template match="lpid_notif:CustomsPerson">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PersonName" />
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:LNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:LNP" />
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата подписания</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="lpid_notif:IssueDate" mode="russian_date" />
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="lpid_notif:DTNumber">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:CustomsCode" />
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date" />
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:GTDNumber" />
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа lpid_notif:DeclaredMethod/lpid_notif:Decision -->
	<xsl:template match="*" mode="DecisionDM">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="lpid_notif:GoodsNumeric" />
				</td>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="lpid_notif:DecisionText='1'">
							<xsl:text>товар идентифицирован</xsl:text>
						</xsl:when>
						<xsl:when test="lpid_notif:DecisionText='2'">
							<xsl:text>товар не идентифицирован</xsl:text>
						</xsl:when>
						<xsl:when test="lpid_notif:DecisionText='3'">
							<xsl:text>товар не идентифицирован в продуктах переработки</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="lpid_notif:DecisionText" />
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="lpid_notif:Justification" />
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа lpid_notif:ProductOfProcessing/lpid_notif:Decision -->
	<xsl:template match="*" mode="DecisionPOP">
		<xsl:param name="wdth" select="0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" />
		<xsl:variable name="w" select="$wdth - 5" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер товара в ДТ, в которой заявлен идентифицируемый товар (продукты переработки)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="lpid_notif:GoodsNumeric" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" />
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Решение таможенного органа об идентификации товара</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
							<xsl:when test="lpid_notif:DecisionText='1'">
								<xsl:text>товар идентифицирован</xsl:text>
							</xsl:when>
							<xsl:when test="lpid_notif:DecisionText='2'">
								<xsl:text>товар не идентифицирован</xsl:text>
							</xsl:when>
							<xsl:when test="lpid_notif:DecisionText='3'">
								<xsl:text>товар не идентифицирован в продуктах переработки</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="lpid_notif:DecisionText" />
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<xsl:if test="lpid_notif:Justification" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Обоснование решения таможенного органа о невозможности идентификации товара</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="lpid_notif:Justification" />
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа lpid_notif:DeclaredMethodType -->
	<xsl:template match="lpid_notif:DeclaredMethod">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="lpid_notif:AppIdentif">
				<div class="title marg-top">Регистрационный номер Заявления о проведении идентификации товаров</div>
				<div>
					<xsl:apply-templates select="lpid_notif:AppIdentif">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="lpid_notif:PreviousDT">
				<div class="title marg-top">Номер предшествующей ДТ, в которой были заявлены идентифицируемые товары при помещении под предшествующую таможенную процедуру</div>
				<div>
					<xsl:apply-templates select="lpid_notif:PreviousDT">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="lpid_notif:CurrentDT">
				<div class="title marg-top">Номер ДТ, в которой заявлены идентифицируемые товары</div>
				<div>
					<xsl:apply-templates select="lpid_notif:CurrentDT">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<div class="title marg-top">Решение таможенного органа об идентификации товаров</div>
			<table class="bordered">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Порядковый номер товара в ДТ, в которой заявлен идентифицируемый товар (продукты переработки)</td>
						<td class="graphMain bordered">Решение таможенного органа об идентификации товара</td>
						<td class="graphMain bordered">Обоснование решения таможенного органа о невозможности идентификации товара</td>
					</tr>
					<xsl:for-each select="lpid_notif:Decision">
						<xsl:apply-templates select="." mode="DecisionDM">
							<xsl:with-param name="wdth" select="$w" />
						</xsl:apply-templates>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catProc_ru:PermitNumberType -->
	<xsl:template match="lpid_notif:PermitNumber">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего Разрешение</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="catProc_ru:CustomsCode" />
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации Разрешения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="catProc_ru:RegistrationDate" mode="russian_date" />
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенной процедуры переработки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="catProc_ru:ProcessingProcedureCode='21'">
								<xsl:text>переработка вне ТТ</xsl:text>
							</xsl:when>
							<xsl:when test="catProc_ru:ProcessingProcedureCode='51'">
								<xsl:text>переработка на ТТ</xsl:text>
							</xsl:when>
							<xsl:when test="catProc_ru:ProcessingProcedureCode='91'">
								<xsl:text>переработка для внутреннего потребления</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="catProc_ru:ProcessingProcedureCode" />
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер Разрешения по журналу регистрации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="catProc_ru:Number" />
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="lpid_notif:PreviousDT">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:CustomsCode" />
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date" />
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:GTDNumber" />
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа lpid_notif:ProductOfProcessingType -->
	<xsl:template match="lpid_notif:ProductOfProcessing">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="lpid_notif:PermitNumber">
				<div class="title marg-top">Регистрационный номер Разрешения на переработку товаров</div>
				<div>
					<xsl:apply-templates select="lpid_notif:PermitNumber">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="lpid_notif:PreviousDT">
				<div class="title marg-top">Номер предшествующей ДТ, в которой были заявлены идентифицируемые товары при помещении под предшествующую таможенную процедуру</div>
				<div>
					<xsl:apply-templates select="lpid_notif:PreviousDT">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="lpid_notif:ProductOfProcessingDT">
				<div class="title marg-top">Номер ДТ, в которой заявлены продукты переработки</div>
				<div>
					<xsl:apply-templates select="lpid_notif:ProductOfProcessingDT">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="lpid_notif:Decision">
				<div class="title marg-top">Решение таможенного органа о невозможности идентификации товаров</div>
				<div>
					<xsl:apply-templates select="lpid_notif:Decision" mode="DecisionPOP">
						<xsl:with-param name="wdth" select="$w" />
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="lpid_notif:ProductOfProcessingDT">
		<xsl:param name="wdth" select="0" />
		<xsl:variable name="w" select="$wdth - 5" />
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:CustomsCode" />
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date" />
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:GTDNumber" />
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn" />
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)" />
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)" />
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='LongProcIdentifyNotif']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()" />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates />
		</element>
	</xsl:template>
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="." />
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()" />
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])" />
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath" />
	</xsl:template>
	<xsl:template match="*" mode="date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="." />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="." />
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="." />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="." />
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="." />
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')" />
		</element>
	</xsl:template>
</xsl:stylesheet>