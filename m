Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 19CF7290AC7
	for <lists+dm-devel@lfdr.de>; Fri, 16 Oct 2020 19:32:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602869560;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9Yl/vYLGC+1W3tpAVRwdB8+I58ixKlzj25NJSTkxIWk=;
	b=YypKpE8DD/C1ExJf7BG18epqWY8fgZhDS+JLY8cCooMe7QwX/h8/MVRve4q0VJ1dsZsaXq
	CFzJ1iUBPfjhw4uXuF9TV/1mR5YTlrGNcb9sdXlSCHsNWsW5Gq7V4xgLRsLo4QSDIvr5CR
	rpt8CWDVu6050Ofq6LQ8cNH9OLJQF9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479--r84WQv1OciXPjLG4EbE9Q-1; Fri, 16 Oct 2020 13:32:37 -0400
X-MC-Unique: -r84WQv1OciXPjLG4EbE9Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F30F61006704;
	Fri, 16 Oct 2020 17:32:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE4CD5C1D0;
	Fri, 16 Oct 2020 17:32:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7D7B558118;
	Fri, 16 Oct 2020 17:32:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09GHVgat007607 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Oct 2020 13:31:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6386055775; Fri, 16 Oct 2020 17:31:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFDE475130;
	Fri, 16 Oct 2020 17:31:38 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 09GHVb19026116; 
	Fri, 16 Oct 2020 12:31:37 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 09GHVaQ1026115;
	Fri, 16 Oct 2020 12:31:36 -0500
Date: Fri, 16 Oct 2020 12:31:36 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <20201016173136.GU3384@octiron.msp.redhat.com>
References: <6169bcfa-343d-adc8-a458-5e5c46aed737@huawei.com>
MIME-Version: 1.0
In-Reply-To: <6169bcfa-343d-adc8-a458-5e5c46aed737@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH] libmultipath: fix memory leaks in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 16, 2020 at 02:23:58PM +0800, lixiaokeng wrote:
> When multipath -F are executed firstly and multipath -v2 or
> -d are executed later, asan will warn memory leaks. The
> reason is that the mpp allocated in coalesce_paths isn't
> freed. Here we add newmp in configure(multipath) to store
> mpp and free it.
> 
> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: Linfeilong <linfeilong@huawei.com>
> ---
>  libmultipath/configure.c | 12 ++++++++++--
>  multipath/main.c         |  7 +++++--
>  2 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/libmultipath/configure.c b/libmultipath/configure.c
> index 6fb477fc..fb2c3f73 100644
> --- a/libmultipath/configure.c
> +++ b/libmultipath/configure.c
> @@ -1270,8 +1270,14 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
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
> @@ -1309,8 +1315,10 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
> 
>  		if (newmp) {
>  			if (mpp->action != ACT_REJECT) {
> -				if (!vector_alloc_slot(newmp))
> +				if (!vector_alloc_slot(newmp)) {
> +					remove_map(mpp, vecs->pathvec, vecs->mpvec, KEEP_VEC);
>  					goto out;
> +				}
>  				vector_set_slot(newmp, mpp);
>  			}
>  			else
> diff --git a/multipath/main.c b/multipath/main.c
> index 9e920d89..5f5b435a 100644
> --- a/multipath/main.c
> +++ b/multipath/main.c

You should rebase this on top of Martin's "libmultipath: improve cleanup
on exit" patchset, since it conflicts with those patches. He's just
posted another version of them.

-Ben

> @@ -472,6 +472,7 @@ configure (struct config *conf, enum mpath_cmds cmd,
>  {
>  	vector curmp = NULL;
>  	vector pathvec = NULL;
> +	vector newmp = NULL;
>  	struct vectors vecs;
>  	int r = RTVL_FAIL, rc;
>  	int di_flag = 0;
> @@ -483,8 +484,9 @@ configure (struct config *conf, enum mpath_cmds cmd,
>  	 */
>  	curmp = vector_alloc();
>  	pathvec = vector_alloc();
> +	newmp = vector_alloc();
> 
> -	if (!curmp || !pathvec) {
> +	if (!curmp || !pathvec || !newmp) {
>  		condlog(0, "can not allocate memory");
>  		goto out;
>  	}
> @@ -586,7 +588,7 @@ configure (struct config *conf, enum mpath_cmds cmd,
>  	/*
>  	 * core logic entry point
>  	 */
> -	rc = coalesce_paths(&vecs, NULL, refwwid,
> +	rc = coalesce_paths(&vecs, newmp, refwwid,
>  			   conf->force_reload, cmd);
>  	r = rc == CP_RETRY ? RTVL_RETRY : rc == CP_OK ? RTVL_OK : RTVL_FAIL;
> 
> @@ -595,6 +597,7 @@ out:
>  		FREE(refwwid);
> 
>  	free_multipathvec(curmp, KEEP_PATHS);
> +	free_multipathvec(newmp, KEEP_PATHS);
>  	free_pathvec(pathvec, FREE_PATHS);
> 
>  	return r;
> -- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

