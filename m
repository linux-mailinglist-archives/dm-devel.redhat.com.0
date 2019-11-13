Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A1487FBB5E
	for <lists+dm-devel@lfdr.de>; Wed, 13 Nov 2019 23:08:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573682894;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lHO8u66nQf3frtpm2CQm3bM8M9bh/ODCc8mM4Kp/OlY=;
	b=g64y/y8knoaW4WKRKqzG1g1s8e++F7hVg2Xo+f3Jvt4T3s1DnsPWwlsmRWwQuobBBvZZ+W
	WeKZRTyRTd8ddeRlYoQb1VDjrkQOTyXa2bVGhi51U96UWuLzzvu9Oj9EKxHANMFRW4CN2x
	hTnUtvMblTsQ8x2xqDT0gLBSkxbHJpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-gHuQPNxYNw-sstFwJ_eFbA-1; Wed, 13 Nov 2019 17:08:13 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3155D477;
	Wed, 13 Nov 2019 22:08:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CA018175D;
	Wed, 13 Nov 2019 22:08:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3CD0918089C8;
	Wed, 13 Nov 2019 22:07:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADM7nLQ006977 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 17:07:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CD29B179E4; Wed, 13 Nov 2019 22:07:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22B3860BFB;
	Wed, 13 Nov 2019 22:07:47 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id xADM7jLB002554; 
	Wed, 13 Nov 2019 16:07:45 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id xADM7i4K002552;
	Wed, 13 Nov 2019 16:07:44 -0600
Date: Wed, 13 Nov 2019 16:07:44 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20191113220744.GH30153@octiron.msp.redhat.com>
References: <20191107092651.10975-1-martin.wilck@suse.com>
	<20191107092651.10975-2-martin.wilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20191107092651.10975-2-martin.wilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Bart Van Assche <Bart.VanAssche@sandisk.com>
