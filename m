Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2FFDF27BCA6
	for <lists+dm-devel@lfdr.de>; Tue, 29 Sep 2020 07:58:06 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601359085;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GJhHWXOt37OvR4ZKluWUhdp7PNJJ0/ZVNI6ir72tWH0=;
	b=Oks6HP5slcWitB9xfhIG6+UuaUsVRMa7o9BSfSm8bzyhB/Fihg46p3lRiSJbiI3rTnNyHN
	DuP5jC59N9Vs0Hu0El3wp+nMu0iBbaFmk+oIM6kgtY2Ut6OQbOvyjIgqFNZ/ADjF+OYDi6
	qfE+GNe+v6hWKNJ2TEbHLUZTo9PDDTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-qX7NWkWOP9-TZqoNxF9PwQ-1; Tue, 29 Sep 2020 01:58:02 -0400
X-MC-Unique: qX7NWkWOP9-TZqoNxF9PwQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53CA08D9BA1;
	Tue, 29 Sep 2020 05:57:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00A631A8AC;
	Tue, 29 Sep 2020 05:57:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B1BA8180B655;
	Tue, 29 Sep 2020 05:57:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08T5vP45018709 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 29 Sep 2020 01:57:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 748C97880B; Tue, 29 Sep 2020 05:57:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1556B78828;
	Tue, 29 Sep 2020 05:57:17 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08T5vGET027150; 
	Tue, 29 Sep 2020 00:57:16 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08T5vGBt027149;
	Tue, 29 Sep 2020 00:57:16 -0500
Date: Tue, 29 Sep 2020 00:57:15 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200929055715.GR3384@octiron.msp.redhat.com>
References: <20200924133716.14120-1-mwilck@suse.com>
	<20200924133716.14120-12-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200924133716.14120-12-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 11/21] libmultipath: protect racy
 libdevmapper calls with a mutex
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24, 2020 at 03:37:06PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> dm_udev_wait() and dm_task_run() may access global / static state
> in libdevmapper. They need to be protected by a lock in in our
> multithreaded library.
> 

This breaks the dmevents unit tests. dm_task_run is no longer called in
dmevents.c. Intead, its only called in devmapper.c, so this needs to be
in dmevents-test_OBJDEPS

