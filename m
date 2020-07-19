Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D2903224F74
	for <lists+dm-devel@lfdr.de>; Sun, 19 Jul 2020 06:48:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595134082;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z19U7eNC7Am9yl88TXT+Ay+ttJ+QRr56LTq8e61t3fI=;
	b=AMT+puuSK93//AhBWDGcJGFjbF65ztO0HQo5M+JgHIvCBMb7UzCBU81Ii8fj87TgIxFVDF
	kR59NVSDrqwa8VFj9I3UCJadqfU8gjWJgvPfwxh0UP5hu5LPygZN33LtNMU/NI1hPwGiG2
	nsIG/cL0JHj/IFymS/yJEBn1qNO9r6I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-gbtaG-2DPEe23Wh5kV3NPQ-1; Sun, 19 Jul 2020 00:47:59 -0400
X-MC-Unique: gbtaG-2DPEe23Wh5kV3NPQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5C851083;
	Sun, 19 Jul 2020 04:47:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D95D75C1D4;
	Sun, 19 Jul 2020 04:47:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E2FE81809554;
	Sun, 19 Jul 2020 04:47:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06J4kpFl015331 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 19 Jul 2020 00:46:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 61DC310027A5; Sun, 19 Jul 2020 04:46:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38064100238C;
	Sun, 19 Jul 2020 04:46:48 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06J4kkVM006920; 
	Sat, 18 Jul 2020 23:46:46 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06J4kjAA006919;
	Sat, 18 Jul 2020 23:46:45 -0500
Date: Sat, 18 Jul 2020 23:46:45 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200719044645.GV11089@octiron.msp.redhat.com>
References: <20200709105145.9211-1-mwilck@suse.com>
	<20200709105145.9211-13-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200709105145.9211-13-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 65/74] libmultipath: add
	update_pathvec_from_dm()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 09, 2020 at 12:51:36PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> It can happen in particular during boot or startup that we encounter
> paths as map members which haven't been discovered or fully initialized
> yet, and are thus not in the pathvec. These paths need special treatment
> in various ways. Currently this is dealt with in disassemble_map(). That's
> a layer violation, and the way it is done is suboptimal in various ways.
> 
> As a preparation to change that, this patch introduces a new function,
> update_pathvec_from_dm(), that is supposed to deal with newly discovered
> paths from disassemble_map(). It has to be called after disassemble_map()
> has finished.

I don't really understand the reason for adding paths to pathvec, just
because they appear in disassemble_map(). If multipathd sees a map with
a path that it doesn't have in pathvec, then that path should either
sortly appear, or multipathd likely doesn't have it for a reason.  I
agree that it's possible that uevent got missed, but it seems more
likely that the user updated multipath.conf and hasn't reconfigured
multipathd. 

Maybe when I read future patches this will make more sense, but can't
multipathd add paths to the pathvec that it is configured to blacklist.
I would like to think that multipathd is definitive for the multipath
devices that it controls.  If multipathd doesn't think a path belongs in
a multipath device, then the path doesn't belong in the multipath
device. There are corner cases where a path can appear in a multipath
device before multipathd gets notified about the path, but they all seem
pretty rare. Someone running "multipath" before multipathd has seen the
path addition uevent, for instance. Perhaps if pathinfo() should always
set DI_BLACKLIST, and if the path is skipped, flag the device for
reloading.
 
