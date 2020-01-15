Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7AD13BA39
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jan 2020 08:12:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579072357;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=S9hzEr4T+DXOPY747/DtCwvUvKGHqzlcCL/R5HDDSaw=;
	b=CwHQJbk9+A/kZgra2C8PaSI9BROt2gMJSXuYiuVM4sH2lO7qLAIsMmkMAxvpY0Z7/vRseP
	67F3aNE3HsaAqQB/oYFbs+X+ie04KyzbXuqvMJuxdWNRCICToY5KSirKU7eRGUxP1cFONv
	MQXdnOSPSqmc0zOss7OnoUjKy36h5vM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-xbWBiWWLOzC6a6jHHgPXdQ-1; Wed, 15 Jan 2020 02:12:35 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AFF6477;
	Wed, 15 Jan 2020 07:12:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8639A675AF;
	Wed, 15 Jan 2020 07:12:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A7E61809567;
	Wed, 15 Jan 2020 07:12:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00F7Bnf7012108 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 02:11:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CFD4B2037E42; Wed, 15 Jan 2020 07:11:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA67F2026D67
	for <dm-devel@redhat.com>; Wed, 15 Jan 2020 07:11:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1F828015A2
	for <dm-devel@redhat.com>; Wed, 15 Jan 2020 07:11:47 +0000 (UTC)
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
	[148.163.137.20]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-211-ld-i0UytNL-OZca7FSaqaQ-1; Wed, 15 Jan 2020 02:11:44 -0500
Received: from pps.filterd (m0170396.ppops.net [127.0.0.1])
	by mx0b-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	00F7AEVt030040
	for <dm-devel@redhat.com>; Wed, 15 Jan 2020 02:11:44 -0500
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
	[67.231.157.37])
	by mx0b-00154904.pphosted.com with ESMTP id 2xfb30x4r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <dm-devel@redhat.com>; Wed, 15 Jan 2020 02:11:43 -0500
Received: from pps.filterd (m0144104.ppops.net [127.0.0.1])
	by mx0b-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	00F790Vo052831
	for <dm-devel@redhat.com>; Wed, 15 Jan 2020 02:11:43 -0500
Received: from ausc60ps301.us.dell.com (ausc60ps301.us.dell.com
	[143.166.148.206])
	by mx0b-00154901.pphosted.com with ESMTP id 2xhbewqydq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dm-devel@redhat.com>; Wed, 15 Jan 2020 02:11:43 -0500
X-LoopCount0: from 10.166.132.131
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,349,1549951200"; 
	d="scan'208,217";a="1398618162"
From: <Sreenivas.Honnur@dell.com>
To: <dm-devel@redhat.com>
Thread-Topic: device blacklisting and suspend issue
Thread-Index: AdXLcvsStNGWHshsTnS9ETD6TDW7UA==
Date: Wed, 15 Jan 2020 07:11:39 +0000
Message-ID: <451c7e3b120e4880b9ed178850f15285@BLRX13MDC423.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
	MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
	MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Sreenivas_Honnur@Dell.com;
	MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-01-15T07:11:38.0323047Z;
	MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
	MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual;
	aiplabel=External Public
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [143.166.11.235]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
	definitions=2020-01-14_06:2020-01-14,
	2020-01-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	clxscore=1011 impostorscore=0
	lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0
	bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0
	mlxlogscore=680 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-1910280000 definitions=main-2001150057
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
	suspectscore=0 adultscore=0
	clxscore=1011 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=800
	priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-1910280000 definitions=main-2001150058
X-MC-Unique: ld-i0UytNL-OZca7FSaqaQ-1
X-MC-Unique: xbWBiWWLOzC6a6jHHgPXdQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Subject: [dm-devel] device blacklisting and suspend issue
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: multipart/mixed; boundary="===============7129444931359559740=="

--===============7129444931359559740==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_451c7e3b120e4880b9ed178850f15285BLRX13MDC423AMERDELLCOM_"

--_000_451c7e3b120e4880b9ed178850f15285BLRX13MDC423AMERDELLCOM_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

I have two queries:

  1.  We have an issue with device blacklisting. We add an entry in /etc/mu=
ltipath.conf" and do "service multipathd reload".
After this to check if device is blacklisted we issue "multipathd show blac=
klist" command in a loop(with a delay of 1 second).
Sometimes I see that this command takes too much time to come out or someti=
mes it just hangs. Is this the correct way to check if device is blackliste=
d? Or is there any other way to do it?


  1.  After suspending (dmsetup suspend wwid) a device,  is there a way to =
