Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B5B47102F56
	for <lists+dm-devel@lfdr.de>; Tue, 19 Nov 2019 23:31:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574202686;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=k2cZj+26UNmEQYuwEkfooossGTwf8b8aQe7hdS0gsHM=;
	b=RZdBLrwukUj8EjeLh98rzdMp2FZoGMV1wnlKezksAJiSQKxUtcnTbLXIRXEaMaUYIzLVLs
	4m7bjcQjp5o6zK6l9rwApkG6y9NSmrBM6xVxaHmHp0uKuzBjRQXxEg4TQGIUjyAeYLQReD
	mEVvk4+odlexlDwt4lHcMri1BSrnuYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-X2jnzj3NPiWwjAcGRqSRPQ-1; Tue, 19 Nov 2019 17:31:24 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 112AE593BA;
	Tue, 19 Nov 2019 22:31:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C630210375F6;
	Tue, 19 Nov 2019 22:31:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B04C18089C8;
	Tue, 19 Nov 2019 22:31:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJMVERg009239 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 17:31:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A085D50910; Tue, 19 Nov 2019 22:31:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2A825E1AD;
	Tue, 19 Nov 2019 22:31:11 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id xAJMVAMw010951; 
	Tue, 19 Nov 2019 16:31:10 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id xAJMV94l010950;
	Tue, 19 Nov 2019 16:31:09 -0600
Date: Tue, 19 Nov 2019 16:31:08 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20191119223108.GP30153@octiron.msp.redhat.com>
References: <20191115143403.31692-1-martin.wilck@suse.com>
	<20191115143403.31692-5-martin.wilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20191115143403.31692-5-martin.wilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Chongyun Wu <wu.chongyun@h3c.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Bart Van Assche <Bart.VanAssche@sandisk.com>
