Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7F1D52B2
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:31:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 36FE4A3CD72;
	Sat, 12 Oct 2019 21:31:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACA575D784;
	Sat, 12 Oct 2019 21:31:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 46D714E589;
	Sat, 12 Oct 2019 21:31:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSiPK006173 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5FE6A6092F; Sat, 12 Oct 2019 21:28:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24F78608A5;
	Sat, 12 Oct 2019 21:28:42 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 591D430BBE82;
	Sat, 12 Oct 2019 21:28:39 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:28:00 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:06 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=bRTC1ILE58qcWTCbmbN/H4qWS+PMpF6EEgqY8lJUaDzpjoxN7Id+rG/6kVaAK5NNrPW0eB82U5vHXLXwSmZb+OrK5n5X0faY4JOpw0W/okXF1K9F6gG4xP5PxsS9n4w4fFXGyAqbCj1I/s7ZmGLD7GFd5Bb8YK2thuR9oFuVqMhJDlhAvTVpyURB7K29p3r4tT1ikF+ejaxm4+0dXOJnMQqkQy+BrJwjNODMVCxUxy0DlTY0LV2wy+wy9NsZLKbjZfZERlKc0wHBY+uPJOEbMKsDKRZN+O58H8i4y2FKZzKDo8OTw3+99GuuDULN7TLtgqlrhgpnxLKZx6peCL2ULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=sfK/oHABZ6CG+GkXgadEVaoWjYXtXLZr4WL91GgcgCQ=;
	b=bzZEV+Kg7RkrEDAso34+Jc0fnG3U44OIItkBKVgXQmSrRg8jsc+vdSHdm6fantYyYdeyIQzrA74YOwsHfMid2aGAwpfjzukByS+XSlpo3hqoC53UhE1KbUJzAmOYWGvleihtJn1/6X22gGQLKuAiGvThlj2g85aHc3UdVxlDYx/Hhp7jbY3gA7dAbPA9aD4G3Y/NlXdPYb5v31/Ttw9BoMpfnd8quxK/7UTEqhpXbr9RZnmrAKZ2u979bU5fOmaCcg+Ej9mQC7YME9hpKmVu5BF/d/uKezHoTmd+tCytqu2DN41AP0w6Bt+iX4VduMf8LIlsj2ZlQuMkfO1By4Mj4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:04 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:04 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 22/72] libmultipath: mark unused arguments in partmap
	functions
Thread-Index: AQHVgUPuHwVUnVeWtUKudHgLXBz+bA==
Date: Sat, 12 Oct 2019 21:28:04 +0000
Message-ID: <20191012212703.12989-23-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 18e3ba36-e954-4b12-0860-08d74f5b112e
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB33171B6D87B6F05AFF902A82FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(1496009)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(14444005)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(4744005)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4ArHyLiXy1LM3ZPCc/9Q5lDMyDz6ogG2BPxJuXGThc3sUS4UVWiOp9dpOJPw5Usq/Pjw0FQgWKV0XljCrjqazQC3qDQMqhAzFDvQoLwNo1xoDg7+LP13vPpY3ohKOgZvDdkC6mKwzuyAvED2AhftklZapjZJWigiT2wUU2NM46HvP3JQr9YfObF3rTBsLZHQS1PuknDnqPr0D+OEBEGXGT6zoPaQcTqSzDk7ZNEOhyFmDjyuBogYQTJuebnSKQaN3fGMLki8pyb+OaykTPdbpTAvXXegGzelrSSgUb+k3PfnjkJJu3b5V4UVZ0BnJbNZ8u6tCUi2AY1CP0rb487fl6rxlgTI6FdbJX31AM9EGCkZ99JnQC2qCmrLCkRAZWzCOlII0MxQhseh3XrxuCRYHitJ61OopWmr9UVYqwOdb20=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e3ba36-e954-4b12-0860-08d74f5b112e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:04.7880 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V3lM38YmbUqBleZbsSl0AVvbFynGQerZAWFIEIT8Qm/L1+27M94j8VQMUTaziE/8GUBF7wKhk2jgZVh7Y4tdbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Sat, 12 Oct 2019 21:28:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Sat, 12 Oct 2019 21:28:40 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSiPK006173
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 22/72] libmultipath: mark unused arguments in
 partmap functions
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Sat, 12 Oct 2019 21:31:47 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/devmapper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index 0f0c3a34..f478ac2d 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -812,7 +812,8 @@ dm_get_major_minor(const char *name, int *major, int *minor)
 }
 
 static int
-has_partmap(const char *name, void *data)
+has_partmap(const char *name __attribute__((unused)),
+	    void *data __attribute__((unused)))
 {
 	return 1;
 }
@@ -1308,7 +1309,7 @@ dm_remove_partmaps (const char * mapname, int need_sync, int deferred_remove)
 #ifdef LIBDM_API_DEFERRED
 
 static int
-cancel_remove_partmap (const char *name, void *unused)
+cancel_remove_partmap (const char *name, void *unused __attribute__((unused)))
 {
 	if (dm_get_opencount(name))
 		dm_cancel_remove_partmaps(name);
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
