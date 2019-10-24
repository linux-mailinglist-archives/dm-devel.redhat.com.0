Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 539B2E3728
	for <lists+dm-devel@lfdr.de>; Thu, 24 Oct 2019 17:55:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571932498;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=e8cFeWsRe0eO6hSkplcpzS+S0eTQM42cE9XGN22XD2o=;
	b=ica+CYzEx+zLWf1laBJeDoE828E8HXmaVOpiYHaqElUKR1BV6lr9ug4yc9VFX/LrKvYDfx
	PZXeUhIlZQBlX3A+iqdVoeKpURqY4GPPglYCjMmF2fcZPVBz6c5Yi+btHErlBdtrnQEy7B
	NT1gOuVeucKf9TVqw22ekHPN6Ry2bFQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-O0aHWJe6OuagPEwfr2GVzw-1; Thu, 24 Oct 2019 11:54:45 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10980800D4E;
	Thu, 24 Oct 2019 15:24:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ABD76012E;
	Thu, 24 Oct 2019 15:24:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 85DD41808878;
	Thu, 24 Oct 2019 15:24:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9OFOFUN001070 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Oct 2019 11:24:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4B7016012E; Thu, 24 Oct 2019 15:24:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9DA36012D;
	Thu, 24 Oct 2019 15:24:12 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F149C30860BF;
	Thu, 24 Oct 2019 15:23:21 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Thu, 24 Oct 2019 15:22:22 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Thu, 24 Oct 2019 15:06:12 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.13) by
	M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Thu, 24 Oct 2019 15:06:11 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3239.namprd18.prod.outlook.com (52.132.244.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2367.24; Thu, 24 Oct 2019 15:06:10 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.030;
	Thu, 24 Oct 2019 15:06:10 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Bart Van Assche <Bart.VanAssche@sandisk.com>
Thread-Topic: [PATCH v2 45/72] libmultipath: fix -Wsign-compare warnings with
	snprintf()
Thread-Index: AQHVinyRClZNBGp5Pka5AUNFpoHYjQ==
Date: Thu, 24 Oct 2019 15:06:10 +0000
Message-ID: <20191024150556.19575-2-martin.wilck@suse.com>
References: <20191024150556.19575-1-martin.wilck@suse.com>
In-Reply-To: <20191024150556.19575-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0042.eurprd05.prod.outlook.com
	(2603:10a6:208:be::19) To CH2PR18MB3349.namprd18.prod.outlook.com
	(2603:10b6:610:28::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [90.186.0.223]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb4a0740-912e-419c-1b53-08d75893b40c
x-ms-traffictypediagnostic: CH2PR18MB3239:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3239DD8EAE286CC0A1110CE0FC6A0@CH2PR18MB3239.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:773;
x-forefront-prvs: 0200DDA8BE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(189003)(199004)(14454004)(110136005)(316002)(54906003)(66066001)(11346002)(446003)(99286004)(2616005)(486006)(476003)(71200400001)(71190400001)(256004)(1076003)(44832011)(66446008)(64756008)(66556008)(66476007)(66946007)(3846002)(6116002)(7736002)(305945005)(2906002)(5660300002)(81166006)(81156014)(6436002)(86362001)(36756003)(6486002)(76176011)(1691005)(6512007)(102836004)(107886003)(4326008)(478600001)(186003)(8676002)(6506007)(386003)(25786009)(50226002)(52116002)(8936002)(26005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3239;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 514MnYfgwFHwixnt/ogVuNjHrUzi6VCAZSiqAiTeAFuo1lGAN52GrQL+N7ZGE4jzbi2/BdtvnPglhYTglNFkDCdtvZHJgWGOd8mHG6dnZUMh9pd1KqUh2Lqe2hB4xP7bL8+EUvrxaXQRIaK2fIPWm7H60Nl825mOFK2MSDdsEZuLWyGuv2C6faDlPL2Bk9r6DA3ll+4HvSNBL4ZEBBrxHu162BqZh2bPQ5usgNJ+j8GUkXV5tzSMJH/LDQYSrAXLs/eBC2AEmFc0JdxjBJELKYDrqP4ddo7vG4BHRRUWcDXJJbV0nbCg6XAmQNilrRDvFeYiRo0HG7QVO4zsnLyypKBzh+ZAHQcOJp0A/qHnABYc4qpCEVQki4oWxikZimsjumytC6F5MAutW83+HV+rvQyFymuXubSdQgV0ShAyabp1ZMeKmvmf+nWjdjlI2/3O
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4a0740-912e-419c-1b53-08d75893b40c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2019 15:06:10.2962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SejYpkQQbacPUSKQSo9QwECFwbE9IoejXWtysQmZBA2ppOMZcWuBfu4J3Yktq0n88DJ2ZfAyrYyhdLJ6Q/CQjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3239
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.44]); Thu, 24 Oct 2019 15:24:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Thu, 24 Oct 2019 15:24:11 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9OFOFUN001070
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 45/72] libmultipath: fix -Wsign-compare
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: O0aHWJe6OuagPEwfr2GVzw-1
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
index 52920e43..2d36b0b5 100644
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
+=09=09__ret =3D snprintf(var, size, format, ##args);=09=09\
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
index 913ab7c2..12ce723f 100644
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
+=09=09__ret =3D snprintf(var, size, format, ##args);=09=09\
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

