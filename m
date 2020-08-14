Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 82742244471
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 07:09:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597381766;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PfTGj2RDhcpRyJ3w+todi9RHa6UKKUD4qzJ+HcBE3B0=;
	b=aSrsL5PAjBJKQY08qBBH7jn6MfSwN9xJU0N2Mtc+SbghRVQc5oAtYMwUmt3XkdCFTyFgec
	iB5ksjiABnwTXP2qFiwH3k+K9ZAdzM+nbA1zcoUD9k1elDvIHQxjSgq7HdEIFbBD4jZ5/m
	o9Zxdvc+4+S9LkfT8qrILHbfMnVrgrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-5Fe0beogNaau1Mx2MTWTXA-1; Fri, 14 Aug 2020 01:09:23 -0400
X-MC-Unique: 5Fe0beogNaau1Mx2MTWTXA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBE8B1005E5B;
	Fri, 14 Aug 2020 05:09:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A9085C1A3;
	Fri, 14 Aug 2020 05:09:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E28F24EE16;
	Fri, 14 Aug 2020 05:09:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07E58VDZ027883 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 14 Aug 2020 01:08:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C4FE339A55; Fri, 14 Aug 2020 05:08:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DD72600E4;
	Fri, 14 Aug 2020 05:08:28 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07E58QEL032095; 
	Fri, 14 Aug 2020 00:08:26 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07E58PTY032094;
	Fri, 14 Aug 2020 00:08:26 -0500
Date: Fri, 14 Aug 2020 00:08:25 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200814050825.GE19233@octiron.msp.redhat.com>
References: <20200812113511.26469-1-mwilck@suse.com>
	<20200812113511.26469-7-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200812113511.26469-7-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 65/74] libmultipath: add
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Aug 12, 2020 at 01:35:09PM +0200, mwilck@suse.com wrote:
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
> 
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
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/structs_vec.c | 136 +++++++++++++++++++++++++++++++++++++
>  libmultipath/structs_vec.h |   2 +
>  2 files changed, 138 insertions(+)
> 
> diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
> index b644d3f..bd2d13b 100644
> --- a/libmultipath/structs_vec.c
> +++ b/libmultipath/structs_vec.c
> @@ -59,6 +59,142 @@ int update_mpp_paths(struct multipath *mpp, vector pathvec)
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
> +	/*
> +	 * This will initialize mpp->wwid with an educated guess,
> +	 * either from the dm uuid or from a member path with properly
> +	 * determined WWID.
> +	 */
> +	mpp_has_wwid = guess_mpp_wwid(mpp);
> +
> +	vector_foreach_slot(mpp->pg, pgp, i) {
> +		if (!pgp->paths)
> +			goto delete_pg;
> +
> +		vector_foreach_slot(pgp->paths, pp, j) {
> +			pp->mpp = mpp;
> +
> +			/*
> +			 * The way disassemble_map() works: If it encounters a
> +			 * path device which isn't found in pathvec, it adds an
> +			 * uninitialized struct path to pgp->paths, with only
> +			 * pp->dev_t filled in. Thus if pp->udev is set here,
> +			 * we know that the path is in pathvec already.
> +			 */
> +			if (pp->udev) {
> +				if (pathinfo_flags) {
> +					conf = get_multipath_config();
> +					pthread_cleanup_push(put_multipath_config,
> +							     conf);
> +					pathinfo(pp, conf, pathinfo_flags);
> +					pthread_cleanup_pop(1);
> +				}
> +				continue;
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
> +				int rc;
> +
> +				devt2devname(pp->dev, sizeof(pp->dev),
> +					     pp->dev_t);
> +				conf = get_multipath_config();
> +				pthread_cleanup_push(put_multipath_config,
> +						     conf);
> +				pp->checkint = conf->checkint;
> +				rc = pathinfo(pp, conf,
> +					      DI_SYSFS|DI_WWID|DI_BLACKLIST|
> +					      pathinfo_flags);
> +				pthread_cleanup_pop(1);
> +				if (rc != PATHINFO_OK) {
> +					condlog(1, "%s: error %d in pathinfo, discarding path",
> +						pp->dev, rc);
> +					vector_del_slot(pgp->paths, j--);
> +					free_path(pp);
> +					must_reload = true;
> +				} else {
> +					if (mpp_has_wwid && !strlen(pp->wwid)) {
> +						condlog(3, "%s: setting wwid from map: %s",
> +							pp->dev, mpp->wwid);
> +						strlcpy(pp->wwid, mpp->wwid,
> +							sizeof(pp->wwid));
> +					}
> +					condlog(2, "%s: adding new path %s",
> +						mpp->alias, pp->dev);
> +					store_path(pathvec, pp);
> +					pp->tick = 1;
> +				}
> +			}
> +		}
> +		if (VECTOR_SIZE(pgp->paths) != 0)
> +			continue;
> +	delete_pg:
> +		condlog(2, "%s: removing empty pathgroup %d", mpp->alias, i);
> +		vector_del_slot(mpp->pg, i--);
> +		free_pathgroup(pgp, KEEP_PATHS);
> +		must_reload = true;
> +	}
> +	return must_reload;
> +}
> +
>  int adopt_paths(vector pathvec, struct multipath *mpp)
>  {
>  	int i, ret;
> diff --git a/libmultipath/structs_vec.h b/libmultipath/structs_vec.h
> index d7dfe32..6c79069 100644
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
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