Subject: Re: [dm-devel] [PATCH 4/5] libmultipath: fix (max_)polling_interval
 setting logic
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: X2jnzj3NPiWwjAcGRqSRPQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Nov 15, 2019 at 02:41:52PM +0000, Martin Wilck wrote:
> From: Martin Wilck <mwilck@suse.com>
>=20
> checkint should never be larger than max_checkint. The WATCHDOG_USEC
> setting should be honored on "reconfigure", too, not only on startup.
> Pathological values for checkint and integer overflows should be avoided.
> The logic should work reasonably well if both polling_interval and
> max_polling_interval, just one of them, or neither is set.
>=20
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/config.c   | 40 +++++++++++++++++++++++++++++++++++++---
>  libmultipath/config.h   |  1 +
>  libmultipath/defaults.h |  3 +--
>  multipathd/main.c       | 26 ++++++--------------------
>  4 files changed, 45 insertions(+), 25 deletions(-)
>=20
> diff --git a/libmultipath/config.c b/libmultipath/config.c
> index 49723add..0bf7bb40 100644
> --- a/libmultipath/config.c
> +++ b/libmultipath/config.c
> @@ -683,6 +683,27 @@ process_config_dir(struct config *conf, char *dir)
>  =09pthread_cleanup_pop(1);
>  }
> =20
> +static void set_max_checkint_from_watchdog(struct config *conf)
> +{
> +#ifdef USE_SYSTEMD
> +=09char *envp =3D getenv("WATCHDOG_USEC");
> +=09unsigned long checkint;
> +
> +=09if (envp && sscanf(envp, "%lu", &checkint) =3D=3D 1) {
> +=09=09/* Value is in microseconds */
> +=09=09checkint /=3D 1000000;
> +=09=09if (checkint < 1 || checkint > UINT_MAX) {
> +=09=09=09condlog(1, "invalid value for WatchdogSec: \"%s\"", envp);
> +=09=09=09return;
> +=09=09}
> +=09=09if (conf->max_checkint =3D=3D 0 || conf->max_checkint > checkint)
> +=09=09=09conf->max_checkint =3D checkint;
> +=09=09condlog(3, "enabling watchdog, interval %ld", checkint);
> +=09=09conf->use_watchdog =3D true;
> +=09}
> +#endif
> +}
> +
>  struct config *
>  load_config (char * file)
>  {
> @@ -703,7 +724,8 @@ load_config (char * file)
>  =09conf->multipath_dir =3D set_default(DEFAULT_MULTIPATHDIR);
>  =09conf->attribute_flags =3D 0;
>  =09conf->reassign_maps =3D DEFAULT_REASSIGN_MAPS;
> -=09conf->checkint =3D DEFAULT_CHECKINT;
> +=09conf->checkint =3D CHECKINT_UNDEF;
> +=09conf->use_watchdog =3D false;
>  =09conf->max_checkint =3D 0;
>  =09conf->force_sync =3D DEFAULT_FORCE_SYNC;
>  =09conf->partition_delim =3D (default_partition_delim !=3D NULL ?
> @@ -754,8 +776,20 @@ load_config (char * file)
>  =09/*
>  =09 * fill the voids left in the config file
>  =09 */
> -=09if (conf->max_checkint =3D=3D 0)
> -=09=09conf->max_checkint =3D MAX_CHECKINT(conf->checkint);
> +=09set_max_checkint_from_watchdog(conf);
> +=09if (conf->max_checkint =3D=3D 0) {
> +=09=09if (conf->checkint =3D=3D CHECKINT_UNDEF)
> +=09=09=09conf->checkint =3D DEFAULT_CHECKINT;
> +=09=09conf->max_checkint =3D (conf->checkint < UINT_MAX / 4 ?
> +=09=09=09=09      conf->checkint * 4 : UINT_MAX);
> +=09} else if (conf->checkint =3D=3D CHECKINT_UNDEF)
> +=09=09conf->checkint =3D (conf->max_checkint >=3D 4 ?
> +=09=09=09=09  conf->max_checkint / 4 : 1);
> +=09else if (conf->checkint > conf->max_checkint)
> +=09=09conf->checkint =3D conf->max_checkint;
> +=09condlog(3, "polling interval: %d, max: %d",
> +=09=09conf->checkint, conf->max_checkint);
> +
>  =09if (conf->blist_devnode =3D=3D NULL) {
>  =09=09conf->blist_devnode =3D vector_alloc();
> =20
> diff --git a/libmultipath/config.h b/libmultipath/config.h
> index 2ab7b42c..a078947c 100644
> --- a/libmultipath/config.h
> +++ b/libmultipath/config.h
> @@ -139,6 +139,7 @@ struct config {
>  =09int minio_rq;
>  =09unsigned int checkint;
>  =09unsigned int max_checkint;
> +=09bool use_watchdog;
>  =09int pgfailback;
>  =09int remove;
>  =09int rr_weight;
> diff --git a/libmultipath/defaults.h b/libmultipath/defaults.h
> index d7034655..e5ee6afe 100644
> --- a/libmultipath/defaults.h
> +++ b/libmultipath/defaults.h
> @@ -53,9 +53,8 @@
>  /* Enable all foreign libraries by default */
>  #define DEFAULT_ENABLE_FOREIGN ""
> =20
> -#define CHECKINT_UNDEF=09=09(~0U)
> +#define CHECKINT_UNDEF=09=09UINT_MAX
>  #define DEFAULT_CHECKINT=095
> -#define MAX_CHECKINT(a)=09=09(a << 2)
> =20
>  #define MAX_DEV_LOSS_TMO=09UINT_MAX
>  #define DEFAULT_PIDFILE=09=09"/" RUN_DIR "/multipathd.pid"
> diff --git a/multipathd/main.c b/multipathd/main.c
> index c0423602..95426d3d 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -33,10 +33,6 @@
>   */
>  #include "checkers.h"
> =20
> -#ifdef USE_SYSTEMD
> -static int use_watchdog;
> -#endif
> -
>  /*
>   * libmultipath
>   */
> @@ -2284,6 +2280,7 @@ checkerloop (void *ap)
>  =09struct timespec last_time;
>  =09struct config *conf;
>  =09int foreign_tick =3D 0;
> +=09bool use_watchdog;
> =20
>  =09pthread_cleanup_push(rcu_unregister, NULL);
>  =09rcu_register_thread();
> @@ -2295,6 +2292,11 @@ checkerloop (void *ap)
>  =09get_monotonic_time(&last_time);
>  =09last_time.tv_sec -=3D 1;
> =20
> +=09/* use_watchdog is set from process environment and never changes */
> +=09conf =3D get_multipath_config();
> +=09use_watchdog =3D conf->use_watchdog;
> +=09put_multipath_config(conf);
> +
>  =09while (1) {
>  =09=09struct timespec diff_time, start_time, end_time;
>  =09=09int num_paths =3D 0, strict_timing, rc =3D 0;
> @@ -2766,7 +2768,6 @@ child (__attribute__((unused)) void *param)
>  =09struct multipath * mpp;
>  =09int i;
>  #ifdef USE_SYSTEMD
> -=09unsigned long checkint;
>  =09int startup_done =3D 0;
>  #endif
>  =09int rc;
> @@ -2843,21 +2844,6 @@ child (__attribute__((unused)) void *param)
>  =09setscheduler();
>  =09set_oom_adj();
> =20
> -#ifdef USE_SYSTEMD
> -=09envp =3D getenv("WATCHDOG_USEC");
> -=09if (envp && sscanf(envp, "%lu", &checkint) =3D=3D 1) {
> -=09=09/* Value is in microseconds */
> -=09=09conf->max_checkint =3D checkint / 1000000;
> -=09=09/* Rescale checkint */
> -=09=09if (conf->checkint > conf->max_checkint)
> -=09=09=09conf->checkint =3D conf->max_checkint;
> -=09=09else
> -=09=09=09conf->checkint =3D conf->max_checkint / 4;
> -=09=09condlog(3, "enabling watchdog, interval %d max %d",
> -=09=09=09conf->checkint, conf->max_checkint);
> -=09=09use_watchdog =3D conf->checkint;
> -=09}
> -#endif
>  =09/*
>  =09 * Startup done, invalidate configuration
>  =09 */
> --=20
> 2.24.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

