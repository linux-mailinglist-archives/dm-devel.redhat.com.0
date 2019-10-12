Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B61D52A4
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:30:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB74B1056F90;
	Sat, 12 Oct 2019 21:30:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EC606031D;
	Sat, 12 Oct 2019 21:30:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CE291803517;
	Sat, 12 Oct 2019 21:30:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSYMG006102 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D083F60470; Sat, 12 Oct 2019 21:28:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85C36601B3;
	Sat, 12 Oct 2019 21:28:32 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B4A188306;
	Sat, 12 Oct 2019 21:28:31 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:27:52 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:27:54 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:27:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=GHb4rpnS4DRV25VDyd6f3aCJ4yD/6hjfwHxQku7+AglBS219fesersRZKaQAUgdjUXef7aMa0332gw7R8S5V/yinL5/VecGmoUDWWhG1dPe5ThOHInYKfRZ2ZOxZV12iWnbDHTjbCJY9clxJto3MdvV7FLtU7RW/0YSud1G0IWTeoisdZOD/YC+wDOV7ZBx+cbsGhOTyrG3eQ9HQfyS8irMjgKpmJBJj6Gdq4Hs+H10BZrZmmtukePbkDf4utCcfILijSUl1/QjJHNAE7dekz0RdSx7bKHynO4MYUwelXeul24AkvAFKWdPjD4RwvKG3pTDgXwNpLX2dJI+Y8gIrHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Aw1rtJeSs+iSGBS8VshGUQMRNLkQYNO0QNBEk3o38sU=;
	b=VAgiVaEBgjLT8SHeGbP/ckAtqchh+DpN0v/4GjK7STl+ihFay7uxz/tasu9JzqZ6X/rOAiWZwI+C1zwiYUhEE05dYQiXESDEWp8wjvHA4hGLzV4gUsjI5j0R0K7hgRT95rW8ZGhFAQPcGi3A7Nd4i4qe8oN/zsUAzN46UO7Z/tgQQhOps9yecRw/ho8Rnv4tID0BAD3SZJVSg4q8COlYnlBvefWuHpqeOnd2ROyrj3Swrw3gGscrQZedmXquVPXJnk4hSdJwmMFXTJV1BISQY0wVg2F7WoV/DzfSMRBtmnNOGYxWb0uy/o0hTSUTvCQ0XO7zVCXaUJj1uwRJ7cUT9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:27:43 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:27:43 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 05/72] libmultipath: format_devname: avoid buffer overflow
Thread-Index: AQHVgUPhXN0oLbktKUK1abPpUwjsog==
Date: Sat, 12 Oct 2019 21:27:43 +0000
Message-ID: <20191012212703.12989-6-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: a81b6427-06e7-45f6-4e27-08d74f5b0457
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB33178E0FCCE0773A45348BD5FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uu6TjCqngdmeN/VkOaF4dt2VOdRqNz1jkbQ6kuSd1Olo7E2lS/JQAug3vaMmOTVeMIoh//8IPqEXsQ4zBpRJMcQ9CczKgZvOf3HyLyFoM/T9YoqO5LwTdvSi5ji4cO8W+GPlN1+Anj9BP51kIp0/nkunSO6ikQal0iY0RqmFrE/GMooDd2GeZdsbRhaK+GLZQFNdFb0LnQvrANC91rt+rTx2hBEU50kDgD9EO/eBjwfJ0yochvjKECHyHuhTTz5IGWWVvtBugq6OcXJCvlQE8pFbOOoQJwWiCwRVSbrHRILtCfpAChCgwoWeEl+Q2vnKpwr3KmU0mhNqDUY4U8bDrPaER45ARlbwKYoWTxDRt4kTQuYSKQ19D+1PYMxSSm75lo4+6vOh5W9VlrE4OTKJ3NnzB/5e7zHSYeovG9yFFKo=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a81b6427-06e7-45f6-4e27-08d74f5b0457
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:27:43.1412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a0UP3b6FAtVQj0O6MJe87XHVYv+Pywc8g4YN6+3pQ6X3XpcUPtpuKKMWsHAmreuTTRZkqFgp1pS7bpodpDMzbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Sat, 12 Oct 2019 21:28:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Sat, 12 Oct 2019 21:28:32 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSYMG006102
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 05/72] libmultipath: format_devname: avoid buffer
	overflow
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Sat, 12 Oct 2019 21:30:24 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

If the buffer was too short, the current code could write
the terminating 0 byte after the actual buffer.

Also, assert sufficient buffer length, and positive id.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/alias.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/libmultipath/alias.c b/libmultipath/alias.c
index 412ab5b4..0fb206d1 100644
--- a/libmultipath/alias.c
+++ b/libmultipath/alias.c
@@ -52,18 +52,24 @@ format_devname(char *name, int id, int len, const char *prefix)
 	int pos;
 	int prefix_len = strlen(prefix);
 
-	memset(name,0, len);
+	if (len <= prefix_len + 1 || id <= 0)
+		return -1;
+
+	memset(name, 0, len);
 	strcpy(name, prefix);
-	for (pos = len - 1; pos >= prefix_len; pos--) {
+	name[len - 1] = '\0';
+	for (pos = len - 2; pos >= prefix_len; pos--) {
 		id--;
 		name[pos] = 'a' + id % 26;
 		if (id < 26)
 			break;
 		id /= 26;
 	}
+	if (pos < prefix_len)
+		return -1;
+
 	memmove(name + prefix_len, name + pos, len - pos);
-	name[prefix_len + len - pos] = '\0';
-	return (prefix_len + len - pos);
+	return (prefix_len + len - pos - 1);
 }
 
 static int
@@ -213,6 +219,9 @@ allocate_binding(int fd, const char *wwid, int id, const char *prefix)
 	}
 
 	i = format_devname(buf, id, LINE_MAX, prefix);
+	if (i == -1)
+		return NULL;
+
 	c = buf + i;
 	snprintf(c, LINE_MAX - i, " %s\n", wwid);
 	buf[LINE_MAX - 1] = '\0';
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
