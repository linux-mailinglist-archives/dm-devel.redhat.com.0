Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EF8D52A5
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:30:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0704859FC;
	Sat, 12 Oct 2019 21:30:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DD2B5D772;
	Sat, 12 Oct 2019 21:30:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0877F4E589;
	Sat, 12 Oct 2019 21:30:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSODF005982 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 39CF260BF4; Sat, 12 Oct 2019 21:28:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3086A60BF1;
	Sat, 12 Oct 2019 21:28:24 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0A0E31DB6;
	Sat, 12 Oct 2019 21:28:23 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:27:43 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:27:52 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:27:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=L7tU4fF1D8fR/6xNS5YwbetaavstC9Zz249O+7WBRlSpf68Cg+/zLNcqZywlwS82YjugbWXVRcmqDKIwz5QhwZH0gJZ9xIagx3SpSwLdu+85fMaVF59QZez17O3eUD/sAP0SNDo9XhIE0vfQfKIdfToGePy0PED1aaCRi0npqsUSgoJTH1Ul7Wb8MPj1qu9/AUTrUFoiZv2eaZZhpltgqML9ExCwcPwIcG1zB/G8l6JDTVYBHLHcPt9/zb8BP69vNfedov9Am/Lp/KSK2yfokA72UOEyTKHK/6vpi/2qULkpWH+JRmhmD2kj81ZYhOzo+xHADqXtbyM8oK8JEjZfOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=TKLVMg0m7IPPvrpYacrDA4DsJZ1iC3Xs76nF4ZfyFXA=;
	b=oSA2Mri2zLdmM9wtsO0t0DBNh3Fx/JZzY15UF4NNmIZQo8X9f4L8m2WjmD56t9VwmPbmYJyOBVlpv3yLTvzDCI4yqrQ4m1XGk7bTzf2Br29DpFwMadWO96y+kNbk2qpKt+E4wZ4uQhUeE5W4S2S83CZ0M/hjXEQMRzgm2S+e+rKxhgmHjfqJBcZNTzYfKzf5n0dv8ZaMuRZnt6O2zrZmmztM77eMt1wFrvVd2IEeKraXEAqNPqvmFGb6eyJKfy4A4KQwJrKuzS4qraW8VuDzQGJHDfPBNBmCrH0iftjMWSZLB+pxju8YFMpmoAFT1001listA7p+0Je+mefKnldndA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:27:49 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:27:49 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 10/72] libmultipath: allocate_binding(): detect line
	overflow
Thread-Index: AQHVgUPlujh3OPFUWUGuHS5xoFp89g==
Date: Sat, 12 Oct 2019 21:27:49 +0000
Message-ID: <20191012212703.12989-11-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 8de7a1b5-8f88-438f-8a23-08d74f5b0828
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB33172C28856CDBFC14331CF6FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:459;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(14444005)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(4744005)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mSmRG+2DhGeKwWC5/z09+6wPKGIsG0Altwe15bmyQaz5igN44Vu6cXl3hAzY5xAuSovP+AMhog2beWh+PiR5fF3iAuEnb1F4baxejuiGHrT9IPz5IZIGXLqqlEDiozRn2CzZ7dmWwUTULCLI4j/dx1FgvNsFZWxEFO7Dd9ofn9jeb6gwBhosxS3yW4jQtjpisZCncQQfW+LulP7O2Gcx1W0p6s0O19KRF9ivtAP5xe6rQ2y+t1UVs8VM4N5sJXB8V4NudrhraAbMJrIIke2QOEkPDHq7dOLywer2i2GLQvxl4xX/CdEJ7DmQ7Ryt4vmXDOFEVzU9UAhuJfP4hSZJFgXcynF1vipj9IJQsRqXHSdtSPh+0X2wJlt9eTeex2XMNhdTgaBGqVt/pP3ZMdXAWNbpDcb2k9/4m3RstpSYC/w=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de7a1b5-8f88-438f-8a23-08d74f5b0828
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:27:49.6245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yik9eRJvCQ9rgpprcyz+lbt30teXYSTrWf9meG+7qdR7G4GXrgGoKQLg9Fm7xM20ebTEuo9l53KYM0Jqxatuxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.71]); Sat, 12 Oct 2019 21:28:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Sat, 12 Oct 2019 21:28:23 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSODF005982
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 10/72] libmultipath: allocate_binding(): detect
	line overflow
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Sat, 12 Oct 2019 21:30:24 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Be sure not to truncate the WWID. This shouldn't happen under
normal circumstances, but play it safe.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/alias.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/libmultipath/alias.c b/libmultipath/alias.c
index 2df34f32..15bbc8ed 100644
--- a/libmultipath/alias.c
+++ b/libmultipath/alias.c
@@ -244,7 +244,10 @@ allocate_binding(int fd, const char *wwid, int id, const char *prefix)
 		return NULL;
 
 	c = buf + i;
-	snprintf(c, LINE_MAX - i, " %s\n", wwid);
+	if (snprintf(c, LINE_MAX - i, " %s\n", wwid) >= LINE_MAX - i) {
+		condlog(1, "%s: line too long for %s\n", __func__, wwid);
+		return NULL;
+	}
 	buf[LINE_MAX - 1] = '\0';
 
 	offset = lseek(fd, 0, SEEK_END);
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