Subject: Re: [dm-devel] [PATCH v3 45/72] libmultipath: fix -Wsign-compare
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: gHuQPNxYNw-sstFwJ_eFbA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Nov 07, 2019 at 09:27:41AM +0000, Martin Wilck wrote:
> From: Martin Wilck <mwilck@suse.com>

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
=20
> snprintf() returns int, but the size argument "n" is size_t.
> Use safe_snprintf() to avoid -Wsign-compare warnings. At the same
> time, improve these macros to check for errors in snprintf(), too.
>=20
> Note: there are more uses of snprintf() in our code that may
> need review, too. For now, I'm fixing only those that were causing
> warnings.
>=20
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  kpartx/devmapper.c          |  3 ++-
>  kpartx/kpartx.h             | 11 ++++++++++-
>  libmultipath/foreign/nvme.c |  6 ++----
>  libmultipath/sysfs.c        |  7 +++----
>  libmultipath/util.c         |  3 +--
>  libmultipath/util.h         | 11 +++++++++--
>  libmultipath/wwids.c        |  3 +--
>  multipath/main.c            |  3 +--
>  8 files changed, 29 insertions(+), 18 deletions(-)
>=20
> diff --git a/kpartx/devmapper.c b/kpartx/devmapper.c
> index 3aa4988d..b100b5ef 100644
> --- a/kpartx/devmapper.c
> +++ b/kpartx/devmapper.c
> @@ -10,6 +10,7 @@
>  #include <errno.h>
>  #include <sys/sysmacros.h>
>  #include "devmapper.h"
> +#include "kpartx.h"
> =20
>  #define _UUID_PREFIX "part"
>  #define UUID_PREFIX _UUID_PREFIX "%d-"
> @@ -107,7 +108,7 @@ strip_slash (char * device)
>  static int format_partname(char *buf, size_t bufsiz,
>  =09=09=09   const char *mapname, const char *delim, int part)
>  {
> -=09if (snprintf(buf, bufsiz, "%s%s%d", mapname, delim, part) >=3D bufsiz=
)
> +=09if (safe_snprintf(buf, bufsiz, "%s%s%d", mapname, delim, part))
>  =09=09return 0;
>  =09strip_slash(buf);
>  =09return 1;
> diff --git a/kpartx/kpartx.h b/kpartx/kpartx.h
> index 52920e43..8a2db046 100644
> --- a/kpartx/kpartx.h
> +++ b/kpartx/kpartx.h
> @@ -16,8 +16,17 @@
>  #define likely(x)       __builtin_expect(!!(x), 1)
>  #define unlikely(x)     __builtin_expect(!!(x), 0)
> =20
> +#define safe_snprintf(var, size, format, args...)=09=09=09\
> +=09({=09=09=09=09=09=09=09=09\
> +=09=09size_t __size =3D size;=09=09=09=09=09\
> +=09=09int __ret;=09=09=09=09=09=09\
> +=09=09=09=09=09=09=09=09=09\
> +=09=09__ret =3D snprintf(var, __size, format, ##args);=09=09\
> +=09=09__ret < 0 || (size_t)__ret >=3D __size;=09=09=09\
> +=09})
> +
>  #define safe_sprintf(var, format, args...)=09\
> -=09snprintf(var, sizeof(var), format, ##args) >=3D sizeof(var)
> +=09=09safe_snprintf(var, sizeof(var), format, ##args)
> =20
>  #ifndef BLKSSZGET
>  #define BLKSSZGET  _IO(0x12,104)=09/* get block device sector size */
> diff --git a/libmultipath/foreign/nvme.c b/libmultipath/foreign/nvme.c
> index e8ca516c..09cdddf0 100644
> --- a/libmultipath/foreign/nvme.c
> +++ b/libmultipath/foreign/nvme.c
> @@ -591,8 +591,7 @@ static void test_ana_support(struct nvme_map *map, st=
ruct udev_device *ctl)
>  =09=09return;
> =20
>  =09dev_t =3D udev_device_get_sysattr_value(ctl, "dev");
> -=09if (snprintf(sys_path, sizeof(sys_path), "/dev/char/%s", dev_t)
> -=09    >=3D sizeof(sys_path))
> +=09if (safe_sprintf(sys_path, "/dev/char/%s", dev_t))
>  =09=09return;
> =20
>  =09fd =3D open(sys_path, O_RDONLY);
> @@ -663,8 +662,7 @@ static void _find_controllers(struct context *ctx, st=
ruct nvme_map *map)
>  =09=09char *fn =3D di[i]->d_name;
>  =09=09struct udev_device *ctrl, *udev;
> =20
> -=09=09if (snprintf(pathbuf + n, sizeof(pathbuf) - n, "/%s", fn)
> -=09=09    >=3D sizeof(pathbuf) - n)
> +=09=09if (safe_snprintf(pathbuf + n, sizeof(pathbuf) - n, "/%s", fn))
>  =09=09=09continue;
>  =09=09if (realpath(pathbuf, realbuf) =3D=3D NULL) {
>  =09=09=09condlog(3, "%s: %s: realpath: %s", __func__, THIS,
> diff --git a/libmultipath/sysfs.c b/libmultipath/sysfs.c
> index 923b529b..62ec2ed7 100644
> --- a/libmultipath/sysfs.c
> +++ b/libmultipath/sysfs.c
> @@ -306,7 +306,7 @@ bool sysfs_is_multipathed(const struct path *pp)
>  =09n =3D snprintf(pathbuf, sizeof(pathbuf), "/sys/block/%s/holders",
>  =09=09     pp->dev);
> =20
> -=09if (n >=3D sizeof(pathbuf)) {
> +=09if (n < 0 || (size_t)n >=3D sizeof(pathbuf)) {
>  =09=09condlog(1, "%s: pathname overflow", __func__);
>  =09=09return false;
>  =09}
> @@ -327,9 +327,8 @@ bool sysfs_is_multipathed(const struct path *pp)
>  =09=09int nr;
>  =09=09char uuid[6];
> =20
> -=09=09if (snprintf(pathbuf + n, sizeof(pathbuf) - n,
> -=09=09=09     "/%s/dm/uuid", di[i]->d_name)
> -=09=09    >=3D sizeof(pathbuf) - n)
> +=09=09if (safe_snprintf(pathbuf + n, sizeof(pathbuf) - n,
> +=09=09=09=09  "/%s/dm/uuid", di[i]->d_name))
>  =09=09=09continue;
> =20
>  =09=09fd =3D open(pathbuf, O_RDONLY);
> diff --git a/libmultipath/util.c b/libmultipath/util.c
> index ccc0de29..51c38c87 100644
> --- a/libmultipath/util.c
> +++ b/libmultipath/util.c
> @@ -212,8 +212,7 @@ int devt2devname(char *devname, int devname_len, char=
 *devt)
>  =09=09=09continue;
> =20
>  =09=09if ((major =3D=3D tmpmaj) && (minor =3D=3D tmpmin)) {
> -=09=09=09if (snprintf(block_path, sizeof(block_path),
> -=09=09=09=09     "/sys/block/%s", dev) >=3D sizeof(block_path)) {
> +=09=09=09if (safe_sprintf(block_path, "/sys/block/%s", dev)) {
>  =09=09=09=09condlog(0, "device name %s is too long", dev);
>  =09=09=09=09fclose(fd);
>  =09=09=09=09return 1;
> diff --git a/libmultipath/util.h b/libmultipath/util.h
> index 913ab7c2..56bd78c7 100644
> --- a/libmultipath/util.h
> +++ b/libmultipath/util.h
> @@ -29,9 +29,16 @@ void set_max_fds(rlim_t max_fds);
>  #define ARRAY_SIZE(x) (sizeof(x)/sizeof((x)[0]))
> =20
>  #define safe_sprintf(var, format, args...)=09\
> -=09snprintf(var, sizeof(var), format, ##args) >=3D sizeof(var)
> +=09safe_snprintf(var, sizeof(var), format, ##args)
> +
>  #define safe_snprintf(var, size, format, args...)      \
> -=09snprintf(var, size, format, ##args) >=3D size
> +=09({=09=09=09=09=09=09=09=09\
> +=09=09size_t __size =3D size;=09=09=09=09=09\
> +=09=09int __ret;=09=09=09=09=09=09\
> +=09=09=09=09=09=09=09=09=09\
> +=09=09__ret =3D snprintf(var, __size, format, ##args);=09=09\
> +=09=09__ret < 0 || (size_t)__ret >=3D __size;=09=09=09\
> +=09})
> =20
>  #define pthread_cleanup_push_cast(f, arg)=09=09\
>  =09pthread_cleanup_push(((void (*)(void *))&f), (arg))
> diff --git a/libmultipath/wwids.c b/libmultipath/wwids.c
> index 291db8f5..28a2150d 100644
> --- a/libmultipath/wwids.c
> +++ b/libmultipath/wwids.c
> @@ -393,8 +393,7 @@ static int _failed_wwid_op(const char *wwid, bool rw,
>  =09long lockfd;
>  =09int r =3D -1;
> =20
> -=09if (snprintf(path, sizeof(path), "%s/%s", shm_dir, wwid)
> -=09    >=3D sizeof(path)) {
> +=09if (safe_sprintf(path, "%s/%s", shm_dir, wwid)) {
>  =09=09condlog(1, "%s: path name overflow", __func__);
>  =09=09return -1;
>  =09}
> diff --git a/multipath/main.c b/multipath/main.c
> index c2ef8c7b..c553437b 100644
> --- a/multipath/main.c
> +++ b/multipath/main.c
> @@ -423,8 +423,7 @@ static int find_multipaths_check_timeout(const struct=
 path *pp, long tmo,
> =20
>  =09clock_gettime(CLOCK_REALTIME, &now);
> =20
> -=09if (snprintf(path, sizeof(path), "%s/%s", shm_find_mp_dir, pp->dev_t)
> -=09    >=3D sizeof(path)) {
> +=09if (safe_sprintf(path, "%s/%s", shm_find_mp_dir, pp->dev_t)) {
>  =09=09condlog(1, "%s: path name overflow", __func__);
>  =09=09return FIND_MULTIPATHS_ERROR;
>  =09}
> --=20
> 2.23.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

