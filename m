Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 664D222AA16
	for <lists+dm-devel@lfdr.de>; Thu, 23 Jul 2020 09:54:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-g2Ek82QNMI2mQtlw7IsEQg-1; Thu, 23 Jul 2020 03:54:09 -0400
X-MC-Unique: g2Ek82QNMI2mQtlw7IsEQg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D0301923761;
	Thu, 23 Jul 2020 07:54:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F00CC6931D;
	Thu, 23 Jul 2020 07:54:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 94B6F1809557;
	Thu, 23 Jul 2020 07:53:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06N1S6fK019016 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 21:28:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 678502156A2D; Thu, 23 Jul 2020 01:28:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 627112157F24
	for <dm-devel@redhat.com>; Thu, 23 Jul 2020 01:28:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32D84101244B
	for <dm-devel@redhat.com>; Thu, 23 Jul 2020 01:28:04 +0000 (UTC)
Received: from huawei.com (szxga08-in.huawei.com [45.249.212.255]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-462-275p8GMqOuuqr9LzlvIJ5A-1; Wed, 22 Jul 2020 21:28:00 -0400
X-MC-Unique: 275p8GMqOuuqr9LzlvIJ5A-1
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.57])
	by Forcepoint Email with ESMTP id BDC05396D4B0F527D2E5;
	Thu, 23 Jul 2020 09:11:54 +0800 (CST)
Received: from DGGEMM422-HUB.china.huawei.com (10.1.198.39) by
	DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server
	(TLS) id 14.3.487.0; Thu, 23 Jul 2020 09:11:54 +0800
Received: from DGGEMM531-MBX.china.huawei.com ([169.254.5.150]) by
	dggemm422-hub.china.huawei.com ([10.1.198.39]) with mapi id
	14.03.0487.000; Thu, 23 Jul 2020 09:11:47 +0800
From: lutianxiong <lutianxiong@huawei.com>
To: "christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>,
	"mwilck@suse.com" <mwilck@suse.com>
Thread-Topic: libmultipath: fix null dereference
Thread-Index: AdZgAuZqsPB0lGhtTpG77ZEmTq+Iyw==
Date: Thu, 23 Jul 2020 01:11:47 +0000
Message-ID: <B8F26E5D3A1269458BE7CD6D60E9885F7A369633@dggemm531-mbx.china.huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.176.182]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 23 Jul 2020 03:53:01 -0400
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Liaoqingwei <liaoqingwei@huawei.com>
Subject: [dm-devel] libmultipath: fix null dereference
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============3443771905671819030=="

--===============3443771905671819030==
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_B8F26E5D3A1269458BE7CD6D60E9885F7A369633dggemm531mbxchi_"

--_000_B8F26E5D3A1269458BE7CD6D60E9885F7A369633dggemm531mbxchi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi
I got a multipath segfault while running iscsi login/logout and following s=
cripts in parallel:

#!/bin/bash

interval=3D1
while true
do
              multipath -F &> /dev/null
              multipath -r &> /dev/null
              multipath -v2 &> /dev/null
              multipath -ll &> /dev/null
              sleep $interval
done

This is the debuginfo:
#0  0x00007f3805e4df58 in add (ctx=3D0x55d1569e4a00, ud=3D0x55d1569bafd0) a=
t nvme.c:801
801              if (strcmp("disk", udev_device_get_devtype(ud)))
(gdb) bt
#0  0x00007f3805e4df58 in add (ctx=3D0x55d1569e4a00, ud=3D0x55d1569bafd0) a=
t nvme.c:801
#1  0x00007f3806687a44 in add_foreign (udev=3D0x55d1569bafd0) at foreign.c:=
299
#2  0x00007f3806665abf in is_claimed_by_foreign (ud=3D<optimized out>) at f=
oreign.h:316
#3  pathinfo (pp=3D0x55d1569e9f50, conf=3D0x55d1569b92d0, mask=3D69) at dis=
covery.c:2064
#4  0x000055d154c91cbb in check_usable_paths (conf=3D0x55d1569b92d0, devpat=
h=3D0x55d1569e3200 "dm-6", dev_type=3D<optimized out>) at main.c:368
#5  0x000055d154c910a5 in main (argc=3D3, argv=3D<optimized out>) at main.c=
:1057

In add() at libmultipath/foreign/nvme.c, udev_device_get_devtype(ud) return=
 a NULL pointer then dereferenced.
Here, NULL check is needed.



Check if udev_device_get_devtype return NULL before dereferencing it.

