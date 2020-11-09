Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CB7662AC5AB
	for <lists+dm-devel@lfdr.de>; Mon,  9 Nov 2020 21:00:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604952025;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gc3UCjOZqU7qg7heizxrbowdKJW1pYBaaXVQGQS+aKU=;
	b=Eko6ApIyTe3Lb4s8vI/gVkEiYhTQGWykGj9/eZpIs4Q6wLG0UW/objFMI9RuJA1docLfR5
	1H/o2yoYjIHXe0ogTvpDNzqTiA4r1OSf2dzXPsp2ec4h9MDRKK2qXa5pptv7gL+J8qTrQS
	6heenuS8/GSx90goov6si3VGD/pxWko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-jDPOwyd-MS6W8QFDP5PEew-1; Mon, 09 Nov 2020 15:00:22 -0500
X-MC-Unique: jDPOwyd-MS6W8QFDP5PEew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CB2A13D064;
	Mon,  9 Nov 2020 20:00:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12B7E5D9DD;
	Mon,  9 Nov 2020 20:00:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C07CD180B657;
	Mon,  9 Nov 2020 20:00:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A9JxoBc008542 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 9 Nov 2020 14:59:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 233B76EF53; Mon,  9 Nov 2020 19:59:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 196726EF4A;
	Mon,  9 Nov 2020 19:59:43 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0A9JxgKM030596; 
	Mon, 9 Nov 2020 13:59:42 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0A9JxfQm030595;
	Mon, 9 Nov 2020 13:59:41 -0600
Date: Mon, 9 Nov 2020 13:59:41 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <20201109195941.GK3384@octiron.msp.redhat.com>
References: <5ce8950b-dccb-1083-b17e-f878d2a596f9@huawei.com>
MIME-Version: 1.0
In-Reply-To: <5ce8950b-dccb-1083-b17e-f878d2a596f9@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel mailing list <dm-devel@redhat.com>, Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>,
	linux-lvm-request@redhat.com
Subject: Re: [dm-devel] [PATCH v4] libmultipath: fix memory leaks in
	coalesce_paths
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 09, 2020 at 12:32:05PM +0800, lixiaokeng wrote:
> When multipath -F are executed first and multipath -v2 or
> -d are executed later, asan will warn memory leaks. The
> reason is that the mpp allocated in coalesce_paths isn't
> freed. Here we use newmp to store mpp. If newmp need not
> be copied to mpvec, we free newmp at the end of the func.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: Linfeilong <linfeilong@huawei.com>
> ---
>  libmultipath/configure.c | 40 +++++++++++++++++++++++++++++-----------
>  1 file changed, 29 insertions(+), 11 deletions(-)
> 
> diff --git a/libmultipath/configure.c b/libmultipath/configure.c
> index 6fb477fc..2547e1d5 100644
> --- a/libmultipath/configure.c
> +++ b/libmultipath/configure.c
> @@ -1132,7 +1132,7 @@ out:
>   * FORCE_RELOAD_WEAK: existing maps are compared to the current conf and only
>   * reloaded in DM if there's a difference. This is useful during startup.
>   */
> -int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
> +int coalesce_paths (struct vectors *vecs, vector mpvec, char *refwwid,
>  		    int force_reload, enum mpath_cmds cmd)
>  {
>  	int ret = CP_FAIL;
> @@ -1144,6 +1144,7 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
>  	struct path * pp2;
>  	vector curmp = vecs->mpvec;
>  	vector pathvec = vecs->pathvec;
> +	vector newmp;
>  	struct config *conf;
>  	int allow_queueing;
>  	struct bitfield *size_mismatch_seen;
> @@ -1164,6 +1165,15 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
>  	if (size_mismatch_seen == NULL)
>  		return CP_FAIL;
> 
> +	if (mpvec)
> +		newmp = mpvec;
> +	else
> +		newmp = vector_alloc();
> +	if (!newmp) {
> +		condlog(0, "can not allocate newmp");
> +		goto out;
> +	}
> +
>  	vector_foreach_slot (pathvec, pp1, k) {
>  		int invalid;
>  		/* skip this path for some reason */
> @@ -1270,8 +1280,14 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
>  				goto out;
>  			}
>  		}
> -		if (r == DOMAP_DRY)
> +		if (r == DOMAP_DRY) {
> +			if (!vector_alloc_slot(newmp)) {
> +				remove_map(mpp, vecs->pathvec, vecs->mpvec, KEEP_VEC);
> +				goto out;
> +			}
> +			vector_set_slot(newmp, mpp);
>  			continue;
> +		}
> 
>  		if (r == DOMAP_EXIST && mpp->action == ACT_NOTHING &&
>  		    force_reload == FORCE_RELOAD_WEAK)
> @@ -1307,22 +1323,22 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
>  			print_multipath_topology(mpp, verbosity);
>  		}
> 
> -		if (newmp) {
> -			if (mpp->action != ACT_REJECT) {
> -				if (!vector_alloc_slot(newmp))
> -					goto out;
> -				vector_set_slot(newmp, mpp);
> +		if (mpp->action != ACT_REJECT) {
> +			if (!vector_alloc_slot(newmp)) {
> +				remove_map(mpp, vecs->pathvec, vecs->mpvec, KEEP_VEC);
> +				goto out;
>  			}
> -			else
> -				remove_map(mpp, vecs->pathvec, vecs->mpvec,
> -					   KEEP_VEC);
> +			vector_set_slot(newmp, mpp);
>  		}
> +		else
> +			remove_map(mpp, vecs->pathvec, vecs->mpvec,
> +				   KEEP_VEC);
>  	}
>  	/*
>  	 * Flush maps with only dead paths (ie not in sysfs)
>  	 * Keep maps with only failed paths
>  	 */
> -	if (newmp) {
> +	if (mpvec) {
>  		vector_foreach_slot (newmp, mpp, i) {
>  			char alias[WWID_SIZE];
> 
> @@ -1345,6 +1361,8 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
>  	ret = CP_OK;
>  out:
>  	free(size_mismatch_seen);
> +	if (!mpvec)
> +		free_multipathvec(newmp, KEEP_PATHS);
>  	return ret;
>  }
> 
> -- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

