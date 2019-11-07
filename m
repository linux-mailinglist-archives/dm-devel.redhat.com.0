Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 77367F2AAC
	for <lists+dm-devel@lfdr.de>; Thu,  7 Nov 2019 10:30:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573119031;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mNqenyllHv0Lps2TNUkGxZGtijdD68eSqHtSf0Ulxfg=;
	b=cxwrzr6Xcfd4PsgT55O+GAogYjxJq4ei5VlRpRXrsFlLiQQxkTR06/OeupViUpcVnrUlJ1
	2ChrNzlteEYNT/vDdQOctMRLBrhdfOiA26qTjpxwSAnb6/c2Y3T9eSnPs9Za8OWybVEgLI
	L5i1GhugYSbkSfolNjHo7pC2yMrclQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-GmHVERG0O0-9K2EQ0J9Ppg-1; Thu, 07 Nov 2019 04:30:28 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08FC6477;
	Thu,  7 Nov 2019 09:30:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DD7B271A8;
	Thu,  7 Nov 2019 09:30:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7661918089CD;
	Thu,  7 Nov 2019 09:29:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA79ThFX013340 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 Nov 2019 04:29:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0F8F65D727; Thu,  7 Nov 2019 09:29:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CF965D6B7;
	Thu,  7 Nov 2019 09:29:38 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 691914E832;
	Thu,  7 Nov 2019 09:29:36 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Thu,  7 Nov 2019 09:28:57 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Thu, 7 Nov 2019 09:27:43 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.13) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Thu, 7 Nov 2019 09:27:43 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (10.175.223.16) by
	DM5PR18MB1243.namprd18.prod.outlook.com (10.173.210.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Thu, 7 Nov 2019 09:27:42 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1db:c70a:b831:8150]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1db:c70a:b831:8150%5]) with mapi id 15.20.2408.024;
	Thu, 7 Nov 2019 09:27:42 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Bart Van Assche
	<Bart.VanAssche@sandisk.com>, Benjamin Marzinski <bmarzins@redhat.com>
Thread-Topic: [PATCH v3 45/72] libmultipath: fix -Wsign-compare warnings with
	snprintf()
