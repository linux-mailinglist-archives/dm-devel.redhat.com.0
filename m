Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED623D694F
	for <lists+dm-devel@lfdr.de>; Tue, 27 Jul 2021 00:18:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627337890;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Mo7oPijRTm/VMFDs4BCKGEpR2A9dvdnCH/1fEWhFwEI=;
	b=KKmqKuyiQbsmEjRlr9tBX2h1C0+BO3A9ZGcJva4fa4GPjUa3NzCr7O5iklm9ZACh3ZIaxC
	4utxaTYaZVa0i8G4UJ5YQTiEbehn57FmpXxx9VKoN3iQj+/DkS3yAuvJZj/0NZdFBQDD/T
	3VsiFxfYhPNSrxKyvnTENfD9s6rvlF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-yVvgdB_kO2-8_RXht8uUKg-1; Mon, 26 Jul 2021 18:18:08 -0400
X-MC-Unique: yVvgdB_kO2-8_RXht8uUKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7CB21853027;
	Mon, 26 Jul 2021 22:18:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1496360C0F;
	Mon, 26 Jul 2021 22:17:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6037F4BB7C;
	Mon, 26 Jul 2021 22:17:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16QMHO0V026078 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 18:17:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 17A6519D9F; Mon, 26 Jul 2021 22:17:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFEDA19D7C;
	Mon, 26 Jul 2021 22:17:19 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 16QMHImJ027761; 
	Mon, 26 Jul 2021 17:17:18 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 16QMHHoM027760;
	Mon, 26 Jul 2021 17:17:17 -0500
