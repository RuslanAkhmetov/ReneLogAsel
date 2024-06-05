<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.22.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.22.0" xmlns:nuprd="urn:customs.ru:Information:CommercialFinanceDocuments:NotifUnPaidRecyclingDetails:5.22.0">
	<!-- Шаблон для типа NotifUnPaidRecyclingDetailsType -->
	<xsl:template match="nuprd:NotifUnPaidRecyclingDetails">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
				#row_descr {
margin: -1em 10% 0;
}
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
                  text-align: center;
                   vertical-align:top;
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
                   p {
                border-bottom:0px solid black;
                padding: 0;
                text-align: justify;
            }
           
            #row_name {
             margin-left: auto;
    margin-right: 0;
            width: 535;
   border-bottom:1px solid black;
}
#head{
  position: absolute; 
  left: 23mm; 
  right: 0; 
  top: 239;
 
  width: 600;
 }
 #head_p {
  text-align: justify;
                 font-style: italic;
    text-indent: 22mm; 
    line-height: 33px;
   }

                </style>
			</head>
			<body>
				<div id="head">
					<p id="head_p">
						<font size="2">
							<xsl:apply-templates select="nuprd:Payer" mode="organizationBase"/>
						</font>
					</p>
				</div>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Уведомление о сумме неуплаченного утилизационного сбора и (или) пени</b>
									</font>
								</td>
							</tr>
							<tr>
								<td align="center" class="title">
									<font size="2">
										от <xsl:apply-templates select="nuprd:NotifRegDate" mode="DateStr"/>№
										<u>
											<xsl:value-of select="nuprd:NotifRegNum/nuprd:CustomsCode"/>/УС<xsl:value-of select="nuprd:NotifRegNum/nuprd:RegistrationYear"/>/<xsl:value-of select="nuprd:NotifRegNum/nuprd:GTDNumber"/>
										</u>
									</font>
								</td>
							</tr>
							<tr>
								<td class="value graphMain" align="center">
									<font size="2">
										<xsl:if test="nuprd:Customs/cat_ru:OfficeName">
											<xsl:value-of select="nuprd:Customs/cat_ru:OfficeName"/>
										</xsl:if>
									</font>
								</td>
							</tr>
							<tr>
								<td align="center">
									<font size="2">
										(наименование таможенного органа)
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<p>
						<font size="2">
										на основании пункта 17(1) Правил взимания, исчисления, уплаты и взыскания утилизационного сбора в отношении самоходных машин и (или) и прицепов к ним, а также возврата и зачета излишне уплаченных или излишне взысканных сумм этого сбора, утвержденных постановлением Правительства Российской Федерации от 6 февраля 2016 г. № 81 «Об утилизационном сборе в отношении самоходных машин и (или) прицепов к ним и о внесении изменений в некоторые акты Правительства Российской Федерации», уведомляет 
										
						<span id="row_name">	</span>
						</font>
					</p>
					<div align="right" id="row_descr">
						<font size="2">
										 (полное наименование организации 
									</font>
					</div>
					<table>
						<tr>
							<td class="value graphMain" height="13">
							
							</td>
						</tr>
						<tr>
							<td align="center">
								<font size="2">
										 или фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица,
									</font>
							</td>
						</tr>
						<tr>
							<td class="value graphMain" height="16">
								
							</td>
						</tr>
						<tr>
							<td align="center">
								<font size="2">
										 идентификационный номер налогоплательщика (при наличии) 
									</font>
							</td>
						</tr>
					</table>
					<br/>
					<table>
						<tr>
							<td colspan="2">
								<font size="2">
							о неисполнении обязанности по уплате утилизационного сбора и (или) пеней в отношении самоходной
							</font>
							</td>
						</tr>
						<tr>
							<td style="width:25%">
								<font size="2">
										 машины и (или) прицепа 
									</font>
							</td>
							<td class="value graphMain">
								<font size="2">
									<xsl:value-of select="nuprd:VINID"/>
								</font>
							</td>
						</tr>
						<tr>
							<td>
								
							</td>
							<td align="center">
								<font size="2">
										 (идентификационный номер или заводской номер) 
									</font>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td style="width:45%">
								<font size="2">
										 исчисленного в расчете утилизационного сбора 
									</font>
							</td>
							<td class="value graphMain">
								<font size="2">
									<xsl:if test="nuprd:RegUtilDate">
										<xsl:apply-templates select="nuprd:RegUtilDate" mode="russian_date"/>
									</xsl:if>
									<xsl:if test="nuprd:RegUtil">
										№
										<xsl:value-of select="nuprd:RegUtil/cat_ru:CustomsCode"/>/<xsl:value-of select="substring(nuprd:RegUtil/cat_ru:RegistrationDate,9,2)"/>
										<xsl:value-of select="substring(nuprd:RegUtil/cat_ru:RegistrationDate,6,2)"/>
										<xsl:value-of select="substring(nuprd:RegUtil/cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="nuprd:RegUtil/cat_ru:GTDNumber"/>
										<xsl:if test="nuprd:RegUtil/RUScat_ru:AddNumber">/<xsl:value-of select="nuprd:RegUtil/RUScat_ru:AddNumber"/>
										</xsl:if>
									</xsl:if>
								</font>
							</td>
						</tr>
						<tr>
							<td>
								
							</td>
							<td align="center">
								<font size="2">
										 (дата и регистрационный номер расчета (корректировки расчета) утилизационного сбора) 
									</font>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td style="width:8%">
								<font size="2">
										 ТПО № 
									</font>
							</td>
							<td class="value graphMain">
								<font size="2">
									<xsl:if test="nuprd:TPORegNumber">
										<xsl:value-of select="nuprd:TPORegNumber/nuprd:CustomsCode"/>/<xsl:value-of select="substring(nuprd:TPORegNumber/nuprd:RegistrationDate,9,2)"/>
										<xsl:value-of select="substring(nuprd:TPORegNumber/nuprd:RegistrationDate,6,2)"/>
										<xsl:value-of select="substring(nuprd:TPORegNumber/nuprd:RegistrationDate,3,2)"/>/<xsl:value-of select="nuprd:TPORegNumber/nuprd:DocNumber"/>
										<xsl:if test="nuprd:TPORegNumber/nuprd:NumPP">/<xsl:value-of select="nuprd:TPORegNumber/nuprd:NumPP"/>
										</xsl:if>
									</xsl:if>
								</font>
							</td>
							<td style="width:10%">
								<font size="2">
										  в размере: 
									</font>
							</td>
							<td style="width:15%">
								
							</td>
						</tr>
						<tr>
							<td>
								
							</td>
							<td align="center">
								<font size="2">
										 (регистрационный номер и дата таможенного приходного ордера) 
									</font>
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
						</tr>
					</table>
					<table class="bordered">
						<tr class="title">
							<td class="bordered" rowspan="2">Номер п/п </td>
							<td class="graphMain bordered" colspan="2">Подлежащий уплате утилизационный сбор и пени </td>
						</tr>
						<tr class="title">
							<td class="graphMain bordered">код вида платежа </td>
							<td class="graphMain bordered">сумма, рубли </td>
						</tr>
						<xsl:for-each select="nuprd:UtilCollDetails">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
						<tr>
							<td class="graphMain bordered"/>
							<td class="graphMain bordered">ИТОГО </td>
							<td class="graphMain bordered">
								<xsl:apply-templates select="nuprd:TotalPaymentAmount" mode="translate_number"/>
							</td>
						</tr>
					</table>
					<table style="margin-top: 5px;">
						<tr>
							<td style="vertical-align:top;">
								<font size="2">
										При уплате в безналичной форме денежные средства вносятся на счет Федерального казначейства:
										<u>
										<xsl:apply-templates select="nuprd:RequisitesForTransferring" mode="RequisitesForTransferringType"/>
									</u>
								</font>
							</td>
							<td style="width:10px">
								<font size="2">
										
									</font>
							</td>
							<td style="width:25%; height:100" class="bordered">
								
							</td>
						</tr>
					</table>
					<p>
						<font size="2">
										При неисполнении обязанности по уплате утилизационного сбора и (или) пени в установленный срок после получения настоящего уведомления таможенным органом будут приняты меры по взысканию неуплаченных сумм утилизационного сбора и (или) пеней в судебном порядке. 
						</font>
					</p>
				</div>
				<xsl:if test="nuprd:DocSign ='true'">
				<div class="page" style="width: {$w}mm;">
					<table style="margin-top: 5px;">
						<tr>
							<td class="bordered">
								<p style="padding: 5px 20px 10px;">
									<font size="2">
										В связи с изменением размера исчисленных и подлежащих уплате сумм утилизационного сбора и (или) пеней уведомление о сумме неуплаченного утилизационного сбора и (или) пеней от 
										<u>
											<xsl:apply-templates select="nuprd:NotifRegDate" mode="DateStr"/>
										</u> № <u>
											<xsl:value-of select="nuprd:NotifRegNum/nuprd:CustomsCode"/>/УС<xsl:value-of select="nuprd:NotifRegNum/nuprd:RegistrationYear"/>/<xsl:value-of select="nuprd:NotifRegNum/nuprd:GTDNumber"/>
										</u> считать отозванным. 
						</font>
								</p>
							</td>
						</tr>
					</table>
					<table style="margin-top: 25px;">
						<tr>
							<td class="value graphMain">
								<font size="2">
									<xsl:apply-templates select="nuprd:CustomsPersonName" mode="PersonBase"/>
								</font>
							</td>
							<td style="width:10%">
								<font size="2">
										
									</font>
							</td>
							<td style="width:30%;" class="value graphMain">
								
							</td>
						</tr>
						<tr>
							<td align="center">
								<font size="2">
										(инициалы и фамилия уполномоченного должностного лица таможенного органа) 
								</font>
							</td>
							<td>
								
							</td>
							<td align="center" style="vertical-align:top;">
								<font size="2">
										(подпись) 
									</font>
							</td>
						</tr>
					</table>
				</div>
			</xsl:if>
				<xsl:if test="nuprd:DocSign = 'false'">
				<div class="page" style="width: {$w}mm;">
					<table style="margin-top: 5px; border: solid 1px windowtext;">
					<tr>
					<td colspan="5">
					<p style="padding: 10px 0px 10px;">
								<font size="2" >
										Получено непосредственно под расписку
									</font>
									</p>
							</td>
					</tr>
						<tr>
							<td style="width:20%;" class="value graphMain">
								
							</td>
							<td style="width:2%">
								<font size="2">
										
									</font>
							</td>
							<td class="value graphMain">
								<font size="2">
								<xsl:if test="nuprd:ApproverPerson">
									<xsl:apply-templates select="nuprd:ApproverPerson" mode="PersonBase"/>
									</xsl:if>
								</font>
							</td>
							<td style="width:2%">
								<font size="2">
										
									</font>
							</td>
							<td style="width:22%;">
							<font size="2">
							<xsl:if test="nuprd:ApproverPerson">
										<xsl:apply-templates select="nuprd:ApproverPerson/cat_ru:IssueDate" mode="DateStr"/>
										</xsl:if>
									</font>
								
							</td>
						</tr>
						<tr>
							<td align="center" style="vertical-align:top;">
								<font size="2">
										(подпись) 
									</font>
							</td>
							<td>
								
							</td>
							<td align="center">
								<font size="2">
										(фамилия, имя, отчество (при наличии) руководителя организации, индивидуального предпринимателя, уполномоченного представителя организации (индивидуального предпринимателя), физического лица) 
								</font>
							</td>
							<td>
								
							</td>
							<td align="center" style="vertical-align:top;">
								<font size="2">
										(дата вручения)
									</font>
							</td>
						</tr>
					</table>
				</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа nuprd:UtilCollDetailsType -->
	<xsl:template match="nuprd:UtilCollDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<tr>
			<td class="graphMain bordered">
				<xsl:apply-templates select="nuprd:LineNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="nuprd:PaymentModeCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="nuprd:PaymentAmount" mode="translate_number"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template mode="RequisitesForTransferringType" match="*">
		<xsl:apply-templates select="." mode="organizationBase"/>
		<xsl:if test="nuprd:UFKAccount">
			, лицевой счет в УФК <xsl:value-of select="nuprd:UFKAccount"/>
		</xsl:if>
		<xsl:if test="nuprd:BankName">
			, банк получателя <xsl:value-of select="nuprd:BankName"/>
		</xsl:if>
		<xsl:if test="nuprd:BICID">
			, БИК <xsl:value-of select="nuprd:BICID"/>
		</xsl:if>
		<xsl:if test="nuprd:BankAccount">
			, номер счета получателя <xsl:value-of select="nuprd:BankAccount"/>
		</xsl:if>
		<xsl:if test="nuprd:BCC">
			, КБК <xsl:value-of select="nuprd:BCC"/>
		</xsl:if>
		<xsl:if test="nuprd:OKTMO">
			, ОКТМО <xsl:value-of select="nuprd:OKTMO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="PersonBase">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonSurname">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="cat_ru:PersonSurname"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonName">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
			<xsl:text>.</xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
			<xsl:text>.</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="CustomsOffice">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:if test="cat_ru:Code">
			<xsl:if test="cat_ru:OfficeName">
				<xsl:text> (</xsl:text>
				<xsl:value-of select="cat_ru:Code"/>
				<xsl:text>)</xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="normal">,&#032;</span>
			<span class="italic">
				<xsl:if test="string-length(cat_ru:INN) &gt; 0">
					<span class="italic">ИНН</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">
					<span class="normal">/</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:KPP) &gt; 0">
					<span class="italic">КПП</span>
				</xsl:if>
				<span class="normal">:&#032;</span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<span class="normal">,&#032;</span>
			<span class="italic">ОГРН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="normal">,&#032;</span>
			<span class="italic">БИН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">,&#032;</span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">,&#032;</span>
			<span class="italic">ИТН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal">&#032;/&#032;</span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal">&#032;/&#032;</span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal">&#032;/&#032;</span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">,&#032;</span>
			<span class="italic">УНП</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">,&#032;</span>
			<span class="italic">УНН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">,&#032;</span>
			<span class="italic">N справки об отсутв. НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="addressStr" match="*">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="Contact" match="*">
		<xsl:if test="cat_ru:Phone"> Тел: <xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>,&#032;</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">Факс: <xsl:value-of select="cat_ru:Fax"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:Telex">Телекс: <xsl:value-of select="cat_ru:Telex"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:E_mail">Email: <xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">,&#032;</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="organizationBase" match="*">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0"> (</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">)</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures and (cat_ru:OrganizationName or cat_ru:ShortName)">&#032;<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='NotifUnPaidRecyclingDetails']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="date">
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
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')"/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="DateStr">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="DateStr">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="DateStr">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="string-length($dateIn) &gt; 0 and substring($dateIn,1,4)!='0001'">
				<xsl:variable name="month" select="substring($dateIn, 6, 2)"/>
				"<u>
					<xsl:value-of select="substring($dateIn,9,2)"/>
				</u>"
				 <u> 
				<xsl:choose>
						<xsl:when test="$month=1">января</xsl:when>
						<xsl:when test="$month=2">февраля</xsl:when>
						<xsl:when test="$month=3">марта</xsl:when>
						<xsl:when test="$month=4">апреля</xsl:when>
						<xsl:when test="$month=5">мая</xsl:when>
						<xsl:when test="$month=6">июня</xsl:when>
						<xsl:when test="$month=7">июля</xsl:when>
						<xsl:when test="$month=8">августа</xsl:when>
						<xsl:when test="$month=9">сентября</xsl:when>
						<xsl:when test="$month=10">октября</xsl:when>
						<xsl:when test="$month=11">ноября</xsl:when>
						<xsl:when test="$month=12">декабря</xsl:when>
					</xsl:choose> 					
				</u> <xsl:value-of select="substring($dateIn,1,2)"/>
				<u>
					<xsl:value-of select="substring($dateIn,3,2)"/>
				</u>
				<xsl:text> г.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				"<u>     </u>"
				 <u>                  </u> 
				20<u>     </u> г.
			</xsl:otherwise>
		</xsl:choose>
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
	<xsl:template match="//*[local-name()='CustomsBrokerCertificate']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
</xsl:stylesheet>