> The logic of the new function is similar but not identical to what
> disassemble_map() was doing before. Firstly, the function will simply
> remove path devices that don't exist - there's no point in carrying these
> around. Map reloads can't be called from this code for reasons of the
> overall program logic. But it's prepared to signal to the caller that
> a map reload is in order. Using this return value will be future work.
> 
> Second, pathinfo() is now called on new paths rather than just setting
> pp->dev. The pathinfo flags can be passed as argument to make the function
> flexible for different callers.
> 
> Finally, treatment of WWIDs is different now. There'll be only one attempt
> at guessing the map WWID if it's not set yet. If a non-matching path WWID
> is found, the path is removed, and a new uevent triggered (this is the
> most important change wrt the dangerous previous code that would simply
> overwrite the path WWID). If the path WWID is empty, it will still be
> set from the map WWID, which I consider not perfect, but no worse
> than what we did before.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/structs_vec.c | 134 +++++++++++++++++++++++++++++++++++++
>  libmultipath/structs_vec.h |   2 +
>  2 files changed, 136 insertions(+)
> 
> diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
> index 1e0f109..5dd37d5 100644
> --- a/libmultipath/structs_vec.c
> +++ b/libmultipath/structs_vec.c
> @@ -59,6 +59,140 @@ int update_mpp_paths(struct multipath *mpp, vector pathvec)
>  	return store_failure;
>  }
>  
> +static bool guess_mpp_wwid(struct multipath *mpp)
> +{
> +	int i, j;
> +	struct pathgroup *pgp;
> +	struct path *pp;
> +
> +	if (strlen(mpp->wwid) || !mpp->pg)
> +		return true;
> +
> +	vector_foreach_slot(mpp->pg, pgp, i) {
> +		if (!pgp->paths)
> +			continue;
> +		vector_foreach_slot(pgp->paths, pp, j) {
> +			if (pp->initialized == INIT_OK && strlen(pp->wwid)) {
> +				strlcpy(mpp->wwid, pp->wwid, sizeof(mpp->wwid));
> +				condlog(2, "%s: guessed WWID %s from path %s",
> +					mpp->alias, mpp->wwid, pp->dev);
> +				return true;
> +			}
> +		}
> +	}
> +	condlog(1, "%s: unable to guess WWID", mpp->alias);
> +	return false;
> +}
> +
> +/*
> + * update_pathvec_from_dm() - update pathvec after disassemble_map()
> + *
> + * disassemble_map() may return block devices that are members in
> + * multipath maps but haven't been discovered. Check whether they
> + * need to be added to pathvec or discarded.
> + *
> + * Returns: true if immediate map reload is desirable
> + *
> + * Side effects:
> + * - may delete non-existing paths and empty pathgroups from mpp
> + * - may set pp->wwid and / or mpp->wwid
> + * - calls pathinfo() on existing paths is pathinfo_flags is not 0
> + */
> +bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
> +	int pathinfo_flags)
> +{
> +	int i, j;
> +	struct pathgroup *pgp;
> +	struct path *pp;
> +	struct config *conf;
> +	bool mpp_has_wwid;
> +	bool must_reload = false;
> +
> +	if (!mpp->pg)
> +		return false;
> +
> +	mpp_has_wwid = guess_mpp_wwid(mpp);
> +
> +	vector_foreach_slot(mpp->pg, pgp, i) {
> +		if (!pgp->paths)
> +			goto delete_pg;
> +
> +		vector_foreach_slot(pgp->paths, pp, j) {
> +			pp->mpp = mpp;
> +
> +			if (pp->udev) {
> +				if (pathinfo_flags) {
> +					conf = get_multipath_config();
> +					pthread_cleanup_push(put_multipath_config,
> +							     conf);
> +					pathinfo(pp, conf, pathinfo_flags);
> +					pthread_cleanup_pop(1);
> +				}
> +				continue;

I suppose that if pp->udev is set then the path is in pathvec, but the
lack of check seemed odd to me. 

> +			}
> +
> +			/* If this fails, the device is not in sysfs */
> +			pp->udev = get_udev_device(pp->dev_t, DEV_DEVT);
> +			if (!pp->udev) {
> +				condlog(2, "%s: discarding non-existing path %s",
> +					mpp->alias, pp->dev_t);
> +				vector_del_slot(pgp->paths, j--);
> +				free_path(pp);
> +				must_reload = true;
> +			} else {
> +
> +				devt2devname(pp->dev, sizeof(pp->dev),
> +					     pp->dev_t);
> +				conf = get_multipath_config();
> +				pthread_cleanup_push(put_multipath_config,
> +						     conf);
> +				pp->checkint = conf->checkint;
> +				if (pathinfo(pp, conf,
> +					     DI_SYSFS|DI_WWID|pathinfo_flags)
> +				    != PATHINFO_OK)
> +					condlog(1, "%s: error in pathinfo",
> +						pp->dev);

This seems wrong to me.  A blacklisted path shouldn't be added to
pathvec.

> +				pthread_cleanup_pop(1);
> +				if (mpp_has_wwid && !strlen(pp->wwid)) {
> +					condlog(3, "%s: setting wwid from map: %s",
> +						pp->dev, mpp->wwid);
> +					strlcpy(pp->wwid, mpp->wwid,
> +						sizeof(pp->wwid));
> +				} else if (mpp_has_wwid &&
> +					   strcmp(mpp->wwid, pp->wwid)) {
> +
> +					condlog(0, "%s: path %s WWID %s doesn't match, removing from map",
> +						mpp->wwid, pp->dev_t, pp->wwid);
> +					/*
> +					 * This path exists, but in the wong map.
> +					 * We can't reload the map from here.
> +					 * Instead, treat this path like "missing udev",
> +					 * which it probably is.
> +					 * check_path() will trigger an uevent
> +					 * and reset pp->tick.
> +					 */
> +					must_reload = true;
> +					pp->mpp = NULL;
> +					dm_fail_path(mpp->alias, pp->dev_t);
> +					vector_del_slot(pgp->paths, j--);
> +					pp->initialized = INIT_MISSING_UDEV;
> +					pp->tick = 1;
> +				}
> +				condlog(2, "%s: adding new path %s",
> +					mpp->alias, pp->dev);
> +				store_path(pathvec, pp);
> +			}
> +		}
> +		if (VECTOR_SIZE(pgp->paths) != 0)
> +			continue;
> +	delete_pg:
> +		condlog(2, "%s: removing empty pathgroup %d", mpp->alias, i);
> +		vector_del_slot(mpp->pg, i--);
> +		free_pathgroup(pgp, KEEP_PATHS);

Should this flag the device for reloading, to remove the useless path
group?

> +	}
> +	return must_reload;
> +}
> +
>  int adopt_paths(vector pathvec, struct multipath *mpp)
>  {
>  	int i, ret;
> diff --git a/libmultipath/structs_vec.h b/libmultipath/structs_vec.h
> index cd3ef76..4c28148 100644
> --- a/libmultipath/structs_vec.h
> +++ b/libmultipath/structs_vec.h
> @@ -21,6 +21,8 @@ void orphan_path (struct path * pp, const char *reason);
>  void set_path_removed(struct path *pp);
>  
>  int verify_paths(struct multipath *mpp);
> +bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
> +			    int pathinfo_flags);
>  int update_mpp_paths(struct multipath * mpp, vector pathvec);
>  int update_multipath_strings (struct multipath *mpp, vector pathvec,
>  			      int is_daemon);
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

