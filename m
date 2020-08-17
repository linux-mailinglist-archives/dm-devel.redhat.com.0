Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1F1247958
	for <lists+dm-devel@lfdr.de>; Mon, 17 Aug 2020 23:56:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597701399;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JMq9f/o6RR1xmAqd2whtWfn0Jr5GOEgsrXd+m/CvdSM=;
	b=VUwLnoJM8SdJobulik1qflE+AvMBm5/yMt8B1EoqVKUJJlQmtMXIuXUb9zpHsMnhSgjQ1o
	wv1zg2tP0ZyRxlwXYtFSgnek5l34+/OFx6sUUesbW7kskvSU+vAyfX2S5gMXyER/U35u1Y
	vox0DKgXk9w5t7NuZUCd6YNI56p532E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-Ef8J2RSTP9OghJ0To23xgA-1; Mon, 17 Aug 2020 17:56:37 -0400
X-MC-Unique: Ef8J2RSTP9OghJ0To23xgA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5846380BCA0;
	Mon, 17 Aug 2020 21:56:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2713F7A1C8;
	Mon, 17 Aug 2020 21:56:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F29FB4EEEA;
	Mon, 17 Aug 2020 21:56:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07HLuGoD015073 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 17:56:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 568657D90E; Mon, 17 Aug 2020 21:56:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56A465D6C4;
	Mon, 17 Aug 2020 21:56:13 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07HLuB5J023272; 
	Mon, 17 Aug 2020 16:56:11 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07HLuBc6023271;
	Mon, 17 Aug 2020 16:56:11 -0500
Date: Mon, 17 Aug 2020 16:56:11 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200817215611.GJ19233@octiron.msp.redhat.com>
References: <20200812113601.26658-1-mwilck@suse.com>
	<20200812113601.26658-2-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200812113601.26658-2-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 81/84] multipath: check_path_valid():
 eliminate some failure modes
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Aug 12, 2020 at 01:35:58PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> The memory allocations can fail, and pathvec is not needed until the
> path_discovery() call. Eliminate the failure modes by not setting up
> pathvec before it's actually needed.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipath/main.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/multipath/main.c b/multipath/main.c
> index 9d6b482..9e65070 100644
> --- a/multipath/main.c
> +++ b/multipath/main.c
> @@ -637,15 +637,6 @@ check_path_valid(const char *name, struct config *conf, bool is_uevent)
>  			 minor(devt));
>  	}
>  
> -	pathvec = vector_alloc();
> -	if (!pathvec)
> -		goto fail;
> -
> -	if (store_path(pathvec, pp) != 0) {
> -		free_path(pp);
> -		goto fail;
> -	}
> -
>  	if ((r == PATH_IS_VALID || r == PATH_IS_MAYBE_VALID) &&
>  	    released_to_systemd())
>  		r = PATH_IS_NOT_VALID;
> @@ -684,6 +675,15 @@ check_path_valid(const char *name, struct config *conf, bool is_uevent)
>  		goto out;
>  	}
>  
> +	pathvec = vector_alloc();
> +	if (!pathvec)
> +		goto fail;
> +
> +	if (store_path(pathvec, pp) != 0) {
> +		free_path(pp);
> +		goto fail;
> +	}
> +
>  	/* For find_multipaths = SMART, if there is more than one path
>  	 * matching the refwwid, then the path is valid */
>  	if (path_discovery(pathvec, DI_SYSFS | DI_WWID) < 0)
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

