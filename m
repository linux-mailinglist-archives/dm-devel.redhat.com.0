Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4C8D52B4
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:32:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2E2007BDA7;
	Sat, 12 Oct 2019 21:32:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0957A5DA5B;
	Sat, 12 Oct 2019 21:32:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F1934EE50;
	Sat, 12 Oct 2019 21:32:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLTGaV006281 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:29:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CB3951001B2D; Sat, 12 Oct 2019 21:29:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8C431001B2C;
	Sat, 12 Oct 2019 21:29:14 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 97CDF356C9;
	Sat, 12 Oct 2019 21:29:13 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:28:20 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:14 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=kOEQmICTyptK7HMpiEIaIy/eg5K/YpPE5Ece4TDYnSAiUOKmVRI3gYiB2vbZn5QNghnQhgJsz2KJoiyePbbG1FI9hsUM9MOvOPVZyOprL7LuPFgtDWhMcT5g/gqfKZdSfyCnrhLmHF16zkFgBDzIysbiGx9gw0uI0+RkYrnRurDgvz5QrnAqDJfmb6aHdJnEukVsDFche49/66Ig53OHxxO9eBxnyKAyhG8EATzvkAmdefOMLepK+52mKXzkuPiuq1vbYTORNtkumLP3SYM51GS3AjtxiczRf7xQdF0Af19tHlVQkabQYcRHotqg9GfLVo60jcBVbz8eqH68p46Brw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=WyteTNMTrfRlGIOgItw8njzcIbx6Q1qHaMtF+vAHVf4=;
	b=U5ep7S+grALHFoWrq03tTjgVD4gtJLwr0TVAu03t8t7JPzLQWHxIdSi4BQs6gDUpDHfHutjlBwcQZxkO/qDOm3Y6nplp/Jl90MRC6uY88Z24wuq12XN3LDYOYkgUZd012Zs/d3k3fRWCwy2d/aXLMmQY0aaChvkt0KAw4YtX27RjjKvvzNtcQ+0LDahdWfYqcEUCcVqVge2yl2EhGFGfX7ue4kiEs6drLGi7gLKolO0/VaYvhOa6V3P1/96lEmTqMoMckSVMuzuTA5YwQlWU0y74VsVvEOumSduGiQNWdpVe2LHgd5txsPovbEyHJJOrsxr+l7zlPzW1DY2dZKU/Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:13 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:13 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 29/72] multipathd: stop_waiter_thread(): removed unused
	parameter
Thread-Index: AQHVgUP0QQcCUZpKQUeLVTYd6T5pug==
Date: Sat, 12 Oct 2019 21:28:13 +0000
Message-ID: <20191012212703.12989-30-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 1d4fcacf-9da6-4ef3-74d9-08d74f5b1672
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317A2267B5FF81031B20A37FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:326;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(1496009)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e7CPZpJnp5QBTMjOSjGSWpHuVf/7n0RWNloQJBQGy/XepE3yBIGZ/AKQHXnJuh+6eSzY931bc8PGARVxWvf2pk+3O3Z4/izzEmJk9NuubIZGMrQx8MPUvCodPd6uLNl9wpSPktT7UvfzPocY42SWR+zO0MJVfSrNWIxFOSonMBKqL2XJG2pN4FLpBuMWX1Cb8cTFG+dHIWrBpEmvh3DY/4Hvew1hAf8mFJhHZtn4wMULOiBUNa5rmsu72SuUXTmRYWn7HTWxkfQkSzuvLDbNaFP0GRZ77+zy6ec6aU/+Ay0pbPlngESWH7YN7AKhzlMEBjkJK48TXiVTf5pR1W6qtdrqKOld4NEyQE4Mhb2dYuDGnylZaMv51W4HG/RRWgWt8zSkDTqCJPqkYfJFrz24CLYP+UCA7mAWYj2k19BdweM=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4fcacf-9da6-4ef3-74d9-08d74f5b1672
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:13.5151 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4L5lCwTWwplPpZEph41IGWiVlnN4bQSxt9Hqb6GILZhPPG4eaeWEenBCUFDdmY0+uPMXyac9NaHlWKfu1XTHzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.30]); Sat, 12 Oct 2019 21:29:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Sat, 12 Oct 2019 21:29:14 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLTGaV006281
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 29/72] multipathd: stop_waiter_thread(): removed
 unused parameter
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Sat, 12 Oct 2019 21:32:08 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c   | 4 ++--
 multipathd/waiter.c | 2 +-
 multipathd/waiter.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index ef128a32..43ae42d4 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -377,7 +377,7 @@ remove_map_and_stop_waiter(struct multipath *mpp, struct vectors *vecs)
 	 * so they don't need to be manually removed here */
 	condlog(3, "%s: removing map from internal tables", mpp->alias);
 	if (!poll_dmevents)
-		stop_waiter_thread(mpp, vecs);
+		stop_waiter_thread(mpp);
 	remove_map(mpp, vecs, PURGE_VEC);
 }
 
@@ -392,7 +392,7 @@ remove_maps_and_stop_waiters(struct vectors *vecs)
 
 	if (!poll_dmevents) {
 		vector_foreach_slot(vecs->mpvec, mpp, i)
-			stop_waiter_thread(mpp, vecs);
+			stop_waiter_thread(mpp);
 	}
 	else
 		unwatch_all_dmevents();
diff --git a/multipathd/waiter.c b/multipathd/waiter.c
index eb8d6996..e6457663 100644
--- a/multipathd/waiter.c
+++ b/multipathd/waiter.c
@@ -49,7 +49,7 @@ static void free_waiter (void *data)
 	FREE(wp);
 }
 
-void stop_waiter_thread (struct multipath *mpp, struct vectors *vecs)
+void stop_waiter_thread (struct multipath *mpp)
 {
 	pthread_t thread;
 
diff --git a/multipathd/waiter.h b/multipathd/waiter.h
index 0cfae46f..28e0f6d5 100644
--- a/multipathd/waiter.h
+++ b/multipathd/waiter.h
@@ -11,7 +11,7 @@ struct event_thread {
 	struct vectors *vecs;
 };
 
-void stop_waiter_thread (struct multipath *mpp, struct vectors *vecs);
+void stop_waiter_thread (struct multipath *mpp);
 int start_waiter_thread (struct multipath *mpp, struct vectors *vecs);
 
 #endif /* _WAITER_H */
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