inform multipathd not to make it active if some events happen on this devic=
e(like new path added..etc...I see that the table is reloaded and device be=
comes active)

How to avoid this i.e. the device should be in "suspended" state until I do=
 a "resume" on it, "multipathd" should not enable it until I do "dmsetup re=
sume"







--_000_451c7e3b120e4880b9ed178850f15285BLRX13MDC423AMERDELLCOM_
Content-Type: text/html; charset=WINDOWS-1252
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
=09{font-family:"Cambria Math";
=09panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09margin-bottom:.0001pt;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:#0563C1;
=09text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
=09{mso-style-priority:99;
=09color:#954F72;
=09text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
=09{mso-style-priority:34;
=09margin-top:0in;
=09margin-right:0in;
=09margin-bottom:0in;
=09margin-left:.5in;
=09margin-bottom:.0001pt;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:"Calibri",sans-serif;
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-family:"Calibri",sans-serif;}
@page WordSection1
=09{size:8.5in 11.0in;
=09margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
=09{page:WordSection1;}
/* List Definitions */
@list l0
=09{mso-list-id:847448017;
=09mso-list-type:hybrid;
=09mso-list-template-ids:-612727868 67698703 67698713 67698715 67698703 676=
98713 67698715 67698703 67698713 67698715;}
@list l0:level1
=09{mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l0:level2
=09{mso-level-number-format:alpha-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l0:level3
=09{mso-level-number-format:roman-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:right;
=09text-indent:-9.0pt;}
@list l0:level4
=09{mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l0:level5
=09{mso-level-number-format:alpha-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l0:level6
=09{mso-level-number-format:roman-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:right;
=09text-indent:-9.0pt;}
@list l0:level7
=09{mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l0:level8
=09{mso-level-number-format:alpha-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l0:level9
=09{mso-level-number-format:roman-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:right;
=09text-indent:-9.0pt;}
@list l1
=09{mso-list-id:1682581990;
=09mso-list-type:hybrid;
=09mso-list-template-ids:1190816600 67698703 67698713 67698715 67698703 676=
98713 67698715 67698703 67698713 67698715;}
@list l1:level1
=09{mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l1:level2
=09{mso-level-number-format:alpha-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l1:level3
=09{mso-level-number-format:roman-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:right;
=09text-indent:-9.0pt;}
@list l1:level4
=09{mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l1:level5
=09{mso-level-number-format:alpha-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l1:level6
=09{mso-level-number-format:roman-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:right;
=09text-indent:-9.0pt;}
@list l1:level7
=09{mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l1:level8
=09{mso-level-number-format:alpha-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;}
@list l1:level9
=09{mso-level-number-format:roman-lower;
=09mso-level-tab-stop:none;
=09mso-level-number-position:right;
=09text-indent:-9.0pt;}
ol
=09{margin-bottom:0in;}
ul
=09{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I have two queries:<o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo2">We have an issue with device blacklisting. We add an entry in /etc/mu=
ltipath.conf&#8221; and do &#8220;service multipathd reload&#8221;.<o:p></o=
:p></li></ol>
<p class=3D"MsoNormal">After this to check if device is blacklisted we issu=
e &#8220;multipathd show blacklist&#8221; command in a loop(with a delay of=
 1 second).<o:p></o:p></p>
<p class=3D"MsoNormal">Sometimes I see that this command takes too much tim=
e to come out or sometimes it just hangs. Is this the correct way to check =
if device is blacklisted? Or is there any other way to do it?<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0in" start=3D"2" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo2">After suspending (dmsetup suspend wwid) a device, &nbsp;is there a wa=
y to inform multipathd not to make it active if some events happen on this =
device(like new path added..etc&#8230;I see that
 the table is reloaded and device becomes active)<o:p></o:p></li></ol>
<p class=3D"MsoListParagraph">How to avoid this i.e. the device should be i=
n &#8220;suspended&#8221; state until I do a &#8220;resume&#8221; on it, &#=
8220;multipathd&#8221; should not enable it until I do &#8220;dmsetup resum=
e&#8221;<o:p></o:p></p>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_451c7e3b120e4880b9ed178850f15285BLRX13MDC423AMERDELLCOM_--

--===============7129444931359559740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============7129444931359559740==--

