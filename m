Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 69085D52ED
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:47:34 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D3C7302C081;
	Sat, 12 Oct 2019 21:47:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07F8A5D71C;
	Sat, 12 Oct 2019 21:47:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 83CE51803517;
	Sat, 12 Oct 2019 21:47:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLWM3R007238 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:32:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD6986017E; Sat, 12 Oct 2019 21:32:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8469C6031D;
	Sat, 12 Oct 2019 21:32:20 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2FB687BDAB;
	Sat, 12 Oct 2019 21:32:19 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:31:25 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:57 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=O+xT5YXXXSpOwOu/tM357SMwa9Sr2OWFoscGSd+m/yPpGyJJVpR1SRvuT6W3tR9wAhirIARk/MwetgdSdwpYIDzRon4tAe4m3/T9EJVuQU2zc7kXdLTUHYN/4jl+fyHJQus5N46CKnwzPVtGSeI5R/jW3FwR0FRBApmOWKVM2kCElcP37K6wQ5otU7mCjea2vXJu/egeDBmfNabk+r21lK+InYuW69KDLZOMe9TZzRO99980PiOhK9U4oq1h06z8L3/YzcJI56mY7NgFUWHFBPlZjW3/EqBrA/+/K0U7MiibyawNkbANGgJZ4X+d50cPdvZvjN01OXokuSOrDsV1Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=OkBN9pa8UJl2Lm2PYO1zcJoNPQSDlqHSmfhqA5odV1k=;
	b=ZkNFVxabZW+F2VTF9Y6jE5fUhfC0H2pLOdbmQjARMSXxDDv85x9Ldweyl/VhBy8V8QbXq1qwDa3ssg9ItRi/ByFQCR7EJNKLgHwErQIww6Q6CvnrDSIrTbCirvdkuH4KkMLbEfhKi9ym2KyeUn9QSbsBITuSDoxUG7ji5jLMxmPIuRBAZXj9lObjMe1qtjdQB30hfld9/SXigP993iHckzjov7fsxkzjl4W5wU7e8ZmzHYZz8GM6sZdnaAX7j0AvG6lt8PGykPw0l1bk2ELpVtqcWaBFCUneZNXGFQBOWRxezh9x7PULSdBoSr92bULCV2/nxnrwUipq5px7FH6xdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:53 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:53 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 45/72] libmultipath: fix -Wsign-compare warnings with
	snprintf()
Thread-Index: AQHVgUP/vRjgspJFLEGusG/rLD5KFg==
Date: Sat, 12 Oct 2019 21:28:33 +0000
Message-ID: <20191012212703.12989-46-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: b0ae2eb8-58b8-45a9-e863-08d74f5b2250
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331754093E89D3281E536C55FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:76;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(6666004)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3UxGt/aPyva+Vjt85amskRcV+0Z/4mSAb/+kOshEmEdLwPjESHg1Q+F4JsNMEFO2x4s7c9RuRN2VQFQlKpUZd2jcL3Din7qdx2EojARSVwlZTUaovEyJtru6CT+C+hOdgwaN60f1WjaeaypPIvfAACOmLFwvo5WVanIZuf4tTsFZK+NXACcInp6fLewbWdCRHaN44QgqgZCiMlAxvz334RVMFFyf7YErF4wAeIU2DotzZw9JTaVv5idFdS5X3Ltd65KlcnwXfZ9mVV/BqwAnH8q7xXMceJSxyiB7uO0APOgW7T0JouFSygrf3QN/8bR6BgFU0M7f7sz0lNy91H4Md/KY7mdhRYcuqp8y94/Dt/cAq6qu1/mzk51lzNKAey5+Wy6mDIdwaVRqG0wFdDYMC/sjX9Y/VKwpFv+I3tvsm4o=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ae2eb8-58b8-45a9-e863-08d74f5b2250
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:33.4299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mSdv9AqqpuH+oHPksL5aEyPut+oWFYKtMmdJcmvNdHT2UyBObpIiD+neyBsnsxbZznQO3VkrPc7CR0+Hvn2GJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.26]); Sat, 12 Oct 2019 21:32:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Sat, 12 Oct 2019 21:32:19 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLWM3R007238
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 45/72] libmultipath: fix -Wsign-compare warnings
 with snprintf()
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Sat, 12 Oct 2019 21:47:32 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

snprintf() returns int, and thus its result needs to be compared
with a signed int. In theory, snprintf can return -1 with errno
EOVERFLOW if the "size" argument exceeds INT_MAX, but this can
be quite safely ignored for now.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 kpartx/devmapper.c          | 3 ++-
 kpartx/kpartx.h             | 2 +-
 libmultipath/foreign/nvme.c | 4 ++--
 libmultipath/sysfs.c        | 4 ++--
 libmultipath/util.c         | 3 ++-
 libmultipath/util.h         | 4 ++--
 libmultipath/wwids.c        | 2 +-
 multipath/main.c            | 2 +-
 8 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/kpartx/devmapper.c b/kpartx/devmapper.c
