Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C9E5A244133
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 00:24:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597357468;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KBuUviKAE09a3QIId633Or/KAlLx0ap596+tfiDJhxA=;
	b=CkDI4t1raLIRBXBQmoUzNNXmQ4FZZYvPtxPPWMIlmU+wnRxPy6tc9x0Sk1+EhwDOK8ugXY
	nsOxNVq+5C4uUJvvZ1PXm5MD94LFrk6ZB8ObQzrqeO5/yR3GQu9PfwJFT+jOOh4jRVBKVd
	6SwQMIFuaBPbpvPHWTaKOZmYMz+RDOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-SAswFDsDP4iR0Q4fD4GS_w-1; Thu, 13 Aug 2020 18:24:27 -0400
X-MC-Unique: SAswFDsDP4iR0Q4fD4GS_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C90E4100CA95;
	Thu, 13 Aug 2020 22:24:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0DD471D1F;
	Thu, 13 Aug 2020 22:24:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7CE801826D2A;
	Thu, 13 Aug 2020 22:24:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DMO3j7008746 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 18:24:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D4FFC10021AA; Thu, 13 Aug 2020 22:24:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAD4010023BB;
	Thu, 13 Aug 2020 22:24:00 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07DMNxhT030418; 
	Thu, 13 Aug 2020 17:23:59 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07DMNxAf030417;
	Thu, 13 Aug 2020 17:23:59 -0500
Date: Thu, 13 Aug 2020 17:23:59 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200813222359.GY19233@octiron.msp.redhat.com>
References: <20200812113405.26206-1-mwilck@suse.com>
	<20200812113405.26206-3-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200812113405.26206-3-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 41/42] libmultipath: refuse reloading an
 existing map with different WWID
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Aug 12, 2020 at 01:34:05PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> If a map with given name (alias) already exists with a different WWID,
> reloading it with a new WWID is harmful. The existing paths would first
> be replaced by others with the new WWID. The WWIDs of the new paths wouldn't
> match the map WWID; thus the next time the map is disassembled, the (correct)
> path WWIDs would be overwritten by the different map WWID (with subsequent
> patches from this series, they'd be orphaned instead, which is better but
> still not ideal). When the map is reloaded later, paths with diffent WWIDs
> may be mixed, causing data corruption.
> 
> Refuse reloading a map under such circumstances.
> 
> Note: this patch doesn't change multipath-tools behavior in the case
> where valid map aliases are supposed to be swapped (typically if the bindings
> file differs between initrd and root FS). In this case, select_action()
> selects ACT_RENAME, which this patch doesn't affect. The user-visible behavior
> in this case remains as-is: the map renames fail, and the aliases remain
> unchanged, thus not matching the current bindings file, but art least
> internally consistent.
> 
> To fully fix this use case, coalesce_paths() must cease setting up maps one
> by one. Instead, we'd need to build up a full set of maps-to-be-set-up,
> and create them in a single batch, figuring out a "rename strategy" beforehand
> to avoid clashes between existing and to-be-created maps (for example,
> a name swap A<->B would need to be carried out as B->tmp, A->B, tmp->A).
> Implementing that is out of the scope of this patch series.
>

We need to do something about this, and this is an easy stop-gap, so I'm
fine with this patch.  However it might be better check if we can fall
back to using the wwid for the alias (we should always be able to,
unless people pick really bad aliases in /etc/multipath.conf). This will
allow us to create the device.  It can always get renamed later, and all
things being equal, it seems better to have a device with a wwid alias,
than to have no device at all.

Also, I do wonder if we can't still setup devices one at a time.  As
long as we agree that it is unsupported to configure multipath so that
two devices have the same alias or to configure a device with an alias
that matches another device's wwid, and that we can't guarantee what the
devices will be named in that case (or even that there names won't
change when commands are run), it seems doable.

If we are reloading all the devices, and there is an A<->B alias swap,
when we reload A (assume that's the first one we see, with a wwid of
WWID1) we notice that there already is an existing device named B (with
a wwid of WWID2). Before continuing with the reload of A, we reanme B to
WWID2 (which should work. If not we refuse the reload of A). When we
later get to the device now named WWID2, we can rename it to A.

If we are only reloading a single device, I'm fine with failing, with a
message telling the user to reload all devices to fix the issue. I'm
also open to convinced that it would be o.k. to rename a device that we
weren't planing on reloading, because it has a wrong alias, which messes
with the device that we were supposed to reload (I assume this makes the
code easier). Does that sound like a reasonable solution?
 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/configure.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/libmultipath/configure.c b/libmultipath/configure.c
> index 315eb6a..5f60f74 100644
> --- a/libmultipath/configure.c
> +++ b/libmultipath/configure.c
> @@ -897,10 +897,21 @@ int domap(struct multipath *mpp, char *params, int is_daemon)
>  		return DOMAP_DRY;
>  	}
>  
> -	if (mpp->action == ACT_CREATE &&
> -	    dm_map_present(mpp->alias)) {
> -		condlog(3, "%s: map already present", mpp->alias);
> -		mpp->action = ACT_RELOAD;
> +	if (mpp->action == ACT_CREATE && dm_map_present(mpp->alias)) {
> +		char wwid[WWID_SIZE];
> +
> +		if (dm_get_uuid(mpp->alias, wwid, sizeof(wwid)) == 0) {
> +			if (!strncmp(mpp->wwid, wwid, sizeof(wwid))) {
> +				condlog(3, "%s: map already present",
> +					mpp->alias);
> +				mpp->action = ACT_RELOAD;
> +			} else {
> +				condlog(0, "%s: map \"%s\" already present with WWID %s, skipping",
> +					mpp->wwid, mpp->alias, wwid);
> +				condlog(0, "please check alias settings in config and bindings file");
> +				mpp->action = ACT_REJECT;
> +			}
> +		}
>  	}
>  
>  	switch (mpp->action) {
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