Date: Mon, 26 Jul 2021 17:17:17 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210726221717.GI3087@octiron.msp.redhat.com>
References: <20210715105223.30463-1-mwilck@suse.com>
	<20210715105223.30463-2-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210715105223.30463-2-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 1/9] libmultipath: variable-size parameters
 in dm_get_map()
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 15, 2021 at 12:52:15PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> We've seen a crash of multipath in disassemble_map because of a params
> string exceeding PARAMS_SIZE. While the crash could have been fixed by
> a simple error check, I believe multipath should be able to work with
> arbitrary long parameter strings passed from the kernel.
> 
> The parameter list of dm_get_map() has changed. Bumped ABI version and
> removed dm_get_map() and some functions from the ABI, which are only
> called from libmultipath itself.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/devmapper.c          | 44 ++++++++++++++++++++-----------
>  libmultipath/devmapper.h          |  4 +--
>  libmultipath/libmultipath.version |  6 +----
>  libmultipath/structs_vec.c        | 11 +++++---
>  4 files changed, 38 insertions(+), 27 deletions(-)
> 
> diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
> index 945e625..a5194d8 100644
> --- a/libmultipath/devmapper.c
> +++ b/libmultipath/devmapper.c
> @@ -648,7 +648,7 @@ int dm_map_present(const char * str)
>  	return (do_get_info(str, &info) == 0);
>  }
>  
> -int dm_get_map(const char *name, unsigned long long *size, char *outparams)
> +int dm_get_map(const char *name, unsigned long long *size, char **outparams)
>  {
>  	int r = DMP_ERR;
>  	struct dm_task *dmt;
> @@ -682,12 +682,13 @@ int dm_get_map(const char *name, unsigned long long *size, char *outparams)
>  	if (size)
>  		*size = length;
>  
> -	if (!outparams) {
> +	if (!outparams)
>  		r = DMP_OK;
> -		goto out;
> +	else {
> +		*outparams = strdup(params);
> +		r = *outparams ? DMP_OK : DMP_ERR;
>  	}
> -	if (snprintf(outparams, PARAMS_SIZE, "%s", params) <= PARAMS_SIZE)
> -		r = DMP_OK;
> +
>  out:
>  	dm_task_destroy(dmt);
>  	return r;
> @@ -761,7 +762,7 @@ is_mpath_part(const char *part_name, const char *map_name)
>  	return 0;
>  }
>  
> -int dm_get_status(const char *name, char *outstatus)
> +int dm_get_status(const char *name, char **outstatus)
>  {
>  	int r = DMP_ERR;
>  	struct dm_task *dmt;
> @@ -799,8 +800,12 @@ int dm_get_status(const char *name, char *outstatus)
>  		goto out;
>  	}
>  
> -	if (snprintf(outstatus, PARAMS_SIZE, "%s", status) <= PARAMS_SIZE)
> +	if (!outstatus)
>  		r = DMP_OK;
> +	else {
> +		*outstatus = strdup(status);
> +		r = outstatus ? DMP_OK : DMP_ERR;

Missing the dereference here "r = *outstatus ?"

-Ben

> +	}
>  out:
>  	if (r != DMP_OK)
>  		condlog(0, "%s: error getting map status string", name);
> @@ -1049,7 +1054,7 @@ int _dm_flush_map (const char * mapname, int need_sync, int deferred_remove,
>  	int queue_if_no_path = 0;
>  	int udev_flags = 0;
>  	unsigned long long mapsize;
> -	char params[PARAMS_SIZE] = {0};
> +	char *params = NULL;
>  
>  	if (dm_is_mpath(mapname) != 1)
>  		return 0; /* nothing to do */
> @@ -1065,7 +1070,7 @@ int _dm_flush_map (const char * mapname, int need_sync, int deferred_remove,
>  			return 1;
>  
>  	if (need_suspend &&
> -	    dm_get_map(mapname, &mapsize, params) == DMP_OK &&
> +	    dm_get_map(mapname, &mapsize, &params) == DMP_OK &&
>  	    strstr(params, "queue_if_no_path")) {
>  		if (!dm_queue_if_no_path(mapname, 0))
>  			queue_if_no_path = 1;
> @@ -1073,6 +1078,8 @@ int _dm_flush_map (const char * mapname, int need_sync, int deferred_remove,
>  			/* Leave queue_if_no_path alone if unset failed */
>  			queue_if_no_path = -1;
>  	}
> +	free(params);
> +	params = NULL;
>  
>  	if (dm_remove_partmaps(mapname, need_sync, deferred_remove))
>  		return 1;
> @@ -1431,7 +1438,7 @@ do_foreach_partmaps (const char * mapname,
>  	struct dm_task *dmt;
>  	struct dm_names *names;
>  	unsigned next = 0;
> -	char params[PARAMS_SIZE];
> +	char *params = NULL;
>  	unsigned long long size;
>  	char dev_t[32];
>  	int r = 1;
> @@ -1474,7 +1481,7 @@ do_foreach_partmaps (const char * mapname,
>  		    /*
>  		     * and we can fetch the map table from the kernel
>  		     */
> -		    dm_get_map(names->name, &size, &params[0]) == DMP_OK &&
> +		    dm_get_map(names->name, &size, &params) == DMP_OK &&
>  
>  		    /*
>  		     * and the table maps over the multipath map
> @@ -1486,12 +1493,15 @@ do_foreach_partmaps (const char * mapname,
>  				goto out;
>  		}
>  
> +		free(params);
> +		params = NULL;
>  		next = names->next;
>  		names = (void *) names + next;
>  	} while (next);
>  
>  	r = 0;
>  out:
> +	free(params);
>  	dm_task_destroy (dmt);
>  	return r;
>  }
> @@ -1620,17 +1630,19 @@ struct rename_data {
>  static int
>  rename_partmap (const char *name, void *data)
>  {
> -	char buff[PARAMS_SIZE];
> +	char *buff = NULL;
>  	int offset;
>  	struct rename_data *rd = (struct rename_data *)data;
>  
>  	if (strncmp(name, rd->old, strlen(rd->old)) != 0)
>  		return 0;
>  	for (offset = strlen(rd->old); name[offset] && !(isdigit(name[offset])); offset++); /* do nothing */
> -	snprintf(buff, PARAMS_SIZE, "%s%s%s", rd->new, rd->delim,
> -		 name + offset);
> -	dm_rename(name, buff, rd->delim, SKIP_KPARTX_OFF);
> -	condlog(4, "partition map %s renamed", name);
> +	if (asprintf(&buff, "%s%s%s", rd->new, rd->delim, name + offset) >= 0) {
> +		dm_rename(name, buff, rd->delim, SKIP_KPARTX_OFF);
> +		free(buff);
> +		condlog(4, "partition map %s renamed", name);
> +	} else
> +		condlog(1, "failed to rename partition map %s", name);
>  	return 0;
>  }
>  
> diff --git a/libmultipath/devmapper.h b/libmultipath/devmapper.h
> index e29b4d4..45a676d 100644
> --- a/libmultipath/devmapper.h
> +++ b/libmultipath/devmapper.h
> @@ -44,8 +44,8 @@ int dm_addmap_create (struct multipath *mpp, char *params);
>  int dm_addmap_reload (struct multipath *mpp, char *params, int flush);
>  int dm_map_present (const char *);
>  int dm_map_present_by_uuid(const char *uuid);
> -int dm_get_map(const char *, unsigned long long *, char *);
> -int dm_get_status(const char *, char *);
> +int dm_get_map(const char *, unsigned long long *, char **);
> +int dm_get_status(const char *, char **);
>  int dm_type(const char *, char *);
>  int dm_is_mpath(const char *);
>  int _dm_flush_map (const char *, int, int, int, int);
> diff --git a/libmultipath/libmultipath.version b/libmultipath/libmultipath.version
> index 0cff311..7567837 100644
> --- a/libmultipath/libmultipath.version
> +++ b/libmultipath/libmultipath.version
> @@ -31,7 +31,7 @@
>   *   The new version inherits the previous ones.
>   */
>  
> -LIBMULTIPATH_5.0.0 {
> +LIBMULTIPATH_6.0.0 {
>  global:
>  	/* symbols referenced by multipath and multipathd */
>  	add_foreign;
> @@ -58,8 +58,6 @@ global:
>  	count_active_paths;
>  	delete_all_foreign;
>  	delete_foreign;
> -	disassemble_map;
> -	disassemble_status;
>  	dlog;
>  	dm_cancel_deferred_remove;
>  	dm_enablegroup;
> @@ -70,10 +68,8 @@ global:
>  	dm_geteventnr;
>  	dm_get_info;
>  	dm_get_major_minor;
> -	dm_get_map;
>  	dm_get_maps;
>  	dm_get_multipath;
> -	dm_get_status;
>  	dm_get_uuid;
>  	dm_is_mpath;
>  	dm_mapname;
> diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
> index 7539019..24d6fd2 100644
> --- a/libmultipath/structs_vec.c
> +++ b/libmultipath/structs_vec.c
> @@ -416,12 +416,12 @@ int
>  update_multipath_table (struct multipath *mpp, vector pathvec, int flags)
>  {
>  	int r = DMP_ERR;
> -	char params[PARAMS_SIZE] = {0};
> +	char *params = NULL;
>  
>  	if (!mpp)
>  		return r;
>  
> -	r = dm_get_map(mpp->alias, &mpp->size, params);
> +	r = dm_get_map(mpp->alias, &mpp->size, &params);
>  	if (r != DMP_OK) {
>  		condlog(2, "%s: %s", mpp->alias, (r == DMP_ERR)? "error getting table" : "map not present");
>  		return r;
> @@ -429,14 +429,17 @@ update_multipath_table (struct multipath *mpp, vector pathvec, int flags)
>  
>  	if (disassemble_map(pathvec, params, mpp)) {
>  		condlog(2, "%s: cannot disassemble map", mpp->alias);
> +		free(params);
>  		return DMP_ERR;
>  	}
>  
> -	*params = '\0';
> -	if (dm_get_status(mpp->alias, params) != DMP_OK)
> +	free(params);
> +	params = NULL;
> +	if (dm_get_status(mpp->alias, &params) != DMP_OK)
>  		condlog(2, "%s: %s", mpp->alias, (r == DMP_ERR)? "error getting status" : "map not present");
>  	else if (disassemble_status(params, mpp))
>  		condlog(2, "%s: cannot disassemble status", mpp->alias);
> +	free(params);
>  
>  	/* FIXME: we should deal with the return value here */
>  	update_pathvec_from_dm(pathvec, mpp, flags);
> -- 
> 2.32.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

