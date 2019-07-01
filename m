Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 374EC5C20B
	for <lists+dm-devel@lfdr.de>; Mon,  1 Jul 2019 19:34:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D3D8959455;
	Mon,  1 Jul 2019 17:34:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BEA49089;
	Mon,  1 Jul 2019 17:33:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4303F1806B16;
	Mon,  1 Jul 2019 17:32:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x61HVVvp017101 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jul 2019 13:31:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2DDB22CFBC; Mon,  1 Jul 2019 17:31:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 273092CFB8
	for <dm-devel@redhat.com>; Mon,  1 Jul 2019 17:31:27 +0000 (UTC)
Received: from APC01-PU1-obe.outbound.protection.outlook.com
	(mail-eopbgr1320048.outbound.protection.outlook.com [40.107.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5CCBF88305
	for <dm-devel@redhat.com>; Mon,  1 Jul 2019 17:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=teoenmingcorp.onmicrosoft.com;
	s=selector1-teoenmingcorp-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=83h6Yu/korcE3+u+jQKETaiR/Jlvwlo30lkzKZ05CBI=;
	b=TfSlxgJvFqdiRDtJwuijukv5Rs7bOiGNVAJPlq8LRr8tgsNF0uQBlVfiq3tG9QOqmVsNv0j+ZrxAeovXbQkyUshrqlohyq+o67ClFOF/geMI8eGbAsgiMjliIWmsOYmt+xhh8bfGrXZa0Cobk5hTifO7iHYEk7f8ow7LRbHeoBU=
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com (10.170.143.19) by
	SG2PR01MB3112.apcprd01.prod.exchangelabs.com (20.178.152.12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2032.20; Mon, 1 Jul 2019 17:30:52 +0000
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com
	([fe80::d503:3d71:ce06:19d2]) by
	SG2PR01MB2141.apcprd01.prod.exchangelabs.com
	([fe80::d503:3d71:ce06:19d2%6]) with mapi id 15.20.2032.019;
	Mon, 1 Jul 2019 17:30:52 +0000
From: Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
To: "dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: Device mapper (Wikipedia)
Thread-Index: AdUwMprzOwziAT1kSre/tdg22Ahgvg==
Date: Mon, 1 Jul 2019 17:30:52 +0000
Message-ID: <SG2PR01MB214143FD4107A76B7726281A87F90@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ceo@teo-en-ming-corp.com; 
x-originating-ip: [118.189.211.120]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de84d9b7-cbfc-430c-9bb1-08d6fe49ddf8
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:SG2PR01MB3112; 
x-ms-traffictypediagnostic: SG2PR01MB3112:
x-ms-exchange-purlcount: 5
x-microsoft-antispam-prvs: <SG2PR01MB3112E9D4087ADB242F9EF65187F90@SG2PR01MB3112.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(376002)(346002)(396003)(136003)(39830400003)(189003)(199004)(476003)(66946007)(52536014)(66476007)(86362001)(5660300002)(81166006)(8676002)(81156014)(76116006)(73956011)(486006)(64756008)(66446008)(66556008)(26005)(7736002)(186003)(2906002)(33656002)(66066001)(6916009)(8936002)(4744005)(256004)(2501003)(6436002)(99286004)(53936002)(3846002)(102836004)(7696005)(71200400001)(508600001)(6506007)(71190400001)(5640700003)(68736007)(74316002)(966005)(606006)(316002)(4326008)(55016002)(25786009)(21615005)(6306002)(54896002)(14454004)(107886003)(2351001)(6116002)(790700001)(236005)(9686003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SG2PR01MB3112;
	H:SG2PR01MB2141.apcprd01.prod.exchangelabs.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: teo-en-ming-corp.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Gl/UZ7CIfmU5xXRVFVcGQRwonfwCy4zePX02iMC/YTUUgl24DWvzaVm/VsY+ylrj+lufGJl4kh5nQZMt36zDAvOCuE/PT6sFS5ui8vfcgkeDLU23NtPk/VtfXkZZ9d9WZtNbLrdYjWDBjeQfcg8ECg2XvQqk3JKlWfchzTqWDS35E5vdKssCuBNveXsmHmq0d22C8srOGmNpsDgMv0TInc1bV/mX31ncmbzF4FoLVxP3HZHiVJeDy14hANP9xkgqBEndEDId+EJ1J3QA22WmuAl1YJ7h0LIXFL4k8HudiqsI+yrds+b3GMHKTkyppINHbigfRQgeugckf5GDTIJ1NfvB4mHr2mjpCefDFen4la2FnIfthzBC1Z397Iwn+FoAC0RZ3y6jaKVpnEpKF7/ohA9Pc5L3T8GSabnBOKGDjWw=
MIME-Version: 1.0
X-OriginatorOrg: teo-en-ming-corp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de84d9b7-cbfc-430c-9bb1-08d6fe49ddf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 17:30:52.8119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b3f6ae-c453-4b93-aec9-f17508e5885c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ceo@teo-en-ming-corp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB3112
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Mon, 01 Jul 2019 17:31:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Mon, 01 Jul 2019 17:31:02 +0000 (UTC) for IP:'40.107.132.48'
	DOMAIN:'mail-eopbgr1320048.outbound.protection.outlook.com'
	HELO:'APC01-PU1-obe.outbound.protection.outlook.com'
	FROM:'ceo@teo-en-ming-corp.com' RCPT:''
X-RedHat-Spam-Score: -0.011  (DKIM_SIGNED, DKIM_VALID, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS, SPF_PASS) 40.107.132.48
	mail-eopbgr1320048.outbound.protection.outlook.com
	40.107.132.48
	mail-eopbgr1320048.outbound.protection.outlook.com
	<ceo@teo-en-ming-corp.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
Subject: [dm-devel] Device mapper (Wikipedia)
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7080041286859000900=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Mon, 01 Jul 2019 17:34:29 +0000 (UTC)

--===============7080041286859000900==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SG2PR01MB214143FD4107A76B7726281A87F90SG2PR01MB2141apcp_"

--_000_SG2PR01MB214143FD4107A76B7726281A87F90SG2PR01MB2141apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Good morning from Singapore,

Device mapper (Wikipedia):

https://en.wikipedia.org/wiki/Device_mapper





-----BEGIN EMAIL SIGNATURE-----

The Gospel for all Targeted Individuals (TIs):

[The New York Times] Microwave Weapons Are Prime Suspect in Ills of
U.S. Embassy Workers

Link: https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microwav=
e.html

***************************************************************************=
*****************

Singaporean Mr. Turritopsis Dohrnii Teo En Ming's Academic
Qualifications as at 14 Feb 2019

[1] https://tdtemcerts.wordpress.com/

[2] https://tdtemcerts.blogspot.sg/

[3] https://www.scribd.com/user/270125049/Teo-En-Ming

-----END EMAIL SIGNATURE-----


--_000_SG2PR01MB214143FD4107A76B7726281A87F90SG2PR01MB2141apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-SG" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Good morning from Singapore,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Device mapper (Wikipedia):<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://en.wikipedia.org/wiki/Device_mapp=
er">https://en.wikipedia.org/wiki/Device_mapper</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">-----BEGIN EMAIL SIGNATURE-----<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">The Gospel for all Targeted Individuals (TIs):=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">[The New York Times] Microwave Weapons Are Pri=
me Suspect in Ills of<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">U.S. Embassy Workers<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">Link:
<a href=3D"https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-mic=
rowave.html">
<span style=3D"color:blue">https://www.nytimes.com/2018/09/01/science/sonic=
-attack-cuba-microwave.html</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">**********************************************=
**********************************************<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">Singaporean Mr. Turritopsis Dohrnii Teo En Min=
g's Academic<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">Qualifications as at 14 Feb 2019<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">[1]
<a href=3D"https://tdtemcerts.wordpress.com/"><span style=3D"color:blue">ht=
tps://tdtemcerts.wordpress.com/</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">[2]
<a href=3D"https://tdtemcerts.blogspot.sg/"><span style=3D"color:blue">http=
s://tdtemcerts.blogspot.sg/</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">[3]
<a href=3D"https://www.scribd.com/user/270125049/Teo-En-Ming"><span style=
=3D"color:blue">https://www.scribd.com/user/270125049/Teo-En-Ming</span></a=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">-----END EMAIL SIGNATURE-----</span><o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SG2PR01MB214143FD4107A76B7726281A87F90SG2PR01MB2141apcp_--


--===============7080041286859000900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============7080041286859000900==--

