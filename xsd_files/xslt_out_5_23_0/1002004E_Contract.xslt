<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="con  cat_ru" version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.22.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:con="urn:customs.ru:Information:CommercialFinanceDocuments:Contract:5.22.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
	<xsl:template match="//*[local-name()='Contract']//*" priority="-1">
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
   <xsl:template match="con:Contract">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Контракт</title>
            <style type="text/css">
                    body {
                        /*text-align: center;*/
                        background: #cccccc;
                    }
                    
                    table {
                        border: 0;
                        cellpadding: 3;
                        cellspacing: 0;
                        width: 100%;
                        border-collapse: collapse;
                    }
                    
                    table.condition td {
						padding-top: 10px;
						width: 50%;
                    }

					table.condition tr {
						
						vertical-align: top;
                    }
                    
                    table.persons {
						width: 90%;
						margin-right: 5%
                    }
                    
                     table.persons td {
						padding-top: 10px;
						width: 45%;
						margin-right: 5%
                    }

					table.persons tr {
						vertical-align: top;
                    }
                    
                    
                    .head {
						margin-bottom:-15px; 
						margin-top:25px;
                    }
                    
                    /*td {
                        font-size: 10pt;
                        font-family: Arial, sans-serif;
                        color: windowtext;
                        font-weight: 400;
                        font-style: normal;
                        text-decoration: none;
                        text-align: general;
                        vertical-align: top;
                        white-space: nowrap;
                        padding-left: 4pt;
                        width: 50pt
                    }*/

                    /*td.bold {
                        font-size: 8.0pt;
                        font-family: Arial, sans-serif;
                        color: windowtext;
                        font-weight: 700;
                        font-style: normal;
                        text-decoration: none;
                        text-align: general;
                        vertical-align: bottom;
                        white-space: nowrap;
                    }*/

                    td.value {
                        font-size: 10.0pt;
                        font-family: Courier;
                        color: windowtext;
                        font-weight: 400;
                        font-style: normal;
                        text-decoration: none;
                        text-align: general;
                        vertical-align: top;
                        /*white-space: nowrap;*/
                    }

                    th.border, td.border {
                        border: 1pt solid windowtext;
                    }



                    span.value {
                        font-size: 12.0pt;
                        font-family: Courier;
                        color: windowtext;
                    }

                    .page {
                        width: 210mm;
                        /*height: 297mm;*/
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }
                    
                    .page2 {
                        width: 297mm;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm 5mm 10mm 5mm;
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }

                    .bold {
                        font-weight: bold;
                    }

                    .graph {
                        font-family: Arial;
                        font-size: 7pt;
                    }
					
					.space {
						width: 70px;
						border:none;
					}
					
					.first_td {
						border-width: 0 0 1px 0; 
						border-color:black
					}
					
					.contractSignedPerson {
							text-align:center; 
							border: none;
						}
					
                 @media print {
                        div.page {
                            border: none;
                        }
                    }
                </style>
         </head>
         <body>
            <div class="page">
               <h2 align="center">
                        КОНТРАКТ №
                        <xsl:apply-templates select="con:ContractRegistration/cat_ru:PrDocumentNumber"/>
               </h2>
               <table>
                  <tr>
                     <td align="left" class="value" style="width:130mm">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:apply-templates select="con:ContractRegistration/catComFin_ru:ContractPlace"/>
                     </td>
                     <td align="right" class="value" style="width:50mm">
						<xsl:apply-templates select="con:ContractRegistration/cat_ru:PrDocumentDate" mode="russian_date"/>
                     </td>
                  </tr>
               </table>
               <div class="contractSubject">
                  <p align="center" class="head">1. ПРЕДМЕТ ДОГОВОРА</p>
                  <xsl:if test="con:ContractTerms/catComFin_ru:ContractSubject">
                     <xsl:for-each select="con:ContractTerms/catComFin_ru:ContractSubject">
                     <p align="left">
                           <xsl:apply-templates select="."/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </p>
                     </xsl:for-each>
                  </xsl:if>
                  <xsl:if test="con:ContractTerms/catComFin_ru:ContractText">
                     <p class="bold" style="margin-bottom:-15px;">Текст контракта:</p>
                     <xsl:for-each select="con:ContractTerms/catComFin_ru:ContractText">
                        <p>
                           <xsl:apply-templates select="."/>
                        </p>
                     </xsl:for-each>
                  </xsl:if>
                  <xsl:if test="con:ContractTerms/catComFin_ru:DealSign">
                     <span class="bold" style="margin-bottom:-8px;">Вид сделки:</span>
                     <xsl:choose>
                        <xsl:when test="(con:ContractTerms/catComFin_ru:DealSign = 'true') or (con:ContractTerms/catComFin_ru:DealSign = 't') or (con:ContractTerms/catComFin_ru:DealSign = '1')  ">
                           <span style="margin-bottom:-8px;">Купля</span>
                        </xsl:when>
                        <xsl:otherwise>
                           <span style="margin-bottom:-8px;">Продажа</span>
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:if>
                  <p class="bold" style="margin-bottom:-8px;">Условия контракта:</p>
                  <table class="condition">
                     <tbody>
                        <xsl:if test="con:ContractTerms/catComFin_ru:ExchangeClause">
                           <tr>
                              <td>Порядок пересчета валюты платежа в валюту цены:</td>
                              <td>
                                 <xsl:for-each select="con:ContractTerms/catComFin_ru:ExchangeClause">
                                    <xsl:apply-templates select="."/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:for-each>
                              </td>
                           </tr>
                        </xsl:if>
                        <xsl:if test="con:ContractTerms/catComFin_ru:DueDateCode">
                           <tr>
                              <td>Код применяемой формы расчета по контракту: </td>
                              <td>
                                 <xsl:for-each select="con:ContractTerms/catComFin_ru:DueDateCode">
                                    <xsl:apply-templates select="."/>
                                 </xsl:for-each>
                              </td>
                           </tr>
                        </xsl:if>
                        <xsl:if test="con:ContractTerms/catComFin_ru:PrepaySign">
                           <tr>
                              <td>Предоплата: </td>
                              <td>
                                 <xsl:choose>
                                    <xsl:when test="(con:ContractTerms/catComFin_ru:PrepaySign = 'true') or (con:ContractTerms/catComFin_ru:PrepaySign = 't') or (con:ContractTerms/catComFin_ru:PrepaySign = '1') ">
                                       <xsl:text>Да</xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text>Нет</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                           </tr>
                        </xsl:if>
                        <xsl:if test="con:ContractTerms/catComFin_ru:DueDateCode">
                           <tr>
                              <td>Срок оплаты: </td>
                              <td>
                                 <xsl:apply-templates select="con:ContractTerms/catComFin_ru:PaymentPeriod"/>
                              </td>
                           </tr>
                        </xsl:if>
                        <xsl:if test="con:ContractTerms/catComFin_ru:ContractTime">
                           <tr>
                              <td>Срок действия договора до</td>
                              <td>
								<xsl:apply-templates select="con:ContractTerms/catComFin_ru:ContractTime" mode="russian_date"/>
                              </td>
                           </tr>
                        </xsl:if>
                        <xsl:if test="con:ContractTerms/catComFin_ru:AdditionalContractTime">
                           <tr>
                              <td>Дополнительный срок действия договора до</td>
                              <td>
								<xsl:apply-templates select="con:ContractTerms/catComFin_ru:AdditionalContractTime" mode="russian_date"/>
                              </td>
                           </tr>
                        </xsl:if>
                        <xsl:if test="con:ContractTerms/catComFin_ru:StockCategorySign">
                           <tr>
                              <td>Предмет контракта </td>
                              <td>
                                 <xsl:choose>
                                    <xsl:when test="(con:ContractTerms/catComFin_ru:StockCategorySign = 'true') or (con:ContractTerms/catComFin_ru:StockCategorySign = 't') or (con:ContractTerms/catComFin_ru:StockCategorySign = '1') ">
                                       <xsl:text>Относится к категории биржевых товаров</xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <xsl:text>Не относится к категории биржевых товаров</xsl:text>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </td>
                           </tr>
                        </xsl:if>
                        <xsl:if test="con:ContractTerms/catComFin_ru:OtherTerms">
                           <tr>
                              <td>Прочие условия договора:</td>
                              <td>
                                 <xsl:for-each select="con:ContractTerms/catComFin_ru:OtherTerms">
                                    <!--xsl:apply-templates/-->
                                    <xsl:apply-templates select="."/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:for-each>
                              </td>
                           </tr>
                        </xsl:if>
                     </tbody>
                  </table>
               </div>
               <div class="price">
                  <p align="center" class="head">2. ЦЕНА</p>
                  <xsl:if test="con:ContractTerms/catComFin_ru:Amount">
                     <p align="left">
								Общая стоимость проданного по настоящему контракту товара составляет 
								<xsl:apply-templates select="con:ContractTerms/catComFin_ru:Amount"/>.
							</p>
                  </xsl:if>
                  <xsl:if test="string(con:ContractTerms/catComFin_ru:DiscountPercentage)!=''">
                     <p>
								Размер скидки по настоящему контракту составляет 
								<xsl:apply-templates select="con:ContractTerms/catComFin_ru:DiscountPercentage"/>%
							</p>
                  </xsl:if>
                  <xsl:if test="string(con:ContractTerms/catComFin_ru:Discount)!=''">
                     <p>
								Общая сумма скидки по настоящему контракту составляет 
								<xsl:apply-templates select="con:ContractTerms/catComFin_ru:Discount"/>.
							</p>
                  </xsl:if>
                  <xsl:if test="string(con:ContractTerms/catComFin_ru:CurrencyCode)!=''">
                     <p>
								Код валюты поставки:
								<xsl:for-each select="con:ContractTerms/catComFin_ru:CurrencyCode">
                           <xsl:apply-templates select="."/>
                        </xsl:for-each>
                     </p>
                  </xsl:if>
               </div>
               <div class="deliveryTerms">
                  <p align="center">
							3. УСЛОВИЯ ПОСТАВКИ
						</p>
                  <table width="180mm">
                     <tbody>
                        <tr align="center">
                           <td class="border" align="center" style="width:30mm">Место поставки</td>
                           <td class="border" align="center" style="width:20mm">Код условий поставки по Инкотермс</td>
                           <td class="border" align="center" style="width:50mm">Комментарий к условиям поставки</td>
                           <td class="border" align="center" style="width:30mm">Код срока оплаты по инвойсу</td>
                           <td class="border" align="center" style="width:60mm">Описание срока оплаты по инвойсу</td>
                        </tr>
                        <xsl:for-each select="con:ContractDeliveryTerms">
                           <tr>
                              <td class="border" align="left" style="width:30mm">
                                 <xsl:for-each select="catComFin_ru:DeliveryPlace">
                                    <xsl:apply-templates select="."/>, </xsl:for-each>
                              </td>
                              <td class="border" align="center" style="width:20mm">
                                 <xsl:apply-templates select="catComFin_ru:DeliveryTermsStringCode"/>
                              </td>
                              <td class="border" align="left" style="width:50mm">
                                 <xsl:for-each select="catComFin_ru:TermsDescription">
                                    <xsl:apply-templates select="."/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:for-each>
                              </td>
                              <td class="border" align="center" style="width:30mm">
                                 <xsl:for-each select="catComFin_ru:InvoiceSaleTerms">
                                    <xsl:if test="catComFin_ru:SaleTermsCode">
                                       <xsl:apply-templates select="catComFin_ru:SaleTermsCode"/>
                                    </xsl:if>
                                 </xsl:for-each>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="border" align="left" style="width:60mm">
                                 <xsl:for-each select="catComFin_ru:InvoiceSaleTerms">
                                    <xsl:if test="catComFin_ru:SaleTermsDescription">
                                       <xsl:apply-templates select="catComFin_ru:SaleTermsDescription"/>
                                    </xsl:if>
                                 </xsl:for-each>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </div>
               <div class="additional">
                  <p align="center" class="head">4.ДОПОЛНЕНИЯ К КОНТРАКТУ</p>
                  <p align="left">
                     <xsl:for-each select="con:ContractTerms/catComFin_ru:ChangeContract">
                        <xsl:apply-templates select="cat_ru:PrDocumentName"/>
								№
								<xsl:apply-templates select="cat_ru:PrDocumentNumber"/> от
								<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
                        <br/>
                     </xsl:for-each>
                  </p>
                  <br/>
                  <p align="center" style="margin-bottom:5px">5. АДРЕСА И РЕКВИЗИТЫ СТОРОН КОНТРАКТА</p>
                  <table class="persons" style="page-break-inside: avoid;">
                     <tbody>
                        <tr>
                           <th>Российская сторона:</th>
                           <th>Иностранная сторона:</th>
                        </tr>
                        <tr>
                           <td>
										Наименование:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:apply-templates select="con:RussianPerson/cat_ru:OrganizationName"/>
                              <xsl:if test="con:RussianPerson/cat_ru:RFOrganizationFeatures/cat_ru:INN">
								  <br/>
								  ИНН
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								  <xsl:apply-templates select="con:RussianPerson/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                              </xsl:if>
                              <xsl:if test="con:RussianPerson/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
								<br/>
								  КПП
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								  <xsl:apply-templates select="con:RussianPerson/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                              </xsl:if>
                           </td>
                           <td>
										Наименование:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:apply-templates select="con:ForeignPerson/cat_ru:OrganizationName"/>
                              <xsl:if test="con:ForeignPerson/cat_ru:RFOrganizationFeatures/cat_ru:INN">
								  <br/>
								  ИНН
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								  <xsl:apply-templates select="con:ForeignPerson/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                              </xsl:if>
                              <xsl:if test="con:ForeignPerson/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
								<br/>
								  КПП
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								  <xsl:apply-templates select="con:ForeignPerson/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td>
										Индекс:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:apply-templates select="con:RussianPerson/cat_ru:Address/cat_ru:PostalCode"/>
                           </td>
                           <td>
										Индекс:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:apply-templates select="con:ForeignPerson/cat_ru:Address/cat_ru:PostalCode"/>
                           </td>
                        </tr>
                        <tr>
                           <td>
										Почтовый адрес:
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:apply-templates select="con:RussianPerson/cat_ru:Address/cat_ru:CounryName"/>,
										<xsl:apply-templates select="con:RussianPerson/cat_ru:Address/cat_ru:City"/>,
										<xsl:apply-templates select="con:RussianPerson/cat_ru:Address/cat_ru:StreetHouse"/>
                           </td>
                           <td>
										Почтовый адрес:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:apply-templates select="con:ForeignPerson/cat_ru:Address/cat_ru:CounryName"/>,
										<xsl:apply-templates select="con:ForeignPerson/cat_ru:Address/cat_ru:City"/>,
										<xsl:apply-templates select="con:ForeignPerson/cat_ru:Address/cat_ru:StreetHouse"/>
                           </td>
                        </tr>
                        <tr>
                           <td>Банковские реквизиты:</td>
                           <td>Банковские реквизиты:</td>
                        </tr>
                        <tr>
                           <td>
                              <xsl:apply-templates select="con:RussianPerson/cat_ru:BankInformation"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="con:ForeignPerson/cat_ru:BankInformation"/>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <p>_______________/____________/</p>
                              <p align="center">М.П.</p>
                           </td>
                           <td>
                              <p>_______________/____________/</p>
                              <p align="center">М.П.</p>
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <xsl:if test="con:ContractSignedPerson">
                  <p align="center">6. ЛИЦО, ПОДПИСАВШЕЕ ДОКУМЕНТ</p>
                  <!--p>Документ подписал
							<xsl:apply-templates select="con:ContractSignedPerson/cat_ru:PersonSurname"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:apply-templates select="con:ContractSignedPerson/cat_ru:PersonName"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:if test="con:ContractSignedPerson/cat_ru:PersonMiddleName">
								<xsl:apply-templates select="con:ContractSignedPerson/cat_ru:PersonMiddleName"/>
							</xsl:if>
						</p>
						<xsl:if test="con:ContractSignedPerson/cat_ru:PersonPost">
							<p>Занимаемая должность - <xsl:apply-templates select="con:ContractSignedPerson/cat_ru:PersonPost"/></p>
						</xsl:if>
						<xsl:if test="con:ContractSignedPerson/cat_ru:IssueDate">
							<p>
								Дата подписания
								<xsl:apply-templates select="con:ContractSignedPerson/cat_ru:IssueDate" mode="russian_date"/>
							</p>
						</xsl:if-->
                  <table class="contractSignedPerson">
                     <tbody>
                        <tr>
                           <td class="first_td">
                              <xsl:apply-templates select="con:ContractSignedPerson/cat_ru:PersonPost"/>
                           </td>
                           <td class="space"/>
                           <td class="first_td">
                              <xsl:apply-templates select="con:ContractSignedPerson/cat_ru:PersonSurname"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:apply-templates select="con:ContractSignedPerson/cat_ru:PersonName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:if test="con:ContractSignedPerson/cat_ru:PersonMiddleName">
                                 <xsl:apply-templates select="con:ContractSignedPerson/cat_ru:PersonMiddleName"/>
                              </xsl:if>
                           </td>
                           <td class="space"/>
                           <td class="first_td">
								<xsl:apply-templates select="con:ContractSignedPerson/cat_ru:IssueDate" mode="russian_date"/>
                           </td>
                        </tr>
                        <tr class="contractSignedPerson">
                           <td style="border: none">(Наименование должности)</td>
                           <td class="space"/>
                           <td style="border: none">(Ф.И.О.)</td>
                           <td class="space"/>
                           <td style="border: none">(Дата подписания)</td>
                        </tr>
                     </tbody>
                  </table>
               </xsl:if>
            </div>
            <xsl:for-each select="con:ContractSpecification">
               <div class="page2">
                  <p align="center">
                            СПЕЦИФИКАЦИЯ К КОНТРАКТУ №
                            <xsl:apply-templates select="catComFin_ru:ID"/>
                  </p>
                  <br/>
                  <p align="right">
					<xsl:apply-templates select="catComFin_ru:IssueDate" mode="russian_date"/>
                  </p>
                  <table>
                     <tbody>
                        <tr>
                           <th class="border">Артикул</th>
                           <th class="border">Описание товара</th>
                           <th class="border">Количество</th>
                           <th class="border">Единицы измерения</th>
                           <th class="border">Цена</th>
                           <th class="border">Код валюты контракта</th>
                           <th class="border">Стоимость</th>
                           <th class="border">Код по ТН ВЭД ЕАЭС</th>
                           <th class="border">Описание грузовых мест</th>
                           <th class="border">Производитель</th>
                           <th class="border">Товарный знак</th>
                           <th class="border">Марка</th>
                           <th class="border">Модель</th>
                           <th class="border">Стандарт</th>
                        </tr>
                        <xsl:for-each select="catComFin_ru:SpecificationGoodsExtended">
                           <tr>
                              <td class="border" align="right">
                                 <xsl:apply-templates select="catComFin_ru:GoodMarking"/>
                              </td>
                              <td class="border" align="right">
                                 <xsl:for-each select="catComFin_ru:GoodsDescription"> 
                                            <xsl:apply-templates select="."/>
                                 </xsl:for-each>
                              </td>
                              <td class="border" align="right">
                                 <xsl:apply-templates select="catComFin_ru:GoodsQuantity"/>
                              </td>
                              <td class="border" align="right">
                                 <xsl:apply-templates select="catComFin_ru:MeasureUnitQualifierName"/>
                              </td>
                              <td class="border" align="right">
                                 <xsl:apply-templates select="catComFin_ru:Price"/>
                              </td>
                              <td class="border" align="right">
                                 <xsl:apply-templates select="catComFin_ru:CurrencyCode"/>
                              </td>
                              <td class="border" align="right">
                                 <xsl:apply-templates select="catComFin_ru:GCost"/>
                              </td>
                              <td class="border" align="right">
                                 <xsl:apply-templates select="catComFin_ru:GoodsTNVEDCode"/>
                              </td>
                              <td class="border" align="right">
                                 <xsl:for-each select="catComFin_ru:GoodsPlace">
                                    <xsl:apply-templates select="catComFin_ru:PlacesQuantity"/>-
                                                <xsl:apply-templates select="catComFin_ru:PlaceWeightQuantity"/>кг
                                            </xsl:for-each>
                              </td>
                              <td class="border" align="right">
                                 <xsl:apply-templates select="catComFin_ru:AdditionalGoodsDescription/catComFin_ru:Manufacturer"/>
                              </td>
                              <td class="border" align="right">
                                 <xsl:apply-templates select="catComFin_ru:AdditionalGoodsDescription/catComFin_ru:TradeMark"/>
                              </td>
                              <td class="border" align="right">
                                 <xsl:apply-templates select="catComFin_ru:AdditionalGoodsDescription/catComFin_ru:GoodsMark"/>
                              </td>
                              <td class="border" align="right">
                                 <xsl:apply-templates select="catComFin_ru:AdditionalGoodsDescription/catComFin_ru:GoodsModel"/>
                              </td>
                              <td class="border" align="right">
                                 <xsl:apply-templates select="catComFin_ru:AdditionalGoodsDescription/catComFin_ru:GoodsStandart"/>
                              </td>
                           </tr>
                        </xsl:for-each>
                     </tbody>
                  </table>
               </div>
            </xsl:for-each>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="cat_ru:BankInformation">
        Cчет № :
        <xsl:for-each select="cat_ru:BankAccount">
         <xsl:apply-templates select="."/>,
        </xsl:for-each>
      <xsl:if test="cat_ru:BankAccountDescription">
         <xsl:apply-templates select="cat_ru:BankAccountDescription"/>
         <br/>
      </xsl:if>
      <xsl:apply-templates select="cat_ru:BankName"/>
      <xsl:if test="cat_ru:BankMFO">
			МФО<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:apply-templates select="cat_ru:BankMFO"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:OKPOID">ОКПО<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:apply-templates select="cat_ru:OKPOID"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:BICID">БИК<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:apply-templates select="cat_ru:BICID"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:SWIFTID">
			SWIFT код<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:apply-templates select="cat_ru:SWIFTID"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:CorrAccount">
         <xsl:apply-templates select="cat_ru:CorrAccount"/>
         <br/>
      </xsl:if>
      <xsl:for-each select="cat_ru:TransitCurrencyAccount">
         <xsl:apply-templates select="."/>,
        </xsl:for-each>
      <br/>
      <xsl:for-each select="cat_ru:SpecialTransitCurrencyAccount">
         <xsl:apply-templates select="."/>,
        </xsl:for-each>
      <br/>
   </xsl:template>
   <xsl:template match="con:RussianPerson | con:ForeignPerson">
      <xsl:apply-templates select="cat_ru:OrganizationName"/>
      <br/>
      <xsl:apply-templates select="cat_ru:OGRN"/>
      <br/>
      <xsl:apply-templates select="cat_ru:INN"/>
      <br/>
      <xsl:apply-templates select="cat_ru:KPP"/>
      <br/>
      <xsl:apply-templates select="cat_ru:Contact/cat_ru:Phone"/>
      <br/>
      <xsl:apply-templates select="cat_ru:Contact/cat_ru:Fax"/>
      <br/>
      <xsl:apply-templates select="cat_ru:Contact/cat_ru:Telex"/>
      <br/>
      <xsl:apply-templates select="cat_ru:OKPOID"/>
      <br/>
      <xsl:apply-templates select="cat_ru:OKATOCode"/>
      <br/>
      <xsl:apply-templates select="cat_ru:Address"/>
      <br/>
      <xsl:if test="cat_ru:BankInformation">Банковские реквизиты
            <br/>
         <xsl:apply-templates select="cat_ru:BankInformation"/>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:Address | catComFin_ru:PostalAddress">
      <xsl:apply-templates select="cat_ru:StreetHouse"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:apply-templates select="cat_ru:City"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:if test="string(cat_ru:PostalCode)!=''">
         <xsl:apply-templates select="cat_ru:PostalCode"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </xsl:if>
      <xsl:apply-templates select="cat_ru:CounryName"/>
   </xsl:template>
</xsl:stylesheet>