Thread-Index: AQHVlU2aPTrxln0DUkqB7/Bc7kz2Gg==
Date: Thu, 7 Nov 2019 09:27:41 +0000
Message-ID: <20191107092651.10975-2-martin.wilck@suse.com>
References: <20191107092651.10975-1-martin.wilck@suse.com>
In-Reply-To: <20191107092651.10975-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0027.eurprd01.prod.exchangelabs.com
	(2603:10a6:208:69::40) To DM5PR18MB1355.namprd18.prod.outlook.com
	(2603:10b6:3:14a::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2.206.153.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69949a78-89bd-4173-79c7-08d76364bc27
x-ms-traffictypediagnostic: DM5PR18MB1243:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR18MB1243A3B8C6CAF48897CDA2D4FC780@DM5PR18MB1243.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:773;
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(199004)(189003)(8676002)(66556008)(81156014)(486006)(11346002)(44832011)(81166006)(2616005)(6506007)(386003)(8936002)(76176011)(478600001)(476003)(446003)(64756008)(186003)(66946007)(66476007)(71190400001)(6486002)(6512007)(6436002)(66446008)(52116002)(102836004)(1691005)(36756003)(25786009)(7736002)(305945005)(14454004)(4326008)(256004)(110136005)(1076003)(2906002)(86362001)(5660300002)(71200400001)(316002)(50226002)(26005)(99286004)(6116002)(3846002)(66066001)(54906003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1243;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AEijQl26OCdKKQk8jUH/DrC6ZrjyKJGEUbN0IRRTALwVOTYQ8VoiMZvhfvv8MmevJCn5NK9VeZlMTosZUGMFzk4HvzoJmOr0n2r+00KvTFwuFzaquCaUK5Z+ChCThblLDITrYtCSJW9nf9/N4Kq+olC8ibAwMJh8OfDTXv/JYIvXZCEKuiMTPQKVlYhxs63kkhUagjGey9MEH9fCcIGOD8vHuIdLpflQy7yT6uF5LJPZj9a6uFV/uixr7zPC1qHKBZnf4Fk4WEjTorDFYcljxGIMGd5FRjNrzMqmGG/3xDaXdibIpbz8+f9pSSL9cZmTNppwGr1O66i0/uEmCPNTP2qXf3WgOSrpIKQ0obVPvuMnMWInXD/Ehb8YqI+FIbTr4rm+hwJjqWjqwSFD8VgaazkLftJ6qaKP/w4me21hP4J4j1tmezI2x0WrY9MgVjk/
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 69949a78-89bd-4173-79c7-08d76364bc27
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2019 09:27:41.4891 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /r3G95bo8t0cQ39ftWcHe5w1QXDXZRh8KcQJHScFVzEiI0dDz/dIhTqQEGZPHNFL0DQy9Q2kNlHubq55iDsY9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1243
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Thu, 07 Nov 2019 09:29:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Thu, 07 Nov 2019 09:29:37 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xA79ThFX013340
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 45/72] libmultipath: fix -Wsign-compare
 warnings with snprintf()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: GmHVERG0O0-9K2EQ0J9Ppg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From: Martin Wilck <mwilck@suse.com>

snprintf() returns int, but the size argument "n" is size_t.
Use safe_snprintf() to avoid -Wsign-compare warnings. At the same
time, improve these macros to check for errors in snprintf(), too.

Note: there are more uses of snprintf() in our code that may
need review, too. For now, I'm fixing only those that were causing
warnings.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 kpartx/devmapper.c          |  3 ++-
 kpartx/kpartx.h             | 11 ++++++++++-
 libmultipath/foreign/nvme.c |  6 ++----
 libmultipath/sysfs.c        |  7 +++----
 libmultipath/util.c         |  3 +--
 libmultipath/util.h         | 11 +++++++++--
 libmultipath/wwids.c        |  3 +--
 multipath/main.c            |  3 +--
 8 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/kpartx/devmapper.c b/kpartx/devmapper.c
index 3aa4988d..b100b5ef 100644
--- a/kpartx/devmapper.c
+++ b/kpartx/devmapper.c
@@ -10,6 +10,7 @@
 #include <errno.h>
 #include <sys/sysmacros.h>
 #include "devmapper.h"
+#include "kpartx.h"
=20
 #define _UUID_PREFIX "part"
 #define UUID_PREFIX _UUID_PREFIX "%d-"
@@ -107,7 +108,7 @@ strip_slash (char * device)
 static int format_partname(char *buf, size_t bufsiz,
 =09=09=09   const char *mapname, const char *delim, int part)
 {
-=09if (snprintf(buf, bufsiz, "%s%s%d", mapname, delim, part) >=3D bufsiz)
+=09if (safe_snprintf(buf, bufsiz, "%s%s%d", mapname, delim, part))
 =09=09return 0;
 =09strip_slash(buf);
 =09return 1;
diff --git a/kpartx/kpartx.h b/kpartx/kpartx.h
index 52920e43..8a2db046 100644
--- a/kpartx/kpartx.h
+++ b/kpartx/kpartx.h
@@ -16,8 +16,17 @@
 #define likely(x)       __builtin_expect(!!(x), 1)
 #define unlikely(x)     __builtin_expect(!!(x), 0)
=20
+#define safe_snprintf(var, size, format, args...)=09=09=09\
+=09({=09=09=09=09=09=09=09=09\
+=09=09size_t __size =3D size;=09=09=09=09=09\
+=09=09int __ret;=09=09=09=09=09=09\
+=09=09=09=09=09=09=09=09=09\
+=09=09__ret =3D snprintf(var, __size, format, ##args);=09=09\
+=09=09__ret < 0 || (size_t)__ret >=3D __size;=09=09=09\
+=09})
+
 #define safe_sprintf(var, format, args...)=09\
-=09snprintf(var, sizeof(var), format, ##args) >=3D sizeof(var)
+=09=09safe_snprintf(var, sizeof(var), format, ##args)
=20
 #ifndef BLKSSZGET
 #define BLKSSZGET  _IO(0x12,104)=09/* get block device sector size */
diff --git a/libmultipath/foreign/nvme.c b/libmultipath/foreign/nvme.c
index e8ca516c..09cdddf0 100644
--- a/libmultipath/foreign/nvme.c
+++ b/libmultipath/foreign/nvme.c
@@ -591,8 +591,7 @@ static void test_ana_support(struct nvme_map *map, stru=
ct udev_device *ctl)
 =09=09return;
=20
 =09dev_t =3D udev_device_get_sysattr_value(ctl, "dev");
-=09if (snprintf(sys_path, sizeof(sys_path), "/dev/char/%s", dev_t)
-=09    >=3D sizeof(sys_path))
+=09if (safe_sprintf(sys_path, "/dev/char/%s", dev_t))
 =09=09return;
=20
 =09fd =3D open(sys_path, O_RDONLY);
@@ -663,8 +662,7 @@ static void _find_controllers(struct context *ctx, stru=
ct nvme_map *map)
 =09=09char *fn =3D di[i]->d_name;
 =09=09struct udev_device *ctrl, *udev;
=20
-=09=09if (snprintf(pathbuf + n, sizeof(pathbuf) - n, "/%s", fn)
-=09=09    >=3D sizeof(pathbuf) - n)
+=09=09if (safe_snprintf(pathbuf + n, sizeof(pathbuf) - n, "/%s", fn))
 =09=09=09continue;
 =09=09if (realpath(pathbuf, realbuf) =3D=3D NULL) {
 =09=09=09condlog(3, "%s: %s: realpath: %s", __func__, THIS,
diff --git a/libmultipath/sysfs.c b/libmultipath/sysfs.c
index 923b529b..62ec2ed7 100644
--- a/libmultipath/sysfs.c
+++ b/libmultipath/sysfs.c
@@ -306,7 +306,7 @@ bool sysfs_is_multipathed(const struct path *pp)
 =09n =3D snprintf(pathbuf, sizeof(pathbuf), "/sys/block/%s/holders",
 =09=09     pp->dev);
=20
-=09if (n >=3D sizeof(pathbuf)) {
+=09if (n < 0 || (size_t)n >=3D sizeof(pathbuf)) {
 =09=09condlog(1, "%s: pathname overflow", __func__);
 =09=09return false;
 =09}
@@ -327,9 +327,8 @@ bool sysfs_is_multipathed(const struct path *pp)
 =09=09int nr;
 =09=09char uuid[6];
=20
-=09=09if (snprintf(pathbuf + n, sizeof(pathbuf) - n,
-=09=09=09     "/%s/dm/uuid", di[i]->d_name)
-=09=09    >=3D sizeof(pathbuf) - n)
+=09=09if (safe_snprintf(pathbuf + n, sizeof(pathbuf) - n,
+=09=09=09=09  "/%s/dm/uuid", di[i]->d_name))
 =09=09=09continue;
=20
 =09=09fd =3D open(pathbuf, O_RDONLY);
diff --git a/libmultipath/util.c b/libmultipath/util.c
index ccc0de29..51c38c87 100644
--- a/libmultipath/util.c
+++ b/libmultipath/util.c
@@ -212,8 +212,7 @@ int devt2devname(char *devname, int devname_len, char *=
devt)
 =09=09=09continue;
=20
 =09=09if ((major =3D=3D tmpmaj) && (minor =3D=3D tmpmin)) {
-=09=09=09if (snprintf(block_path, sizeof(block_path),
-=09=09=09=09     "/sys/block/%s", dev) >=3D sizeof(block_path)) {
+=09=09=09if (safe_sprintf(block_path, "/sys/block/%s", dev)) {
 =09=09=09=09condlog(0, "device name %s is too long", dev);
 =09=09=09=09fclose(fd);
 =09=09=09=09return 1;
diff --git a/libmultipath/util.h b/libmultipath/util.h
index 913ab7c2..56bd78c7 100644
--- a/libmultipath/util.h
+++ b/libmultipath/util.h
@@ -29,9 +29,16 @@ void set_max_fds(rlim_t max_fds);
 #define ARRAY_SIZE(x) (sizeof(x)/sizeof((x)[0]))
=20
 #define safe_sprintf(var, format, args...)=09\
-=09snprintf(var, sizeof(var), format, ##args) >=3D sizeof(var)
+=09safe_snprintf(var, sizeof(var), format, ##args)
+
 #define safe_snprintf(var, size, format, args...)      \
-=09snprintf(var, size, format, ##args) >=3D size
+=09({=09=09=09=09=09=09=09=09\
+=09=09size_t __size =3D size;=09=09=09=09=09\
+=09=09int __ret;=09=09=09=09=09=09\
+=09=09=09=09=09=09=09=09=09\
+=09=09__ret =3D snprintf(var, __size, format, ##args);=09=09\
+=09=09__ret < 0 || (size_t)__ret >=3D __size;=09=09=09\
+=09})
=20
 #define pthread_cleanup_push_cast(f, arg)=09=09\
 =09pthread_cleanup_push(((void (*)(void *))&f), (arg))
diff --git a/libmultipath/wwids.c b/libmultipath/wwids.c
index 291db8f5..28a2150d 100644
--- a/libmultipath/wwids.c
+++ b/libmultipath/wwids.c
@@ -393,8 +393,7 @@ static int _failed_wwid_op(const char *wwid, bool rw,
 =09long lockfd;
 =09int r =3D -1;
=20
-=09if (snprintf(path, sizeof(path), "%s/%s", shm_dir, wwid)
-=09    >=3D sizeof(path)) {
+=09if (safe_sprintf(path, "%s/%s", shm_dir, wwid)) {
 =09=09condlog(1, "%s: path name overflow", __func__);
 =09=09return -1;
 =09}
diff --git a/multipath/main.c b/multipath/main.c
index c2ef8c7b..c553437b 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -423,8 +423,7 @@ static int find_multipaths_check_timeout(const struct p=
ath *pp, long tmo,
=20
 =09clock_gettime(CLOCK_REALTIME, &now);
=20
-=09if (snprintf(path, sizeof(path), "%s/%s", shm_find_mp_dir, pp->dev_t)
-=09    >=3D sizeof(path)) {
+=09if (safe_sprintf(path, "%s/%s", shm_find_mp_dir, pp->dev_t)) {
 =09=09condlog(1, "%s: path name overflow", __func__);
 =09=09return FIND_MULTIPATHS_ERROR;
 =09}
--=20
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

