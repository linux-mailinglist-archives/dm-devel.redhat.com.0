Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 78F8F24A7DE
	for <lists+dm-devel@lfdr.de>; Wed, 19 Aug 2020 22:46:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597869990;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=42Zlxn2JusZF8Vaw0q0ce6gUBciJf0Jzs36MeOcw+X8=;
	b=ZlD8yWqvzbun/u9fdkpXCpfUKy7ahClIoh989E2FsaiHBR1ssmB1gG44GGLyfmNX+z03N7
	Ynnn0fvQ46UzHLbF/pF33YXB5Rn3r0QncbdI64n8GsFS5aBuG9hz2Kk0bT8e8DpCSfa09N
	FOjT9abRVP/pOXBnVrsEKXb/3L2yJzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-qPBpHElGOGur42pmEtF6tw-1; Wed, 19 Aug 2020 16:46:28 -0400
X-MC-Unique: qPBpHElGOGur42pmEtF6tw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE60F10054FF;
	Wed, 19 Aug 2020 20:46:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFD3A7A5E4;
	Wed, 19 Aug 2020 20:46:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB5D860370;
	Wed, 19 Aug 2020 20:46:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07JKk2vl009580 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Aug 2020 16:46:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E4E705C1DC; Wed, 19 Aug 2020 20:46:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF7615C1D0;
	Wed, 19 Aug 2020 20:45:59 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07JKjwrW006649; 
	Wed, 19 Aug 2020 15:45:58 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07JKjwCm006648;
	Wed, 19 Aug 2020 15:45:58 -0500
