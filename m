Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AF7D52C3
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:33:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B19788306;
	Sat, 12 Oct 2019 21:33:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEE8B194B9;
	Sat, 12 Oct 2019 21:33:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BEC34EE70;
	Sat, 12 Oct 2019 21:33:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLU38G006481 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 83F395D721; Sat, 12 Oct 2019 21:30:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1D085D6A3;
	Sat, 12 Oct 2019 21:30:00 +0000 (UTC)
Received: from m9a0001g.houston.softwaregrp.com
	(m9a0001g.houston.softwaregrp.com [15.124.64.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 95E89C08EC04;
	Sat, 12 Oct 2019 21:29:59 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:29:15 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:29:35 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.13) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:29:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=mpEKtlfEJpOEI6WirIVPPdtVv9hvpSxFux61001MnfnKAW0+dJ8sKHlNDm5srHxjEg2BZVJbNYorUYRb5mTgrnSWRNEan4yzj7voF8qekR80gFIEpYJsz5WZjyfItTiNVyap7FWPghEzkXSgq3FrmtMlyhABiGockLGSgGYl+EQFs8TDhIGxyNJgyikcX5RBn0NDEL14+ktniulHedONJwTpCb1DNLvcNoicgBKEYG80qTQD4klCT9V9+7k7cuTjToxuawmpIxO4wlTwCtaJOgSlBHOzHVWlWSjAtFidku96Uma9kbWJgGiygqGz9S5jbysKEvoCdJZE58T+7kk4Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=8+lrrPMw3h5slPr/9bgxkj6aO7GnEanJRltLRmikoLQ=;
	b=Hv2IVPrUUeU4f9Zay7PXTpAsuCGqnn/6mA0iMeZEUfkLV/UUa7nnmQZhAVAGyTKFbXxWf3ZcVeqEO9t6imMrE4wAwkER/dtMJgSBMmSr1cLhD5cnuWtSjSA/q9ki9PCb6Zjc4oXNuu60kF7YzuH8NUDo+KDreqwsNu+6Cf/U172EBfpIjiAJgZpNefEI0kHcKXgHHi8GjkoDp9pR2zDawiOGcEEJec0zIQi/NPeCGlpVFAbtEjghAuRHbPGqy7AIN2w/KBovG/fh1ehd/WHzhvYRda2jEBh5hh6KhlHu2+MCnY/U6rYNwbf3FpXGZGQ6UeuelJYp8WvkCpqYLiuZvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:29:30 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:29:30 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 60/72] libmultipath: fix clang -Wformat-literal warnings
Thread-Index: AQHVgUQLfMf9B6H9RUOIk9bJDvFAQA==
Date: Sat, 12 Oct 2019 21:28:52 +0000
Message-ID: <20191012212703.12989-61-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 680f224b-9845-486d-0d7b-08d74f5b2d6f
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317C3ADD0C3F05FB3E3D5F8FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:233;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(6666004)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(14444005)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rh/+iQYM7uG+OyjZZcgzYwBZX5PVVRAVMNllc7+FlYD5afFn/owOkkzQQyPlPoz0HsNmsiJ1YXHcA2L43AEB6Ve0TsD7RzWB8uQ6lH8P6jMj0CAXG7dKbenYhpLnOb7bp8pe911rtpOsPlSkfmoin7VH2N5wQocxQtMntMdpV0OPR8Q9aQMvM3zRUSHlFH+eIvR2/zfL6kPtuRDlEl8FYnQmoneb3+DVcLUvPoa4UDsIgxUwMQfv7GDm0fjvDJpuGGXx4oErgmAkeq1Fr7nvsE6uL0bFHCA/YxryhcdCY55LtJl4YQqJUvCG+BeAIU5Mdxqv2SwSNdFI0cwQXBTUxr5dVJdAPrzc2LFNfT+OsdD261rkc4nbqBRt+zueZkMN2IlCo+6Z87VKullpFIuk+bOjdA3PYPT4yahNtcvWaro=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 680f224b-9845-486d-0d7b-08d74f5b2d6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:52.0824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0a4DX9ppHNw62fHILmkxnlMbpCIahisNiC6iRVc8sdvQLA5omIlGMT3FMWvlGGioJNKGhkCC7HBB9Q+n91O3Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Sat, 12 Oct 2019 21:30:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Sat, 12 Oct 2019 21:30:00 +0000 (UTC) for IP:'15.124.64.66'
	DOMAIN:'m9a0001g.houston.softwaregrp.com'
	HELO:'m9a0001g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.66
	m9a0001g.houston.softwaregrp.com 15.124.64.66
	m9a0001g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLU38G006481
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 60/72] libmultipath: fix clang -Wformat-literal
	warnings
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Sat, 12 Oct 2019 21:33:10 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/devmapper.c   | 2 +-
 libmultipath/log.h         | 3 ++-
 libmultipath/log_pthread.h | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index 4bff37d0..acf576aa 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -59,7 +59,7 @@ void dm_udev_set_sync_support(int c)
 
 #endif
 
-static void
+__attribute__((format(printf, 4, 5))) static void
 dm_write_log (int level, const char *file, int line, const char *f, ...)
 {
 	va_list ap;
diff --git a/libmultipath/log.h b/libmultipath/log.h
index 6551b5cf..d2448f6a 100644
--- a/libmultipath/log.h
+++ b/libmultipath/log.h
@@ -34,7 +34,8 @@ extern struct logarea* la;
 int log_init (char * progname, int size);
 void log_close (void);
 void log_reset (char * progname);
-int log_enqueue (int prio, const char * fmt, va_list ap);
+int log_enqueue (int prio, const char * fmt, va_list ap)
+	__attribute__((format(printf, 2, 0)));
 int log_dequeue (void *);
 void log_syslog (void *);
 void dump_logmsg (void *);
diff --git a/libmultipath/log_pthread.h b/libmultipath/log_pthread.h
index 7e138a00..810ac920 100644
--- a/libmultipath/log_pthread.h
+++ b/libmultipath/log_pthread.h
@@ -3,7 +3,8 @@
 
 #include <pthread.h>
 
-void log_safe(int prio, const char * fmt, va_list ap);
+void log_safe(int prio, const char * fmt, va_list ap)
+	__attribute__((format(printf, 2, 0)));
 void log_thread_start(pthread_attr_t *attr);
 void log_thread_reset (void);
 void log_thread_stop(void);
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
