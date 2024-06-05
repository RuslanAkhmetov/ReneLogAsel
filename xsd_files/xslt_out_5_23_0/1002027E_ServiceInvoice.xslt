<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="s_inv catComFin_ru cat_ru" version="1.0" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.22.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0" xmlns:s_inv="urn:customs.ru:Information:CommercialFinanceDocuments:ServiceInvoice:5.22.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
	<xsl:template match="//*[local-name()='ServiceInvoice']//*" priority="-1">
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
   <xsl:template match="s_inv:ServiceInvoice">
      <html>
         <head>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <title>СЧЕТ-ФАКТУРА на оплату услуг по перевозке (транспортировке) погрузке перегрузке/разгрузкепо и по страхованию товаров</title>
            <style type="text/css">
					body {	text-align: center; background: #cccccc; }
					table { border: 0; cellpadding: 3; cellspacing: 0; width:100%; border-collapse: collapse; }
					td { font-size: 6.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ padding-left:4pt }
					td.bold { font-size: 8.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: bottom; /*white-space: nowrap;*/ }					
					td.value { font-size: 10.0pt; font-family: Courier; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ }
					td.border-left { border-left: medium none; border-right: .5pt solid black; }
					td.border { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }
					td.border-left { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: medium none; } 
					td.border-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; } 
					td.border-top { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-bottom { border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; } 
					td.border-top-bottom { border-left: medium none; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; } 
					td.border-top-right { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-top-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext; }
					td.border-left-right-bottom { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-right-top { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; }
					td.border-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-bottom { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-right { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; }
					td.border-left-top { border-left: .5pt solid windowtext; border-right: medium none; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					td.border-right-top { border-left: medium none; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: medium none; } 
					span.bold { font-size: 12.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; }					
					span.value { font-size: 12.0pt; font-family: Courier; color: windowtext; }
					div.page { width: 297mm; height: 210mm; margin-top: 6pt; margin-bottom: 6pt; padding:	10mm; padding-left:	20mm; background: #ffffff; border: solid 1pt #000000; }
					p.number-date { font-weight: bold; }
					.bordered {	border: solid 1pt #000000; padding-top:4pt; padding-bottom:4pt; }
					.underlined { border-bottom: solid 0.8pt #000000; }
					.graph { font-family: Arial; font-size: 7pt; }
					.graph-number { font-size: 9pt; font-weight: bold; }
					.graphMain {font-family: Arial;font-size: 10pt;font-weight: normal;}
			</style>
         </head>
         <body>
            <div class="page">
               <table border="0" style="width: 100%;">
                  <tbody>
                     <tr>
                        <td align="center" style=" font-size: 11.0pt;font-weight: 600;">
                           <xsl:if test="s_inv:DocumentSign='0'">
								СЧЕТ-ФАКТУРА на оплату услуг по страхованию товаров</xsl:if>
                           <xsl:if test="s_inv:DocumentSign='1'">
								СЧЕТ-ФАКТУРА на оплату услуг по перевозке (транспортировке) погрузке перегрузке/разгрузке товаров</xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" style=" font-size: 11.0pt;font-weight: 600;">
							№ <u>
                              <xsl:apply-templates select="s_inv:Registration/cat_ru:PrDocumentNumber"/>
                           </u> от 
							<u>
                              <xsl:apply-templates select="s_inv:Registration/cat_ru:PrDocumentDate" mode="russian_date"/>
                           </u>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <br/>
               <xsl:if test="(s_inv:DocumentSign='0') or (s_inv:DocumentSign='f') or (s_inv:DocumentSign='false')">
                  <xsl:call-template name="Strahovschik"/>
               </xsl:if>
               <xsl:if test="(s_inv:DocumentSign='1') or (s_inv:DocumentSign='t') or (s_inv:DocumentSign='true')">
                  <xsl:call-template name="Carrier"/>
               </xsl:if>
               <br/>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template name="Strahovschik">
      <table border="0" style="width: 210mm;">
         <tbody>
            <tr>
               <td align="left" class="graphMain">Страховщик</td>
               <td class="graphMain" style="border-bottom: solid 0.8pt #000000;">
                  <xsl:apply-templates select="s_inv:ServiceProvider/catComFin_ru:Name"/>
               </td>
            </tr>
            <tr>
               <td class="graphMain" style="width: 70mm">ИНН/КПП страховщика</td>
               <td class="graphMain" style="border-bottom: solid 0.8pt #000000;">
                  <xsl:apply-templates select="s_inv:ServiceProvider/catComFin_ru:CompanyID"/> ⁄ <xsl:apply-templates select="s_inv:ServiceProvider/catComFin_ru:KPPCode"/>
               </td>
            </tr>
            <td class="graphMain" style="width: 70mm">Адрес</td>
            <td class="graphMain" style="border-bottom: solid 0.8pt #000000;width: 160mm">
               <xsl:call-template name="Address">
                  <xsl:with-param name="adr" select="s_inv:ServiceProvider/s_inv:PostalAddress"/>
               </xsl:call-template>
            </td>
            <xsl:call-template name="BankRequisitions"/>
            <tr>
               <td class="graphMain" style="width: 70mm">Страховой полис</td>
               <xsl:call-template name="Doc">
                  <xsl:with-param name="docum" select="s_inv:Insurance"/>
               </xsl:call-template>
            </tr>
            <tr>
               <td class="graphMain" style="width: 70mm">К платежно-расчетному документу </td>
               <xsl:call-template name="Doc">
                  <xsl:with-param name="docum" select="s_inv:PaymentDocument"/>
               </xsl:call-template>
            </tr>
            <tr>
               <td class="graphMain" style="width: 70mm">Реквизиты договора страхования товаров</td>
               <xsl:call-template name="Doc">
                  <xsl:with-param name="docum" select="s_inv:ContractDetails"/>
               </xsl:call-template>
            </tr>
            <tr>
               <td class="graphMain" style="width: 70mm">Страхователь</td>
               <td class="graphMain" style="border-bottom: solid 0.8pt #000000;">
                  <xsl:apply-templates select="s_inv:ServiceConsumer/cat_ru:OrganizationName"/> 
					</td>
            </tr>
            <tr>
               <td class="graphMain" style="width: 70mm">ИНН/КПП страхователя</td>
               <td class="graphMain" style="border-bottom: solid 0.8pt #000000;">
                  <xsl:apply-templates select="s_inv:ServiceConsumer/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> ⁄ 
						<xsl:apply-templates select="s_inv:ServiceConsumer/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> 
					</td>
            </tr>
            <tr>
               <td class="graphMain" style="width: 70mm">Адрес</td>
               <td class="graphMain" style="border-bottom: solid 0.8pt #000000;width: 160mm">
					<xsl:if test="s_inv:ServiceConsumer/RUScat_ru:SubjectAddressDetails">
						<xsl:for-each select="s_inv:ServiceConsumer/RUScat_ru:SubjectAddressDetails">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()">; </xsl:if>
						</xsl:for-each>
					</xsl:if>
               </td>
            </tr>
            <xsl:call-template name="InsuranceService"/>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template name="Carrier">
      <table border="0" style="width: 210mm;">
         <tbody>
            <tr>
               <td class="graphMain" style="width: 70mm">Экспедитор/Перевозчик</td>
               <td class="graphMain" style="border-bottom: solid 0.8pt #000000;">
                  <xsl:apply-templates select="s_inv:ServiceProvider/catComFin_ru:Name"/>
               </td>
            </tr>
            <tr>
               <td class="graphMain" style="width: 70mm">ИНН/КПП экспедитора/перевозчика</td>
               <td class="graphMain" style="border-bottom: solid 0.8pt #000000;">
                  <xsl:apply-templates select="s_inv:ServiceProvider/catComFin_ru:CompanyID"/> ⁄ <xsl:apply-templates select="s_inv:ServiceProvider/catComFin_ru:KPPCode"/>
               </td>
            </tr>
            <tr>
				<xsl:call-template name="BankRequisitions"/>
				<td class="graphMain" style="width: 70mm">Адрес</td>
				<td class="graphMain" style="border-bottom: solid 0.8pt #000000;width: 160mm">
				   <xsl:call-template name="Address">
					  <xsl:with-param name="adr" select="s_inv:ServiceProvider/s_inv:PostalAddress"/>
				   </xsl:call-template>
				</td>
            </tr>
            <tr>
               <td class="graphMain" style="width: 70mm">Грузоотправитель и его адрес</td>
               <td class="graphMain" style="border-bottom: solid 0.8pt #000000;">
                  <xsl:apply-templates select="s_inv:Consignor/cat_ru:OrganizationName"/> 
					<xsl:if test="s_inv:Consignor/RUScat_ru:SubjectAddressDetails">
						<xsl:for-each select="s_inv:Consignor/RUScat_ru:SubjectAddressDetails">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()">; </xsl:if>
						</xsl:for-each>
					</xsl:if>
               </td>
            </tr>
            <tr>
               <td class="graphMain" style="width: 70mm">Грузополучатель и его адрес</td>
               <td class="graphMain" style="border-bottom: solid 0.8pt #000000;">
                  <xsl:apply-templates select="s_inv:Consignee/cat_ru:OrganizationName"/> 
					<xsl:if test="s_inv:Consignee/RUScat_ru:SubjectAddressDetails">
						<xsl:for-each select="s_inv:Consignee/RUScat_ru:SubjectAddressDetails">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()">; </xsl:if>
						</xsl:for-each>
					</xsl:if>
               </td>
            </tr>
            <tr>
               <td class="graphMain" style="width: 70mm">К платежно-расчетному документу </td>
				   <xsl:call-template name="Doc">
					  <xsl:with-param name="docum" select="s_inv:PaymentDocument"/>
				   </xsl:call-template>
            </tr>
            <tr>
               <td class="graphMain" style="width: 70mm">Реквизиты договора транспортной перевозки (экспедиции) товаров</td>
				   <xsl:call-template name="Doc">
					  <xsl:with-param name="docum" select="s_inv:ContractDetails"/>
				   </xsl:call-template>
            </tr>
            <tr>
               <td class="graphMain" style="width: 70mm">Клиент (Заказчик)</td>
               <td class="graphMain" style="border-bottom: solid 0.8pt #000000;">
                  <xsl:apply-templates select="s_inv:ServiceConsumer/cat_ru:OrganizationName"/> 
				</td>
            </tr>
            <tr>
               <td class="graphMain" style="width: 70mm">ИНН/КПП клиента (заказчика)</td>
               <td class="graphMain" style="border-bottom: solid 0.8pt #000000;">
                  <xsl:apply-templates select="s_inv:ServiceConsumer/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> ⁄ 
						<xsl:apply-templates select="s_inv:ServiceConsumer/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> 
					</td>
            </tr>
            <tr>
               <td class="graphMain" style="width: 70mm">Адрес</td>
               <td class="graphMain" style="border-bottom: solid 0.8pt #000000;width: 160mm">
					<xsl:if test="s_inv:ServiceConsumer/RUScat_ru:SubjectAddressDetails">
						<xsl:for-each select="s_inv:ServiceConsumer/RUScat_ru:SubjectAddressDetails">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()">; </xsl:if>
						</xsl:for-each>
					</xsl:if>
               </td>
            </tr>
            <xsl:call-template name="TransportService"/>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template name="BankRequisitions">
      <tr>
         <td class="graphMain" style="width: 40mm">Банковские реквизиты</td>
         <td class="graphMain" style="border-bottom: solid 0.8pt #000000;width: 160mm">
            <xsl:for-each select="s_inv:ServiceProvider/s_inv:PaymentRequisitions">
					Банк: <xsl:apply-templates select="catComFin_ru:BankName"/> 
					<xsl:if test="catComFin_ru:OKPOID">ОКПО: <xsl:apply-templates select="catComFin_ru:OKPOID"/>; </xsl:if>
               <xsl:if test="catComFin_ru:BICID">БИК: <xsl:apply-templates select="catComFin_ru:BICID"/>; </xsl:if>
               <xsl:if test="catComFin_ru:SWIFTID">SWIFT: <xsl:apply-templates select="catComFin_ru:SWIFTID"/>; </xsl:if>
               <xsl:if test="catComFin_ru:AccountNumeric">Корр.счет: <xsl:apply-templates select="catComFin_ru:AccountNumeric"/>; </xsl:if>
					Валютные счета организации:
					<xsl:if test="catComFin_ru:CurrentCurrencyAccount">Текущий: <xsl:apply-templates select="catComFin_ru:CurrentCurrencyAccount"/>; </xsl:if>
               <xsl:if test="catComFin_ru:TransitCurrencyAccount">Транзитный: <xsl:apply-templates select="catComFin_ru:TransitCurrencyAccount"/>; </xsl:if>
               <xsl:if test="catComFin_ru:SpecialTransitCurrencyAccount">Транзитный(спец): <xsl:apply-templates select="catComFin_ru:SpecialTransitCurrencyAccount"/>; </xsl:if>
               <xsl:if test="catComFin_ru:RoubleCurrencyAccount">Рублевый счет: <xsl:apply-templates select="catComFin_ru:RoubleCurrencyAccount"/>; </xsl:if>
               <br/>
            </xsl:for-each>
         </td>
      </tr>
   </xsl:template>
   <xsl:template name="Address">
      <xsl:param name="adr"/>
      <xsl:apply-templates select="$adr/cat_ru:StreetHouse"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:apply-templates select="$adr/cat_ru:City"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:if test="string($adr/cat_ru:PostalCode)!=''">
         <xsl:apply-templates select="$adr/cat_ru:PostalCode"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </xsl:if>
      <xsl:apply-templates select="$adr/cat_ru:CounryName"/>
   </xsl:template>
   <xsl:template name="Doc">
      <xsl:param name="docum"/>
      <td valign="bottom" class="graphMain" style="border-bottom: solid 0.8pt #000000;width: 160mm;vertical-align:bottom;">
		  <xsl:for-each select="$docum">
			 № <xsl:apply-templates select="cat_ru:PrDocumentNumber"/> 
					<span class="graphMain">от </span>
				<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
				<xsl:if test="position()!=last()"><br/></xsl:if>
		  </xsl:for-each>
         </td>
   </xsl:template>
   <xsl:template name="InsuranceService">
      <table border="1" style="border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext;border-bottom: .5pt solid windowtext;width: 210mm;">
         <tbody>
            <br/>
            <br/>
            <tr>
               <td class="graph" style="width:30mm;">Наименование (описание выполненных работ, оказанных услуг)</td>
               <td class="graph" style="width:30mm;">Краткое наименование товара</td>
               <td class="graph" style="width:20mm;">Количество</td>
               <td class="graph" style="width:20mm;">Стоимость товара (код валюты)</td>
               <td class="graph" style="width:20mm;">Страховая сумма (код валюты)</td>
               <td class="graph" style="width:20mm;">Тариф страхового взноса (%)</td>
               <td class="graph" style="width:30mm;">Налоговая ставка (%)</td>
               <td class="graph" style="width:20mm;">Сумма налога</td>
               <td class="graph" style="width:20mm;">Страховой взнос (код валюты), всего с учетом налога</td>
            </tr>
            <tr>
               <td>1</td>
               <td>2</td>
               <td>3</td>
               <td>4</td>
               <td>5</td>
               <td>6</td>
               <td>7</td>
               <td>8</td>
               <td>9</td>
            </tr>
            <xsl:for-each select="s_inv:ServiceDescription">
               <tr>
                  <td class="graph" style="width:30mm;">
                     <xsl:apply-templates select="s_inv:ServiceName"/>
                  </td>
                  <td class="graph" style="width:30mm;">
                     <xsl:apply-templates select="s_inv:GoodsDescription"/>
                  </td>
                  <td class="graph" style="width:20mm;">
                     <xsl:apply-templates select="s_inv:GoodsQuantity/cat_ru:GoodsQuantity"/>
                  </td>
                  <td class="graph" style="width:20mm;">
                     <xsl:apply-templates select="s_inv:GCost"/>
                     <xsl:if test="s_inv:CurrencyCode"> (<xsl:apply-templates select="s_inv:CurrencyCode"/>)</xsl:if>
                  </td>
                  <td class="graph" style="width:20mm;">
                     <xsl:apply-templates select="s_inv:InsuranceSum/s_inv:Amount"/>
                     <xsl:if test="s_inv:InsuranceSum/s_inv:Currency"> (<xsl:apply-templates select="s_inv:InsuranceSum/s_inv:Currency"/>)</xsl:if>
                  </td>
                  <td class="graph" style="width:20mm;">
                     <xsl:apply-templates select="s_inv:InsuranceRate"/>
                  </td>
                  <td class="graph" style="width:30mm;">
                     <xsl:apply-templates select="s_inv:TaxRate"/>
                  </td>
                  <td class="graph" style="width:20mm;">
                     <xsl:apply-templates select="s_inv:TaxSum"/>
                  </td>
                  <td class="graph" style="width:20mm;">
                     <xsl:apply-templates select="s_inv:ServiceCost/s_inv:Amount"/>
                     <xsl:if test="s_inv:ServiceCost/s_inv:Currency"> (<xsl:apply-templates select="s_inv:ServiceCost/s_inv:Currency"/>)</xsl:if>
                  </td>
               </tr>
            </xsl:for-each>
            <tr style="height:17px">
               <td class="graph"/>
               <td class="graph" colspan="3"> Всего к оплате <xsl:apply-templates select="s_inv:TotalServiceCost"/>
                  <xsl:if test="s_inv:Currency"> (<xsl:apply-templates select="s_inv:Currency"/>)</xsl:if>
               </td>
               <td class="graph"/>
               <td class="graph"/>
               <td class="graph"/>
               <td class="graph"/>
               <td class="graph"/>
            </tr>
         </tbody>
      </table>
      <table border="0" style="width: 210mm;">
         <tbody>
            <br/>
            <br/>
            <tr>
               <td style="width:60mm;">
                  <span class="graphMain">
                                        Руководитель организации
                                    </span>
               </td>
               <td align="center" class="underlined" style="width:120mm;font-family: Arial;font-size: 9pt;font-weight: normal;">
                  <xsl:apply-templates select="s_inv:SignatureDirectorChiefAccountant/s_inv:Director/cat_ru:PersonSurname"/> 
									<xsl:apply-templates select="s_inv:SignatureDirectorChiefAccountant/s_inv:Director/cat_ru:PersonName"/> 
									<xsl:apply-templates select="s_inv:SignatureDirectorChiefAccountant/s_inv:Director/cat_ru:PersonMiddleName"/>
               </td>
               <td style="width:30mm;">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </td>
            </tr>
            <tr>
               <td style="width:60mm;">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </td>
               <td align="center" style="width:120mm;" valign="top">
                  <span class="graph">(подпись) (ф.и.о.)</span>
               </td>
               <td style="width:30mm;">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </td>
            </tr>
            <tr>
               <td style="width:60mm;">
                  <span class="graphMain">Главный бухгалтер</span>
               </td>
               <td align="center" class="underlined" style="width:120mm;font-family: Arial;font-size: 9pt;font-weight: normal;">
                  <xsl:apply-templates select="s_inv:SignatureDirectorChiefAccountant/s_inv:ChiefAccountant/cat_ru:PersonSurname"/> 
									<xsl:apply-templates select="s_inv:SignatureDirectorChiefAccountant/s_inv:ChiefAccountant/cat_ru:PersonName"/> 
									<xsl:apply-templates select="s_inv:SignatureDirectorChiefAccountant/s_inv:ChiefAccountant/cat_ru:PersonMiddleName"/>
               </td>
               <td style="width:30mm;">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </td>
            </tr>
            <tr>
               <td style="width:60mm;">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </td>
               <td align="center" style="width:120mm;" valign="top">
                  <span class="graph">(подпись) (ф.и.о.)</span>
               </td>
               <td style="width:30mm;">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template name="TransportService">
      <table border="1" style="border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext;border-bottom: .5pt solid windowtext;width: 210mm;">
         <tbody>
            <br/>
            <br/>
            <tr style="border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: .5pt solid windowtext; border-bottom: .5pt solid windowtext;width: 210mm;">
               <td class="graph" style="width:30mm;">Наименование (описание выполненных работ, оказанных услуг)</td>
               <td class="graph" style="width:20mm">Единица измерения</td>
               <td class="graph" style="width:20mm">Количество</td>
               <td class="graph" style="width:20mm">Цена (тариф) за единицу измерения (код валюты)</td>
               <td class="graph" style="width:20mm">Стоимость услуг по перевозке (транспортировке) товаров, всего без налога (код валюты)</td>
               <td class="graph" style="width:20mm">Стоимость работ по погрузке перегрузке/разгрузке товаров, всего без налога (код валюты)</td>
               <td class="graph" style="width:30mm">Налоговая ставка (%)</td>
               <td class="graph" style="width:30mm">Сумма налога</td>
               <td class="graph" style="width:30mm">Стоимость работ, услуг, всего с учетом налога (код валюты)</td>
            </tr>
            <tr>
               <td>1</td>
               <td>2</td>
               <td>3</td>
               <td>4</td>
               <td>5</td>
               <td>6</td>
               <td>7</td>
               <td>8</td>
               <td>9</td>
            </tr>
            <xsl:for-each select="s_inv:ServiceDescription">
               <tr>
                  <td class="graph" style="width:30mm;">
                     <xsl:apply-templates select="s_inv:ServiceName"/>
                  </td>
                  <td class="graph">
                     <xsl:if test="s_inv:GoodsQuantity/cat_ru:MeasureUnitQualifierName">
                        <xsl:apply-templates select="s_inv:GoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
                     </xsl:if>
                     <xsl:if test="s_inv:GoodsQuantity/cat_ru:MeasureUnitQualifierCode"> (<xsl:apply-templates select="s_inv:GoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
                  </td>
                  <td class="graph">
                     <xsl:apply-templates select="s_inv:GoodsQuantity/cat_ru:GoodsQuantity"/>
                  </td>
                  <td class="graph">
                     <xsl:apply-templates select="s_inv:ServicePrice/s_inv:Amount"/>
                     <xsl:if test="s_inv:GoodsQuantity/s_inv:Currency"> (<xsl:apply-templates select="s_inv:GoodsQuantity/s_inv:Currency"/>)</xsl:if>
                  </td>
                  <td class="graph">
                     <xsl:apply-templates select="s_inv:TransportCost/s_inv:Amount"/>
                     <xsl:if test="s_inv:TransportCost/s_inv:Currency"> (<xsl:apply-templates select="s_inv:TransportCost/s_inv:Currency"/>)</xsl:if>
                  </td>
                  <td class="graph">
                     <xsl:apply-templates select="s_inv:LoadingCost/s_inv:Amount"/>
                     <xsl:if test="s_inv:LoadingCost/s_inv:Currency"> (<xsl:apply-templates select="s_inv:LoadingCost/s_inv:Currency"/>)</xsl:if>
                  </td>
                  <td class="graph" style="width:30mm">
                     <xsl:apply-templates select="s_inv:TaxRate"/>
                  </td>
                  <td class="graph" style="width:30mm">
                     <xsl:apply-templates select="s_inv:TaxSum"/>
                  </td>
                  <td class="graph" style="width:30mm">
                     <xsl:apply-templates select="s_inv:ServiceCost/s_inv:Amount"/>
                     <xsl:if test="s_inv:ServiceCost/s_inv:Currency"> (<xsl:apply-templates select="s_inv:ServiceCost/s_inv:Currency"/>)</xsl:if>
                  </td>
               </tr>
            </xsl:for-each>
            <tr style="height:17px">
               <td class="graph"/>
               <td class="graph" colspan="3"> Всего к оплате <xsl:apply-templates select="s_inv:TotalServiceCost"/>
                  <xsl:if test="s_inv:Currency"> (<xsl:apply-templates select="s_inv:Currency"/>)</xsl:if>
               </td>
               <td class="graph"/>
               <td class="graph"/>
               <td class="graph"/>
               <td class="graph"/>
               <td class="graph"/>
            </tr>
         </tbody>
      </table>
      <table border="0" style="width: 210mm;">
         <tbody>
            <br/>
            <br/>
            <tr>
               <td style="width:25mm;">
                  <span class="graphMain">
                                        Руководитель организации
                                    </span>
               </td>
               <td align="center" class="underlined" style="width:80mm;font-family: Arial;font-size: 9pt;font-weight: normal;">
                  <br/>
                  <xsl:apply-templates select="s_inv:SignatureDirectorChiefAccountant/s_inv:Director/cat_ru:PersonSurname"/> 
						<xsl:apply-templates select="s_inv:SignatureDirectorChiefAccountant/s_inv:Director/cat_ru:PersonName"/> 
						<xsl:apply-templates select="s_inv:SignatureDirectorChiefAccountant/s_inv:Director/cat_ru:PersonMiddleName"/>
               </td>
               <!--<td style="width:5mm;">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</td>-->
               <td style="width:25mm;">
                  <span class="graphMain">Главный бухгалтер</span>
               </td>
               <td align="center" class="underlined" style="width:80mm;font-family: Arial;font-size: 9pt;font-weight: normal;">
                  <br/>
                  <xsl:apply-templates select="s_inv:SignatureDirectorChiefAccountant/s_inv:ChiefAccountant/cat_ru:PersonSurname"/> 
						<xsl:apply-templates select="s_inv:SignatureDirectorChiefAccountant/s_inv:ChiefAccountant/cat_ru:PersonName"/> 
						<xsl:apply-templates select="s_inv:SignatureDirectorChiefAccountant/s_inv:ChiefAccountant/cat_ru:PersonMiddleName"/>
               </td>
            </tr>
            <tr>
               <td style="width:25mm;">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </td>
               <td align="center" style="width:80mm;" valign="top">
                  <span class="graph">(подпись) (ф.и.о.)</span>
               </td>
               <!--<td style="width:5mm;">
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</td>-->
               <td style="width:25mm;">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </td>
               <td align="center" style="width:80mm;" valign="top">
                  <span class="graph">(подпись) (ф.и.о.)</span>
               </td>
            </tr>
            <tr>
               <td style="width:25mm;">
                  <span class="graphMain">Индивидуальный предприниматель</span>
               </td>
               <td align="center" class="underlined" style="width:80mm;font-family: Arial;font-size: 9pt;font-weight: normal;">
                  <br/>
                  <text/>
                  <xsl:apply-templates select="s_inv:IndividualEntrepreneur/cat_ru:PersonSurname"/>
                  <text/>
                  <xsl:apply-templates select="s_inv:IndividualEntrepreneur/cat_ru:PersonName"/>
                  <text/>
                  <xsl:apply-templates select="s_inv:IndividualEntrepreneur/cat_ru:PersonMiddleName"/>
               </td>
               <!--<td style="width:105mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</td>-->
            </tr>
            <tr>
               <td style="width:25mm;">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
               </td>
               <td align="center" style="width:80mm;">
                  <span class="graph">(подпись) (ф.и.о.)</span>
               </td>
               <!--<td style="width:105mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</td>-->
            </tr>
         </tbody>
      </table>
   </xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:variable name="xpath_AddressKindCode">
						<xsl:call-template name="get_xpath">
							<xsl:with-param name="node" select="."/>
						</xsl:call-template>
					</xsl:variable>
					<element xml_node="{$xpath_AddressKindCode}">
						<xsl:choose>
							<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
							<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
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
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:apply-templates select="."/>) </xsl:otherwise>
							</xsl:choose>
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
</xsl:stylesheet>
