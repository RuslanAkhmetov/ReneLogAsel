<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:frd="urn:customs.ru:Information:CustomsDocuments:FreeDoc:5.22.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Версия 4.7.0.0 от 25.02.2009.  -->
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <!--xsl:variable name="ColumnSpec" select="frd:DocumentBody/frd:Table/frd:ColumnSpec"/-->
   <xsl:variable name="ColumnSpec" select="frd:FreeDoc/frd:DocumentBody/frd:Table/frd:ColumnSpec"/>
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
	<xsl:template match="//*[local-name()='FreeDoc']//*" priority="-1">
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
   <xsl:template match="frd:TableRow | frd:TableHead/frd:TableRow | frd:TableFoot/frd:TableRow | frd:TableBody/frd:TableRow">
      <tr>
         <xsl:choose>
            <xsl:when test="frd:EntryCell">
               <xsl:apply-templates select="frd:EntryCell"/>
            </xsl:when>
            <xsl:when test="frd:TableCell">
               <xsl:apply-templates select="frd:TableCell"/>
            </xsl:when>
         </xsl:choose>
      </tr>
   </xsl:template>
   <xsl:template match="frd:EntryCell">
      <td align="{./@align}" colspan="{./@morecols}" rowspan="{./@morerows}" valign="{./@valign}">
         <table border="1" cellpadding="0" cellspacing="0" style="width:100%;">
            <tbody>
               <xsl:for-each select="frd:EntryTable/frd:EntryRow">
                  <tr>
                     <xsl:apply-templates select="frd:TableCell"/>
                  </tr>
               </xsl:for-each>
            </tbody>
         </table>
      </td>
   </xsl:template>
   <xsl:template match="frd:DocumentBody/frd:TextSection">
      <xsl:if test="frd:SectionName">
         <h3 align="left">
            <xsl:apply-templates select="frd:SectionName"/>
         </h3>
      </xsl:if>
      <xsl:for-each select="frd:TextPara">
         <p align="left" class="{../@style}">
            <xsl:apply-templates select="."/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         </p>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="frd:DocumentBody/frd:Table">
      <xsl:if test="frd:TableName">
         <h3 align="right">
            <xsl:apply-templates select="frd:TableName"/>
         </h3>
      </xsl:if>
      <table border="1" cellpadding="0" cellspacing="0" style="width:100%;">
         <tbody>
            <xsl:apply-templates select="frd:TableHead/frd:TableRow"/>
            <xsl:apply-templates select="frd:TableBody/frd:TableRow"/>
            <xsl:apply-templates select="frd:TableFoot/frd:TableRow"/>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="frd:TableCell">
      <td align="{./@align}" colspan="{./@morecols}" rowspan="{./@morerows}" valign="{./@valign}">
         <xsl:for-each select="frd:TextPara">
            <p class="{../@style}">
               <xsl:apply-templates select="."/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </p>
         </xsl:for-each>
      </td>
   </xsl:template>
   <xsl:template match="frd:FreeDoc">
      <xsl:param name="k" select="1"/>
      <html>
         <head>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <title>
               <xsl:apply-templates select="frd:DocumentHead/frd:DocumentName"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               <xsl:text>№ </xsl:text>
               <xsl:apply-templates select="frd:DocumentHead/frd:DocumentNumber"/>
               <xsl:text> от </xsl:text>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               <xsl:apply-templates select="frd:DocumentHead/frd:DocumentDate" mode="russian_date"/>
            </title>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
							
						div.page {
							width: {210*$k}mm;
							height: {297*$k}mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid 1pt #000000;
							}
						
						td {
							font-family:Courier;
							}
						
						.normal{
							font-weight: normal;
							font-family:Courier;
							}
							
						.bold{
							font-weight: bold;
							font-family:Courier;
							}
						
						.italic{
							font-style: italic;
							font-family:Courier;
							}
						
					</style>
         </head>
         <body>
            <div class="page">
               <xsl:if test="(frd:DocumentHead/@VisibleFlag = 'true') or (not(//frd:DocumentHead/@VisibleFlag))">
                  <h2>
                     <xsl:apply-templates select="frd:DocumentHead/frd:DocumentName"/>
                  </h2>
                  <p>
                     <xsl:text>№ </xsl:text>
                     <xsl:apply-templates select="frd:DocumentHead/frd:DocumentNumber"/>
                     <xsl:text> от </xsl:text>
                     <xsl:apply-templates select="frd:DocumentHead/frd:DocumentDate" mode="russian_date"/>
                  </p>
                  <xsl:if test="frd:DocumentHead/frd:OrganizationName">
                     <p>
                        <xsl:text>Выдан: </xsl:text>
                        <xsl:apply-templates select="frd:DocumentHead/frd:OrganizationName"/>
                     </p>
                  </xsl:if>
               </xsl:if>
               <xsl:apply-templates select="frd:DocumentBody/frd:TextSection | frd:DocumentBody/frd:Table"/>
               <table border="0" style="width:100%;">
                  <tbody>
                     <xsl:for-each select="frd:DocumentSign">
                        <tr>
                           <td align="right" style="width:40%;">
                              <xsl:apply-templates select="cat_ru:IssueDate" mode="russian_date"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="left" style="width:25%;">
                              <xsl:apply-templates select="cat_ru:PersonPost"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="right" style="width:10%;">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="left" style="width:25%;">
                              <xsl:apply-templates select="cat_ru:PersonSurname"/>
                              <xsl:text> </xsl:text>
                              <xsl:apply-templates select="cat_ru:PersonName"/>
                              <xsl:text> </xsl:text>
                              <xsl:apply-templates select="cat_ru:PersonMiddleName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