Signed-off-by: lutianxiong <lutianxiong@huawei.com>
---
libmultipath/foreign/nvme.c | 4 +++-
1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/libmultipath/foreign/nvme.c b/libmultipath/foreign/nvme.c
index 09cdddf0..f1da1dcd 100644
--- a/libmultipath/foreign/nvme.c
+++ b/libmultipath/foreign/nvme.c
@@ -793,12 +793,14 @@ int add(struct context *ctx, struct udev_device *ud)
{
        struct udev_device *subsys;
        int rc;
+       const char *devtype;

        condlog(5, "%s called for \"%s\"", __func__, THIS);

        if (ud =3D=3D NULL)
                return FOREIGN_ERR;
-       if (strcmp("disk", udev_device_get_devtype(ud)))
+       if ((devtype =3D udev_device_get_devtype(ud)) =3D=3D NULL ||
+                       strcmp("disk", devtype))
                return FOREIGN_IGNORED;

        subsys =3D udev_device_get_parent_with_subsystem_devtype(ud,
--
2.23.0

--_000_B8F26E5D3A1269458BE7CD6D60E9885F7A369633dggemm531mbxchi_
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
=09{font-family:SimSun;
=09panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
=09{font-family:"Cambria Math";
=09panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
=09{font-family:SimSun;
=09panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0cm;
=09margin-bottom:.0001pt;
=09text-align:justify;
=09text-justify:inter-ideograph;
=09font-size:10.5pt;
=09font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:#0563C1;
=09text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
=09{mso-style-priority:99;
=09color:#954F72;
=09text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
=09{mso-style-priority:99;
=09mso-style-link:"\7EAF\6587\672C Char";
=09margin:0cm;
=09margin-bottom:.0001pt;
=09font-size:10.5pt;
=09font-family:"Calibri",sans-serif;}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:"Calibri",sans-serif;
=09color:windowtext;}
span.Char
=09{mso-style-name:"\7EAF\6587\672C Char";
=09mso-style-priority:99;
=09mso-style-link:\7EAF\6587\672C;
=09font-family:"Calibri",sans-serif;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-family:"Calibri",sans-serif;}
/* Page Definitions */
@page WordSection1
=09{size:612.0pt 792.0pt;
=09margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
=09{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">Hi<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">I go=
t a multipath segfault while running iscsi login/logout and following scrip=
ts in parallel:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-size:14.0pt">#=
!/bin/bash<o:p></o:p></span></i></p>
<p class=3D"MsoPlainText"><i><span lang=3D"EN-US" style=3D"font-size:14.0pt=
">interval=3D1<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-size:14.0pt">w=
hile true<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-size:14.0pt">d=
o<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-size:14.0pt">&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; multipath -F &amp;&gt; /dev/null<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-size:14.0pt">&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; multipath -r &amp;&gt; /dev/null<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-size:14.0pt">&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; multipath -v2 &amp;&gt; /dev/null<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-size:14.0pt">&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; multipath -ll &amp;&gt; /dev/null<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-size:14.0pt">&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; sleep $interval<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-size:14.0pt">d=
one<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">This=
 is the debuginfo:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">#0&n=
bsp; 0x00007f3805e4df58 in add (ctx=3D0x55d1569e4a00, ud=3D0x55d1569bafd0) =
at nvme.c:801<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">801&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; if (strcmp(&quot;disk&quot;, udev_device_get_devtype(ud)))<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">(gdb=
) bt<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">#0&n=
bsp; 0x00007f3805e4df58 in add (ctx=3D0x55d1569e4a00, ud=3D0x55d1569bafd0) =
at nvme.c:801<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">#1&n=
bsp; 0x00007f3806687a44 in add_foreign (udev=3D0x55d1569bafd0) at foreign.c=
:299<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">#2&n=
bsp; 0x00007f3806665abf in is_claimed_by_foreign (ud=3D&lt;optimized out&gt=
;) at foreign.h:316<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">#3&n=
bsp; pathinfo (pp=3D0x55d1569e9f50, conf=3D0x55d1569b92d0, mask=3D69) at di=
scovery.c:2064<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">#4&n=
bsp; 0x000055d154c91cbb in check_usable_paths (conf=3D0x55d1569b92d0, devpa=
th=3D0x55d1569e3200 &quot;dm-6&quot;, dev_type=3D&lt;optimized out&gt;) at =
main.c:368<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">#5&n=
bsp; 0x000055d154c910a5 in main (argc=3D3, argv=3D&lt;optimized out&gt;) at=
 main.c:1057<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">In a=
dd() at </span>
<span lang=3D"EN-US" style=3D"font-size:14.0pt">libmultipath/foreign/nvme.c=
, udev_device_get_devtype(ud) return a NULL pointer then
</span><span lang=3D"EN-US" style=3D"font-size:14.0pt">dereferenced.<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">Here=
, NULL check is needed.</span><span lang=3D"EN-US" style=3D"font-size:14.0p=
t"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">Chec=
k if udev_device_get_devtype return NULL before dereferencing it.<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">Sign=
ed-off-by: lutianxiong &lt;lutianxiong@huawei.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">---<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">libm=
ultipath/foreign/nvme.c | 4 &#43;&#43;&#43;-<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">1 fi=
le changed, 3 insertions(&#43;), 1 deletion(-)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">diff=
 --git a/libmultipath/foreign/nvme.c b/libmultipath/foreign/nvme.c<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">inde=
x 09cdddf0..f1da1dcd 100644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">--- =
a/libmultipath/foreign/nvme.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">&#43=
;&#43;&#43; b/libmultipath/foreign/nvme.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">@@ -=
793,12 &#43;793,14 @@ int add(struct context *ctx, struct udev_device *ud)<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">{<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct udev_device *subsys;<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int rc;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">&#43=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *devtype;<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; condlog(5, &quot;%s called for \&quo=
t;%s\&quot;&quot;, __func__, THIS);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ud =3D=3D NULL)<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; return FOREIGN_ERR;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">-&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strcmp(&quot;disk&quot;, udev_device_=
get_devtype(ud)))<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">&#43=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((devtype =3D udev_device_get_devt=
ype(ud)) =3D=3D NULL ||<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">&#43=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcmp(&quot;dis=
k&quot;, devtype))<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; return FOREIGN_IGNORED;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subsys =3D udev_device_get_parent_wi=
th_subsystem_devtype(ud,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">--<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:14.0pt">2.23=
.0<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_B8F26E5D3A1269458BE7CD6D60E9885F7A369633dggemm531mbxchi_--

--===============3443771905671819030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============3443771905671819030==--