Date: Wed, 19 Aug 2020 15:45:58 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200819204558.GS19233@octiron.msp.redhat.com>
References: <20200819131747.13400-1-mwilck@suse.com>
	<20200819131747.13400-3-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200819131747.13400-3-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v3 77/80] libmultipath: log dm_task_run()
	errors
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Aug 19, 2020 at 03:17:47PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Log the ioctl error messages from libdm.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/devmapper.c | 61 ++++++++++++++++++++++++++++++++--------
>  libmultipath/devmapper.h |  4 +++
>  multipathd/dmevents.c    |  4 ++-
>  multipathd/waiter.c      |  2 ++
>  4 files changed, 58 insertions(+), 13 deletions(-)
> 
> diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
> index 38d1990..cc2de1d 100644
> --- a/libmultipath/devmapper.c
> +++ b/libmultipath/devmapper.c
> @@ -182,6 +182,7 @@ dm_tgt_version (unsigned int * version, char * str)
>  	dm_task_no_open_count(dmt);
>  
>  	if (!dm_task_run(dmt)) {
> +		dm_log_error(2, DM_DEVICE_LIST_VERSIONS, dmt);
>  		condlog(0, "Can not communicate with kernel DM");
>  		goto out;
>  	}
> @@ -320,6 +321,8 @@ dm_simplecmd (int task, const char *name, int no_flush, int need_sync, uint16_t
>  		goto out;
>  
>  	r = dm_task_run (dmt);
> +	if (!r)
> +		dm_log_error(2, task, dmt);
>  
>  	if (udev_wait_flag)
>  			dm_udev_wait(cookie);
> @@ -410,6 +413,8 @@ dm_addmap (int task, const char *target, struct multipath *mpp,
>  		goto freeout;
>  
>  	r = dm_task_run (dmt);
> +	if (!r)
> +		dm_log_error(2, task, dmt);
>  
>  	if (task == DM_DEVICE_CREATE)
>  			dm_udev_wait(cookie);
> @@ -522,8 +527,10 @@ do_get_info(const char *name, struct dm_info *info)
>  
>  	dm_task_no_open_count(dmt);
>  
> -	if (!dm_task_run(dmt))
> +	if (!dm_task_run(dmt)) {
> +		dm_log_error(3, DM_DEVICE_INFO, dmt);
>  		goto out;
> +	}
>  
>  	if (!dm_task_get_info(dmt, info))
>  		goto out;
> @@ -562,6 +569,7 @@ int dm_get_map(const char *name, unsigned long long *size, char *outparams)
>  
>  	errno = 0;
>  	if (!dm_task_run(dmt)) {
> +		dm_log_error(3, DM_DEVICE_TABLE, dmt);
>  		if (dm_task_get_errno(dmt) == ENXIO)
>  			r = DMP_NOT_FOUND;
>  		goto out;
> @@ -602,8 +610,10 @@ dm_get_prefixed_uuid(const char *name, char *uuid, int uuid_len)
>  	if (!dm_task_set_name (dmt, name))
>  		goto uuidout;
>  
> -	if (!dm_task_run(dmt))
> +	if (!dm_task_run(dmt)) {
> +		dm_log_error(3, DM_DEVICE_INFO, dmt);
>  		goto uuidout;
> +	}
>  
>  	uuidtmp = dm_task_get_uuid(dmt);
>  	if (uuidtmp)
> @@ -672,6 +682,7 @@ int dm_get_status(const char *name, char *outstatus)
>  
>  	errno = 0;
>  	if (!dm_task_run(dmt)) {
> +		dm_log_error(3, DM_DEVICE_STATUS, dmt);
>  		if (dm_task_get_errno(dmt) == ENXIO)
>  			r = DMP_NOT_FOUND;
>  		goto out;
> @@ -723,8 +734,10 @@ int dm_type(const char *name, char *type)
>  
>  	dm_task_no_open_count(dmt);
>  
> -	if (!dm_task_run(dmt))
> +	if (!dm_task_run(dmt)) {
> +		dm_log_error(3, DM_DEVICE_TABLE, dmt);
>  		goto out;
> +	}
>  
>  	/* Fetch 1st target */
>  	if (dm_get_next_target(dmt, NULL, &start, &length,
> @@ -765,8 +778,10 @@ int dm_is_mpath(const char *name)
>  
>  	dm_task_no_open_count(dmt);
>  
> -	if (!dm_task_run(dmt))
> +	if (!dm_task_run(dmt)) {
> +		dm_log_error(3, DM_DEVICE_TABLE, dmt);
>  		goto out_task;
> +	}
>  
>  	if (!dm_task_get_info(dmt, &info))
>  		goto out_task;
> @@ -827,8 +842,10 @@ dm_map_present_by_uuid(const char *uuid)
>  	if (!dm_task_set_uuid(dmt, prefixed_uuid))
>  		goto out_task;
>  
> -	if (!dm_task_run(dmt))
> +	if (!dm_task_run(dmt)) {
> +		dm_log_error(3, DM_DEVICE_INFO, dmt);
>  		goto out_task;
> +	}
>  
>  	if (!dm_task_get_info(dmt, &info))
>  		goto out_task;
> @@ -871,8 +888,10 @@ dm_get_opencount (const char * mapname)
>  	if (!dm_task_set_name(dmt, mapname))
>  		goto out;
>  
> -	if (!dm_task_run(dmt))
> +	if (!dm_task_run(dmt)) {
> +		dm_log_error(3, DM_DEVICE_INFO, dmt);
>  		goto out;
> +	}
>  
>  	if (!dm_task_get_info(dmt, &info))
>  		goto out;
> @@ -1029,8 +1048,10 @@ int dm_flush_maps (int need_suspend, int retries)
>  
>  	dm_task_no_open_count(dmt);
>  
> -	if (!dm_task_run (dmt))
> +	if (!dm_task_run (dmt)) {
> +		dm_log_error(3, DM_DEVICE_LIST, dmt);
>  		goto out;
> +	}
>  
>  	if (!(names = dm_task_get_names (dmt)))
>  		goto out;
> @@ -1073,8 +1094,10 @@ dm_message(const char * mapname, char * message)
>  
>  	dm_task_no_open_count(dmt);
>  
> -	if (!dm_task_run(dmt))
> +	if (!dm_task_run(dmt)) {
> +		dm_log_error(2, DM_DEVICE_TARGET_MSG, dmt);
>  		goto out;
> +	}
>  
>  	r = 0;
>  out:
> @@ -1191,8 +1214,10 @@ dm_get_maps (vector mp)
>  
>  	dm_task_no_open_count(dmt);
>  
> -	if (!dm_task_run(dmt))
> +	if (!dm_task_run(dmt)) {
> +		dm_log_error(3, DM_DEVICE_LIST, dmt);
>  		goto out;
> +	}
>  
>  	if (!(names = dm_task_get_names(dmt)))
>  		goto out;
> @@ -1283,6 +1308,7 @@ dm_mapname(int major, int minor)
>  	}
>  
>  	if (!r) {
> +		dm_log_error(2, DM_DEVICE_STATUS, dmt);
>  		condlog(0, "%i:%i: timeout fetching map name", major, minor);
>  		goto bad;
>  	}
> @@ -1318,8 +1344,10 @@ do_foreach_partmaps (const char * mapname,
>  
>  	dm_task_no_open_count(dmt);
>  
> -	if (!dm_task_run(dmt))
> +	if (!dm_task_run(dmt)) {
> +		dm_log_error(3, DM_DEVICE_LIST, dmt);
>  		goto out;
> +	}
>  
>  	if (!(names = dm_task_get_names(dmt)))
>  		goto out;
> @@ -1552,6 +1580,8 @@ dm_rename (const char * old, char * new, char *delim, int skip_kpartx)
>  	if (!dm_task_set_cookie(dmt, &cookie, udev_flags))
>  		goto out;
>  	r = dm_task_run(dmt);
> +	if (!r)
> +		dm_log_error(2, DM_DEVICE_RENAME, dmt);
>  
>  	dm_udev_wait(cookie);
>  
> @@ -1595,8 +1625,10 @@ int dm_reassign_table(const char *name, char *old, char *new)
>  
>  	dm_task_no_open_count(dmt);
>  
> -	if (!dm_task_run(dmt))
> +	if (!dm_task_run(dmt)) {
> +		dm_log_error(3, DM_DEVICE_TABLE, dmt);
>  		goto out;
> +	}
>  	if (!(reload_dmt = libmp_dm_task_create(DM_DEVICE_RELOAD)))
>  		goto out;
>  	if (!dm_task_set_name(reload_dmt, name))
> @@ -1627,6 +1659,7 @@ int dm_reassign_table(const char *name, char *old, char *new)
>  		dm_task_no_open_count(reload_dmt);
>  
>  		if (!dm_task_run(reload_dmt)) {
> +			dm_log_error(3, DM_DEVICE_RELOAD, reload_dmt);
>  			condlog(3, "%s: failed to reassign targets", name);
>  			goto out_reload;
>  		}
> @@ -1672,8 +1705,10 @@ int dm_reassign(const char *mapname)
>  
>  	dm_task_no_open_count(dmt);
>  
> -	if (!dm_task_run(dmt))
> +	if (!dm_task_run(dmt)) {
> +		dm_log_error(3, DM_DEVICE_DEPS, dmt);
>  		goto out;
> +	}
>  
>  	if (!dm_task_get_info(dmt, &info))
>  		goto out;
> @@ -1739,6 +1774,8 @@ int dm_setgeometry(struct multipath *mpp)
>  	}
>  
>  	r = dm_task_run(dmt);
> +	if (!r)
> +		dm_log_error(3, DM_DEVICE_SET_GEOMETRY, dmt);
>  out:
>  	dm_task_destroy(dmt);
>  
> diff --git a/libmultipath/devmapper.h b/libmultipath/devmapper.h
> index 6dd178c..f568ab5 100644
> --- a/libmultipath/devmapper.h
> +++ b/libmultipath/devmapper.h
> @@ -85,4 +85,8 @@ struct multipath *dm_get_multipath(const char *name);
>  	((v[0] == minv[0]) && (v[1] == minv[1]) && (v[2] >= minv[2])) \
>  )
>  
> +#define dm_log_error(lvl, cmd, dmt)			      \
> +	condlog(lvl, "%s: libdm task=%d error: %s", __func__, \
> +		cmd, strerror(dm_task_get_errno(dmt)))	      \
> +
>  #endif /* _DEVMAPPER_H */
> diff --git a/multipathd/dmevents.c b/multipathd/dmevents.c
> index b22b47d..b235dd4 100644
> --- a/multipathd/dmevents.c
> +++ b/multipathd/dmevents.c
> @@ -156,8 +156,10 @@ static int dm_get_events(void)
>  
>  	dm_task_no_open_count(dmt);
>  
> -	if (!dm_task_run(dmt))
> +	if (!dm_task_run(dmt)) {
> +		dm_log_error(3, DM_DEVICE_LIST, dmt);
>  		goto fail;
> +	}
>  
>  	if (!(names = dm_task_get_names(dmt)))
>  		goto fail;
> diff --git a/multipathd/waiter.c b/multipathd/waiter.c
> index e645766..16fbdc8 100644
> --- a/multipathd/waiter.c
> +++ b/multipathd/waiter.c
> @@ -119,6 +119,8 @@ static int waiteventloop (struct event_thread *waiter)
>  
>  	pthread_testcancel();
>  	r = dm_task_run(waiter->dmt);
> +	if (!r)
> +		dm_log_error(2, DM_DEVICE_WAITEVENT, waiter->dmt);
>  	pthread_testcancel();
>  
>  	pthread_sigmask(SIG_SETMASK, &oldset, NULL);
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

