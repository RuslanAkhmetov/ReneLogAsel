<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="math" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:math="http://exslt.org/math" xmlns:oezr="urn:customs.ru:Information:CustomsDocuments:OEZ_Report:5.22.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
	<xsl:template match="//*[local-name()='OEZ_Report']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
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
         <xsl:apply-templates select="cat_ru:PostalCode"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:apply-templates select="cat_ru:CounryName"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:apply-templates select="cat_ru:Region"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:apply-templates select="cat_ru:City"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:apply-templates select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="head">
      <table style="width:297mm">
         <tbody>
            <tr>
               <td align="right">
                  <b>Форма №<xsl:apply-templates select="."/>
                  </b>
               </td>
            </tr>
            <tr>
               <td>ОТЧЕТНОСТЬ<br/>
					<xsl:variable name="xpath_FormNum">
						<xsl:call-template name="get_xpath">
							<xsl:with-param name="node" select="."/>
						</xsl:call-template>
					</xsl:variable>
					<element xml_node="{$xpath_FormNum}">
						  <xsl:choose>
							 <xsl:when test="(.=3) or (.=4)">о товарах, изготовленных(полученных) из товаров,<br/> помещенных под таможенную процедуру
										свободной таможенной зоны,  <br/>
							 </xsl:when>
							 <xsl:when test="(.=1) or (.=2)">о товарах, помещенных под таможенную процедуру
										свободной таможенной зоны,  <br/>
							 </xsl:when>
						  </xsl:choose>
					</element>
					<xsl:variable name="xpath_StartDate">
						<xsl:call-template name="get_xpath">
							<xsl:with-param name="node" select="../oezr:ReportingPeriod/oezr:StartDate"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:variable name="xpath_EndDate">
						<xsl:call-template name="get_xpath">
							<xsl:with-param name="node" select="../oezr:ReportingPeriod/oezr:EndDate"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:variable name="xpath_ReportDate">
						<xsl:call-template name="get_xpath">
							<xsl:with-param name="node" select="../oezr:ReportDate"/>
						</xsl:call-template>
					</xsl:variable>
                  <xsl:choose>
                     <xsl:when test="(.=1)">	
								за период с "<u>
							<element xml_node="{$xpath_StartDate}">
							   <xsl:value-of select="substring(../oezr:ReportingPeriod/oezr:StartDate,9,2)"/>
							</element>
                        </u>" 
								<u>
							<element xml_node="{$xpath_StartDate}">
							   <xsl:choose>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:StartDate,6,2))='01'">января</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:StartDate,6,2))='02'">февраля</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:StartDate,6,2))='03'">марта</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:StartDate,6,2))='04'">апреля</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:StartDate,6,2))='05'">мая</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:StartDate,6,2))='06'">июня</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:StartDate,6,2))='07'">июля</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:StartDate,6,2))='08'">августа</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:StartDate,6,2))='09'">сентября</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:StartDate,6,2))='10'">октября</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:StartDate,6,2))='11'">ноября</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:StartDate,6,2))='12'">декабря</xsl:when>
							   </xsl:choose>
							</element>
                        </u> 
								20 
								<u>
							<element xml_node="{$xpath_StartDate}">
							   <xsl:value-of select="substring(../oezr:ReportingPeriod/oezr:StartDate,3,2)"/>
							</element>
                        </u>г.
															
								по "<u>
							<element xml_node="{$xpath_EndDate}">
							   <xsl:value-of select="substring(../oezr:ReportingPeriod/oezr:EndDate,9,2)"/>
							</element>
                        </u>" 
								<u>
							<element xml_node="{$xpath_EndDate}">
							   <xsl:choose>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:EndDate,6,2))='01'">января</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:EndDate,6,2))='02'">февраля</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:EndDate,6,2))='03'">марта</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:EndDate,6,2))='04'">апреля</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:EndDate,6,2))='05'">мая</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:EndDate,6,2))='06'">июня</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:EndDate,6,2))='07'">июля</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:EndDate,6,2))='08'">августа</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:EndDate,6,2))='09'">сентября</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:EndDate,6,2))='10'">октября</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:EndDate,6,2))='11'">ноября</xsl:when>
								  <xsl:when test="(substring(../oezr:ReportingPeriod/oezr:EndDate,6,2))='12'">декабря</xsl:when>
							   </xsl:choose>
							</element>
                        </u> 
								20 <u>
						<element xml_node="{$xpath_EndDate}">
                           <xsl:value-of select="substring(../oezr:ReportingPeriod/oezr:EndDate,3,2)"/>
                        </element>
                        </u>г.<br/>
                     </xsl:when>
                     <xsl:when test="(.=2) or (.=3)">
						по таможенным декларациям №№
								<u>
                           <xsl:for-each select="oezr:DeclarationNumForReport">
                              <xsl:apply-templates select="cat_ru:CustomsCode"/>
                              <xsl:text>/</xsl:text>
                              <xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date_gtd"/>
                              <xsl:text>/</xsl:text>
                              <xsl:apply-templates select="cat_ru:GTDNumber"/>
                           </xsl:for-each>
                        </u>
                        <br/>
                     </xsl:when>
                  </xsl:choose>
								по состоянию на "<u>
					<element xml_node="{$xpath_ReportDate}">
                     <xsl:value-of select="substring(../oezr:ReportDate,9,2)"/>
                    </element>
                  </u>" 
								<u>
					<element xml_node="{$xpath_ReportDate}">
                     <xsl:choose>
                        <xsl:when test="(substring(../oezr:ReportDate,6,2))='01'">января</xsl:when>
                        <xsl:when test="(substring(../oezr:ReportDate,6,2))='02'">февраля</xsl:when>
                        <xsl:when test="(substring(../oezr:ReportDate,6,2))='03'">марта</xsl:when>
                        <xsl:when test="(substring(../oezr:ReportDate,6,2))='04'">апреля</xsl:when>
                        <xsl:when test="(substring(../oezr:ReportDate,6,2))='05'">мая</xsl:when>
                        <xsl:when test="(substring(../oezr:ReportDate,6,2))='06'">июня</xsl:when>
                        <xsl:when test="(substring(../oezr:ReportDate,6,2))='07'">июля</xsl:when>
                        <xsl:when test="(substring(../oezr:ReportDate,6,2))='08'">августа</xsl:when>
                        <xsl:when test="(substring(../oezr:ReportDate,6,2))='09'">сентября</xsl:when>
                        <xsl:when test="(substring(../oezr:ReportDate,6,2))='10'">октября</xsl:when>
                        <xsl:when test="(substring(../oezr:ReportDate,6,2))='11'">ноября</xsl:when>
                        <xsl:when test="(substring(../oezr:ReportDate,6,2))='12'">декабря</xsl:when>
                     </xsl:choose>
                    </element>
                  </u> 
								20 <u>
					<element xml_node="{$xpath_ReportDate}">
                     <xsl:value-of select="substring(../oezr:ReportDate,3,2)"/>
                    </element>
                  </u>г.
								 на 
                  <!--u><xsl:apply-templates select=""/></u-->л.
								
								</td>
            </tr>
            <tr>
               <td>от 
									<u>
                     <xsl:apply-templates select="../oezr:Declarant/oezr:ResidentLicenseNumber"/> 
							<xsl:apply-templates select="../oezr:Declarant/oezr:Organisation/cat_ru:OrganizationName"/> 
							<xsl:apply-templates select="../oezr:Declarant/oezr:Organisation/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/> 
						</u>
               </td>
            </tr>
            <tr>
               <td>(наименование организации, ОГРН, адрес)</td>
            </tr>
            <tr>
               <td>
                  <u>
                     <xsl:for-each select="../oezr:Declarant/oezr:Address">
                        <xsl:call-template name="Address"/>
                     </xsl:for-each>
                  </u>
               </td>
            </tr>
            <tr>
               <td>М.П.
								<u>
                     <xsl:apply-templates select="../oezr:ResidentPersonSignature/cat_ru:PersonSurname"/> 
							<xsl:apply-templates select="../oezr:ResidentPersonSignature/cat_ru:PersonName"/> 
							<xsl:apply-templates select="../oezr:ResidentPersonSignature/cat_ru:PersonMiddleName"/> 
							<xsl:apply-templates select="../oezr:ResidentPersonSignature/cat_ru:IssueDate" mode="russian_date"/>
                  </u>
               </td>
            </tr>
            <tr>
               <td>(Ф.И.О., подпись уполномоченного лица, на которое возложена ответственность составления отчетности, дата)</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template name="tab1">
      <table border="1" style="width:297mm">
         <tbody>
            <tr>
               <td rowspan="3" style="width:5mm">№п/п</td>
               <td rowspan="3" style="width:15mm">Наименование товара</td>
               <td rowspan="3" style="width:13mm">Код товара по ТН ВЭД ЕАЭС (10 знаков)</td>
               <td rowspan="3" style="width:10mm">Единица измерения количество товара, указанного в графах 5-9, 12, 14 и 16-20</td>
               <td colspan="3" style="width:36mm">Количество товаров, помещенных под таможенную процедуру свобой таможенной зоны</td>
               <td colspan="13" style="width:195mm">Распоряжение за отчетный период товарами, помещенными под таможенную процедуру свободной таможеннной зоны</td>
            </tr>
            <tr>
               <td rowspan="2" style="width:11mm">На начало отчетного  периода</td>
               <td rowspan="2" style="width:12mm">На конец отчетного периода</td>
               <td rowspan="2" style="width:13mm">Всего за отчетный период</td>
               <td rowspan="2" style="width:11mm">Товары, подвергнутые операциям по пераработке (обработке) (количество)</td>
               <td rowspan="2" style="width:11mm">Товары, потребленные на территории ОЭЗ без учета товаров, указанных в графе 19</td>
               <td colspan="3" style="width:40mm"> Изменение таможенной процедуры СТЗ на иную таможенную процедуру, 
					в том числе при передаче прав владения, пользованияи (или) распоряжениядругому(им) резиденту(ам)</td>
               <td colspan="2" style="width:33mm">Уничтожено на территории ОЭЗ вследствие аварии или действия непреодолимой силы или с разрешения таможенного органа</td>
               <td colspan="2" style="width:33mm">Иное использование</td>
               <td colspan="2" style="width:40mm">Изменение статуса товаров (сведения о завершении таможенной процедуры СТЗ в отношении 
					товаров, помещенных под таможенную процедуру СТЗ, при прекращении функционирования ОЭЗ 
					и в случае утраты лицом статуса резидента в соответствии с пунктами 5, 8 статьи 15 Соглашения о СЭЗ)</td>
               <td rowspan="2" style="width:13mm">Товары, использованные в соответсвии с пунктом 4 статьи 13 Соглашения о СЭЗ (количество)</td>
               <td rowspan="2" style="width:13mm">Товары, находящиеся у резидента ОЭЗ, в отношении которых осуществляется хранение (складирование)
					 на территории ОЭЗ (количество)</td>
            </tr>
            <tr>
               <td style="width:10mm">Код таможенной процедуры</td>
               <td style="width:18mm">№ таможенной декларации, в соответствии с которой товары помещены под иную таможенную процедуру</td>
               <td style="width:12mm">Количество товара</td>
               <td style="width:13mm">Дата и номер документа, подтверждающего факт уничтожения товаров</td>
               <td style="width:20mm">Количество товаров в соответствии с документом, подтверждающим факт уничтожения товаров, указанным в графе 13</td>
               <td style="width:13mm">Дата и номер документа, подтверждающего факт использования товаров</td>
               <td style="width:20mm">Количество товаров в соответствии с документом, подтверждающим факт использования товаров, указанным в графе 15</td>
               <td style="width:20mm">Количество товаров, в отношении которых таможенная процедура СТЗ завершена при прекращении функционирования ОЭЗ</td>
               <td style="width:20mm">Количество товаров, в отношении которых таможенная процедура СТЗ завершена в случае утраты лицом статуса резидента</td>
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
               <td>10</td>
               <td>11</td>
               <td>12</td>
               <td>13</td>
               <td>14</td>
               <td>15</td>
               <td>16</td>
               <td>17</td>
               <td>18</td>
               <td>19</td>
               <td>20</td>
            </tr>
            <!-- Вывод товаров со статусом ИМ   -->
            <!--xsl:choose>
					<xsl:when test="(../oezr:Table1/oezr:Table1Goods/oezr:Status='1') or (../oezr:Table1/oezr:Table1Goods/oezr:Status='true')">
					<tr>
						<td colspan="20">Иностранные товары</td>
					</tr>
					</xsl:when>
					<xsl:when test="(../oezr:Table1/oezr:Table1Goods/oezr:Status='0') or (../oezr:Table1/oezr:Table1Goods/oezr:Status='false')">
					<tr>
						<td colspan="20">Товары таможенного союза</td>
					</tr>
					</xsl:when>
				</xsl:choose-->
            <xsl:if test="../oezr:Table1/oezr:Table1Goods[(oezr:Status='1') ]">
               <tr>
                  <td colspan="20">Иностранные товары</td>
               </tr>
               <xsl:for-each select="../oezr:Table1/oezr:Table1Goods[(oezr:Status='1') ]">
                  <xsl:variable name="posMain1" select="position()"/>
                  <xsl:variable name="Change" select="count(oezr:Used/oezr:CustomsTreatmentModeChanged)"/>
                  <xsl:variable name="Destruct" select="count(oezr:Used/oezr:OEZDestructedGoods)"/>
                  <xsl:variable name="Other" select="count(oezr:Used/oezr:OtherGoodsUsage)"/>
                  <xsl:variable name="Status" select="count(oezr:Used/oezr:StatusDisguiseGoods)"/>
                  <!--Вывод таблицы, если цикл  CustomsTreatmentModeChanged наибольший-->
                  <xsl:if test="(($Change>$Destruct) and ($Change>$Other) and ($Change>$Status)) or (($Change=$Destruct) and ($Change>$Other) and ($Change>$Status)) or (($Change>$Destruct) and ($Change=$Other) and ($Change>$Status)) or (($Change>$Destruct) and ($Change>$Other) and ($Change=$Status)) or (($Change=$Destruct) and ($Change=$Other) and ($Change=$Status))">
                     <xsl:for-each select="oezr:Used/oezr:CustomsTreatmentModeChanged">
                        <xsl:variable name="pos" select="position()"/>
                        <tr>
                           <xsl:choose>
                              <xsl:when test="$pos=1">
                                 <!--Вывод общих колонок 1-4  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="$posMain1"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:for-each select="../../oezr:Name"> 
												<xsl:apply-templates select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:TNVED[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:MeasureUnitQualifier[position() = $pos]"/>
                                 </td>
                                 <!--Вывод Количество товаров помещенных под таможенную процедуру, колонки 5-7  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityAtTheBeginning"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityInTheEnd"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityTotal"/>
                                 </td>
                                 <!--Вывод Распоряжение за отчетный период, колонки 8-9  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:RecyclingGoodsQuantity[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:QuantityOEZConsumed[position() = $pos]"/>
                                 </td>
                              </xsl:when>
                           </xsl:choose>
                           <!--Вывод цикла Изменение там процедуры СТЗ( Распоряжение за отчетный период), колонки 10-12  -->
                           <td>
                              <xsl:apply-templates select="oezr:CustomsModeCode"/>
                           </td>
                           <td>
                              <xsl:if test="oezr:DeclarationNumber/cat_ru:CustomsCode">
                                 <xsl:apply-templates select="oezr:DeclarationNumber/cat_ru:CustomsCode"/>
                                 <xsl:text>/</xsl:text>
                                 <xsl:apply-templates select="oezr:DeclarationNumber/cat_ru:RegistrationDate" mode="russian_date_gtd"/>
                                 <xsl:text>/</xsl:text>
									<xsl:apply-templates select="oezr:DeclarationNumber/cat_ru:GTDNumber"/>
                              </xsl:if>
                           </td>
                           <td>
                              <xsl:apply-templates select="oezr:Quantity"/>
                           </td>
                           <!--Вывод цикла Уничтожено на территории ОЭЗ( Распоряжение за отчетный период), колонки 13-14  -->
                           <td>
                              <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/>
                              <xsl:text> </xsl:text> 
                              <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
                              <xsl:text> </xsl:text>
									<xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/> 
								</td>
                           <td>
                              <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:Quantity"/>
                           </td>
                           <!--Вывод цикла Иное использование товаров( Распоряжение за отчетный период), колонки 15-16  -->
                           <td>
                              <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/>
                              <xsl:text> </xsl:text>
                              <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
                              <xsl:text> </xsl:text>
                              <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:Quantity"/>
                           </td>
                           <!--Вывод цикла Изменение статуса товаров( Распоряжение за отчетный период), колонки 17-18  -->
                           <td>
                              <xsl:apply-templates select="../oezr:StatusDisguiseGoods[position() = $pos]/oezr:OEZClosedQuantity"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:StatusDisguiseGoods[position() = $pos]/oezr:LostGoodsQuantity"/>
                           </td>
                           <xsl:choose>
                              <xsl:when test="$pos=1">
                                 <!--Вывод двух последних колонок ( Распоряжение за отчетный период), колонки 19-20  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:QuantityConformUsageGoods[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:ResidentsGoodsQuantity[position() = $pos]"/>
                                 </td>
                              </xsl:when>
                           </xsl:choose>
                        </tr>
                     </xsl:for-each>
                  </xsl:if>
                  <!--Вывод таблицы, если цикл  OEZDestructedGoods наибольший-->
                  <xsl:if test="(($Destruct>$Change) and ($Destruct>$Other) and ($Destruct>$Status)) or (($Change=$Destruct) and ($Destruct>$Other) and ($Destruct>$Status)) or (($Destruct>$Change) and ($Destruct=$Other) and ($Destruct>$Status)) or (($Destruct>$Change) and ($Destruct>$Other) and ($Destruct=$Status))">
                     <xsl:for-each select="oezr:Used/oezr:OEZDestructedGoods">
                        <xsl:variable name="pos" select="position()"/>
                        <tr>
                           <xsl:choose>
                              <xsl:when test="$pos=1">
                                 <!--Вывод общих колонок 1-4  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="$posMain1"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:for-each select="../../oezr:Name">
                                       <xsl:apply-templates select="."/> 
											</xsl:for-each>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:TNVED[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:MeasureUnitQualifier[position() = $pos]"/>
                                 </td>
                                 <!--Вывод Количество товаров помещенных под таможенную процедуру, колонки 5-7  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityAtTheBeginning"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityInTheEnd"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityTotal"/>
                                 </td>
                                 <!--Вывод Распоряжение за отчетный период, колонки 8-9  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:RecyclingGoodsQuantity[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:QuantityOEZConsumed[position() = $pos]"/>
                                 </td>
                              </xsl:when>
                           </xsl:choose>
                           <!--Вывод цикла Изменение там процедуры СТЗ( Распоряжение за отчетный период), колонки 10-12  -->
                           <td>
                              <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:CustomsModeCode"/>
                           </td>
                           <td>
                              <xsl:if test="../oezr:CustomsTreatmentModeChanged[position() = $pos]">
                                 <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:DeclarationNumber/cat_ru:CustomsCode"/>
								  <xsl:text>/</xsl:text>
								  <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:DeclarationNumber/cat_ru:RegistrationDate" mode="russian_date_gtd"/>
								  <xsl:text>/</xsl:text>
										<xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:DeclarationNumber/cat_ru:GTDNumber"/>
                              </xsl:if>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:Quantity"/>
                           </td>
                           <!--Вывод цикла Уничтожено на территории ОЭЗ( Распоряжение за отчетный период), колонки 13-14  -->
                           <td>
                              <xsl:apply-templates select="oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/>
								  <xsl:text> </xsl:text>
								  <xsl:apply-templates select="oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
								  <xsl:text> </xsl:text>
                              <xsl:apply-templates select="oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="oezr:Quantity"/>
                           </td>
                           <!--Вывод цикла Иное использование товаров( Распоряжение за отчетный период), колонки 15-16  -->
                           <td>
                              <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/> 
								  <xsl:text> </xsl:text>
								  <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
								  <xsl:text> </xsl:text>
									<xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/> 
								</td>
                           <td>
                              <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:Quantity"/>
                           </td>
                           <!--Вывод цикла Изменение статуса товаров( Распоряжение за отчетный период), колонки 17-18  -->
                           <td>
                              <xsl:apply-templates select="../oezr:StatusDisguiseGoods[position() = $pos]/oezr:OEZClosedQuantity"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:StatusDisguiseGoods[position() = $pos]/oezr:LostGoodsQuantity"/>
                           </td>
                           <xsl:choose>
                              <xsl:when test="$pos=1">
                                 <!--Вывод двух последних колонок ( Распоряжение за отчетный период), колонки 19-20  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:QuantityConformUsageGoods[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:ResidentsGoodsQuantity[position() = $pos]"/>
                                 </td>
                              </xsl:when>
                           </xsl:choose>
                        </tr>
                     </xsl:for-each>
                  </xsl:if>
                  <!--Вывод таблицы, если цикл  OtherGoodsUsage наибольший-->
                  <xsl:if test="(($Other>$Destruct) and ($Other>$Change) and ($Other>$Status)) or (($Other=$Destruct) and ($Other>$Change)       and ($Other>$Status)) or (($Other>$Destruct) and ($Other=$Change) and ($Other>$Status)) or (($Other>$Destruct) and ($Other>$Change)       and ($Other=$Status))">
                     <xsl:for-each select="oezr:Used/oezr:OEZDestructedGoods">
                        <xsl:variable name="pos" select="position()"/>
                        <tr>
                           <xsl:choose>
                              <xsl:when test="$pos=1">
                                 <!--Вывод общих колонок 1-4  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="$posMain1"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:for-each select="../../oezr:Name">
                                       <xsl:apply-templates select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:TNVED[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:MeasureUnitQualifier[position() = $pos]"/>
                                 </td>
                                 <!--Вывод Количество товаров помещенных под таможенную процедуру, колонки 5-7  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityAtTheBeginning"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityInTheEnd"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityTotal"/>
                                 </td>
                                 <!--Вывод Распоряжение за отчетный период, колонки 8-9  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:RecyclingGoodsQuantity[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:QuantityOEZConsumed[position() = $pos]"/>
                                 </td>
                              </xsl:when>
                           </xsl:choose>
                           <!--Вывод цикла Изменение там процедуры СТЗ( Распоряжение за отчетный период), колонки 10-12  -->
                           <td>
                              <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:CustomsModeCode"/>
                           </td>
                           <td>
                              <xsl:if test="./oezr:CustomsTreatmentModeChanged[position() = $pos]">
                                 <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:DeclarationNumber/cat_ru:CustomsCode"/>
								  <xsl:text>/</xsl:text>
								  <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:DeclarationNumber/cat_ru:RegistrationDate" mode="russian_date_gtd"/>
								  <xsl:text>/</xsl:text>
										<xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:DeclarationNumber/cat_ru:GTDNumber"/>
                              </xsl:if>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:Quantity"/>
                           </td>
                           <!--Вывод цикла Уничтожено на территории ОЭЗ( Распоряжение за отчетный период), колонки 13-14  -->
                           <td>
                              <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/>
								  <xsl:text> </xsl:text>
								  <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
								  <xsl:text> </xsl:text>
                              <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:Quantity"/>
                           </td>
                           <!--Вывод цикла Иное использование товаров( Распоряжение за отчетный период), колонки 15-16  -->
                           <td>
                              <xsl:apply-templates select="oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/> 
								  <xsl:text> </xsl:text>
								  <xsl:apply-templates select="oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
								  <xsl:text> </xsl:text>
									<xsl:apply-templates select="oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/> 
								</td>
                           <td>
                              <xsl:apply-templates select="oezr:Quantity"/>
                           </td>
                           <!--Вывод цикла Изменение статуса товаров( Распоряжение за отчетный период), колонки 17-18  -->
                           <td>
                              <xsl:apply-templates select="../oezr:StatusDisguiseGoods[position() = $pos]/oezr:OEZClosedQuantity"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:StatusDisguiseGoods[position() = $pos]/oezr:LostGoodsQuantity"/>
                           </td>
                           <xsl:choose>
                              <xsl:when test="$pos=1">
                                 <!--Вывод двух последних колонок ( Распоряжение за отчетный период), колонки 19-20  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:QuantityConformUsageGoods[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:ResidentsGoodsQuantity[position() = $pos]"/>
                                 </td>
                              </xsl:when>
                           </xsl:choose>
                        </tr>
                     </xsl:for-each>
                  </xsl:if>
                  <!--Вывод таблицы, если цикл  StatusDisguiseGoods наибольший-->
                  <xsl:if test="(($Status>$Destruct) and ($Status>$Other) and ($Status>$Change)) or (($Status=$Destruct) and ($Status>$Other)       and ($Status>$Change)) or (($Status>$Destruct) and ($Status=$Other) and ($Status>$Change)) or (($Status>$Destruct)        and ($Status>$Other) and ($Status=$Change))">
                     <xsl:for-each select="oezr:Used/oezr:StatusDisguiseGoods">
                        <xsl:variable name="pos" select="position()"/>
                        <tr>
                           <xsl:choose>
                              <xsl:when test="$pos=1">
                                 <!--Вывод общих колонок 1-4  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="$posMain1"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:for-each select="../../oezr:Name">
                                       <xsl:apply-templates select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:TNVED[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:MeasureUnitQualifier[position() = $pos]"/>
                                 </td>
                                 <!--Вывод Количество товаров помещенных под таможенную процедуру, колонки 5-7  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityAtTheBeginning"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityInTheEnd"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityTotal"/>
                                 </td>
                                 <!--Вывод Распоряжение за отчетный период, колонки 8-9  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:RecyclingGoodsQuantity[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:QuantityOEZConsumed[position() = $pos]"/>
                                 </td>
                              </xsl:when>
                           </xsl:choose>
                           <!--Вывод цикла Изменение там процедуры СТЗ( Распоряжение за отчетный период), колонки 10-12  -->
                           <td>
                              <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:CustomsModeCode"/>
                           </td>
                           <td>
                              <xsl:if test="../oezr:CustomsTreatmentModeChanged[position() = $pos]">
                                 <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:DeclarationNumber/cat_ru:CustomsCode"/>
								  <xsl:text>/</xsl:text>
								  <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:DeclarationNumber/cat_ru:RegistrationDate" mode="russian_date_gtd"/>
								  <xsl:text>/</xsl:text>
										<xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:DeclarationNumber/cat_ru:GTDNumber"/>
                              </xsl:if>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:Quantity"/>
                           </td>
                           <!--Вывод цикла Уничтожено на территории ОЭЗ( Распоряжение за отчетный период), колонки 13-14  -->
                           <td>
                              <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/>
								  <xsl:text> </xsl:text>
								  <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
								  <xsl:text> </xsl:text>
                              <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:Quantity"/>
                           </td>
                           <!--Вывод цикла Иное использование товаров( Распоряжение за отчетный период), колонки 15-16  -->
                           <td>
                              <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/>
								  <xsl:text> </xsl:text>
								  <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
								  <xsl:text> </xsl:text>
                              <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:Quantity"/>
                           </td>
                           <!--Вывод цикла Изменение статуса товаров( Распоряжение за отчетный период), колонки 17-18  -->
                           <td>
                              <xsl:apply-templates select="oezr:OEZClosedQuantity"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="oezr:LostGoodsQuantity"/>
                           </td>
                           <xsl:choose>
                              <xsl:when test="$pos=1">
                                 <!--Вывод двух последних колонок ( Распоряжение за отчетный период), колонки 19-20  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:QuantityConformUsageGoods[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:ResidentsGoodsQuantity[position() = $pos]"/>
                                 </td>
                              </xsl:when>
                           </xsl:choose>
                        </tr>
                     </xsl:for-each>
                  </xsl:if>
               </xsl:for-each>
            </xsl:if>
            <!-- Вывод товаров со статусом ТС   -->
            <xsl:if test="../oezr:Table1/oezr:Table1Goods[(oezr:Status='0') ]">
               <tr>
                  <td colspan="20">Товары таможенного союза</td>
               </tr>
               <xsl:for-each select="../oezr:Table1/oezr:Table1Goods[(oezr:Status='0') ]">
                  <xsl:variable name="posMain1" select="position()"/>
                  <xsl:variable name="Change" select="count(oezr:Used/oezr:CustomsTreatmentModeChanged)"/>
                  <xsl:variable name="Destruct" select="count(oezr:Used/oezr:OEZDestructedGoods)"/>
                  <xsl:variable name="Other" select="count(oezr:Used/oezr:OtherGoodsUsage)"/>
                  <xsl:variable name="Status" select="count(oezr:Used/oezr:StatusDisguiseGoods)"/>
                  <!--Вывод таблицы, если цикл  CustomsTreatmentModeChanged наибольший-->
                  <xsl:if test="(($Change>$Destruct) and ($Change>$Other) and ($Change>$Status)) or (($Change=$Destruct) and ($Change>$Other) and ($Change>$Status)) or (($Change>$Destruct) and ($Change=$Other) and ($Change>$Status)) or (($Change>$Destruct) and ($Change>$Other) and ($Change=$Status)) or (($Change=$Destruct) and ($Change=$Other) and ($Change=$Status))">
                     <xsl:for-each select="oezr:Used/oezr:CustomsTreatmentModeChanged">
                        <xsl:variable name="pos" select="position()"/>
                        <tr>
                           <xsl:choose>
                              <xsl:when test="$pos=1">
                                 <!--Вывод общих колонок 1-4  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="$posMain1"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:for-each select="../../oezr:Name"> 
												<xsl:apply-templates select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:TNVED[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:MeasureUnitQualifier[position() = $pos]"/>
                                 </td>
                                 <!--Вывод Количество товаров помещенных под таможенную процедуру, колонки 5-7  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityAtTheBeginning"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityInTheEnd"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityTotal"/>
                                 </td>
                                 <!--Вывод Распоряжение за отчетный период, колонки 8-9  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:RecyclingGoodsQuantity[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:QuantityOEZConsumed[position() = $pos]"/>
                                 </td>
                              </xsl:when>
                           </xsl:choose>
                           <!--Вывод цикла Изменение там процедуры СТЗ( Распоряжение за отчетный период), колонки 10-12  -->
                           <td>
                              <xsl:apply-templates select="oezr:CustomsModeCode"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="oezr:DeclarationNumber/cat_ru:CustomsCode"/>
								  <xsl:text>/</xsl:text>
								  <xsl:apply-templates select="oezr:DeclarationNumber/cat_ru:RegistrationDate" mode="russian_date_gtd"/>
								  <xsl:text>/</xsl:text>
									<xsl:apply-templates select="oezr:DeclarationNumber/cat_ru:GTDNumber"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="oezr:Quantity"/>
                           </td>
                           <!--Вывод цикла Уничтожено на территории ОЭЗ( Распоряжение за отчетный период), колонки 13-14  -->
                           <td>
                              <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/> 
								  <xsl:text> </xsl:text>
								  <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
								  <xsl:text> </xsl:text>
									<xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/> 
								</td>
                           <td>
                              <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:Quantity"/>
                           </td>
                           <!--Вывод цикла Иное использование товаров( Распоряжение за отчетный период), колонки 15-16  -->
                           <td>
                              <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/>
								  <xsl:text> </xsl:text>
								  <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
								  <xsl:text> </xsl:text>
                              <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:Quantity"/>
                           </td>
                           <!--Вывод цикла Изменение статуса товаров( Распоряжение за отчетный период), колонки 17-18  -->
                           <td>
                              <xsl:apply-templates select="../oezr:StatusDisguiseGoods[position() = $pos]/oezr:OEZClosedQuantity"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:StatusDisguiseGoods[position() = $pos]/oezr:LostGoodsQuantity"/>
                           </td>
                           <xsl:choose>
                              <xsl:when test="$pos=1">
                                 <!--Вывод двух последних колонок ( Распоряжение за отчетный период), колонки 19-20  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:QuantityConformUsageGoods[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Change"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:ResidentsGoodsQuantity[position() = $pos]"/>
                                 </td>
                              </xsl:when>
                           </xsl:choose>
                        </tr>
                     </xsl:for-each>
                  </xsl:if>
                  <!--Вывод таблицы, если цикл  OEZDestructedGoods наибольший-->
                  <xsl:if test="(($Destruct>$Change) and ($Destruct>$Other) and ($Destruct>$Status)) or (($Change=$Destruct) and ($Destruct>$Other) and ($Destruct>$Status)) or (($Destruct>$Change) and ($Destruct=$Other) and ($Destruct>$Status)) or (($Destruct>$Change) and ($Destruct>$Other) and ($Destruct=$Status))">
                     <xsl:for-each select="oezr:Used/oezr:OEZDestructedGoods">
                        <xsl:variable name="pos" select="position()"/>
                        <tr>
                           <xsl:choose>
                              <xsl:when test="$pos=1">
                                 <!--Вывод общих колонок 1-4  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="$posMain1"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:for-each select="../../oezr:Name">
                                       <xsl:apply-templates select="."/> 
											</xsl:for-each>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:TNVED[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:MeasureUnitQualifier[position() = $pos]"/>
                                 </td>
                                 <!--Вывод Количество товаров помещенных под таможенную процедуру, колонки 5-7  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityAtTheBeginning"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityInTheEnd"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityTotal"/>
                                 </td>
                                 <!--Вывод Распоряжение за отчетный период, колонки 8-9  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:RecyclingGoodsQuantity[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:QuantityOEZConsumed[position() = $pos]"/>
                                 </td>
                              </xsl:when>
                           </xsl:choose>
                           <!--Вывод цикла Изменение там процедуры СТЗ( Распоряжение за отчетный период), колонки 10-12  -->
                           <td>
                              <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:CustomsModeCode"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:Quantity"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:DeclarationNumber/cat_ru:CustomsCode"/>
								  <xsl:text>/</xsl:text>
								  <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:DeclarationNumber/cat_ru:RegistrationDate" mode="russian_date_gtd"/>
								  <xsl:text>/</xsl:text>
                              <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:DeclarationNumber/cat_ru:GTDNumber"/>
                           </td>
                           <!--Вывод цикла Уничтожено на территории ОЭЗ( Распоряжение за отчетный период), колонки 13-14  -->
                           <td>
                              <xsl:apply-templates select="oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/>
								  <xsl:text> </xsl:text>
								  <xsl:apply-templates select="oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
								  <xsl:text> </xsl:text>
                              <xsl:apply-templates select="oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="oezr:Amount"/>
                           </td>
                           <!--Вывод цикла Иное использование товаров( Распоряжение за отчетный период), колонки 15-16  -->
                           <td>
                              <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/> 
								  <xsl:text> </xsl:text>
								  <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
								  <xsl:text> </xsl:text>
									<xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/> 
								</td>
                           <td>
                              <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:Amount"/>
                           </td>
                           <!--Вывод цикла Изменение статуса товаров( Распоряжение за отчетный период), колонки 17-18  -->
                           <td>
                              <xsl:apply-templates select="../oezr:StatusDisguiseGoods[position() = $pos]/oezr:OEZClosedQuantity"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:StatusDisguiseGoods[position() = $pos]/oezr:LostGoodsQuantity"/>
                           </td>
                           <xsl:choose>
                              <xsl:when test="$pos=1">
                                 <!--Вывод двух последних колонок ( Распоряжение за отчетный период), колонки 19-20  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:QuantityConformUsageGoods[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Destruct"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:ResidentsGoodsQuantity[position() = $pos]"/>
                                 </td>
                              </xsl:when>
                           </xsl:choose>
                        </tr>
                     </xsl:for-each>
                  </xsl:if>
                  <!--Вывод таблицы, если цикл  OtherGoodsUsage наибольший-->
                  <xsl:if test="(($Other>$Destruct) and ($Other>$Change) and ($Other>$Status)) or (($Other=$Destruct) and ($Other>$Change)       and ($Other>$Status)) or (($Other>$Destruct) and ($Other=$Change) and ($Other>$Status)) or (($Other>$Destruct) and ($Other>$Change)       and ($Other=$Status))">
                     <xsl:for-each select="oezr:Used/oezr:OEZDestructedGoods">
                        <xsl:variable name="pos" select="position()"/>
                        <tr>
                           <xsl:choose>
                              <xsl:when test="$pos=1">
                                 <!--Вывод общих колонок 1-4  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="$posMain1"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:for-each select="../../oezr:Name">
                                       <xsl:apply-templates select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:TNVED[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:MeasureUnitQualifier[position() = $pos]"/>
                                 </td>
                                 <!--Вывод Количество товаров помещенных под таможенную процедуру, колонки 5-7  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityAtTheBeginning"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityInTheEnd"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityTotal"/>
                                 </td>
                                 <!--Вывод Распоряжение за отчетный период, колонки 8-9  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:RecyclingGoodsQuantity[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:QuantityOEZConsumed[position() = $pos]"/>
                                 </td>
                              </xsl:when>
                           </xsl:choose>
                           <!--Вывод цикла Изменение там процедуры СТЗ( Распоряжение за отчетный период), колонки 10-12  -->
                           <td>
                              <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:CustomsModeCode"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:Quantity"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:DeclarationNumber/cat_ru:CustomsCode"/>
								  <xsl:text>/</xsl:text>
								  <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:DeclarationNumber/cat_ru:RegistrationDate" mode="russian_date_gtd"/>
								  <xsl:text>/</xsl:text>
                              <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:DeclarationNumber/cat_ru:GTDNumber"/>
                           </td>
                           <!--Вывод цикла Уничтожено на территории ОЭЗ( Распоряжение за отчетный период), колонки 13-14  -->
                           <td>
                              <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/>
								  <xsl:text> </xsl:text>
								  <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
								  <xsl:text> </xsl:text>
                              <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:Amount"/>
                           </td>
                           <!--Вывод цикла Иное использование товаров( Распоряжение за отчетный период), колонки 15-16  -->
                           <td>
                              <xsl:apply-templates select="oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/> 
								  <xsl:text> </xsl:text>
								  <xsl:apply-templates select="oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
								  <xsl:text> </xsl:text>
									<xsl:apply-templates select="oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/> 
								</td>
                           <td>
                              <xsl:apply-templates select="oezr:Amount"/>
                           </td>
                           <!--Вывод цикла Изменение статуса товаров( Распоряжение за отчетный период), колонки 17-18  -->
                           <td>
                              <xsl:apply-templates select="../oezr:StatusDisguiseGoods[position() = $pos]/oezr:OEZClosedQuantity"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:StatusDisguiseGoods[position() = $pos]/oezr:LostGoodsQuantity"/>
                           </td>
                           <xsl:choose>
                              <xsl:when test="$pos=1">
                                 <!--Вывод двух последних колонок ( Распоряжение за отчетный период), колонки 19-20  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:QuantityConformUsageGoods[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Other"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:ResidentsGoodsQuantity[position() = $pos]"/>
                                 </td>
                              </xsl:when>
                           </xsl:choose>
                        </tr>
                     </xsl:for-each>
                  </xsl:if>
                  <!--Вывод таблицы, если цикл  StatusDisguiseGoods наибольший-->
                  <xsl:if test="(($Status>$Destruct) and ($Status>$Other) and ($Status>$Change)) or (($Status=$Destruct) and ($Status>$Other)       and ($Status>$Change)) or (($Status>$Destruct) and ($Status=$Other) and ($Status>$Change)) or (($Status>$Destruct)        and ($Status>$Other) and ($Status=$Change))">
                     <xsl:for-each select="oezr:Used/oezr:OEZDestructedGoods">
                        <xsl:variable name="pos" select="position()"/>
                        <tr>
                           <xsl:choose>
                              <xsl:when test="$pos=1">
                                 <!--Вывод общих колонок 1-4  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="$posMain1"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:for-each select="../../oezr:Name">
                                       <xsl:apply-templates select="."/>
                                    </xsl:for-each>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:TNVED[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:MeasureUnitQualifier[position() = $pos]"/>
                                 </td>
                                 <!--Вывод Количество товаров помещенных под таможенную процедуру, колонки 5-7  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityAtTheBeginning"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityInTheEnd"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../../oezr:Put[position() = $pos]/oezr:QuantityTotal"/>
                                 </td>
                                 <!--Вывод Распоряжение за отчетный период, колонки 8-9  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:RecyclingGoodsQuantity[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:QuantityOEZConsumed[position() = $pos]"/>
                                 </td>
                              </xsl:when>
                           </xsl:choose>
                           <!--Вывод цикла Изменение там процедуры СТЗ( Распоряжение за отчетный период), колонки 10-12  -->
                           <td>
                              <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:CustomsModeCode"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:Quantity"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:DeclarationNumber/cat_ru:CustomsCode"/>
								  <xsl:text>/</xsl:text>
								  <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:DeclarationNumber/cat_ru:RegistrationDate" mode="russian_date_gtd"/>
								  <xsl:text>/</xsl:text>
                              <xsl:apply-templates select="../oezr:CustomsTreatmentModeChanged[position() = $pos]/oezr:DeclarationNumber/cat_ru:GTDNumber"/>
                           </td>
                           <!--Вывод цикла Уничтожено на территории ОЭЗ( Распоряжение за отчетный период), колонки 13-14  -->
                           <td>
                              <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/>
								  <xsl:text> </xsl:text>
								  <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
								  <xsl:text> </xsl:text>
                              <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:OEZDestructedGoods[position() = $pos]/oezr:Amount"/>
                           </td>
                           <!--Вывод цикла Иное использование товаров( Распоряжение за отчетный период), колонки 15-16  -->
                           <td>
                              <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/>
								  <xsl:text> </xsl:text>
								  <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
								  <xsl:text> </xsl:text>
                              <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="../oezr:OtherGoodsUsage[position() = $pos]/oezr:Amount"/>
                           </td>
                           <!--Вывод цикла Изменение статуса товаров( Распоряжение за отчетный период), колонки 17-18  -->
                           <td>
                              <xsl:apply-templates select="oezr:OEZClosedQuantity"/>
                           </td>
                           <td>
                              <xsl:apply-templates select="oezr:LostGoodsQuantity"/>
                           </td>
                           <xsl:choose>
                              <xsl:when test="$pos=1">
                                 <!--Вывод двух последних колонок ( Распоряжение за отчетный период), колонки 19-20  -->
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:QuantityConformUsageGoods[position() = $pos]"/>
                                 </td>
                                 <td>
                                    <xsl:attribute name="rowspan">
                                       <xsl:value-of select="$Status"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="../oezr:ResidentsGoodsQuantity[position() = $pos]"/>
                                 </td>
                              </xsl:when>
                           </xsl:choose>
                        </tr>
                     </xsl:for-each>
                  </xsl:if>
               </xsl:for-each>
            </xsl:if>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template name="tab2">
      <table border="1" style="width:297mm">
         <tbody>
            <tr>
               <td rowspan="2" style="width:10mm">№п/п</td>
               <td rowspan="2" style="width:25mm">Наименование товара</td>
               <td rowspan="2" style="width:20mm">Код товара по ТН ВЭД ЕАЭС (10 знаков)</td>
               <td rowspan="2" style="width:20mm">№ таможенной декларации, в соответствии с которой товар был помещен по таможенную процедуру СТЗ</td>
               <td rowspan="2" style="width:15mm">Единица измерения количество товара, указанного в графах 6,9,12 и 15</td>
               <td colspan="3" style="width:55mm">Товары, поступившие в организацию</td>
               <td colspan="3" style="width:55mm">Товары, переданные в производство и фактически израсходованные</td>
               <td colspan="3" style="width:55mm">Товары, которые выбыли (проданы, списаны)</td>
               <td rowspan="2" style="width:20mm">Товары, находящиеся у резидента ОЭЗ, в отношении которых осуществляется хранение (складирование)</td>
            </tr>
            <tr>
               <td style="width:15mm">Количество товара</td>
               <td style="width:20mm">Стоимость товара в тысячах рублей согласно учтеным ценам</td>
               <td style="width:20mm"> №№ счета и субсчета согласно Плану счетов бухгалтерского учета, на которых отражены товары</td>
               <td style="width:15mm">Количество товара</td>
               <td style="width:20mm">Стоимость товара в тысячах рублей согласно учтеным ценам</td>
               <td style="width:20mm"> №№ счета и субсчета согласно Плану счетов бухгалтерского учета, на которых отражены товары</td>
               <td style="width:15mm">Количество товара</td>
               <td style="width:20mm">Стоимость товара в тысячах рублей согласно учтеным ценам</td>
               <td style="width:20mm"> №№ счета и субсчета согласно Плану счетов бухгалтерского учета, на которых отражены товары</td>
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
               <td>10</td>
               <td>11</td>
               <td>12</td>
               <td>13</td>
               <td>14</td>
               <td>15</td>
            </tr>
            <xsl:for-each select="../oezr:Table2/oezr:Table2Goods">
               <xsl:variable name="posMain" select="position()"/>
               <xsl:variable name="In" select="count(oezr:In)"/>
               <xsl:variable name="Used" select="count(oezr:Used)"/>
               <xsl:variable name="Out" select="count(oezr:Out)"/>
               <xsl:if test="(($In>$Out) and ($In>$Used)) or (($In=$Out) and ($In>$Used)) or (($In>$Out) and ($In=$Used))">
                  <xsl:for-each select="oezr:In">
                     <xsl:variable name="pos" select="position()"/>
                     <tr>
                        <xsl:choose>
                           <xsl:when test="$pos=1">
                              <td>
                                 <xsl:attribute name="rowspan">
                                    <xsl:value-of select="$In"/>
                                 </xsl:attribute>
                                 <xsl:value-of select="$posMain"/>
                              </td>
                              <td>
                                 <xsl:attribute name="rowspan">
                                    <xsl:value-of select="$In"/>
                                 </xsl:attribute>
                                 <xsl:for-each select="../oezr:Name">
                                    <xsl:apply-templates select="."/> 
											</xsl:for-each>
                              </td>
                              <td>
                                 <xsl:attribute name="rowspan">
                                    <xsl:value-of select="$In"/>
                                 </xsl:attribute>
                                 <xsl:apply-templates select="../oezr:TNVED[position() = $pos]"/>
                              </td>
                              <td>
                                 <xsl:attribute name="rowspan">
                                    <xsl:value-of select="$In"/>
                                 </xsl:attribute>
                                 <xsl:if test="../oezr:CustomsDocument[position() = $pos]/oezr:GTDNumber">
									<xsl:for-each select="../oezr:CustomsDocument[position() = $pos]/oezr:GTDNumber">
										<xsl:apply-templates select="cat_ru:CustomsCode"/>
										  <xsl:text>/</xsl:text>
										  <xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date_gtd"/>
										  <xsl:text>/</xsl:text>
										<xsl:apply-templates select="cat_ru:GTDNumber"/> 
										<xsl:if test="position()!=last()">;<br/></xsl:if>
									</xsl:for-each>	
                                 </xsl:if>
                                 <xsl:if test="../oezr:CustomsDocument[position() = $pos]/oezr:AlienationDocument">
									<xsl:for-each select="../oezr:CustomsDocument[position() = $pos]/oezr:AlienationDocument">
										<xsl:apply-templates select="cat_ru:PrDocumentName"/> 
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PrDocumentNumber"/> 
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
										<xsl:if test="position()!=last()">;<br/></xsl:if>
									</xsl:for-each>
                                 </xsl:if>
                              </td>
                              <td>
                                 <xsl:attribute name="rowspan">
                                    <xsl:value-of select="$In"/>
                                 </xsl:attribute>
                                 <xsl:apply-templates select="oezr:MeasureUnitQualifier[position() = $pos]"/>
                              </td>
                           </xsl:when>
                        </xsl:choose>
                        <td>
                           <xsl:apply-templates select="oezr:Quantity"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="oezr:Amount"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="oezr:Account"/> 
									<xsl:apply-templates select="oezr:SubAccount"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="../oezr:Used[position() = $pos]/oezr:Quantity"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="../oezr:Used[position() = $pos]/oezr:Amount"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="../oezr:Used[position() = $pos]/oezr:Account"/> 
									<xsl:apply-templates select="../oezr:Used[position() = $pos]/oezr:SubAccount"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="../oezr:Out[position() = $pos]/oezr:Quantity"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="../oezr:Out[position() = $pos]/oezr:Amount"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="../oezr:Out[position() = $pos]/oezr:Account"/> 
									<xsl:apply-templates select="../oezr:Out[position() = $pos]/oezr:SubAccount"/>
                        </td>
                        <xsl:choose>
                           <xsl:when test="$pos=1">
                              <td>
                                 <xsl:attribute name="rowspan">
                                    <xsl:value-of select="$In"/>
                                 </xsl:attribute>
                                 <xsl:apply-templates select="../oezr:ResidentsGoodsQuantity[position() = $pos]"/>
                              </td>
                           </xsl:when>
                        </xsl:choose>
                     </tr>
                  </xsl:for-each>
               </xsl:if>
               <xsl:if test="(($Used>$In) and ($Used>$Out)) or (($Used=$Out) and ($Used>$In)) or (($Used>$In) and ($Used=$Out))">
                  <xsl:for-each select="oezr:Used">
                     <xsl:variable name="pos" select="position()"/>
                     <tr>
                        <xsl:choose>
                           <xsl:when test="$pos=1">
                              <td>
                                 <xsl:attribute name="rowspan">
                                    <xsl:value-of select="$Used"/>
                                 </xsl:attribute>
                                 <!--xsl:number value="position()"/-->
                                 <xsl:value-of select="$posMain"/>
                              </td>
                              <td>
                                 <xsl:attribute name="rowspan">
                                    <xsl:value-of select="$Used"/>
                                 </xsl:attribute>
                                 <xsl:for-each select="../oezr:Name">
                                    <xsl:apply-templates select="."/> 
											</xsl:for-each>
                              </td>
                              <td>
                                 <xsl:attribute name="rowspan">
                                    <xsl:value-of select="$Used"/>
                                 </xsl:attribute>
                                 <xsl:apply-templates select="../oezr:TNVED[position() = $pos]"/>
                              </td>
                              <td>
                                 <xsl:attribute name="rowspan">
                                    <xsl:value-of select="$Used"/>
                                 </xsl:attribute>
                                 <xsl:if test="../oezr:CustomsDocument[position() = $pos]/oezr:GTDNumber">
									<xsl:for-each select="../oezr:CustomsDocument[position() = $pos]/oezr:GTDNumber">
										<xsl:apply-templates select="cat_ru:CustomsCode"/>
										<xsl:text>/</xsl:text>
										<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date_gtd"/>
										<xsl:text>/</xsl:text>
										<xsl:apply-templates select="cat_ru:GTDNumber"/> 
										<xsl:if test="position()!=last()">;<br/></xsl:if>
									</xsl:for-each>
								 </xsl:if>
                                 <xsl:if test="../oezr:CustomsDocument[position() = $pos]/oezr:AlienationDocument">
									<xsl:for-each select="../oezr:CustomsDocument[position() = $pos]/oezr:AlienationDocument">
										<xsl:apply-templates select="cat_ru:PrDocumentName"/> 
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PrDocumentNumber"/> 
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
										<xsl:if test="position()!=last()">;<br/></xsl:if>
									</xsl:for-each>
                                 </xsl:if>
                              </td>
                              <td>
                                 <xsl:attribute name="rowspan">
                                    <xsl:value-of select="$Used"/>
                                 </xsl:attribute>
                                 <xsl:apply-templates select="../oezr:MeasureUnitQualifier[position() = $pos]"/>
                              </td>
                           </xsl:when>
                        </xsl:choose>
                        <td>
                           <xsl:apply-templates select="../oezr:In[position() = $pos]/oezr:Quantity"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="../oezr:In[position() = $pos]/oezr:Amount"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="../oezr:In[position() = $pos]/oezr:Account"/> 
									<xsl:apply-templates select="../oezr:In[position() = $pos]/oezr:SubAccount"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="oezr:Quantity"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="oezr:Amount"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="oezr:Account"/> 
									<xsl:apply-templates select="oezr:SubAccount"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="../oezr:Out[position() = $pos]/oezr:Quantity"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="../oezr:Out[position() = $pos]/oezr:Amount"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="../oezr:Out[position() = $pos]/oezr:Account"/> 
									<xsl:apply-templates select="../oezr:Out[position() = $pos]/oezr:SubAccount"/>
                        </td>
                        <xsl:choose>
                           <xsl:when test="$pos=1">
                              <td>
                                 <xsl:attribute name="rowspan">
                                    <xsl:value-of select="$Used"/>
                                 </xsl:attribute>
                                 <xsl:apply-templates select="../oezr:ResidentsGoodsQuantity[position() = $pos]"/>
                              </td>
                           </xsl:when>
                        </xsl:choose>
                     </tr>
                  </xsl:for-each>
               </xsl:if>
               <xsl:if test="(($Out>$In) and ($Out>$Used)) or (($In=$Out) and ($Out>$Used)) or (($Out>$In) and ($Out=$Used)) or (($Out=$In) and ($Out=$Used))">
                  <xsl:for-each select="oezr:Out">
                     <xsl:variable name="pos" select="position()"/>
                     <tr>
                        <xsl:choose>
                           <xsl:when test="$pos=1">
                              <td>
                                 <xsl:attribute name="rowspan">
                                    <xsl:value-of select="$Out"/>
                                 </xsl:attribute>
                                 <!--xsl:number value="position()"/-->
                                 <xsl:value-of select="$posMain"/>
                              </td>
                              <td>
                                 <xsl:attribute name="rowspan">
                                    <xsl:value-of select="$Out"/>
                                 </xsl:attribute>
                                 <xsl:for-each select="../oezr:Name">
                                    <xsl:apply-templates select="."/> 
											</xsl:for-each>
                              </td>
                              <td>
                                 <xsl:attribute name="rowspan">
                                    <xsl:value-of select="$Out"/>
                                 </xsl:attribute>
                                 <xsl:apply-templates select="../oezr:TNVED[position() = $pos]"/>
                              </td>
                              <td>
                                 <xsl:attribute name="rowspan">
                                    <xsl:value-of select="$Out"/>
                                 </xsl:attribute>
                                 <xsl:if test="../oezr:CustomsDocument[position() = $pos]/oezr:GTDNumber">
									<xsl:for-each select="../oezr:CustomsDocument[position() = $pos]/oezr:GTDNumber">
										<xsl:apply-templates select="cat_ru:CustomsCode"/>
										<xsl:text>/</xsl:text>
										<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date_gtd"/>
										<xsl:text>/</xsl:text>
										<xsl:apply-templates select="cat_ru:GTDNumber"/> 
										<xsl:if test="position()!=last()">;<br/></xsl:if>
									</xsl:for-each>
								 </xsl:if>
                                 <xsl:if test="../oezr:CustomsDocument[position() = $pos]/oezr:AlienationDocument">
									<xsl:for-each select="../oezr:CustomsDocument[position() = $pos]/oezr:AlienationDocument">
										<xsl:apply-templates select="cat_ru:PrDocumentName"/> 
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PrDocumentNumber"/> 
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
										<xsl:if test="position()!=last()">;<br/></xsl:if>
									</xsl:for-each>
                                 </xsl:if>
                              </td>
                              <td>
                                 <xsl:attribute name="rowspan">
                                    <xsl:value-of select="$Out"/>
                                 </xsl:attribute>
                                 <xsl:apply-templates select="../oezr:MeasureUnitQualifier[position() = $pos]"/>
                              </td>
                           </xsl:when>
                        </xsl:choose>
                        <td>
                           <xsl:apply-templates select="../oezr:In[position() = $pos]/oezr:Quantity"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="../oezr:In[position() = $pos]/oezr:Amount"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="../oezr:In[position() = $pos]/oezr:Account"/> 
									<xsl:apply-templates select="../oezr:In[position() = $pos]/oezr:SubAccount"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="../oezr:Used[position() = $pos]/oezr:Quantity"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="../oezr:Used[position() = $pos]/oezr:Amount"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="../oezr:Used[position() = $pos]/oezr:Account"/> 
									<xsl:apply-templates select="../oezr:Used[position() = $pos]/oezr:SubAccount"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="oezr:Quantity"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="oezr:Amount"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="oezr:Account"/> 
									<xsl:apply-templates select="oezr:SubAccount"/>
                        </td>
                        <xsl:choose>
                           <xsl:when test="$pos=1">
                              <td>
                                 <xsl:attribute name="rowspan">
                                    <xsl:value-of select="$Out"/>
                                 </xsl:attribute>
                                 <xsl:apply-templates select="../oezr:ResidentsGoodsQuantity[position() = $pos]"/>
                              </td>
                           </xsl:when>
                        </xsl:choose>
                     </tr>
                  </xsl:for-each>
               </xsl:if>
            </xsl:for-each>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template name="tab3">
      <xsl:if test="../oezr:Table3/oezr:Table3Section1">
         <table>
            <tbody>
               <tr>
                  <td>
			Раздел 1. Товары, помещенные под таможенную процедуру СТЗ для целей совершения операций по переработке (обработке)
			</td>
               </tr>
            </tbody>
         </table>
         <table border="1" style="width:297mm">
            <tbody>
               <tr>
                  <td style="width:10mm">№п/п</td>
                  <td style="width:25mm">Наименование товара</td>
                  <td style="width:20mm">Код товара по ТН ВЭД ЕАЭС (10 знаков)</td>
                  <td style="width:20mm">№ таможенной декларации, в соответствии с которой товар был помещен по таможенную процедуру СТЗ</td>
                  <td style="width:20mm">Количество товара</td>
                  <td style="width:15mm">Единица измерения количество товара</td>
                  <td style="width:55mm">Наименование товаров, изготовленных(полученных) на территории ОЭЗ</td>
                  <td style="width:55mm">Примечание</td>
                  <td style="width:55mm">Остаток товаров, в отношении которых не совершены операции по переработке (обработке), находящихся у резидента ОЭЗ на отчетную дату (количество)</td>
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
               <xsl:if test="../oezr:Table3/oezr:Table3Section1/oezr:Table3Section1Goods[(oezr:Status='1') ]">
                  <tr>
                     <td colspan="10">Иностранные товары</td>
                  </tr>
                  <xsl:for-each select="../oezr:Table3/oezr:Table3Section1/oezr:Table3Section1Goods[(oezr:Status='1')]">
                     <xsl:variable name="pos" select="position()"/>
                     <tr>
                        <td>
                           <xsl:value-of select="position()"/>
                        </td>
                        <td>
                           <xsl:for-each select="oezr:Name">
                              <xsl:apply-templates select="."/> 
								</xsl:for-each>
                        </td>
                        <td>
                           <xsl:apply-templates select="oezr:TNVED"/>
                        </td>
                        <td>
                           <xsl:if test="oezr:CustomsDocument/oezr:GTDNumber">
								<xsl:for-each select="oezr:CustomsDocument/oezr:GTDNumber">
									<xsl:apply-templates select="cat_ru:CustomsCode"/>
									<xsl:text>/</xsl:text>
									<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date_gtd"/>
									<xsl:text>/</xsl:text>
									<xsl:apply-templates select="cat_ru:GTDNumber"/> 
									<xsl:if test="position()!=last()">;<br/></xsl:if>
								</xsl:for-each>
							</xsl:if>
                           <xsl:if test="oezr:CustomsDocument/oezr:AlienationDocument">
								<xsl:for-each select="oezr:CustomsDocument/oezr:AlienationDocument">
									<xsl:apply-templates select="cat_ru:PrDocumentName"/> 
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="cat_ru:PrDocumentNumber"/> 
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
									<xsl:if test="position()!=last()">;<br/></xsl:if>
								</xsl:for-each>
                           </xsl:if>
                        </td>
                        <td>
                           <xsl:apply-templates select="oezr:Quantity"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="oezr:MeasureUnitQualifier"/>
                        </td>
                        <td>
                           <xsl:for-each select="oezr:OEZGoodsName">
                              <xsl:apply-templates select="."/> 
								</xsl:for-each>
                        </td>
                        <td>
                           <xsl:for-each select="oezr:Note">
                              <xsl:apply-templates select="."/> 
								</xsl:for-each>
                        </td>
                        <td>
                           <xsl:apply-templates select="oezr:NonProcessingGoodsTail"/>
                        </td>
                     </tr>
                  </xsl:for-each>
               </xsl:if>
               <xsl:if test="../oezr:Table3/oezr:Table3Section1/oezr:Table3Section1Goods[(oezr:Status='0') ]">
                  <tr>
                     <td colspan="10">Товары Таможенного союза</td>
                  </tr>
                  <xsl:for-each select="../oezr:Table3/oezr:Table3Section1/oezr:Table3Section1Goods[(oezr:Status='0')]">
                     <xsl:variable name="pos" select="position()"/>
                     <tr>
                        <td>
                           <xsl:value-of select="position()"/>
                        </td>
                        <td>
                           <xsl:for-each select="oezr:Name">
                              <xsl:apply-templates select="."/> 
								</xsl:for-each>
                        </td>
                        <td>
                           <xsl:apply-templates select="oezr:TNVED"/>
                        </td>
                        <td>
                           <xsl:if test="oezr:CustomsDocument/oezr:GTDNumber">
								<xsl:for-each select="oezr:CustomsDocument/oezr:GTDNumber">
									<xsl:apply-templates select="cat_ru:CustomsCode"/>
									<xsl:text>/</xsl:text>
									<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date_gtd"/>
									<xsl:text>/</xsl:text>
									<xsl:apply-templates select="cat_ru:GTDNumber"/>
									<xsl:if test="position()!=last()">;<br/></xsl:if>
								</xsl:for-each>
                           </xsl:if>
                           <xsl:if test="oezr:CustomsDocument/oezr:AlienationDocument">
								<xsl:for-each select="oezr:CustomsDocument/oezr:AlienationDocument">
									<xsl:apply-templates select="cat_ru:PrDocumentName"/> 
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="cat_ru:PrDocumentNumber"/> 
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
									<xsl:if test="position()!=last()">;<br/></xsl:if>
								</xsl:for-each>
                           </xsl:if>
                        </td>
                        <td>
                           <xsl:apply-templates select="oezr:Quantity"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="oezr:MeasureUnitQualifier"/>
                        </td>
                        <td>
                           <xsl:for-each select="oezr:OEZGoodsName">
                              <xsl:apply-templates select="."/> 
								</xsl:for-each>
                        </td>
                        <td>
                           <xsl:for-each select="oezr:Note">
                              <xsl:apply-templates select="."/> 
								</xsl:for-each>
                        </td>
                        <td>
                           <xsl:apply-templates select="oezr:NonProcessingGoodsTail"/>
                        </td>
                     </tr>
                  </xsl:for-each>
               </xsl:if>
            </tbody>
         </table>
      </xsl:if>
      <xsl:if test="../oezr:Table3/oezr:Table3Section2">
         <table>
            <tbody>
               <tr>
                  <td>
                     <br/>
                     <br/>
                     <br/>
		Раздел 2.Товары, изготовленные(полученные) из товаров, помещенных под таможенную процедуру 
		СТЗ на отчетную дату согласно сведениям, указанным в разделе 1
		</td>
               </tr>
            </tbody>
         </table>
         <table border="1" style="width:297mm">
            <tbody>
               <tr>
                  <td rowspan="3" style="width:5mm">№п/п</td>
                  <td rowspan="3" style="width:25mm">Наименование товара</td>
                  <td rowspan="3" style="width:20mm">Код товара по ТН ВЭД ЕАЭС (10 знаков)</td>
                  <td rowspan="3" style="width:15mm">Количество товара</td>
                  <td rowspan="3" style="width:15mm">Единица измерения количество товара, указанного в графах 4,8, 11-13</td>
                  <td colspan="8" style="width:195mm">Распоряжение товарам, изготовленными (полученными) из товаров, помещенных под таможенную процедуру СТЗ</td>
               </tr>
               <tr>
                  <td colspan="4" style="width:70mm">Помещено под таможенную процедуру</td>
                  <td colspan="2" style="width:65mm">Иное использование товаров</td>
                  <td rowspan="2" style="width:30mm">Товары изготовленные(полученные) из товаров, помещенных под таможенную процедуру СТЗ, которые использованы в соответствии с пунктом 4 статьи 13 Соглашения о СЭЗ (количество)</td>
                  <td rowspan="2" style="width:30mm">Товары, находящиеся в распоряжении резидента ОЭЗ и в отношении которых осуществляется хранение(складирование) на территории ОЭЗ</td>
               </tr>
               <tr>
                  <td style="width:13mm">Код таможенной процедуры</td>
                  <td style="width:22mm">№ таможенной декларации, в соответствии с которой товары были помещены под таможенную процедуру</td>
                  <td style="width:15mm">Количество товара</td>
                  <td style="width:20mm">Примечание</td>
                  <td style="width:30mm">Дата и номер документа, полдтверждающего факт использования товаров</td>
                  <td style="width:30mm">Количество товара в соотвтествии с документом, подтвержлающим факт использования товара указанным в графе 10</td>
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
                  <td>10</td>
                  <td>11</td>
                  <td>12</td>
                  <td>13</td>
               </tr>
               <xsl:if test="../oezr:Table3/oezr:Table3Section2/oezr:Table3Section2Goods[(oezr:GoodsSign='1')]">
                  <tr>
                     <td colspan="13">Товары изготовленные(полученные) из иностранных товаров</td>
                  </tr>
                  <xsl:for-each select="../oezr:Table3/oezr:Table3Section2/oezr:Table3Section2Goods[(oezr:GoodsSign='1')]">
                     <xsl:variable name="posMain2" select="position()"/>
                     <xsl:variable name="N" select="count(oezr:WasteProductsUsage/oezr:CustomsProcedurePlaced)"/>
                     <xsl:variable name="K" select="count(oezr:WasteProductsUsage/oezr:OtherGoodsUsing)"/>
                     <xsl:if test="($N>$K)">
                        <xsl:for-each select="oezr:WasteProductsUsage/oezr:CustomsProcedurePlaced">
                           <xsl:variable name="point" select="ancestor::node()[2]"/>
                           <xsl:variable name="pos" select="position()"/>
                           <tr>
                              <xsl:choose>
                                 <xsl:when test="$pos=1">
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$N"/>
                                       </xsl:attribute>
                                       <xsl:value-of select="$posMain2"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$N"/>
                                       </xsl:attribute>
                                       <xsl:for-each select="$point/oezr:Name[position() = $pos]">
                                          <xsl:apply-templates select="."/> 
													</xsl:for-each>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$N"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:TNVED[position() = $pos]"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$N"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:Quantity[position() = $pos]"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$N"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:MeasureUnitQualifier[position() = $pos]"/>
                                    </td>
                                 </xsl:when>
                              </xsl:choose>
                              <!--oezr:CustomsProcedurePlaced-->
                              <td>
                                 <xsl:apply-templates select="oezr:CustomsModeCode"/>
                              </td>
                              <td>
                                 <xsl:apply-templates select="oezr:DeclarationNumber/cat_ru:CustomsCode"/>
								  <xsl:text>/</xsl:text>
								  <xsl:apply-templates select="oezr:DeclarationNumber/cat_ru:RegistrationDate" mode="russian_date_gtd"/>
								  <xsl:text>/</xsl:text>
							<xsl:apply-templates select="oezr:DeclarationNumber/cat_ru:GTDNumber"/>
                              </td>
                              <td>
                                 <xsl:apply-templates select="oezr:Quantity"/>
                              </td>
                              <td>
                                 <xsl:for-each select="oezr:Note">
                                    <xsl:apply-templates select="."/> 											</xsl:for-each>
                              </td>
                              <!--OtherGoodsUsing-->
                              <td>
                                 <xsl:apply-templates select="../oezr:OtherGoodsUsing[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/> 
								  <xsl:text> </xsl:text>
											<xsl:apply-templates select="../oezr:OtherGoodsUsing[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/>
								  <xsl:text> </xsl:text>
								  <xsl:apply-templates select="../oezr:OtherGoodsUsing[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
                              </td>
                              <td>
                                 <xsl:apply-templates select="../oezr:OtherGoodsUsing[position() = $pos]/oezr:Quantity"/>
                              </td>
                              <xsl:choose>
                                 <xsl:when test="$pos=1">
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$N"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:STZGoodsProduct[position() = $pos]"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$N"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:ResidentsGoodsQuantity[position() = $pos]"/>
                                    </td>
                                 </xsl:when>
                              </xsl:choose>
                           </tr>
                        </xsl:for-each>
                     </xsl:if>
                     <xsl:if test="(($K>$N) or ($K=$N))">
                        <xsl:for-each select="oezr:WasteProductsUsage/oezr:OtherGoodsUsing">
                           <xsl:variable name="pos" select="position()"/>
                           <xsl:variable name="point" select="ancestor::node()[2]"/>
                           <tr>
                              <xsl:choose>
                                 <xsl:when test="$pos=1">
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$K"/>
                                       </xsl:attribute>
                                       <xsl:value-of select="$posMain2"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$K"/>
                                       </xsl:attribute>
                                       <xsl:for-each select="$point/oezr:Name">
                                          <xsl:apply-templates select="."/> 
													</xsl:for-each>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$K"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:TNVED[position() = $pos]"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$K"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:Quantity[position() = $pos]"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$K"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:MeasureUnitQualifier[position() = $pos]"/>
                                    </td>
                                 </xsl:when>
                              </xsl:choose>
                              <!--oezr:CustomsProcedurePlaced-->
                              <td>
                                 <xsl:apply-templates select="../oezr:CustomsProcedurePlaced[position() = $pos]/oezr:CustomsModeCode"/>
                              </td>
                              <td>
                                 <xsl:if test="../oezr:CustomsProcedurePlaced[position() = $pos]">
                                    <xsl:apply-templates select="../oezr:CustomsProcedurePlaced[position() = $pos]/oezr:DeclarationNumber/cat_ru:CustomsCode"/>
								  <xsl:text>/</xsl:text>
								  <xsl:apply-templates select="../oezr:CustomsProcedurePlaced[position() = $pos]/oezr:DeclarationNumber/cat_ru:RegistrationDate" mode="russian_date_gtd"/>
								  <xsl:text>/</xsl:text>
							<xsl:apply-templates select="../oezr:CustomsProcedurePlaced[position() = $pos]/oezr:DeclarationNumber/cat_ru:GTDNumber"/>
                                 </xsl:if>
                              </td>
                              <td>
                                 <xsl:apply-templates select="../oezr:CustomsProcedurePlaced[position() = $pos]/oezr:Quantity"/>
                              </td>
                              <td>
                                 <xsl:for-each select="../oezr:CustomsProcedurePlaced[position() = $pos]/oezr:Note">
                                    <xsl:apply-templates select="."/> 
											</xsl:for-each>
                              </td>
                              <!--OtherGoodsUsing-->
                              <td>
                                 <xsl:apply-templates select="oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/> 
								  <xsl:text> </xsl:text>
											<xsl:apply-templates select="oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/> 
								  <xsl:text> </xsl:text>
								  <xsl:apply-templates select="oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
                              </td>
                              <td>
                                 <xsl:apply-templates select="oezr:Quantity"/>
                              </td>
                              <xsl:choose>
                                 <xsl:when test="$pos=1">
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$K"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:STZGoodsProduct[position() = $pos]"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$K"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:ResidentsGoodsQuantity[position() = $pos]"/>
                                    </td>
                                 </xsl:when>
                              </xsl:choose>
                           </tr>
                        </xsl:for-each>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:if>
               <xsl:if test="../oezr:Table3/oezr:Table3Section2/oezr:Table3Section2Goods[(oezr:GoodsSign='2')]">
                  <tr>
                     <td colspan="13">Товары изготовленные(полученные) с использованием иностранных товаров</td>
                  </tr>
                  <xsl:for-each select="../oezr:Table3/oezr:Table3Section2/oezr:Table3Section2Goods[(oezr:GoodsSign='2')]">
                     <xsl:variable name="posMain2" select="position()"/>
                     <xsl:variable name="N" select="count(oezr:WasteProductsUsage/oezr:CustomsProcedurePlaced)"/>
                     <xsl:variable name="K" select="count(oezr:WasteProductsUsage/oezr:OtherGoodsUsing)"/>
                     <xsl:if test="($N>$K)">
                        <xsl:for-each select="oezr:WasteProductsUsage/oezr:CustomsProcedurePlaced">
                           <xsl:variable name="point" select="ancestor::node()[2]"/>
                           <xsl:variable name="pos" select="position()"/>
                           <tr>
                              <xsl:choose>
                                 <xsl:when test="$pos=1">
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$N"/>
                                       </xsl:attribute>
                                       <xsl:value-of select="$posMain2"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$N"/>
                                       </xsl:attribute>
                                       <xsl:for-each select="$point/oezr:Name[position() = $pos]">
                                          <xsl:apply-templates select="."/> 
													</xsl:for-each>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$N"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:TNVED[position() = $pos]"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$N"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:Quantity[position() = $pos]"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$N"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:MeasureUnitQualifier[position() = $pos]"/>
                                    </td>
                                 </xsl:when>
                              </xsl:choose>
                              <!--oezr:CustomsProcedurePlaced-->
                              <td>
                                 <xsl:apply-templates select="oezr:CustomsModeCode"/>
                              </td>
                              <td>
                                 <xsl:apply-templates select="oezr:DeclarationNumber/cat_ru:CustomsCode"/>
								  <xsl:text>/</xsl:text>
								  <xsl:apply-templates select="oezr:DeclarationNumber/cat_ru:RegistrationDate" mode="russian_date_gtd"/>
								  <xsl:text>/</xsl:text>
							<xsl:apply-templates select="oezr:DeclarationNumber/cat_ru:GTDNumber"/>
                              </td>
                              <td>
                                 <xsl:apply-templates select="oezr:Quantity"/>
                              </td>
                              <td>
                                 <xsl:for-each select="oezr:Note">
                                    <xsl:apply-templates select="."/> 											</xsl:for-each>
                              </td>
                              <!--OtherGoodsUsing-->
                              <td>
                                 <xsl:apply-templates select="../oezr:OtherGoodsUsing[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/> 
								  <xsl:text> </xsl:text>
											<xsl:apply-templates select="../oezr:OtherGoodsUsing[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/>
								  <xsl:text> </xsl:text>
								  <xsl:apply-templates select="../oezr:OtherGoodsUsing[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
                              </td>
                              <td>
                                 <xsl:apply-templates select="../oezr:OtherGoodsUsing[position() = $pos]/oezr:Quantity"/>
                              </td>
                              <xsl:choose>
                                 <xsl:when test="$pos=1">
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$N"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:STZGoodsProduct[position() = $pos]"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$N"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:ResidentsGoodsQuantity[position() = $pos]"/>
                                    </td>
                                 </xsl:when>
                              </xsl:choose>
                           </tr>
                        </xsl:for-each>
                     </xsl:if>
                     <xsl:if test="(($K>$N) or ($K=$N))">
                        <xsl:for-each select="oezr:WasteProductsUsage/oezr:OtherGoodsUsing">
                           <xsl:variable name="pos" select="position()"/>
                           <xsl:variable name="point" select="ancestor::node()[2]"/>
                           <tr>
                              <xsl:choose>
                                 <xsl:when test="$pos=1">
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$K"/>
                                       </xsl:attribute>
                                       <xsl:value-of select="$posMain2"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$K"/>
                                       </xsl:attribute>
                                       <xsl:for-each select="$point/oezr:Name">
                                          <xsl:apply-templates select="."/> 
													</xsl:for-each>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$K"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:TNVED[position() = $pos]"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$K"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:Quantity[position() = $pos]"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$K"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:MeasureUnitQualifier[position() = $pos]"/>
                                    </td>
                                 </xsl:when>
                              </xsl:choose>
                              <!--oezr:CustomsProcedurePlaced-->
                              <td>
                                 <xsl:apply-templates select="../oezr:CustomsProcedurePlaced[position() = $pos]/oezr:CustomsModeCode"/>
                              </td>
                              <td>
                                 <xsl:if test="../oezr:CustomsProcedurePlaced[position() = $pos]">
                                    <xsl:apply-templates select="../oezr:CustomsProcedurePlaced[position() = $pos]/oezr:DeclarationNumber/cat_ru:CustomsCode"/>
								  <xsl:text>/</xsl:text>
								  <xsl:apply-templates select="../oezr:CustomsProcedurePlaced[position() = $pos]/oezr:DeclarationNumber/cat_ru:RegistrationDate" mode="russian_date_gtd"/>
								  <xsl:text>/</xsl:text>
							<xsl:apply-templates select="../oezr:CustomsProcedurePlaced[position() = $pos]/oezr:DeclarationNumber/cat_ru:GTDNumber"/>
                                 </xsl:if>
                              </td>
                              <td>
                                 <xsl:apply-templates select="../oezr:CustomsProcedurePlaced[position() = $pos]/oezr:Quantity"/>
                              </td>
                              <td>
                                 <xsl:for-each select="../oezr:CustomsProcedurePlaced[position() = $pos]/oezr:Note">
                                    <xsl:apply-templates select="."/> 
											</xsl:for-each>
                              </td>
                              <!--OtherGoodsUsing-->
                              <td>
                                 <xsl:apply-templates select="oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/> 
								  <xsl:text> </xsl:text>
											<xsl:apply-templates select="oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/> 
								  <xsl:text> </xsl:text>
								  <xsl:apply-templates select="oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
                              </td>
                              <td>
                                 <xsl:apply-templates select="oezr:Quantity"/>
                              </td>
                              <xsl:choose>
                                 <xsl:when test="$pos=1">
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$K"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:STZGoodsProduct[position() = $pos]"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$K"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:ResidentsGoodsQuantity[position() = $pos]"/>
                                    </td>
                                 </xsl:when>
                              </xsl:choose>
                           </tr>
                        </xsl:for-each>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:if>
               <xsl:if test="../oezr:Table3/oezr:Table3Section2/oezr:Table3Section2Goods[(oezr:GoodsSign='3')]">
                  <tr>
                     <td colspan="13">Товары изготовленные(полученные) из товаров Таможенного союза</td>
                  </tr>
                  <xsl:for-each select="../oezr:Table3/oezr:Table3Section2/oezr:Table3Section2Goods[(oezr:GoodsSign='3')]">
                     <xsl:variable name="posMain2" select="position()"/>
                     <xsl:variable name="N" select="count(oezr:WasteProductsUsage/oezr:CustomsProcedurePlaced)"/>
                     <xsl:variable name="K" select="count(oezr:WasteProductsUsage/oezr:OtherGoodsUsing)"/>
                     <xsl:if test="($N>$K)">
                        <xsl:for-each select="oezr:WasteProductsUsage/oezr:CustomsProcedurePlaced">
                           <xsl:variable name="point" select="ancestor::node()[2]"/>
                           <xsl:variable name="pos" select="position()"/>
                           <tr>
                              <xsl:choose>
                                 <xsl:when test="$pos=1">
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$N"/>
                                       </xsl:attribute>
                                       <xsl:value-of select="$posMain2"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$N"/>
                                       </xsl:attribute>
                                       <xsl:for-each select="$point/oezr:Name[position() = $pos]">
                                          <xsl:apply-templates select="."/> 
													</xsl:for-each>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$N"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:TNVED[position() = $pos]"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$N"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:Quantity[position() = $pos]"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$N"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:MeasureUnitQualifier[position() = $pos]"/>
                                    </td>
                                 </xsl:when>
                              </xsl:choose>
                              <!--oezr:CustomsProcedurePlaced-->
                              <td>
                                 <xsl:apply-templates select="oezr:CustomsModeCode"/>
                              </td>
                              <td>
                                 <xsl:apply-templates select="oezr:DeclarationNumber/cat_ru:CustomsCode"/>
								  <xsl:text>/</xsl:text>
								  <xsl:apply-templates select="oezr:DeclarationNumber/cat_ru:RegistrationDate" mode="russian_date_gtd"/>
								  <xsl:text>/</xsl:text>
							<xsl:apply-templates select="oezr:DeclarationNumber/cat_ru:GTDNumber"/>
                              </td>
                              <td>
                                 <xsl:apply-templates select="oezr:Quantity"/>
                              </td>
                              <td>
                                 <xsl:for-each select="oezr:Note">
                                    <xsl:apply-templates select="."/> 											</xsl:for-each>
                              </td>
                              <!--OtherGoodsUsing-->
                              <td>
                                 <xsl:apply-templates select="../oezr:OtherGoodsUsing[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/> 
								  <xsl:text> </xsl:text>
											<xsl:apply-templates select="../oezr:OtherGoodsUsing[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/>
								  <xsl:text> </xsl:text>
								  <xsl:apply-templates select="../oezr:OtherGoodsUsing[position() = $pos]/oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
                              </td>
                              <td>
                                 <xsl:apply-templates select="../oezr:OtherGoodsUsing[position() = $pos]/oezr:Quantity"/>
                              </td>
                              <xsl:choose>
                                 <xsl:when test="$pos=1">
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$N"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:STZGoodsProduct[position() = $pos]"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$N"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:ResidentsGoodsQuantity[position() = $pos]"/>
                                    </td>
                                 </xsl:when>
                              </xsl:choose>
                           </tr>
                        </xsl:for-each>
                     </xsl:if>
                     <xsl:if test="(($K>$N) or ($K=$N))">
                        <xsl:for-each select="oezr:WasteProductsUsage/oezr:OtherGoodsUsing">
                           <xsl:variable name="pos" select="position()"/>
                           <xsl:variable name="point" select="ancestor::node()[2]"/>
                           <tr>
                              <xsl:choose>
                                 <xsl:when test="$pos=1">
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$K"/>
                                       </xsl:attribute>
                                       <xsl:value-of select="$posMain2"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$K"/>
                                       </xsl:attribute>
                                       <xsl:for-each select="$point/oezr:Name">
                                          <xsl:apply-templates select="."/> 
													</xsl:for-each>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$K"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:TNVED[position() = $pos]"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$K"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:Quantity[position() = $pos]"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$K"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:MeasureUnitQualifier[position() = $pos]"/>
                                    </td>
                                 </xsl:when>
                              </xsl:choose>
                              <!--oezr:CustomsProcedurePlaced-->
                              <td>
                                 <xsl:apply-templates select="../oezr:CustomsProcedurePlaced[position() = $pos]/oezr:CustomsModeCode"/>
                              </td>
                              <td>
                                 <xsl:if test="../oezr:CustomsProcedurePlaced[position() = $pos]">
                                    <xsl:apply-templates select="../oezr:CustomsProcedurePlaced[position() = $pos]/oezr:DeclarationNumber/cat_ru:CustomsCode"/>
								  <xsl:text>/</xsl:text>
								  <xsl:apply-templates select="../oezr:CustomsProcedurePlaced[position() = $pos]/oezr:DeclarationNumber/cat_ru:RegistrationDate" mode="russian_date_gtd"/>
								  <xsl:text>/</xsl:text>
							<xsl:apply-templates select="../oezr:CustomsProcedurePlaced[position() = $pos]/oezr:DeclarationNumber/cat_ru:GTDNumber"/>
                                 </xsl:if>
                              </td>
                              <td>
                                 <xsl:apply-templates select="../oezr:CustomsProcedurePlaced[position() = $pos]/oezr:Quantity"/>
                              </td>
                              <td>
                                 <xsl:for-each select="../oezr:CustomsProcedurePlaced[position() = $pos]/oezr:Note">
                                    <xsl:apply-templates select="."/> 
											</xsl:for-each>
                              </td>
                              <!--OtherGoodsUsing-->
                              <td>
                                 <xsl:apply-templates select="oezr:ConfirmUsageDoc/cat_ru:PrDocumentName"/> 
								  <xsl:text> </xsl:text>
											<xsl:apply-templates select="oezr:ConfirmUsageDoc/cat_ru:PrDocumentNumber"/> 
								  <xsl:text> </xsl:text>
								  <xsl:apply-templates select="oezr:ConfirmUsageDoc/cat_ru:PrDocumentDate" mode="russian_date"/>
                              </td>
                              <td>
                                 <xsl:apply-templates select="oezr:Quantity"/>
                              </td>
                              <xsl:choose>
                                 <xsl:when test="$pos=1">
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$K"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:STZGoodsProduct[position() = $pos]"/>
                                    </td>
                                    <td>
                                       <xsl:attribute name="rowspan">
                                          <xsl:value-of select="$K"/>
                                       </xsl:attribute>
                                       <xsl:apply-templates select="$point/oezr:ResidentsGoodsQuantity[position() = $pos]"/>
                                    </td>
                                 </xsl:when>
                              </xsl:choose>
                           </tr>
                        </xsl:for-each>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:if>
            </tbody>
         </table>
      </xsl:if>
   </xsl:template>
   <xsl:template name="tab4">
      <table border="1" style="width:297mm">
         <tbody>
            <tr>
               <td>№ п/п</td>
               <td>Наименование товара, изготовленного (полученного) из товаров, помещенных под таможенную процедуру СТЗ</td>
               <td>Код товара по ТН ВЭД ЕАЭС ( 6 знаков)</td>
               <td>Количество товара</td>
               <td>Единица измерения количества товара</td>
            </tr>
            <tr>
               <td>1</td>
               <td>2</td>
               <td>3</td>
               <td>4</td>
               <td>5</td>
            </tr>
            <xsl:for-each select="../oezr:Table4/oezr:Table4Goods">
               <xsl:variable name="pos" select="position()"/>
               <tr>
                  <td>
                     <xsl:value-of select="position()"/>
                  </td>
                  <td>
                     <xsl:for-each select="oezr:Name">
                        <xsl:apply-templates select="."/> 
							</xsl:for-each>
                  </td>
                  <td>
                     <xsl:apply-templates select="oezr:TNVED"/>
                  </td>
                  <td>
                     <xsl:apply-templates select="oezr:Quantity"/>
                  </td>
                  <td>
                     <xsl:apply-templates select="oezr:MeasureUnitQualifier"/>
                  </td>
               </tr>
            </xsl:for-each>
         </tbody>
      </table>
   </xsl:template>
   <!--Обработка корневого элемента-->
   <xsl:template match="oezr:OEZ_Report">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Отчетность о товарах, помещенных под таможенную процедуру СТЗ</title>
            <style type="text/css">
					body { text-align: center;  }
					table { border: 0; cellpadding: 0; cellspacing: 0; width:100%; border-collapse: collapse; }
					td { font-size: 10.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ padding-left:4pt }
					td.bold { font-size: 10.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; text-decoration: none; text-align: general; vertical-align: bottom; /*white-space: nowrap;*/ }					
					td.value { font-size: 8.0pt; font-family: Courier; color: windowtext; font-weight: 400; font-style: normal; text-decoration: none; text-align: general; vertical-align: top; /*white-space: nowrap;*/ }
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
					td.border-right-bottom { border-left: medium none; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-bottom { border-left: .5pt solid windowtext; border-right: medium none; border-top: medium none; border-bottom: .5pt solid windowtext; }
					td.border-left-right { border-left: .5pt solid windowtext; border-right: .5pt solid windowtext; border-top: medium none; border-bottom: medium none; }
					span.bold { font-size: 10.0pt; font-family: Arial, sans-serif; color: windowtext; font-weight: 700; font-style: normal; }					
					span.value { font-size: 12.0pt; font-family: Courier; color: windowtext; }
					div.page { width: 297mm; height: 210mm; margin-top: 6pt; margin-bottom: 6pt; padding:	10mm; padding-left:	20mm; background: #ffffff; border: solid 1pt #000000; }
					p.number-date { font-weight: bold; }
					.bordered {	border: solid 1pt #000000; padding-top:4pt; padding-bottom:4pt; }
					.underlined { border-bottom: solid 0.8pt #000000; }
					.graph { font-family: Arial; font-size: 7pt; }
					.graphUnderlined {font-family: Arial; font-size: 7pt; border-top: solid 0.8pt #000000}
					.graph-number { font-size: 9pt; font-weight: bold; }
				</style>
         </head>
         <body>
            <div>
               <xsl:for-each select="oezr:FormNum">
                  <xsl:if test=".='1'">
                     <table style="width:297mm">
                        <tbody>
                           <tr>
                              <td>
                                 <xsl:call-template name="head"/>
                                 <br/>
                                 <xsl:call-template name="tab1"/>
                                 <br/>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </xsl:if>
                  <xsl:if test=".='2'">
                     <table style="width:297mm">
                        <tbody>
                           <tr>
                              <td>
                                 <xsl:call-template name="head"/>
                                 <br/>
                                 <xsl:call-template name="tab2"/>
                                 <br/>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </xsl:if>
                  <xsl:if test=".='3'">
                     <table style="width:297mm">
                        <tbody>
                           <tr>
                              <td>
                                 <xsl:call-template name="head"/>
                                 <br/>
                                 <xsl:call-template name="tab3"/>
                                 <br/>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </xsl:if>
                  <xsl:if test=".='4'">
                     <table style="width:297mm">
                        <tbody>
                           <tr>
                              <td>
                                 <xsl:call-template name="head"/>
                                 <br/>
                                 <xsl:call-template name="tab4"/>
                                 <br/>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </xsl:if>
               </xsl:for-each>
            </div>
         </body>
      </html>
   </xsl:template>
   <!--xsl:template name="massive1">
		<xsl:param name="in1"/>
		<xsl:param name="out1"/>
		<xsl:param name="used1"/>
		<xsl:text>&lt;a&gt;</xsl:text><xsl:value-of select="$in1"/><xsl:text>&lt;/a&gt;</xsl:text>
		<xsl:text>&lt;a&gt;</xsl:text><xsl:value-of select="$out1"/><xsl:text>&lt;/a&gt;</xsl:text>
		<xsl:text>&lt;a&gt;</xsl:text><xsl:value-of select="$used1"/><xsl:text>&lt;/a&gt;</xsl:text>
	</xsl:template-->
</xsl:stylesheet>
