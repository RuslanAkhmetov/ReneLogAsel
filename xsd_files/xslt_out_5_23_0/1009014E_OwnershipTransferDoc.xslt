<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:otd="urn:customs.ru:Information:SertifDocuments:OwnershipTransferDoc:5.22.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
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
   <xsl:template name="russian_date_gtd">
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
   <xsl:template name="Address">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="otd:OwnershipTransferDoc">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Сведения о документах, подтверждающих передачу прав на объекты интеллектуальной собственности, включенных в Таможенные реестры, содержащиеся в товарах, декларируемых в электронном виде; сведения о документах, подтверждающих введение в гражданский оборот на таможенной территории Таможенного союза товаров, обозначенных товарным знаком, с согласия правообладателя</title>
            <style type="text/css">
				body {
					text-align: center;
						background: #cccccc;
						}
						
					div.page {
						width: 210mm;
						max-width: 210mm;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding:	10mm;
						padding-left:	20mm;
						background: #ffffff;
						border: solid 1pt #000000;
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
						font-size: 8pt;
						}
	
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}

					.graphValue {
						font-family: Arial;
						font-size: 10pt;
						}
						
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						
						.graphNo {
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
				</style>
         </head>
         <body>
            <div class="page">
               <table width="100%">
                  <tbody>
                     <tr>
                        <td align="center" class="graphMain">
									Сведения о документах, подтверждающих передачу прав на объекты<br/>
									 интеллектуальной собственности, включенных в Таможенные реестры, <br/>
									 содержащиеся в товарах, декларируемых в электронном виде; <br/>
									 сведения о документах, подтверждающих введение в гражданский оборот на<br/>
									  таможенной территории Таможенного союза товаров, обозначенных товарным<br/>
									   знаком, с согласия правообладателя
						</td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" cellpadding="0" cellspacing="0" width="100%" class="graphValue">
                  <tbody>
                     <tr>
                        <td align="center" width="21%">
									Номер свидетельства о регистрации объекта интеллектуальной собственности
								</td>
                        <td align="center" width="29%">
                           <xsl:value-of select="otd:RegCertifNum"/>
                        </td>
                        <td align="center" width="21%">
									Сведения о правообладателе
								</td>
                        <td align="center" width="29%" style="word-break: break-all;">
                           <xsl:value-of select="otd:RightHolder/cat_ru:OrganizationName"/> 
									<xsl:if test="otd:RightHolder/cat_ru:RFOrganizationFeatures">
                              <xsl:value-of select="otd:RightHolder/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> 
									<xsl:value-of select="otd:RightHolder/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> 
									<xsl:value-of select="otd:RightHolder/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" width="21%">
									Срок действия регистрации
								</td>
                        <td align="center"  width="29%">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="otd:RegExpiretionDate"/>
                           </xsl:call-template>
                        </td>
                        <td align="center" width="21%">
									Сведения о владельце товара
								</td>
                        <td align="center" width="29%">
                           <xsl:value-of select="otd:GoodsOwner/cat_ru:OrganizationName"/> 
									<xsl:if test="otd:GoodsOwner/cat_ru:RFOrganizationFeatures">
                              <xsl:value-of select="otd:GoodsOwner/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> 
									<xsl:value-of select="otd:GoodsOwner/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> 
									<xsl:value-of select="otd:GoodsOwner/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                           </xsl:if>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" cellpadding="0" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td width="35%">
									Наименование объекта интеллектуальной собственности
								</td>
                        <td width="65%">
                           <xsl:for-each select="otd:OwnershipDocInfo/otd:ObjectName">
                              <xsl:value-of select="."/> 
									</xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td width="35%">
									Вид документов, подтверждающих введение в гражданский оборот на
									  таможенной территории Таможенного союза товаров, обозначенных товарным
									   знаком, с согласия правообладателя
								</td>
                        <td width="65%">
                           <xsl:value-of select="otd:OwnershipDocInfo/cat_ru:PrDocumentName"/>
                        </td>
                     </tr>
                     <tr>
                        <td width="35%">
									Регистрационный номер документа(лицензионного договора и т.п)
								</td>
                        <td width="65%">
                           <xsl:value-of select="otd:OwnershipDocInfo/cat_ru:PrDocumentNumber"/>
                        </td>
                     </tr>
                     <tr>
                        <td width="35%">
									Дата заключения договора
								</td>
                        <td>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="otd:OwnershipDocInfo/cat_ru:PrDocumentDate"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td width="35%">
									Срок действия договора
								</td>
                        <td width="65%">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="otd:OwnershipDocInfo/otd:ContractTerms"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td width="35%">
									Вид права(исключительное, неисключительное)
								</td>
                        <td width="65%">
                           <xsl:choose>
                              <xsl:when test="(otd:OwnershipDocInfo/otd:OwnershipKind=1) or (otd:OwnershipDocInfo/otd:OwnershipKind='t') or (otd:OwnershipDocInfo/otd:OwnershipKind='true')">Исключительное</xsl:when>
                              <xsl:otherwise>Неисключительное</xsl:otherwise>
                           </xsl:choose>
                        </td>
                     </tr>
                     <tr>
                        <td width="35%">
									Лицензиат
								</td>
                        <td width="65%">
                           <xsl:value-of select="otd:OwnershipDocInfo/otd:Licensee/cat_ru:OrganizationName"/> 
									<xsl:if test="otd:OwnershipDocInfo/otd:Licensee/cat_ru:RFOrganizationFeatures">
                              <xsl:value-of select="otd:OwnershipDocInfo/otd:Licensee/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> 
									<xsl:value-of select="otd:OwnershipDocInfo/otd:Licensee/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> 
									<xsl:value-of select="otd:OwnershipDocInfo/otd:Licensee/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> 
									</xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td width="35%">
									Лицензиар
								</td>
                        <td width="65%">
                           <xsl:value-of select="otd:OwnershipDocInfo/otd:Licensor/cat_ru:OrganizationName"/> 
									<xsl:if test="otd:OwnershipDocInfo/otd:Licensor/cat_ru:RFOrganizationFeatures">
                              <xsl:value-of select="otd:OwnershipDocInfo/otd:Licensor/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> 
									<xsl:value-of select="otd:OwnershipDocInfo/otd:Licensor/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> 
									<xsl:value-of select="otd:OwnershipDocInfo/otd:Licensor/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> 
									</xsl:if>
                        </td>
                     </tr>
                     <!--tr>
								<td width="35%">
									Регистрационный номер документа(лицензионного договора и т.п)
								</td>
								<td>
									
								</td>
							</tr-->
                     <!--xsl:for-each select="otd:GoodsInfo">
                        <tr>
                           <td width="35%">
									Вид товара, наименование товара
								</td>
                           <td>
                              <xsl:for-each select="otd:GoodsDescription">
                                 <xsl:value-of select="."/> 
									</xsl:for-each>
                           </td>
                        </tr>
                        <tr>
                           <td width="35%">
									Цена товара по договору
								</td>
                           <td>
                              <xsl:value-of select="otd:GoodsCost"/>
                           </td>
                        </tr>
                        <tr>
                           <td width="35%">
									Количество и единица измерения по договору
								</td>
                           <td>
                              <xsl:value-of select="cat_ru:GoodsQuantity"/> 
									<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/> 
									<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
                           </td>
                        </tr>
                        <tr>
                           <td width="35%">
									Страна происхождения товара по договору
								</td>
                           <td style="width:140mm">
                              <xsl:value-of select="otd:GoodsCountry"/>
                           </td>
                        </tr>
                     </xsl:for-each-->
					<tr>
					   <td width="35%">
							Наименование товаров
							</td>
					   <td width="65%">
						  <xsl:for-each select="otd:GoodsDescription">
							 <xsl:value-of select="."/> 
						  </xsl:for-each>
					   </td>
					</tr>
                     <tr>
                        <td width="35%">
									Направление перемещения по договору
								</td>
                        <td width="65%">
                           <xsl:value-of select="otd:MovementDirection"/>
                        </td>
                     </tr>
                     <tr>
                        <td width="35%">
									Отправитель по договору: ФИО, наименование ЮЛ, адрес
								</td>
                        <td width="65%">
                           <xsl:value-of select="otd:Sender/cat_ru:OrganizationName"/> 
									<xsl:if test="otd:Sender/cat_ru:RFOrganizationFeatures">
                              <xsl:value-of select="otd:Sender/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> 
									<xsl:value-of select="otd:Sender/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> 
									<xsl:value-of select="otd:Sender/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> 
									</xsl:if>
                           <xsl:for-each select="otd:Sender/otd:Address">
                              <xsl:call-template name="Address"/>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td width="35%">
									Получатель по договору: ФИО, наименование ЮЛ, адрес
								</td>
                        <td width="65%">
                           <xsl:value-of select="otd:Recipient/cat_ru:OrganizationName"/> 
									<xsl:if test="otd:Recipient/cat_ru:RFOrganizationFeatures">
                              <xsl:value-of select="otd:Recipient/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> 
									<xsl:value-of select="otd:Recipient/cat_ru:RFOrganizationFeatures/cat_ru:INN"/> 
									<xsl:value-of select="otd:Recipient/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> 
									</xsl:if>
                           <xsl:for-each select="otd:Recipient/otd:Address">
                              <xsl:call-template name="Address"/>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <!--tr>
                        <td width="35%">
									Способ транспортировки по договору
								</td>
                        <td>
                           <xsl:value-of select="otd:TransportationMethod"/>
                        </td>
                     </tr-->
                     <tr>
                        <td width="35%">
									ОПИСАНИЕ
								</td>
                        <td width="65%">
                           <xsl:for-each select="otd:Description">
                              <xsl:value-of select="."/> 
									</xsl:for-each>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