index 3aa4988d..7e599e07 100644
--- a/kpartx/devmapper.c
+++ b/kpartx/devmapper.c
@@ -107,7 +107,8 @@ strip_slash (char * device)
 static int format_partname(char *buf, size_t bufsiz,
 			   const char *mapname, const char *delim, int part)
 {
-	if (snprintf(buf, bufsiz, "%s%s%d", mapname, delim, part) >= bufsiz)
+	if (snprintf(buf, bufsiz, "%s%s%d", mapname, delim, part)
+	    >= (int)bufsiz)
 		return 0;
 	strip_slash(buf);
 	return 1;
diff --git a/kpartx/kpartx.h b/kpartx/kpartx.h
index 52920e43..3ec13dbc 100644
--- a/kpartx/kpartx.h
+++ b/kpartx/kpartx.h
@@ -17,7 +17,7 @@
 #define unlikely(x)     __builtin_expect(!!(x), 0)
 
 #define safe_sprintf(var, format, args...)	\
-	snprintf(var, sizeof(var), format, ##args) >= sizeof(var)
+	snprintf(var, sizeof(var), format, ##args) >= (int)sizeof(var)
 
 #ifndef BLKSSZGET
 #define BLKSSZGET  _IO(0x12,104)	/* get block device sector size */
diff --git a/libmultipath/foreign/nvme.c b/libmultipath/foreign/nvme.c
index e8ca516c..17569b36 100644
--- a/libmultipath/foreign/nvme.c
+++ b/libmultipath/foreign/nvme.c
@@ -592,7 +592,7 @@ static void test_ana_support(struct nvme_map *map, struct udev_device *ctl)
 
 	dev_t = udev_device_get_sysattr_value(ctl, "dev");
 	if (snprintf(sys_path, sizeof(sys_path), "/dev/char/%s", dev_t)
-	    >= sizeof(sys_path))
+	    >= (int)sizeof(sys_path))
 		return;
 
 	fd = open(sys_path, O_RDONLY);
@@ -664,7 +664,7 @@ static void _find_controllers(struct context *ctx, struct nvme_map *map)
 		struct udev_device *ctrl, *udev;
 
 		if (snprintf(pathbuf + n, sizeof(pathbuf) - n, "/%s", fn)
-		    >= sizeof(pathbuf) - n)
+		    >= (int)(sizeof(pathbuf) - n))
 			continue;
 		if (realpath(pathbuf, realbuf) == NULL) {
 			condlog(3, "%s: %s: realpath: %s", __func__, THIS,
diff --git a/libmultipath/sysfs.c b/libmultipath/sysfs.c
index 923b529b..eb1f03e1 100644
--- a/libmultipath/sysfs.c
+++ b/libmultipath/sysfs.c
@@ -306,7 +306,7 @@ bool sysfs_is_multipathed(const struct path *pp)
 	n = snprintf(pathbuf, sizeof(pathbuf), "/sys/block/%s/holders",
 		     pp->dev);
 
-	if (n >= sizeof(pathbuf)) {
+	if (n >= (int)sizeof(pathbuf)) {
 		condlog(1, "%s: pathname overflow", __func__);
 		return false;
 	}
@@ -329,7 +329,7 @@ bool sysfs_is_multipathed(const struct path *pp)
 
 		if (snprintf(pathbuf + n, sizeof(pathbuf) - n,
 			     "/%s/dm/uuid", di[i]->d_name)
-		    >= sizeof(pathbuf) - n)
+		    >= (int)(sizeof(pathbuf) - n))
 			continue;
 
 		fd = open(pathbuf, O_RDONLY);
diff --git a/libmultipath/util.c b/libmultipath/util.c
index ccc0de29..4657e7db 100644
--- a/libmultipath/util.c
+++ b/libmultipath/util.c
@@ -213,7 +213,8 @@ int devt2devname(char *devname, int devname_len, char *devt)
 
 		if ((major == tmpmaj) && (minor == tmpmin)) {
 			if (snprintf(block_path, sizeof(block_path),
-				     "/sys/block/%s", dev) >= sizeof(block_path)) {
+				     "/sys/block/%s", dev)
+			    >= (int)sizeof(block_path)) {
 				condlog(0, "device name %s is too long", dev);
 				fclose(fd);
 				return 1;
diff --git a/libmultipath/util.h b/libmultipath/util.h
index 913ab7c2..cfc3b7a9 100644
--- a/libmultipath/util.h
+++ b/libmultipath/util.h
@@ -29,9 +29,9 @@ void set_max_fds(rlim_t max_fds);
 #define ARRAY_SIZE(x) (sizeof(x)/sizeof((x)[0]))
 
 #define safe_sprintf(var, format, args...)	\
-	snprintf(var, sizeof(var), format, ##args) >= sizeof(var)
+	snprintf((var), sizeof(var), (format), ##args) >= (int)sizeof(var)
 #define safe_snprintf(var, size, format, args...)      \
-	snprintf(var, size, format, ##args) >= size
+	snprintf(var, size, format, ##args) >= (int)size
 
 #define pthread_cleanup_push_cast(f, arg)		\
 	pthread_cleanup_push(((void (*)(void *))&f), (arg))
diff --git a/libmultipath/wwids.c b/libmultipath/wwids.c
index 291db8f5..57c2707b 100644
--- a/libmultipath/wwids.c
+++ b/libmultipath/wwids.c
@@ -394,7 +394,7 @@ static int _failed_wwid_op(const char *wwid, bool rw,
 	int r = -1;
 
 	if (snprintf(path, sizeof(path), "%s/%s", shm_dir, wwid)
-	    >= sizeof(path)) {
+	    >= (int)sizeof(path)) {
 		condlog(1, "%s: path name overflow", __func__);
 		return -1;
 	}
diff --git a/multipath/main.c b/multipath/main.c
index c2ef8c7b..8d518585 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -424,7 +424,7 @@ static int find_multipaths_check_timeout(const struct path *pp, long tmo,
 	clock_gettime(CLOCK_REALTIME, &now);
 
 	if (snprintf(path, sizeof(path), "%s/%s", shm_find_mp_dir, pp->dev_t)
-	    >= sizeof(path)) {
+	    >= (int)sizeof(path)) {
 		condlog(1, "%s: path name overflow", __func__);
 		return FIND_MULTIPATHS_ERROR;
 	}
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
