<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:ata_ct="urn:customs.ru:Information:TransportDocuments:ATA:ATA_CommonTypes:5.22.0" xmlns:ata_an="urn:customs.ru:Information:TransportDocuments:ATA:ATA_AlterationNotif:5.22.0">
  <!-- Шаблон для типа ATA_AlterationNotifType -->
  <xsl:template match="ata_an:ATA_AlterationNotif">
    <xsl:param name="w" select="190" />
    <html>
      <head>
        <style>
                  body {
                  background: #cccccc;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 20mm;
                  background: #ffffff;
                  border: solid 1pt #000000;
                  }

                  .marg-top
                  {
                  margin-top:5mm;
                  }

                  table
                  {
                  width: 100%;
                  border: 0;
                  empty-cells: show;
                  border-collapse: collapse;
                  margin-top: 1px;
                  }

                  table.border tr td
                  {
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  }

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                </style>
      </head>
      <body>
        <div class="page" style="width: {$w}mm;">
          <table>
            <tbody>
              <tr>
                <td align="center" class="title">
                  <font size="4">
                    <b>Уведомление по внесению изменений в операцию</b>
                  </font>
                </td>
              </tr>
            </tbody>
          </table>
          <br />
          <!--table>
            <tr>
              <td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="cat_ru:DocumentID" />
              </td>
            </tr>
          </table>
          <xsl:if test="cat_ru:RefDocumentID">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="cat_ru:RefDocumentID" />
                </td>
              </tr>
            </table>
          </xsl:if-->
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Дата создания уведомления</td>
              <td class="value graphMain" style="width:50%">
                <xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="ata_an:IssueDate"/>
                </xsl:call-template>
                <xsl:text> </xsl:text>
                <xsl:value-of select="substring(ata_an:IssueDate,12,5)" />
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Номер карнета АТА</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="ata_an:CarnetNumber" />
              </td>
            </tr>
          </table>
          <xsl:if test="ata_an:RegistrationNumber">
			  <table>
				<tr>
				  <td class="annot graphMain" style="width:50%">Регистрационный номер операции</td>
				  <td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="ata_an:RegistrationNumber"/>
				  </td>
				</tr>
			  </table>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Тип операции</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="ata_an:OperationType" />
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Код ТО, запросивший корректировку операции</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="ata_an:CustomRequested" />
              </td>
            </tr>
          </table>
          <xsl:if test="ata_an:AlterationOperation">
            <div class="title marg-top">Измененная операция карнета АТА</div>
            <div>
              <xsl:apply-templates select="ata_an:AlterationOperation"/>
              <br/>
            </div>
          </xsl:if>
          <xsl:if test="ata_an:AdditionalInformation">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Дополнительная информация по уведомлению</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="ata_an:AdditionalInformation" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="ata_an:Decision">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Решение по запросу</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:choose>
                    <xsl:when test="ata_an:Decision='0' or ata_an:Decision='false' or ata_an:Decision='f' or ata_an:Decision='FALSE'">
                      <xsl:text>Отказ во внесении изменений</xsl:text>
                    </xsl:when>
                    <xsl:when test="ata_an:Decision='1' or ata_an:Decision='true' or ata_an:Decision='t' or ata_an:Decision='TRUE'">
                      <xsl:text>Внесение изменений совершено</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="ata_an:Decision" />
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
            </table>
          </xsl:if>
        </div>
      </body>
    </html>
  </xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="ata_an:RegistrationNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template name="gtd_date">
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
</xsl:stylesheet>