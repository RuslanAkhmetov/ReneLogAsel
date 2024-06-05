<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:catpi_ru="urn:customs.ru:Information:PriorInformation:PriorCommonAggregateTypes:5.23.0" xmlns:pic="urn:customs.ru:Information:PriorInformation:PI_Consignment:5.23.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="pic:PI_Consignment">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Предварительная информация о партии товаров</title>
            <style type="text/css">
			body {
					background: #ffffff;
				}

				div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}

				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}
				
				.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
				}
				
				.header {
					font-weight: bold;
					margin-top:20px;
				}
				
				 table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 8pt;
							}
				.graph1 {
							font-family: Arial;
							font-size: 10pt;
							}
				jh {
				font: 16;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: pt;
							}
				.g{
							border-right:0pt solid;
							}
				</style>
         </head>
         <body>
            <div class="album_page">
               <table>
                  <tr>
                     <td align="center" class="graph" colspan="2" style="border:solid 0pt">
                        <font face="Times new roman" size="4">
                           <b>Предварительная информация о партии товаров</b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" width="50%">
                        <b>Из:<br/>
                        </b>
                        <xsl:value-of select="pic:DepartureCountry/pic:CountryCode"/>
                        <xsl:if test="pic:DepartureCountry/pic:CountryName">, <xsl:value-of select="pic:DepartureCountry/pic:CountryName"/>
                        </xsl:if>
                        <br/>
                        <b>Отправитель</b>
                        <br/>
                        <xsl:apply-templates select="pic:Consignor"/>
                     </td>
                     <td class="graph">
                        <b>В:<br/>
                        </b>
                        <xsl:value-of select="pic:DestinationCountry/pic:CountryCode"/>
                        <xsl:if test="pic:DestinationCountry/pic:CountryName">, <xsl:value-of select="pic:DestinationCountry/pic:CountryName"/>
                        </xsl:if>
                        <br/>
                        <b>Получатель</b>
                        <br/>
                        <xsl:apply-templates select="pic:Consignee"/>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2" style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:if test="pic:BorderCustoms">
                     <tr>
                        <td class="graph" colspan="2" style="border:solid 0pt">
                           <span class="header">
				Таможенный орган, в который ожидается прибытие товаров: </span>
                           <xsl:value-of select="pic:BorderCustoms/cat_ru:Code"/>
                           <xsl:if test="pic:BorderCustoms/cat_ru:OfficeName">, <xsl:value-of select="pic:BorderCustoms/cat_ru:OfficeName"/>
                           </xsl:if>
                           <xsl:if test="pic:BorderCustoms/cat_ru:CustomsCountryCode"> (<xsl:value-of select="pic:BorderCustoms/cat_ru:CustomsCountryCode"/>)</xsl:if>
                        </td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td colspan="2" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="2" style="border:solid 0pt">
                        <span class="header">Сведения о товарах:</span>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2" style="border:solid 0pt">
                        <table>
                           <tr>
                              <td align="center" class="graph">Наименование товара</td>
                              <td align="center" class="graph" width="10%">Артикул (код товара, номер по каталогу производителя)</td>
                              <td align="center" class="graph" width="10%">Код товара по ТН ВЭД ЕАЭС</td>
                              <td align="center" class="graph" width="5%">Вес товара, брутто (кг)</td>
                              <td align="center" class="graph" width="5%">Вес товара, нетто (кг)</td>
                              <td align="center" class="graph" width="7%">Стоимость</td>
                              <td align="center" class="graph">Документы</td>
                              <td align="center" class="graph">Сведения о грузовых местах/упаковке товаров</td>
                           </tr>
                           <tr>
                              <td align="center" class="graph">1</td>
                              <td align="center" class="graph">2</td>
                              <td align="center" class="graph">3</td>
                              <td align="center" class="graph">4</td>
                              <td align="center" class="graph">5</td>
                              <td align="center" class="graph">6</td>
                              <td align="center" class="graph">7</td>
                              <td align="center" class="graph">8</td>
                           </tr>
                           <xsl:for-each select="pic:Goods">
                              <tr>
                                 <td class="graph">
                                    <xsl:for-each select="pic:GoodsDescription">
                                       <xsl:value-of select="."/>
                                       <xsl:if test="position()!=last()"> </xsl:if>
                                    </xsl:for-each>
                                 </td>
                                 <td align="center" class="graph">
                                    <xsl:if test="pic:GoodMarking">
                                       <xsl:value-of select="pic:GoodMarking"/>
                                    </xsl:if>
                                 </td>
                                 <td align="center" class="graph">
                                    <xsl:value-of select="pic:GoodsTNVEDCode"/>
                                 </td>
                                 <td align="center" class="graph">
                                    <xsl:value-of select="pic:GrossWeightQuantity"/>
                                 </td>
                                 <td align="center" class="graph">
                                    <xsl:if test="pic:NetWeightQuantity">
                                       <xsl:value-of select="pic:NetWeightQuantity"/>
                                    </xsl:if>
                                 </td>
                                 <td align="center" class="graph">
                                    <xsl:value-of select="pic:TotalCost"/>
                                 </td>
                                 <td class="graph">
                                    <xsl:for-each select="pic:Documents">
                                       <xsl:value-of select="position()"/>. 
				<xsl:if test="cat_ru:PrDocumentNumber">№<xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                       </xsl:if>
                                       <xsl:if test="cat_ru:PrDocumentName"> <xsl:value-of select="cat_ru:PrDocumentName"/>
                                       </xsl:if>
                                       <xsl:if test="pic:DocumentModeCode"> (<xsl:value-of select="pic:DocumentModeCode"/>)</xsl:if>
                                       <xsl:if test="cat_ru:PrDocumentDate">Дата:<xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                          </xsl:call-template>
                                       </xsl:if>
                                       <xsl:if test="position()!=last()">
                                          <br/>
                                       </xsl:if>
                                    </xsl:for-each>
                                 </td>
                                 <td class="graph">
                                    <xsl:if test="pic:GoodsPackingInfo/catpi_ru:PakageQuantity">Количество <xsl:value-of select="pic:GoodsPackingInfo/catpi_ru:PakageQuantity"/> </xsl:if>
				(код вида <xsl:value-of select="pic:GoodsPackingInfo/catpi_ru:CargoCode"/>)
				<xsl:if test="pic:GoodsPackingInfo/catpi_ru:CargoDescription"> <xsl:value-of select="pic:GoodsPackingInfo/catpi_ru:CargoDescription"/>
                                    </xsl:if>
                                    <xsl:if test="pic:GoodsPackingInfo/catpi_ru:Seal">
										<br/>
										<xsl:text>Номера пломб: </xsl:text>
										  <xsl:for-each select="pic:GoodsPackingInfo/catpi_ru:Seal">
											  <xsl:value-of select="."/>
											  <xsl:if test="position()!=last()">, </xsl:if>
										  </xsl:for-each>
                                    </xsl:if>
                                    <br/>
                                    <table>
                                       <tr>
                                          <td align="center" class="graph" colspan="3" style="border:solid 0pt">Упаковка</td>
                                       </tr>
                                       <tr>
                                          <td align="center" class="graph" style="border:solid 0pt">Код</td>
                                          <td align="center" class="graph" style="border:solid 0pt">Количество</td>
                                          <td align="center" class="graph" style="border:solid 0pt">Маркировка</td>
                                       </tr>
                                       <xsl:for-each select="pic:GoodsPackingInfo/catpi_ru:PackingInformation">
                                          <tr>
                                             <td align="center" class="graph" style="border:solid 0pt">
                                                <xsl:value-of select="catpi_ru:PackingCode"/>
                                             </td>
                                             <td align="center" class="graph" style="border:solid 0pt">
                                                <xsl:value-of select="catpi_ru:PakingQuantity"/>
                                             </td>
                                             <td align="center" class="graph" style="border:solid 0pt">
                                                <xsl:if test="catpi_ru:PackingMark">
                                                   <xsl:value-of select="catpi_ru:PackingMark"/>
                                                </xsl:if>
                                             </td>
                                          </tr>
                                       </xsl:for-each>
                                    </table>
                                 </td>
                              </tr>
                           </xsl:for-each>
                        </table>
                     </td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="pic:Consignor | pic:Consignee">
      <!--<xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/><br/>
	</xsl:if>-->
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
         <xsl:value-of select="cat_ru:ShortName"/>
         <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
      </xsl:if>
      <br/>
      <xsl:choose>
         <xsl:when test="cat_ru:RFOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RKOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RBOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
         </xsl:when>
      </xsl:choose>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			  <span class="header">Адрес:</span>
			  <br/>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()"><br/></xsl:if>
			</xsl:for-each>
		</xsl:if>
      <xsl:if test="RUScat_ru:IdentityCard">
         <br/><xsl:apply-templates select="RUScat_ru:IdentityCard"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
         <span>ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span>БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:for-each select="cat_ru:ITN">
         <span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
            </xsl:if>
         </span>
         <br/>
      </xsl:for-each>
   </xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
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
   <xsl:template match="RUScat_ru:IdentityCard">
      <span class="header">Документ, удостоверяющий личность:</span>
      <br/>
      <xsl:if test="RUScat_ru:IdentityCardName">
         <xsl:value-of select="RUScat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardCode">(код вида документа <xsl:value-of select="RUScat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardName or RUScat_ru:IdentityCardCode">
         <br/>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
         <span>
			Серия номер:
			<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="RUScat_ru:OrganizationName"/>
         <br/>
      </xsl:if>
      <br/>
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
</xsl:stylesheet>