> Cc: lixiaokeng@huawei.com
> Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/devmapper.c          | 73 +++++++++++++++++++------------
>  libmultipath/devmapper.h          |  2 +
>  libmultipath/libmultipath.version |  6 +++
>  libmultipath/util.c               |  5 +++
>  libmultipath/util.h               |  1 +
>  multipathd/dmevents.c             |  2 +-
>  multipathd/waiter.c               |  2 +-
>  7 files changed, 62 insertions(+), 29 deletions(-)
> 
> diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
> index 08aa09f..2e3ae8a 100644
> --- a/libmultipath/devmapper.c
> +++ b/libmultipath/devmapper.c
> @@ -42,6 +42,7 @@ static unsigned int dm_mpath_target_version[3] = { INVALID_VERSION, };
>  
>  static pthread_once_t dm_initialized = PTHREAD_ONCE_INIT;
>  static pthread_once_t versions_initialized = PTHREAD_ONCE_INIT;
> +static pthread_mutex_t libmp_dm_lock = PTHREAD_MUTEX_INITIALIZER;
>  
>  static int dm_conf_verbosity;
>  
> @@ -59,16 +60,34 @@ static inline int dm_task_set_cookie(struct dm_task *dmt, uint32_t *c, int a)
>  	return 1;
>  }
>  
> -void dm_udev_wait(unsigned int c)
> +static void libmp_udev_wait(unsigned int c)
>  {
>  }
>  
> -void dm_udev_set_sync_support(int c)
> +static void dm_udev_set_sync_support(int c)
>  {
>  }
> -
> +#else
> +static void libmp_udev_wait(unsigned int c)
> +{
> +	pthread_mutex_lock(&libmp_dm_lock);
> +	pthread_cleanup_push(cleanup_mutex, &libmp_dm_lock);
> +	dm_udev_wait(c);
> +	pthread_cleanup_pop(1);
> +}
>  #endif
>  
> +int libmp_dm_task_run(struct dm_task *dmt)
> +{
> +	int r;
> +
> +	pthread_mutex_lock(&libmp_dm_lock);
> +	pthread_cleanup_push(cleanup_mutex, &libmp_dm_lock);
> +	r = dm_task_run(dmt);
> +	pthread_cleanup_pop(1);
> +	return r;
> +}
> +
>  __attribute__((format(printf, 4, 5))) static void
>  dm_write_log (int level, const char *file, int line, const char *f, ...)
>  {
> @@ -196,7 +215,7 @@ static int dm_tgt_version (unsigned int *version, char *str)
>  
>  	dm_task_no_open_count(dmt);
>  
> -	if (!dm_task_run(dmt)) {
> +	if (!libmp_dm_task_run(dmt)) {
>  		dm_log_error(2, DM_DEVICE_LIST_VERSIONS, dmt);
>  		condlog(0, "Can not communicate with kernel DM");
>  		goto out;
> @@ -380,12 +399,12 @@ dm_simplecmd (int task, const char *name, int no_flush, int need_sync, uint16_t
>  				DM_UDEV_DISABLE_LIBRARY_FALLBACK | udev_flags))
>  		goto out;
>  
> -	r = dm_task_run (dmt);
> +	r = libmp_dm_task_run (dmt);
>  	if (!r)
>  		dm_log_error(2, task, dmt);
>  
>  	if (udev_wait_flag)
> -			dm_udev_wait(cookie);
> +			libmp_udev_wait(cookie);
>  out:
>  	dm_task_destroy (dmt);
>  	return r;
> @@ -472,12 +491,12 @@ dm_addmap (int task, const char *target, struct multipath *mpp,
>  	    !dm_task_set_cookie(dmt, &cookie, udev_flags))
>  		goto freeout;
>  
> -	r = dm_task_run (dmt);
> +	r = libmp_dm_task_run (dmt);
>  	if (!r)
>  		dm_log_error(2, task, dmt);
>  
>  	if (task == DM_DEVICE_CREATE)
> -			dm_udev_wait(cookie);
> +			libmp_udev_wait(cookie);
>  freeout:
>  	if (prefixed_uuid)
>  		FREE(prefixed_uuid);
> @@ -587,7 +606,7 @@ do_get_info(const char *name, struct dm_info *info)
>  
>  	dm_task_no_open_count(dmt);
>  
> -	if (!dm_task_run(dmt)) {
> +	if (!libmp_dm_task_run(dmt)) {
>  		dm_log_error(3, DM_DEVICE_INFO, dmt);
>  		goto out;
>  	}
> @@ -628,7 +647,7 @@ int dm_get_map(const char *name, unsigned long long *size, char *outparams)
>  	dm_task_no_open_count(dmt);
>  
>  	errno = 0;
> -	if (!dm_task_run(dmt)) {
> +	if (!libmp_dm_task_run(dmt)) {
>  		dm_log_error(3, DM_DEVICE_TABLE, dmt);
>  		if (dm_task_get_errno(dmt) == ENXIO)
>  			r = DMP_NOT_FOUND;
> @@ -670,7 +689,7 @@ dm_get_prefixed_uuid(const char *name, char *uuid, int uuid_len)
>  	if (!dm_task_set_name (dmt, name))
>  		goto uuidout;
>  
> -	if (!dm_task_run(dmt)) {
> +	if (!libmp_dm_task_run(dmt)) {
>  		dm_log_error(3, DM_DEVICE_INFO, dmt);
>  		goto uuidout;
>  	}
> @@ -741,7 +760,7 @@ int dm_get_status(const char *name, char *outstatus)
>  	dm_task_no_open_count(dmt);
>  
>  	errno = 0;
> -	if (!dm_task_run(dmt)) {
> +	if (!libmp_dm_task_run(dmt)) {
>  		dm_log_error(3, DM_DEVICE_STATUS, dmt);
>  		if (dm_task_get_errno(dmt) == ENXIO)
>  			r = DMP_NOT_FOUND;
> @@ -794,7 +813,7 @@ int dm_type(const char *name, char *type)
>  
>  	dm_task_no_open_count(dmt);
>  
> -	if (!dm_task_run(dmt)) {
> +	if (!libmp_dm_task_run(dmt)) {
>  		dm_log_error(3, DM_DEVICE_TABLE, dmt);
>  		goto out;
>  	}
> @@ -838,7 +857,7 @@ int dm_is_mpath(const char *name)
>  
>  	dm_task_no_open_count(dmt);
>  
> -	if (!dm_task_run(dmt)) {
> +	if (!libmp_dm_task_run(dmt)) {
>  		dm_log_error(3, DM_DEVICE_TABLE, dmt);
>  		goto out_task;
>  	}
> @@ -902,7 +921,7 @@ dm_map_present_by_uuid(const char *uuid)
>  	if (!dm_task_set_uuid(dmt, prefixed_uuid))
>  		goto out_task;
>  
> -	if (!dm_task_run(dmt)) {
> +	if (!libmp_dm_task_run(dmt)) {
>  		dm_log_error(3, DM_DEVICE_INFO, dmt);
>  		goto out_task;
>  	}
> @@ -948,7 +967,7 @@ dm_get_opencount (const char * mapname)
>  	if (!dm_task_set_name(dmt, mapname))
>  		goto out;
>  
> -	if (!dm_task_run(dmt)) {
> +	if (!libmp_dm_task_run(dmt)) {
>  		dm_log_error(3, DM_DEVICE_INFO, dmt);
>  		goto out;
>  	}
> @@ -1108,7 +1127,7 @@ int dm_flush_maps (int need_suspend, int retries)
>  
>  	dm_task_no_open_count(dmt);
>  
> -	if (!dm_task_run (dmt)) {
> +	if (!libmp_dm_task_run (dmt)) {
>  		dm_log_error(3, DM_DEVICE_LIST, dmt);
>  		goto out;
>  	}
> @@ -1154,7 +1173,7 @@ dm_message(const char * mapname, char * message)
>  
>  	dm_task_no_open_count(dmt);
>  
> -	if (!dm_task_run(dmt)) {
> +	if (!libmp_dm_task_run(dmt)) {
>  		dm_log_error(2, DM_DEVICE_TARGET_MSG, dmt);
>  		goto out;
>  	}
> @@ -1274,7 +1293,7 @@ dm_get_maps (vector mp)
>  
>  	dm_task_no_open_count(dmt);
>  
> -	if (!dm_task_run(dmt)) {
> +	if (!libmp_dm_task_run(dmt)) {
>  		dm_log_error(3, DM_DEVICE_LIST, dmt);
>  		goto out;
>  	}
> @@ -1359,7 +1378,7 @@ dm_mapname(int major, int minor)
>  	 * daemon uev_trigger -> uev_add_map
>  	 */
>  	while (--loop) {
> -		r = dm_task_run(dmt);
> +		r = libmp_dm_task_run(dmt);
>  
>  		if (r)
>  			break;
> @@ -1404,7 +1423,7 @@ do_foreach_partmaps (const char * mapname,
>  
>  	dm_task_no_open_count(dmt);
>  
> -	if (!dm_task_run(dmt)) {
> +	if (!libmp_dm_task_run(dmt)) {
>  		dm_log_error(3, DM_DEVICE_LIST, dmt);
>  		goto out;
>  	}
> @@ -1639,11 +1658,11 @@ dm_rename (const char * old, char * new, char *delim, int skip_kpartx)
>  
>  	if (!dm_task_set_cookie(dmt, &cookie, udev_flags))
>  		goto out;
> -	r = dm_task_run(dmt);
> +	r = libmp_dm_task_run(dmt);
>  	if (!r)
>  		dm_log_error(2, DM_DEVICE_RENAME, dmt);
>  
> -	dm_udev_wait(cookie);
> +	libmp_udev_wait(cookie);
>  
>  out:
>  	dm_task_destroy(dmt);
> @@ -1685,7 +1704,7 @@ int dm_reassign_table(const char *name, char *old, char *new)
>  
>  	dm_task_no_open_count(dmt);
>  
> -	if (!dm_task_run(dmt)) {
> +	if (!libmp_dm_task_run(dmt)) {
>  		dm_log_error(3, DM_DEVICE_TABLE, dmt);
>  		goto out;
>  	}
> @@ -1718,7 +1737,7 @@ int dm_reassign_table(const char *name, char *old, char *new)
>  	if (modified) {
>  		dm_task_no_open_count(reload_dmt);
>  
> -		if (!dm_task_run(reload_dmt)) {
> +		if (!libmp_dm_task_run(reload_dmt)) {
>  			dm_log_error(3, DM_DEVICE_RELOAD, reload_dmt);
>  			condlog(3, "%s: failed to reassign targets", name);
>  			goto out_reload;
> @@ -1765,7 +1784,7 @@ int dm_reassign(const char *mapname)
>  
>  	dm_task_no_open_count(dmt);
>  
> -	if (!dm_task_run(dmt)) {
> +	if (!libmp_dm_task_run(dmt)) {
>  		dm_log_error(3, DM_DEVICE_DEPS, dmt);
>  		goto out;
>  	}
> @@ -1833,7 +1852,7 @@ int dm_setgeometry(struct multipath *mpp)
>  		goto out;
>  	}
>  
> -	r = dm_task_run(dmt);
> +	r = libmp_dm_task_run(dmt);
>  	if (!r)
>  		dm_log_error(3, DM_DEVICE_SET_GEOMETRY, dmt);
>  out:
> diff --git a/libmultipath/devmapper.h b/libmultipath/devmapper.h
> index c8b37e1..158057e 100644
> --- a/libmultipath/devmapper.h
> +++ b/libmultipath/devmapper.h
> @@ -89,6 +89,8 @@ enum {
>  	MULTIPATH_VERSION
>  };
>  int libmp_get_version(int which, unsigned int version[3]);
> +struct dm_task;
> +int libmp_dm_task_run(struct dm_task *dmt);
>  
>  #define dm_log_error(lvl, cmd, dmt)			      \
>  	condlog(lvl, "%s: libdm task=%d error: %s", __func__, \
> diff --git a/libmultipath/libmultipath.version b/libmultipath/libmultipath.version
> index 5699a0b..0a96010 100644
> --- a/libmultipath/libmultipath.version
> +++ b/libmultipath/libmultipath.version
> @@ -212,3 +212,9 @@ global:
>  local:
>  	*;
>  };
> +
> +LIBMULTIPATH_0.8.4.2 {
> +global:
> +	libmp_dm_task_run;
> +	cleanup_mutex;
> +} LIBMULTIPATH_0.8.4.1;
> diff --git a/libmultipath/util.c b/libmultipath/util.c
> index 66cd721..41da6ce 100644
> --- a/libmultipath/util.c
> +++ b/libmultipath/util.c
> @@ -409,6 +409,11 @@ void cleanup_free_ptr(void *arg)
>  		free(*p);
>  }
>  
> +void cleanup_mutex(void *arg)
> +{
> +	pthread_mutex_unlock(arg);
> +}
> +
>  struct bitfield *alloc_bitfield(unsigned int maxbit)
>  {
>  	unsigned int n;
> diff --git a/libmultipath/util.h b/libmultipath/util.h
> index c1ae878..b8481af 100644
> --- a/libmultipath/util.h
> +++ b/libmultipath/util.h
> @@ -49,6 +49,7 @@ int should_exit(void);
>  
>  void close_fd(void *arg);
>  void cleanup_free_ptr(void *arg);
> +void cleanup_mutex(void *arg);
>  
>  struct scandir_result {
>  	struct dirent **di;
> diff --git a/multipathd/dmevents.c b/multipathd/dmevents.c
> index fc97c8a..b561cbf 100644
> --- a/multipathd/dmevents.c
> +++ b/multipathd/dmevents.c
> @@ -156,7 +156,7 @@ static int dm_get_events(void)
>  
>  	dm_task_no_open_count(dmt);
>  
> -	if (!dm_task_run(dmt)) {
> +	if (!libmp_dm_task_run(dmt)) {
>  		dm_log_error(3, DM_DEVICE_LIST, dmt);
>  		goto fail;
>  	}
> diff --git a/multipathd/waiter.c b/multipathd/waiter.c
> index 16fbdc8..620bfa7 100644
> --- a/multipathd/waiter.c
> +++ b/multipathd/waiter.c
> @@ -118,7 +118,7 @@ static int waiteventloop (struct event_thread *waiter)
>  	pthread_sigmask(SIG_UNBLOCK, &set, &oldset);
>  
>  	pthread_testcancel();
> -	r = dm_task_run(waiter->dmt);
> +	r = libmp_dm_task_run(waiter->dmt);
>  	if (!r)
>  		dm_log_error(2, DM_DEVICE_WAITEVENT, waiter->dmt);
>  	pthread_testcancel();
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

