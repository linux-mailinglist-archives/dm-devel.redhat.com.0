Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 074A2D52AF
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:31:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 508F03090FC5;
	Sat, 12 Oct 2019 21:31:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22C7B10013D9;
	Sat, 12 Oct 2019 21:31:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7229E180B76F;
	Sat, 12 Oct 2019 21:31:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSehh006152 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 369C85DA5B; Sat, 12 Oct 2019 21:28:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx28.extmail.prod.ext.phx2.redhat.com
	[10.5.110.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B62AC5D9CC;
	Sat, 12 Oct 2019 21:28:37 +0000 (UTC)
Received: from m4a0041g.houston.softwaregrp.com
	(m4a0041g.houston.softwaregrp.com [15.124.2.87])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 48BA688384E;
	Sat, 12 Oct 2019 21:28:36 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0041g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:27:41 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:12 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.12) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=LUcKEsCnbFKyL+2vm5+qnRVl+c0dsrg1wA1ALDHMSOeOPLcw23/sNtgwyiMMD/Kw5MLe5xPh076KDr7eeurN3TWAMEQDbep648qej2PLtg3Df7m9FwKALT/SoMnhPhTys4G4ip0UeRAJQdRpOn4b7S65KAzNv6l/x+zrebR0kswmWirUbWpuA1pygYRO00IJwDQ5w/DJ0wMuBvQLuMmbjG30zQ7AnJjjbuZoprAfz7Wln8QBmwhLn9D1HdTCysi5dZqSleK98dIAWuRDQjv81kH+Y4sdVKUS/YGEmgOph9s4/oSUfQxPggXriZs35Kx6IpXPDjSSGHMfKa2q54AEvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pz7aEamMvHFUGmNBMmNOe/XaBz+jkIUD6GDUsdJwNL8=;
	b=Lwi6+FqQ1WqlrGNaN7/HmXtOgptua6mOQx05AAe/FVX9V0fgoMpDL2aYpFH/nzZzho20QH0KMTWYP5c5aa4h54fTm4oO/8q6vD2z34GivvDjPN6J62g/elMRfQVUbljWGCVUwKl4ZnoxDFzcq2tO1Y/3T2NSbqK3ttbeDP8tVmGa+sxCN/aKjZUFy7UmJB0aB00xyWgvwW9zv1bmWoG+HntW8XvdJvSou8rKSQuSJCXX6dQchApsjrWEcmhIhP9raiFZ1cVa5QPDDcjyhPYiaW4/T5SAl84W/ocneAWBXhAped1/AqScQtpOKefIPoHWhmXyIfbAOK045MFs7t1wgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:11 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:11 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 27/72] libmultipath: hp_sw: remove usused argument in
	do_inq()
Thread-Index: AQHVgUPy+JtZzojyBkmKFMOxVkG2XA==
Date: Sat, 12 Oct 2019 21:28:11 +0000
Message-ID: <20191012212703.12989-28-martin.wilck@suse.com>
References: <20191012212703.12989-1-martin.wilck@suse.com>
In-Reply-To: <20191012212703.12989-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR02CA0045.eurprd02.prod.outlook.com
	(2603:10a6:208:d2::22) To CH2PR18MB3349.namprd18.prod.outlook.com
	(2603:10b6:610:28::19)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2.203.223.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5d31223-cc51-4b0d-cb34-08d74f5b14f7
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317BCB1DAFE9A2A660F6273FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(1496009)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(4744005)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MGdnACMOCDpjbuoOtWECin92XfC1sG4dtDKsdzTv1IcJ1rP8hwgGvrKHt8wSpOHFl0J0CTOaVHsmxk7ar+H63IlrPz7ZgV9ONF6hzeRYDDke6HNXWWFK5eTZOt3Ov8dm3hXq2xkKdyR0KN4i6DvG33LfRWTqHYIcg/1E08JnB3YOrtfh7f+ks1NZuqlOf9OKCfTIknewDDTT7adFEMgZbBz7ez9ppbaAOtvc5rDXxnszzN+Yvmw3RYYxzJgyyXVgCKK33ZcEfXO9J9EbcoREsa2cyFBFV8+cxi/qYDArNl1+1PQA49ccLMIIrJrWfyvfMVcGS70GOlNBJCLZVEOf/D8tczlo5GjeS491q77cNy+DF2MiCdaizSPopOoPSBFx895uJTUeVApM/zVWnOgRTLoqMsskFFqlRLvkG6P1PmI=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d31223-cc51-4b0d-cb34-08d74f5b14f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:11.1544 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oA5j6Mq5A0xKDJRoTAhw1yEi1dxafp0dIKs4RESgTNfN8W4fkwd9My72izEl6E3n++MPFSPEFaWCJut2fCknyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.69]); Sat, 12 Oct 2019 21:28:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]);
	Sat, 12 Oct 2019 21:28:37 +0000 (UTC) for IP:'15.124.2.87'
	DOMAIN:'m4a0041g.houston.softwaregrp.com'
	HELO:'m4a0041g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.87
	m4a0041g.houston.softwaregrp.com 15.124.2.87
	m4a0041g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.69
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSehh006152
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 27/72] libmultipath: hp_sw: remove usused
	argument in do_inq()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Sat, 12 Oct 2019 21:31:26 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/checkers/hp_sw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libmultipath/checkers/hp_sw.c b/libmultipath/checkers/hp_sw.c
index 1a820223..eabfa93c 100644
--- a/libmultipath/checkers/hp_sw.c
+++ b/libmultipath/checkers/hp_sw.c
@@ -44,7 +44,7 @@ void libcheck_free (struct checker * c)
 
 static int
 do_inq(int sg_fd, int cmddt, int evpd, unsigned int pg_op,
-       void *resp, int mx_resp_len, int noisy, unsigned int timeout)
+       void *resp, int mx_resp_len, unsigned int timeout)
 {
 	unsigned char inqCmdBlk[INQUIRY_CMDLEN] =
 		{ INQUIRY_CMD, 0, 0, 0, 0, 0 };
@@ -130,7 +130,7 @@ do_tur (int fd, unsigned int timeout)
 int libcheck_check(struct checker * c)
 {
 	char buff[MX_ALLOC_LEN];
-	int ret = do_inq(c->fd, 0, 1, 0x80, buff, MX_ALLOC_LEN, 0, c->timeout);
+	int ret = do_inq(c->fd, 0, 1, 0x80, buff, MX_ALLOC_LEN, c->timeout);
 
 	if (ret == PATH_WILD) {
 		c->msgid = CHECKER_MSGID_UNSUPPORTED;
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
