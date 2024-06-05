<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:oeznr="urn:customs.ru:Information:CustomsDocuments:OEZ_NotifReg:5.22.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template match="oeznr:OEZ_NotifReg">
      <html>
         <head>
			 <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
         </head>
         <body>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="center">
                        <span style="font-size:large; font-weight:bold; ">
							<xsl:choose>
                              <xsl:when test="oeznr:DocumentSign='1'">Уведомление о ввозе товаров</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='2'">Уведомление о вывозе товаров</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='3'">Заявление на уничтожение</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='4'">Акт об уничтожении</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='5'">Заявление на переработку товаров вне ОЭЗ</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='6'">Заявление на продление срока переработки товаров вне ОЭЗ</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='7'">Заявление о перемещении товаров (процедура свободного склада)</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='8'">Уведомление о вывозе товаров (процедура свободного склада)</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='9'">Уведомление о невывозе товаров (процедура свободного склада)</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='10'">Разрешение на ввоз товаров ПОЭЗ</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='11'">Разрешение на вывоз товаров ОЭЗ</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='12'">Разрешение на вывоз товаров ПОЭЗ</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='13'">Разрешение на вывоз товаров ТОСЭР</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='14'">Разрешение на уничтожение</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='15'">Уведомление о вывозе Арктика ПОЭЗ</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='16'">Уведомление о вывозе Арктика ОЭЗ</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='17'">Уведомление о ввозе ПОЭЗ Арктика</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='18'">Разрешение на ввоз ПОЭЗ Арктика</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='19'">Уведомление о ввозе ОЭЗ Арктика</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='20'">Заявление о завершении СТЗ по товарам, использованным для создания недвижимости</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='21'">Заявление о завершении СТЗ по потребленным товарам, в рамках операций по их переработке</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='22'">Решение по заявлению о завершении СТЗ по товарам, использованным для создания недвижимости</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='23'">Решение по заявлению о завершении СТЗ по потребленным товарам, в рамках операций по их переработке</xsl:when>
                              <xsl:otherwise>Акт об уничтожении</xsl:otherwise>
                           </xsl:choose></span>
                        <br/>
                     </td>
                  </tr>
                  <tr>
                     <td align="center"/>
                  </tr>
               </tbody>
            </table>
            <br/>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td width="131">
                        <table border="1">
                           <tbody>
                              <tr>
                                 <td align="center" width="110">
                                    <xsl:value-of select="oeznr:Customs/cat_ru:Code"/>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                     <td>
                        <table border="1">
                           <tbody>
                              <tr>
                                 <td align="center" height="22" width="371">
                                    <xsl:value-of select="oeznr:Customs/cat_ru:OfficeName"/>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </td>
                  </tr>
               </tbody>
            </table>
            <table>
               <tbody>
                  <tr>
                     <td>
                        <b>	Регистрационный номер <xsl:choose>
                              <xsl:when test="oeznr:DocumentSign='1'">уведомления о ввозе товаров</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='2'">уведомления о вывозе товаров</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='3'">заявления на уничтожение товаров</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='4'">акта об уничтожении товаров</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='5'">заявления на переработку товаров вне ОЭЗ</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='6'">заявления на продление срока переработки товаров вне ОЭЗ</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='7'">заявления о перемещении товаров (процедура свободного склада)</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='8'">уведомления о вывозе товаров (процедура свободного склада)</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='9'">уведомления о невывозе товаров (процедура свободного склада)</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='10'">разрешения на ввоз товаров ПОЭЗ</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='11'">разрешения на вывоз товаров ОЭЗ</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='12'">разрешения на вывоз товаров ПОЭЗ</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='13'">разрешения на вывоз товаров ТОСЭР</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='14'">разрешения на уничтожение</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='15'">уведомления о вывозе Арктика ПОЭЗ</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='16'">уведомления о вывозе Арктика ОЭЗ</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='17'">уведомления о ввозе ПОЭЗ Арктика</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='18'">разрешения на ввоз ПОЭЗ Арктика</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='19'">уведомления о ввозе ОЭЗ Арктика</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='20'">заявления о завершении СТЗ по товарам, использованным для создания недвижимости</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='21'">заявления о завершении СТЗ по потребленным товарам, в рамках операций по их переработке</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='22'">решения по заявлению о завершении СТЗ по товарам, использованным для создания недвижимости</xsl:when>
                              <xsl:when test="oeznr:DocumentSign='23'">решения по заявлению о завершении СТЗ по потребленным товарам, в рамках операций по их переработке</xsl:when>
                              <xsl:otherwise>акта об уничтожении товаров</xsl:otherwise>
                           </xsl:choose></b>
                        <u>
                        <xsl:text> </xsl:text>
                           <!--<xsl:value-of select="oeznr:RegistrationNumber/oeznr:CustomsCode"/>/
									<xsl:call-template name="russian_date_gtd">
										<xsl:with-param name="date" select="oeznr:RegistrationNumber/oeznr:RegistrationDate"/>
									</xsl:call-template>/
									<xsl:value-of select="oeznr:RegistrationNumber/oeznr:Number"/>-->
                           <xsl:choose>
                              <xsl:when test="oeznr:DocumentSign='1'">
                                 <u>
                                    <xsl:value-of select="oeznr:RegistrationNumber/oeznr:CustomsCode"/>/
									<xsl:call-template name="russian_date_gtd">
                                       <xsl:with-param name="date" select="oeznr:RegistrationNumber/oeznr:RegistrationDate"/>
                                    </xsl:call-template>/
									<xsl:value-of select="oeznr:RegistrationNumber/oeznr:Number"/>
                                 </u>
                              </xsl:when>
                              <xsl:when test="oeznr:DocumentSign='2'">
                                 <u>
                                    <xsl:value-of select="oeznr:RegistrationNumber/oeznr:CustomsCode"/>/
									<xsl:call-template name="russian_date_gtd">
                                       <xsl:with-param name="date" select="oeznr:RegistrationNumber/oeznr:RegistrationDate"/>
                                    </xsl:call-template>/
									<xsl:value-of select="oeznr:RegistrationNumber/oeznr:Number"/>
                                 </u>
                              </xsl:when>
                              <xsl:when test="oeznr:DocumentSign='3'">
                                 <u>
                                    <xsl:value-of select="oeznr:RegistrationNumber/oeznr:CustomsCode"/>/
									<xsl:call-template name="russian_date_gtd">
                                       <xsl:with-param name="date" select="oeznr:RegistrationNumber/oeznr:RegistrationDate"/>
                                    </xsl:call-template>/
									<xsl:value-of select="oeznr:RegistrationNumber/oeznr:Number"/>
									<xsl:text> ЗУН</xsl:text>
								</u>
                              </xsl:when>
                              <xsl:when test="oeznr:DocumentSign='4'">
                                 <u>
                                    <xsl:value-of select="oeznr:RegistrationNumber/oeznr:CustomsCode"/>/
									<xsl:call-template name="russian_date_gtd">
                                       <xsl:with-param name="date" select="oeznr:RegistrationNumber/oeznr:RegistrationDate"/>
                                    </xsl:call-template>/
									<xsl:value-of select="oeznr:RegistrationNumber/oeznr:Number"/>
									<xsl:text> АУ</xsl:text>
								</u>
                              </xsl:when>
                              <xsl:otherwise>
                                 <u>
                                    <xsl:value-of select="oeznr:RegistrationNumber/oeznr:CustomsCode"/>
                                    <xsl:text>/ </xsl:text>
									<xsl:call-template name="russian_date_gtd">
                                       <xsl:with-param name="date" select="oeznr:RegistrationNumber/oeznr:RegistrationDate"/>
                                    </xsl:call-template>
                                    <xsl:text>/ </xsl:text>
									<xsl:value-of select="oeznr:RegistrationNumber/oeznr:Number"/>
									<xsl:if test="oeznr:RegistrationNumber/oeznr:DocKind">
										<xsl:text>/ </xsl:text>
										<xsl:value-of select="oeznr:RegistrationNumber/oeznr:DocKind"/>
									</xsl:if>
								</u>
                              </xsl:otherwise>
                           </xsl:choose>
                        </u>
                     </td>
                  </tr>
               </tbody>
            </table>
            <table border="0" width="100%">
               <tbody>
                  <tr>
                     <td align="center" width="422">
                        <xsl:value-of select="oeznr:CustomsPerson/cat_ru:PersonName"/>
                     </td>
                     <td width="123"/>
                     <td align="center">
                        <xsl:value-of select="oeznr:CustomsPerson/cat_ru:LNP"/>
                        <xsl:if test="oeznr:CustomsPerson/cat_ru:CustomsCode">
							<xsl:text> (код ТО: </xsl:text>
							<xsl:value-of select="oeznr:CustomsPerson/cat_ru:CustomsCode"/>
							<xsl:text>)</xsl:text>
						</xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" width="422">
                        <hr color="black" size="1"/>Уполномоченное должностное лицо таможенного органа</td>
                     <td width="123"/>
                     <td align="center">
                        <hr color="black" size="1"/>ЛНП</td>
                  </tr>
               </tbody>
            </table>
            <br/>  <br/>
         </body>
      </html>
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
      <xsl:param name="date"/>
      <xsl:choose>
         <xsl:when test="substring($date,5,1)='-' and substring($date,8,1)='-'">
            <xsl:value-of select="substring($date,9,2)"/>
            <xsl:value-of select="substring($date,6,2)"/>
            <xsl:value-of select="substring($date,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$date"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>
