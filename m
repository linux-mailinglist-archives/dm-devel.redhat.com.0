Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7904D22702E
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 23:12:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595279532;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Mg8+mEYx/FeVYFRiYivruOP4fYgN4cz5CwlnhiR2+HA=;
	b=auwL0ICdUGyWGQzKerCqZ+CBnY7CkGP8+Hs1+4NcOyz2p5gUflVUP8W45rJN9fX2auQf6r
	agRXHKfR3hQ3/ixs59RWmBcbWya2UZKCF3+el20mM7kOmYHuWuXPLITE01SaBHdpoAmwCY
	Bw686i4TDdAlvYeq/FLelak2zrSV2iI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-LrJXMg4QOCufi4Q0dCdyIw-1; Mon, 20 Jul 2020 17:12:09 -0400
X-MC-Unique: LrJXMg4QOCufi4Q0dCdyIw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D71D106B242;
	Mon, 20 Jul 2020 21:12:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BB8F4DA91;
	Mon, 20 Jul 2020 21:12:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3120E94EFC;
	Mon, 20 Jul 2020 21:12:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06KLB5SD016168 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 17:11:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5791D7848A; Mon, 20 Jul 2020 21:11:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9738B6FEE9;
	Mon, 20 Jul 2020 21:11:02 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06KLB1PO018855; 
	Mon, 20 Jul 2020 16:11:01 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06KLB0TE018854;
	Mon, 20 Jul 2020 16:11:00 -0500
Date: Mon, 20 Jul 2020 16:11:00 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200720211100.GE11089@octiron.msp.redhat.com>
References: <20200709103513.8142-1-mwilck@suse.com>
	<20200709103513.8142-4-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200709103513.8142-4-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 42/42] libmultipath: dm_addmap(): refuse
 creating map with empty WWID
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

On Thu, Jul 09, 2020 at 12:35:13PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> We already avoid creating maps with empty WWID in coalesce_paths()
> as well as in ev_add_path(). The only code path where it's difficult
> to prove (although extremely unlikely) that we can't call
> dm_addmap(ACT_CREATE) with an empty WWID is update_path_groups()->
> reload_map(). To make the code easier to review and avoid ugly
> corner cases, simply refuse to create maps with a zero-length
> WWID.
> 

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/devmapper.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
> index a177a54..fb7675c 100644
> --- a/libmultipath/devmapper.c
> +++ b/libmultipath/devmapper.c
> @@ -352,6 +352,12 @@ dm_addmap (int task, const char *target, struct multipath *mpp,
>  	char *prefixed_uuid = NULL;
>  	uint32_t cookie = 0;
>  
> +	if (task == DM_DEVICE_CREATE && strlen(mpp->wwid) == 0) {
> +		condlog(1, "%s: refusing to create map with empty WWID",
> +			mpp->alias);
> +		return 0;
> +	}
> +
>  	/* Need to add this here to allow 0 to be passed in udev_flags */
>  	udev_flags |= DM_UDEV_DISABLE_LIBRARY_FALLBACK;
>  
> @@ -368,18 +374,16 @@ dm_addmap (int task, const char *target, struct multipath *mpp,
>  		dm_task_set_ro(dmt);
>  
>  	if (task == DM_DEVICE_CREATE) {
> -		if (strlen(mpp->wwid) > 0) {
> -			prefixed_uuid = MALLOC(UUID_PREFIX_LEN +
> -					       strlen(mpp->wwid) + 1);
> -			if (!prefixed_uuid) {
> -				condlog(0, "cannot create prefixed uuid : %s",
> -					strerror(errno));
> -				goto addout;
> -			}
> -			sprintf(prefixed_uuid, UUID_PREFIX "%s", mpp->wwid);
> -			if (!dm_task_set_uuid(dmt, prefixed_uuid))
> -				goto freeout;
> +		prefixed_uuid = MALLOC(UUID_PREFIX_LEN +
> +				       strlen(mpp->wwid) + 1);
> +		if (!prefixed_uuid) {
> +			condlog(0, "cannot create prefixed uuid : %s",
> +				strerror(errno));
> +			goto addout;
>  		}
> +		sprintf(prefixed_uuid, UUID_PREFIX "%s", mpp->wwid);
> +		if (!dm_task_set_uuid(dmt, prefixed_uuid))
> +			goto freeout;
>  		dm_task_skip_lockfs(dmt);
>  #ifdef LIBDM_API_FLUSH
>  		dm_task_no_flush(dmt);
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

