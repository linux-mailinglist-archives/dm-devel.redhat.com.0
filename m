Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F638E72F
	for <lists+dm-devel@lfdr.de>; Thu, 15 Aug 2019 10:45:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3163FC05AA6B;
	Thu, 15 Aug 2019 08:45:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D87DC95A55;
	Thu, 15 Aug 2019 08:45:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A83D18005A0;
	Thu, 15 Aug 2019 08:44:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7EJhVkR003319 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 15:43:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1E6ED82088; Wed, 14 Aug 2019 19:43:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8642481768;
	Wed, 14 Aug 2019 19:43:28 +0000 (UTC)
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr700053.outbound.protection.outlook.com [40.107.70.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 415DF19CF89;
	Wed, 14 Aug 2019 19:43:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=jbovjwCNbFF78vdNxakYBi+BVOvXn6hoBO1bDzYf40/hC92SZj2XbPCpskW883uGkSF7Fo/xtgu1Kmcy2AfMnQUczpBlQAHuHiWe/oVY5o0zVnCFmjHFpPWAuZk8HvOeUESGnQPorjNWVa+E+6spVePRfr/znKOYRCtKGpOHqamUxGMaSeDNw44x+K6XYxtQl9DNk7Tb13T02UOCD+UFHMjMhjfRKL8212Scr2LbXZzzUOa8JrwGY47q0s3/ZtYIjGaCXtYmNUR5ExRsNczHf2kWaRYtKCFNOsXyUBNP4GZLRqRtR7ApWLOYiIlvs/Sp4Cv25wn+owB1tkD18J0+Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pdUcETDqGEHPWFW2IcfaZf+KQ+Ftq7BvSBrYFsEboJo=;
	b=mDiohKouWxxTbBhHA/tPZ3wKENk/F7aE9488o/XJ5Xpml487XBDrRx9QdGZDb2bcn6wCrYY88yMPFPaQY9eU55pdibNfewq1ZM7JRse9r20MMWOTiE1Vbx8Wi24MVEeKXUtaOZKEid+iqe3xrmcqxwwe3ba8yGKfyPs9+VaByUO80cd4hZoN2gyoa/Bi2dmJztzT3PVot+qW0T+fqtTPOc2G+iAVIBVl865J2r1S+FH+oyfLu9oaH2ltAWcyEFwCoJeicp2/hFr3QS9ebECZxT6Qzxrdhr61xabKsX0Qh+xeTUWEX28gz4dha73tQ9ufzZY2dnVkuclwDnrvZFulXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=netapp.com; dmarc=pass action=none header.from=netapp.com;
	dkim=pass header.d=netapp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=netapp.onmicrosoft.com; s=selector2-netapp-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pdUcETDqGEHPWFW2IcfaZf+KQ+Ftq7BvSBrYFsEboJo=;
	b=eByWoIhEmSzS9F3la1sSzi59XaugR8Jl1QonPOsISAPiic/KPR4UPPX9ngh9CQu2hktpBvX6Z4lP0USKUgtsc+NK03v9K4a0Jv59qPVAjpGZaqjoLMGEbntJnxMNYr7vECayCN/CZ8HnjWq+3lr5+eB+kJyYw5DHBMXaqBT0pk0=
Received: from BN8PR06MB5793.namprd06.prod.outlook.com (20.179.137.207) by
	BN8PR06MB5890.namprd06.prod.outlook.com (20.179.139.20) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.21; Wed, 14 Aug 2019 19:43:22 +0000
Received: from BN8PR06MB5793.namprd06.prod.outlook.com
	([fe80::10c4:ad90:bd32:2519]) by
	BN8PR06MB5793.namprd06.prod.outlook.com
	([fe80::10c4:ad90:bd32:2519%6]) with mapi id 15.20.2157.022;
	Wed, 14 Aug 2019 19:43:21 +0000
From: "Schremmer, Steven" <Steve.Schremmer@netapp.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH] libmultipath: builtin config for NetApp E-Series
Thread-Index: AQHVUtSNrQWCQ9Vm0UmSzSWw3wwI76b7CSYw
Date: Wed, 14 Aug 2019 19:43:21 +0000
Message-ID: <BN8PR06MB5793EA4523DC5D0BBDEB10F98CAD0@BN8PR06MB5793.namprd06.prod.outlook.com>
References: <1565810083-10744-1-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1565810083-10744-1-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc3NjaHJlbW1cYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1jM2ZkYWViMy1iZWNiLTExZTktYTk0YS0xMDRhN2RiMTY2Y2RcYW1lLXRlc3RcYzNmZGFlYjQtYmVjYi0xMWU5LWE5NGEtMTA0YTdkYjE2NmNkYm9keS50eHQiIHN6PSIxMzkwIiB0PSIxMzIxMDI4NTM5OTgyNjAwMzIiIGg9InNMaXYvOWFBSkNucHg2SWtwQ21CNDBvTkVadz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Steve.Schremmer@netapp.com; 
x-originating-ip: [216.240.24.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa243fb3-9387-433e-dfdd-08d720efa9fa
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:BN8PR06MB5890; 
x-ms-traffictypediagnostic: BN8PR06MB5890:
x-microsoft-antispam-prvs: <BN8PR06MB589086DFB0453AD6D79F15478CAD0@BN8PR06MB5890.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(199004)(189003)(13464003)(2906002)(99286004)(66066001)(102836004)(6506007)(6246003)(11346002)(5660300002)(256004)(86362001)(316002)(446003)(476003)(64756008)(81166006)(66446008)(66556008)(14454004)(9686003)(8676002)(71200400001)(71190400001)(53546011)(81156014)(52536014)(4744005)(66476007)(8936002)(66946007)(486006)(305945005)(76116006)(186003)(33656002)(7736002)(110136005)(53936002)(76176011)(229853002)(55016002)(3846002)(25786009)(7696005)(26005)(74316002)(478600001)(4326008)(6436002)(6116002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR06MB5890;
	H:BN8PR06MB5793.namprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: netapp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /3n3MoDXeVV6OwvRSA1dgtpzTq9tNwLBZ2BcRvz9SZnrh1qO2BkpGIujZ845HX3t9qlsYalOZ+aA4FJXLMoD/J/D3nDGZHSXbb2/NgtleTyXVEchIh7LucMMIvrKgL3TUm0U8PTrfy9VLqMIsbt/ADVa9Inn1ugMvRerUUkfSPaktEFsEYzq0dFv1EQsVT3/K4K1igpxmJEjYIdbp5AvajaggB9oYhMjxgu0/xawXGLZST8AsPkwE78Zc5/wrw4LkC2jKM/YT87cxmH9gy8nqj1Lejzu6aJ4GI9Bl3jdfML4iGdmeRFi/zJQ9Jl8oj/a/qmEtFvkzv9g/jUHy+bbdQpqg4u+FEWC8Xl4ao/dn2KTdAtE5/pY4JTa69RuOrsI2bYlfgbzXCVxQBZHAx72biMBYZL/0EZVJ1S0TyP9gYE=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: netapp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa243fb3-9387-433e-dfdd-08d720efa9fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 19:43:21.6268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b0911a0-929b-4715-944b-c03745165b3a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gNWi9KOMOVVX2P7vpkyL9Nktje+8SkEMMvC2h6cKh5ZnQZ0EpypAJuWkEff3EdljA7nAwxKsClRtL7r9qu6rwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR06MB5890
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Wed, 14 Aug 2019 19:43:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Wed, 14 Aug 2019 19:43:25 +0000 (UTC) for IP:'40.107.70.53'
	DOMAIN:'mail-eopbgr700053.outbound.protection.outlook.com'
	HELO:'NAM04-SN1-obe.outbound.protection.outlook.com'
	FROM:'Steve.Schremmer@netapp.com' RCPT:''
X-RedHat-Spam-Score: -0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS, SPF_PASS) 40.107.70.53
	mail-eopbgr700053.outbound.protection.outlook.com 40.107.70.53
	mail-eopbgr700053.outbound.protection.outlook.com
	<Steve.Schremmer@netapp.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7EJhVkR003319
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 15 Aug 2019 04:44:43 -0400
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] libmultipath: builtin config for NetApp
	E-Series
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Thu, 15 Aug 2019 08:45:06 +0000 (UTC)

Nak. We would rather not have this in the builtin config at this time.

Thanks,
Steve

-----Original Message-----
From: Benjamin Marzinski <bmarzins@redhat.com> 
Sent: Wednesday, August 14, 2019 2:15 PM
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: device-mapper development <dm-devel@redhat.com>; Schremmer, Steven <Steve.Schremmer@netapp.com>
Subject: [PATCH] libmultipath: builtin config for NetApp E-Series

Cc: Steve Schremmer <sschremm@netapp.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/hwtable.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c index 96e8b25d..94af153d 100644
--- a/libmultipath/hwtable.c
+++ b/libmultipath/hwtable.c
@@ -780,6 +780,14 @@ static struct hwentry default_hw[] = {
                .pgpolicy      = MULTIBUS,
                .no_path_retry = NO_PATH_RETRY_QUEUE,
        },
+       {
+               /* NetApp E-Series */
+               .vendor        = "NVME",
+               .product       = "NetApp E-Series",
+               .pgpolicy      = GROUP_BY_PRIO,
+               .pgfailback    = -FAILBACK_IMMEDIATE,
+               .no_path_retry = 30,
+       },
        /*
         * Nexenta
         *
--
2.17.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
