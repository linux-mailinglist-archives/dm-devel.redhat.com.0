Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A3334028
	for <lists+dm-devel@lfdr.de>; Tue,  4 Jun 2019 09:32:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 60B62C058CA4;
	Tue,  4 Jun 2019 07:31:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36B0E196BF;
	Tue,  4 Jun 2019 07:31:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 503421806B12;
	Tue,  4 Jun 2019 07:30:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x547TlIb029235 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Jun 2019 03:29:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 99DDA424F; Tue,  4 Jun 2019 07:29:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9508917D99
	for <dm-devel@redhat.com>; Tue,  4 Jun 2019 07:29:45 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 14A4B3078AC5
	for <dm-devel@redhat.com>; Tue,  4 Jun 2019 07:29:27 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x547SHEJ137613
	for <dm-devel@redhat.com>; Tue, 4 Jun 2019 03:29:26 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
	[192.155.248.66])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2swgtrg525-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <dm-devel@redhat.com>; Tue, 04 Jun 2019 03:29:26 -0400
Received: from localhost
	by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
	for <dm-devel@redhat.com> from <EYALBE@il.ibm.com>;
	Tue, 4 Jun 2019 07:29:25 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
	by smtp.notes.na.collabserv.com (10.106.227.127) with
	smtp.notes.na.collabserv.com ESMTP; Tue, 4 Jun 2019 07:29:23 -0000
Received: from us1a3-mail120.a3.dal06.isc4sb.com ([10.146.45.191])
	by us1a3-smtp03.a3.dal06.isc4sb.com
	with ESMTP id 2019060407292323-184687 ;
	Tue, 4 Jun 2019 07:29:23 +0000 
To: dm-devel@redhat.com
From: "Eyal Ben-David" <EYALBE@il.ibm.com>
Date: Tue, 4 Jun 2019 10:29:23 +0300
MIME-Version: 1.0
X-KeepSent: E5B87F49:B857DE99-C225840F:00284A78;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 6443
X-TNEFEvaluated: 1
x-cbid: 19060407-6357-0000-0000-00000B3BABFB
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0.49;
	ST=0; TS=0; UL=0; ISC=; MB=0.001198
X-IBM-SpamModules-Versions: BY=3.00011212; HX=3.00000242; KW=3.00000007;
	PH=3.00000004; SC=3.00000286; SDB=6.01213002; UDB=6.00637507;
	IPR=6.00994069; 
	BA=6.00006325; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00027177;
	XFM=3.00000015; UTC=2019-06-04 07:29:24
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-06-04 02:36:38 - 6.00010005
x-cbparentid: 19060407-6358-0000-0000-0000708CB862
Message-Id: <OFE5B87F49.B857DE99-ONC225840F.00284A78-C225840F.00292455@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-04_06:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Tue, 04 Jun 2019 07:29:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Tue, 04 Jun 2019 07:29:27 +0000 (UTC) for IP:'148.163.156.1'
	DOMAIN:'mx0a-001b2d01.pphosted.com'
	HELO:'mx0a-001b2d01.pphosted.com' FROM:'EYALBE@il.ibm.com' RCPT:''
X-RedHat-Spam-Score: -0.697  (HTML_MESSAGE, RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_NONE) 148.163.156.1 mx0a-001b2d01.pphosted.com
	148.163.156.1 mx0a-001b2d01.pphosted.com <EYALBE@il.ibm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Subject: [dm-devel] Automatic blacklisting of NVMe devices if NVMe native MP
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
Content-Type: multipart/mixed; boundary="===============6984354805400517778=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 04 Jun 2019 07:32:04 +0000 (UTC)


--===============6984354805400517778==
Content-Type: multipart/alternative;
	boundary="=_alternative 002923C3C225840F_="


--=_alternative 002923C3C225840F_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Hi all,

Is it possible to automatically blacklist all NVMe devices if the NVMe=20
driver has it's own multipath?

I mean if for example if:
=20
cat /sys/module/nvme=5Fcore/parameters/multipath=20
Y

then device mapper would automatically blacklist all NVMe devices to avoid =

unexpected consequences.


Thanks.
Eyal



--=_alternative 002923C3C225840F_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<font size=3D2 face=3D"sans-serif">Hi all,</font><br><br><font size=3D2 fac=
e=3D"sans-serif">Is it possible to automatically blacklist
all NVMe devices if the NVMe driver has it's own multipath?</font><br><br><=
font size=3D2 face=3D"sans-serif">I mean if for example if:</font><br><font=
 size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; </font><br><font =
size=3D2 face=3D"sans-serif">cat /sys/module/nvme=5Fcore/parameters/multipa=
th
</font><br><font size=3D2 face=3D"sans-serif">Y</font><br><br><font size=3D=
2 face=3D"sans-serif">then device mapper would automatically
blacklist all NVMe devices to avoid unexpected consequences.</font><br><br>=
<br><font size=3D2 face=3D"sans-serif">Thanks.</font><br><font size=3D2 fac=
e=3D"sans-serif">Eyal</font><br><BR>
--=_alternative 002923C3C225840F_=--


--===============6984354805400517778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============6984354805400517778==--

