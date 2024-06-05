<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:arcc="urn:customs.ru:Information:CustomsDocuments:ApplicationInterestPayment:5.22.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.22.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0">
  <!-- Шаблон для типа ApplicationInterestPaymentType -->
  <xsl:template match="arcc:ApplicationInterestPayment">
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
                    <b>Заявление юридического лица (индивидуального предпринимателя) о выплате процентов</b>
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
          <xsl:if test="arcc:DocNumber">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Номер заявления</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:apply-templates select="arcc:DocNumber" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="arcc:DocDate">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Дата заявления</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:apply-templates select="arcc:DocDate" mode="russian_date" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="arcc:Customs">
            <div class="title marg-top">Таможенный орган, в адрес которого направлено заявление</div>
            <div>
              <xsl:apply-templates select="arcc:Customs">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="arcc:ApplicantInfo">
            <div class="title marg-top">Сведения о заявителе</div>
            <div>
              <xsl:apply-templates select="arcc:ApplicantInfo">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="arcc:LegalSuccessionDocument">
            <div class="title marg-top">Сведения о документе, подтверждающие правопреемство</div>
            <div>
              <xsl:apply-templates select="arcc:LegalSuccessionDocument">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="arcc:TransferActDocument">
            <div class="title marg-top">Сведения о передаточном акте</div>
            <div>
              <xsl:apply-templates select="arcc:TransferActDocument">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Способ выплаты процентов</td>
              <td class="value graphMain" style="width:50%">
                <xsl:choose>
                  <xsl:when test="arcc:PaymentTypeIndicator='0'">
                    <xsl:text>зачесть в счет авансовых платежей на лицевой счет</xsl:text>
                  </xsl:when>
                  <xsl:when test="arcc:PaymentTypeIndicator='1'">
                    <xsl:text>вернуть на банковский счет</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="arcc:PaymentTypeIndicator" />
                  </xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
          </table>
          <xsl:if test="arcc:BankAccountInfo">
            <div class="title marg-top">Реквизиты банковского счета для зачисления процентов</div>
            <div>
              <xsl:apply-templates select="arcc:BankAccountInfo">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">За нарушение срока возврата авансовых платежей (статья 36 ФЗ № 289-ФЗ)</td>
              <td class="value graphMain" style="width:50%">
                <xsl:choose>
                  <xsl:when test="arcc:ReturnAdvanceTermViolationIndicator='true' or arcc:ReturnAdvanceTermViolationIndicator='1'">
                    <xsl:text>ДА</xsl:text>
                  </xsl:when>
                  <xsl:when test="arcc:ReturnAdvanceTermViolationIndicator='false' or arcc:ReturnAdvanceTermViolationIndicator='0'">
                    <xsl:text>НЕТ</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="arcc:ReturnAdvanceTermViolationIndicator" />
                  </xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">На сумму излишне взысканных таможенных пошлин, налогов и иных платежей, взимание которых возложено на таможенные органы (статья 67 ФЗ № 289-ФЗ)</td>
              <td class="value graphMain" style="width:50%">
                <xsl:choose>
                  <xsl:when test="arcc:OverchargedIndicator='true' or arcc:OverchargedIndicator='1'">
                    <xsl:text>ДА</xsl:text>
                  </xsl:when>
                  <xsl:when test="arcc:OverchargedIndicator='false' or arcc:OverchargedIndicator='0'">
                    <xsl:text>НЕТ</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="arcc:OverchargedIndicator" />
                  </xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">За нарушение срока возврата/зачета излишне уплаченных таможенных пошлин, налогов и иных платежей, взимание которых возложено на таможенные органы (статья 67 ФЗ № 289-ФЗ)</td>
              <td class="value graphMain" style="width:50%">
                <xsl:choose>
                  <xsl:when test="arcc:ReturnOverchargedTermViolationIndicator='true' or arcc:ReturnOverchargedTermViolationIndicator='1'">
                    <xsl:text>ДА</xsl:text>
                  </xsl:when>
                  <xsl:when test="arcc:ReturnOverchargedTermViolationIndicator='false' or arcc:ReturnOverchargedTermViolationIndicator='0'">
                    <xsl:text>НЕТ</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="arcc:ReturnOverchargedTermViolationIndicator" />
                  </xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">За нарушение срока возврата/зачета таможенных пошлин, налогов и иных денежных средств (денег) (статья 68 ФЗ № 289-ФЗ)</td>
              <td class="value graphMain" style="width:50%">
                <xsl:choose>
                  <xsl:when test="arcc:ReturnDutiesTermViolationIndicator='true' or arcc:ReturnDutiesTermViolationIndicator='1'">
                    <xsl:text>ДА</xsl:text>
                  </xsl:when>
                  <xsl:when test="arcc:ReturnDutiesTermViolationIndicator='false' or arcc:ReturnDutiesTermViolationIndicator='0'">
                    <xsl:text>НЕТ</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="arcc:ReturnDutiesTermViolationIndicator" />
                  </xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">За нарушение срока возврата денежного залога (статья 69 ФЗ № 289-ФЗ)</td>
              <td class="value graphMain" style="width:50%">
                <xsl:choose>
                  <xsl:when test="arcc:ReturnDepositTermViolationIndicator='true' or arcc:ReturnDepositTermViolationIndicator='1'">
                    <xsl:text>ДА</xsl:text>
                  </xsl:when>
                  <xsl:when test="arcc:ReturnDepositTermViolationIndicator='false' or arcc:ReturnDepositTermViolationIndicator='0'">
                    <xsl:text>НЕТ</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="arcc:ReturnDepositTermViolationIndicator" />
                  </xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
          </table>
          <xsl:if test="arcc:CustomsNotifDocument">
            <div class="title marg-top">Документ об уведомлении таможенным органом о сумме подлежащих выплате процентов</div>
            <div>
              <xsl:apply-templates select="arcc:CustomsNotifDocument">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Сумма денежных средств</td>
              <td class="value graphMain" style="width:50%">
                <xsl:apply-templates select="arcc:Amount" mode="translate_number" />
              </td>
            </tr>
          </table>
          <xsl:if test="arcc:ApplicantSignature">
            <div class="title marg-top">Подпись руководителя организации или уполномоченного от имени организации или ИП</div>
            <div>
              <xsl:apply-templates select="arcc:ApplicantSignature">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="arcc:AttachedDocuments">
            <div class="title marg-top">Перечень прилагаемых документов</div>
            <table class="bordered">
              <tbody>
                <tr class="title">
                  <td class="graphMain bordered">Наименование документа</td>
                  <td class="graphMain bordered">Номер документа</td>
                  <td class="graphMain bordered">Дата документа</td>
                  <td class="graphMain bordered">Код вида электронного документа (сведений)</td>
                  <td class="graphMain bordered">Идентификаторы, присвоенные документу (сведениям) при размещении в хранилище электронных документов</td>
                </tr>
                <xsl:for-each select="arcc:AttachedDocuments">
                  <xsl:apply-templates select=".">
                    <xsl:with-param name="wdth" select="$w" />
                  </xsl:apply-templates>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
          <xsl:if test="arcc:Notes">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Примечания</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:apply-templates select="arcc:Notes" />
                </td>
              </tr>
            </table>
          </xsl:if>
        </div>
      </body>
    </html>
  </xsl:template>
  <!-- Шаблон для типа RUScat_ru:RUAddressType -->
  <xsl:template match="RUScat_ru:Address">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="RUScat_ru:AddressKindCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Вид адреса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="RUScat_ru:AddressKindCode='1'">
                  <xsl:text>адрес регистрации</xsl:text>
                </xsl:when>
                <xsl:when test="RUScat_ru:AddressKindCode='2'">
                  <xsl:text>фактический адрес</xsl:text>
                </xsl:when>
                <xsl:when test="RUScat_ru:AddressKindCode='3'">
                  <xsl:text>почтовый адрес</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="RUScat_ru:AddressKindCode" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:PostalCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Почтовый индекс</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:PostalCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:CounryName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:CounryName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:Region">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Регион (Наименование единицы административно-территориального деления первого уровня)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:Region" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:District">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Район (Наименование единицы административно-территориального деления второго уровня)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:District" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:Town">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Город</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:Town" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:City">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Населенный пункт</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:City" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:StreetHouse">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Улица (Наименование элемента улично-дорожной сети городской инфраструктуры)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:StreetHouse" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:House">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Обозначение дома, корпуса, строения</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:House" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:Room">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Обозначение офиса или квартиры</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:Room" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:AddressText">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Набор элементов адреса, представленных в свободной форме в виде текста.</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:AddressText" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:OKTMO">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:OKTMO" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:OKATO">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:OKATO" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:KLADR">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код КЛАДР</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:KLADR" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:AOGUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор адресного объекта по ФИАС</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:AOGUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:AOID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Уникальный идентификатор адресного объекта по ФИАС</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:AOID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:TerritoryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код единицы административно-территориального деления</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:TerritoryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:PostOfficeBoxId">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер абонентского ящика на предприятии почтовой связи</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:PostOfficeBoxId" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:ContactType -->
  <xsl:template match="RUScat_ru:Contact">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:Phone">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер телефона</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="cat_ru:Phone">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Fax">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер факса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:Fax" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Telex">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер телекса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:Telex" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:E_mail">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="cat_ru:E_mail">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
  <xsl:template match="RUScat_ru:IdentityCard">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="RUScat_ru:IdentityCardCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность, в соответствии с классификатором видов документов, удостоверяющих личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IdentityCardCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IdentityCardName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:FullIdentityCardName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Полное наименование документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:FullIdentityCardName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardSeries">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IdentityCardSeries" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IdentityCardNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:DocValidityDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата окончания срока, в течение которого документ имеет силу</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:DocValidityDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:OrganizationName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:OrganizationName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IssuerCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код подразделения органа, выдавшего документ, удостоверяющий личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IssuerCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:AuthorityId">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Строка, идентифицирующая орган государственной власти государства-члена либо уполномоченную им организацию, выдавшую документ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:AuthorityId" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
  <xsl:template match="RUScat_ru:KGOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:KGINN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="cat_ru:KGINN='ИНН'">
                  <xsl:text>идентификационный налоговый номер налогоплательщика</xsl:text>
                </xsl:when>
                <xsl:when test="cat_ru:KGINN='ПИН'">
                  <xsl:text>персональный идентификационный номер</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="cat_ru:KGINN" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:KGOKPO">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:KGOKPO" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
  <xsl:template match="RUScat_ru:RAOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:UNN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:UNN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:SocialServiceNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:SocialServiceNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:SocialServiceCertificate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:SocialServiceCertificate" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
  <xsl:template match="RUScat_ru:RBOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:UNP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:UNP" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:RBIdentificationNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
  <xsl:template match="RUScat_ru:RFOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:OGRN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный номер</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:OGRN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:INN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:KPP" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
  <xsl:template match="RUScat_ru:RKOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:BIN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:BIN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:IIN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ITN">
        <div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
        <div>
          <xsl:apply-templates select="cat_ru:ITN">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа arcc:DeclarantInfoExtType -->
  <xsl:template match="arcc:ApplicantInfo">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="RUScat_ru:OrganizationName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="RUScat_ru:OrganizationName">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:ShortName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:ShortName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:OrganizationLanguage">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:OrganizationLanguage" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:RFOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:RKOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:RBOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:RAOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:KGOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:Address">
        <div class="title marg-top">Адрес организации</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:Address">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCard">
        <div class="title marg-top">Документ, удостоверяющий личность</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:IdentityCard">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:Contact">
        <div class="title marg-top">Контактная информация</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:Contact">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:OrganizationFullDatas">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Полные данные по организации одной строкой (при отсутствии детализации)</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="RUScat_ru:OrganizationFullDatas">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="arcc:OKPOID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код организации по ОКПО</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="arcc:OKPOID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="arcc:OKATOCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код ОКАТО</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="arcc:OKATOCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="arcc:FactAddress">
        <div class="title marg-top">Фактический адрес организации</div>
        <div>
          <xsl:apply-templates select="arcc:FactAddress">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="arcc:InsuranceNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Страховой номер индивидуального лицевого счёта (СНИЛС)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="arcc:InsuranceNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:PersonSignatureType -->
  <xsl:template match="arcc:ApplicantSignature">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Фамилия</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:PersonSurname" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Имя</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:PersonName" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:PersonMiddleName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Отчество</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PersonMiddleName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PersonPost">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Должность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PersonPost" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:IssueDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата подписания</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:IssueDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа arcc:AttachedDocumentsType -->
  <xsl:template match="arcc:AttachedDocuments">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentName" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="arcc:EDocCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:if test="arcc:DocArchIdDetails">
            <xsl:apply-templates select="arcc:DocArchIdDetails">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:BankInformationType -->
  <xsl:template match="arcc:BankAccountInfo">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номер банковского счета</td>
          <td class="graphMain value" style="width:50%">
            <xsl:for-each select="cat_ru:BankAccount">
              <xsl:value-of select="." />
              <xsl:if test="position()!=last()">
                <xsl:text>, </xsl:text>
              </xsl:if>
            </xsl:for-each>
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Описание типа счета: расчетный, валютный</td>
          <td class="graphMain value" style="width:50%">
            <xsl:for-each select="cat_ru:BankAccountDescription">
              <xsl:value-of select="." />
              <xsl:if test="position()!=last()">
                <xsl:text>, </xsl:text>
              </xsl:if>
            </xsl:for-each>
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Название банка</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:BankName" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:BankMFO">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">МФО банка</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:BankMFO" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:OKPOID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код банка по ОКПО</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:OKPOID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:BICID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">БИК банка</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:BICID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:SWIFTID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">SWIFT код банка</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:SWIFTID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:CorrAccount">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер корреспондентского счета банка</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:CorrAccount" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:TransitCurrencyAccount">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Валютный счет организации (транзитный)</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="cat_ru:TransitCurrencyAccount">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:SpecialTransitCurrencyAccount">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Валютный счет организации (специальный транзитный)</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="cat_ru:SpecialTransitCurrencyAccount">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="arcc:OrganizationAccount">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Лицевой счет организации</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="arcc:OrganizationAccount" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="arcc:CodeBC">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код по БК</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="arcc:CodeBC" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:CustomsType -->
  <xsl:template match="arcc:Customs">
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
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="arcc:CustomsNotifDocument">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:PrDocumentName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PrDocumentName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PrDocumentNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа catESAD_cu:RFBasePresentedDocIDType -->
  <xsl:template match="arcc:DocArchIdDetails">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="catESAD_cu:ElectronicDocumentID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор документа, присвоенный информационной системой таможенных органов при представлении документа в электронном виде</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:ElectronicDocumentID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:ElectronicArchID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор хранилища электронных документов при представлении документа в электронном виде</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:ElectronicArchID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:DocumentModeID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код вида представленного документа в соответствии с альбомом форматов электронных форм документов</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:DocumentModeID" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:AddressType -->
  <xsl:template match="arcc:FactAddress">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:PostalCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Почтовый индекс</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PostalCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:CounryName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:CounryName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Region">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:Region" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:City">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Населенный пункт</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:City" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Улица, номер дома, номер офиса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:StreetHouse" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:TerritoryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код административно-территориальной единицы в соответствии с ГК СОАТЕ (для Кыргызской Республики)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:TerritoryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа catESAD_cu:CUESADPresentedDocumentsType -->
  <xsl:template match="arcc:LegalSuccessionDocument">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:PrDocumentName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PrDocumentName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PrDocumentNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:CustomsCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:CustomsCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код вида представляемого документа в соответствии с классификатором видов документов и сведений, используемых при таможенном декларировании</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="catESAD_cu:PresentedDocumentModeCode" />
          </td>
        </tr>
      </table>
      <xsl:if test="catESAD_cu:DocumentBeginActionsDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата начала действия документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:DocumentBeginActionsDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:DocumentEndActionsDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата окончания действия документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:DocumentEndActionsDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:TemporaryImportCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Срок временного ввоза</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="catESAD_cu:TemporaryImportCode='1'">
                  <xsl:text>Срок временного ввоз/вывоза менее 1 года</xsl:text>
                </xsl:when>
                <xsl:when test="catESAD_cu:TemporaryImportCode='2'">
                  <xsl:text>Срок временного ввоз/вывоза более 1 года</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="catESAD_cu:TemporaryImportCode" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:TemporaryStorageImportDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Заявляемый срок временного ввоза/вывоза./Срок хранения товаров/Запрашиваемый срок переработки</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:TemporaryStorageImportDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:CustomsPaymentModeCodeType">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код вида таможенного платежа по классификатору видов налогов, сборов и иных платежей, взимание которых возложено на таможенные органы</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:CustomsPaymentModeCodeType" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:SupplyStatus">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">11 - ОПЕРЕЖАЮЩАЯ ПОСТАВКА. Заполняется если продукты переработки ввозятся раньше, чем осуществлен вывоз товаров на переработку вне таможенной территории. В остальных случаях не заполняется</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:SupplyStatus" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код страны в соответствии с классификатором стран мира, в которой выдан сертификат</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:TotalDocuments">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Общее количество документов (ПС, контрактов) для РФ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:TotalDocuments" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:PreferenciiCountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код страны классификации документов, подтверждающих наличие льгот или особенностей по уплате таможенных платежей. Для РБ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:PreferenciiCountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:PreferenciiDocID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор документа, по национальному классификатору документов, необходимых для декларирования товаров в соответствии с классификатором кодов дополнительной информации о документах. Для РБ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:PreferenciiDocID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:ProcessingGoodsCostInfo">
        <div class="title marg-top">Сведения о стоимости операций по переработке товаров, помещенных под таможенную процедуру переработки товаров вне таможенной территории</div>
        <div>
          <xsl:apply-templates select="catESAD_cu:ProcessingGoodsCostInfo">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="catESAD_cu:RecordID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Уникальный идентификатор записи (для РФ)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:RecordID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:ExecutiveBodyID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор государственного или межгосударственного органа (организации), выдавшего или утвердившего документ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:ExecutiveBodyID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:ExecutiveName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование органа либо организации, выдавшей документ</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="catESAD_cu:ExecutiveName">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:LicenseGoods">
        <div class="title marg-top">Сведения о декларируемом товаре по лицензии</div>
        <div>
          <xsl:apply-templates select="catESAD_cu:LicenseGoods">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="catESAD_cu:GoodsNumeric">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Порядковый номер товара в представленном документе (сведениях)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:GoodsNumeric" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:RFG44PresentedDocId">
        <div class="title marg-top">Дополнительные технологические идентификаторы представленного документа. Гр 44 (для РФ)</div>
        <div>
          <xsl:apply-templates select="catESAD_cu:RFG44PresentedDocId">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа catESAD_cu:CUESADPresentedDocumentsType -->
  <xsl:template match="arcc:TransferActDocument">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:PrDocumentName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PrDocumentName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PrDocumentNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:CustomsCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:CustomsCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код вида представляемого документа в соответствии с классификатором видов документов и сведений, используемых при таможенном декларировании</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="catESAD_cu:PresentedDocumentModeCode" />
          </td>
        </tr>
      </table>
      <xsl:if test="catESAD_cu:DocumentBeginActionsDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата начала действия документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:DocumentBeginActionsDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:DocumentEndActionsDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата окончания действия документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:DocumentEndActionsDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:TemporaryImportCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Срок временного ввоза</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="catESAD_cu:TemporaryImportCode='1'">
                  <xsl:text>Срок временного ввоз/вывоза менее 1 года</xsl:text>
                </xsl:when>
                <xsl:when test="catESAD_cu:TemporaryImportCode='2'">
                  <xsl:text>Срок временного ввоз/вывоза более 1 года</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="catESAD_cu:TemporaryImportCode" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:TemporaryStorageImportDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Заявляемый срок временного ввоза/вывоза./Срок хранения товаров/Запрашиваемый срок переработки</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:TemporaryStorageImportDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:CustomsPaymentModeCodeType">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код вида таможенного платежа по классификатору видов налогов, сборов и иных платежей, взимание которых возложено на таможенные органы</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:CustomsPaymentModeCodeType" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:SupplyStatus">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">11 - ОПЕРЕЖАЮЩАЯ ПОСТАВКА. Заполняется если продукты переработки ввозятся раньше, чем осуществлен вывоз товаров на переработку вне таможенной территории. В остальных случаях не заполняется</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:SupplyStatus" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код страны в соответствии с классификатором стран мира, в которой выдан сертификат</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:TotalDocuments">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Общее количество документов (ПС, контрактов) для РФ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:TotalDocuments" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:PreferenciiCountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код страны классификации документов, подтверждающих наличие льгот или особенностей по уплате таможенных платежей. Для РБ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:PreferenciiCountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:PreferenciiDocID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор документа, по национальному классификатору документов, необходимых для декларирования товаров в соответствии с классификатором кодов дополнительной информации о документах. Для РБ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:PreferenciiDocID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:ProcessingGoodsCostInfo">
        <div class="title marg-top">Сведения о стоимости операций по переработке товаров, помещенных под таможенную процедуру переработки товаров вне таможенной территории</div>
        <div>
          <xsl:apply-templates select="catESAD_cu:ProcessingGoodsCostInfo">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="catESAD_cu:RecordID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Уникальный идентификатор записи (для РФ)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:RecordID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:ExecutiveBodyID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор государственного или межгосударственного органа (организации), выдавшего или утвердившего документ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:ExecutiveBodyID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:ExecutiveName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование органа либо организации, выдавшей документ</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="catESAD_cu:ExecutiveName">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:LicenseGoods">
        <div class="title marg-top">Сведения о декларируемом товаре по лицензии</div>
        <div>
          <xsl:apply-templates select="catESAD_cu:LicenseGoods">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="catESAD_cu:GoodsNumeric">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Порядковый номер товара в представленном документе (сведениях)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:GoodsNumeric" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:RFG44PresentedDocId">
        <div class="title marg-top">Дополнительные технологические идентификаторы представленного документа. Гр 44 (для РФ)</div>
        <div>
          <xsl:apply-templates select="catESAD_cu:RFG44PresentedDocId">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа catESAD_cu:LicenseGoodsType -->
  <xsl:template match="catESAD_cu:LicenseGoods">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="catESAD_cu:AppNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер приложения/ перечня к лицензии </td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:AppNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Порядковый номер декларируемого товара по приложению/перечню к лицензии</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="catESAD_cu:GoodsNumericLic" />
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа catESAD_cu:ProcessingGoodsCostInfoType -->
  <xsl:template match="catESAD_cu:ProcessingGoodsCostInfo">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Стоимость операций по переработке товаров, помещенных под таможенную процедуру переработки товаров вне таможенной территории</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="catESAD_cu:ProcessingGoodsCost" mode="translate_number" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Трехзначный буквенный код валюты стоимости операций по переработке товаров, помещенных под таможенную процедуру переработки товаров вне таможенной территории, в соответствии с Классификатором валют</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="catESAD_cu:ProcessingGoodsCostCurrencyCode" />
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа catESAD_cu:RFBasePresentedDocIDType -->
  <xsl:template match="catESAD_cu:RFG44PresentedDocId">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="catESAD_cu:ElectronicDocumentID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор документа, присвоенный информационной системой таможенных органов при представлении документа в электронном виде</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:ElectronicDocumentID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:ElectronicArchID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор хранилища электронных документов при представлении документа в электронном виде</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:ElectronicArchID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:DocumentModeID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код вида представленного документа в соответствии с альбомом форматов электронных форм документов</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:DocumentModeID" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:ITNKZType -->
  <xsl:template match="cat_ru:ITN">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:CategoryCode" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:KATOCode" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:RNN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:RNN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ITNReserv">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:ITNReserv" />
            </td>
          </tr>
        </table>
      </xsl:if>
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
  <xsl:template match="//*[local-name()='ApplicationInterestPayment']//*" priority="-1">
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