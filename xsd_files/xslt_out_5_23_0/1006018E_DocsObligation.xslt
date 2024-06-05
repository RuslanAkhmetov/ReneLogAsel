<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.23.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:doo="urn:customs.ru:Information:CustomsDocuments:DocsObligation:5.23.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
	<xsl:template match="//*[local-name()='DocsObligation']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date2">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date2">
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
   <xsl:template name="russian_date2">
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
   <xsl:template match="doo:DocsObligation">
      <html>
         <head>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <title>Обязательство о представлении документов в установленный срок</title>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 210mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}						
						td {
							font-family:Courier;
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
							.bold2{
							font-weight: bold;
							font-family:Arial;
							font-size: 12pt; 
							}
							.normal2{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: 1pt solid windowtext; border-right: 1pt solid windowtext; border-top: 1pt solid windowtext; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt;
							}
							
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph8Bold {
						font-family: Arial;
						font-size: 8pt;
						font-weight: bold;
						}				
						.bordered {
					border: solid 1pt #000000;
										}			
					</style>
         </head>
         <body>
            <div class="page">
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="center" class="bold2" colspan="2" style="width:190mm">	
								Обязательство о представлении документов в установленный срок<br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="bold2" colspan="2" style="width:190mm">
								<xsl:text>ДТ № </xsl:text>
								<span class="normal">
                              <xsl:apply-templates select="doo:GTDNumber/cat_ru:CustomsCode"/>
                              <xsl:text>/</xsl:text>
                              <xsl:apply-templates select="doo:GTDNumber/cat_ru:RegistrationDate" mode="russian_date2"/>
                              <xsl:text>/</xsl:text>
                              <xsl:apply-templates select="doo:GTDNumber/cat_ru:GTDNumber"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td class="graphMain" colspan="2" style="width:190mm;">
                           <span class="bold">Декларант: </span>
                           <xsl:apply-templates select="doo:Applicant"/>
                           <br/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" cellspacing="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td align="center" class="bold" style="width:10mm">
								п/п <br/>№
								</td>
                        <td align="center" class="bold" style="width:90mm">
								Наименование
								</td>
                        <td align="center" class="bold" style="width:30mm">
								Дата
								</td>
                        <td align="center" class="bold" style="width:70mm">
								Примечание
								</td>
                     </tr>
                     <xsl:for-each select="doo:ObligDocsDescription">
                        <tr>
                           <td align="center" class="graphMain" style="width:10mm">
                              <xsl:apply-templates select="catESAD_ru:Position"/>
                           </td>
                           <td align="center" class="graphMain" style="width:90mm">
                              <xsl:apply-templates select="catESAD_ru:DocName"/>
                              <xsl:if test="catESAD_ru:DocCode"><xsl:text> (</xsl:text>
								<xsl:apply-templates select="catESAD_ru:DocCode"/><xsl:text>)</xsl:text>
                              </xsl:if>
                           </td>
                           <td align="center" class="graphMain" style="width:30mm">
                              <xsl:apply-templates select="catESAD_ru:SuggDate" mode="russian_date"/>
                           </td>
                           <td align="center" class="graphMain" style="width:70mm">
                              <xsl:apply-templates select="catESAD_ru:Note"/>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
               <table border="0" style="width:190mm">
                  <tbody>
                     <tr>
                        <td class="bold" style="width:190mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="bold" style="width:100mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="normal" style="width:90mm">
                           <xsl:apply-templates select="doo:SendDate" mode="russian_date"/>
                           <xsl:text> г.</xsl:text>
								</td>
                     </tr>
                     <tr>
                        <td class="bold" style="width:100mm">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" style="width:90mm">
								(дата)
								</td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="doo:Applicant">
      <xsl:apply-templates select="./cat_ru:OrganizationName"/>
      <xsl:if test="./cat_ru:ShortName">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										(<xsl:apply-templates select="./cat_ru:ShortName"/>)
									</xsl:if>
      <br/>
      <xsl:if test="./cat_ru:OKPOID">
										ОКПО 
										<xsl:apply-templates select="./cat_ru:OKPOID"/>
      </xsl:if>
      <xsl:if test="./cat_ru:OKATOCode">
										ОКАТО 
										<xsl:apply-templates select="./cat_ru:OKATOCode"/>
      </xsl:if>
      <xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
										ОГРН 
										<xsl:apply-templates select="./cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
      </xsl:if>
      <xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:INN">
										ИНН 
										<xsl:apply-templates select="./cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
      </xsl:if>
      <xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:KPP">
										КПП 
										<xsl:apply-templates select="./cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
      </xsl:if>
      <br/>
      <xsl:if test="./cat_ru:Contact/cat_ru:Phone">
										тел.
										<xsl:apply-templates select="./cat_ru:Contact/cat_ru:Phone"/>
      </xsl:if>
      <xsl:if test="./cat_ru:Contact/cat_ru:Fax">
										факс: 
										<xsl:apply-templates select="./cat_ru:Contact/cat_ru:Fax"/>
      </xsl:if>
      <xsl:if test="./cat_ru:Contact/cat_ru:Telex">
										телекс
										<xsl:apply-templates select="./cat_ru:Contact/cat_ru:Telex"/>
      </xsl:if>
      <br/>
      <xsl:if test="./cat_ru:Address">
		Адрес:
			<xsl:apply-templates select="./cat_ru:Address"/>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:Address">
	   <xsl:for-each select="*">
		  <xsl:if test="position()!=1"><xsl:text>, </xsl:text></xsl:if>
		  <xsl:apply-templates select="."/>
	   </xsl:for-each>
   </xsl:template>
</xsl:stylesheet>
