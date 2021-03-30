Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B863634E117
	for <lists+dm-devel@lfdr.de>; Tue, 30 Mar 2021 08:19:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617085193;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3ThZMo2SNXd4v3uJx4AZmvC3xTgXQBq3oCOI3cqQgMY=;
	b=N5LlynxEbk9P5ZIGTvaqZcpfzGSPTJokaLdhJlx+hASlYoTVi8OynzGDa5nPR+2HzvGj3s
	1CUS4oLLJfdvNq2K3lFst8gFpvyRJmTaoRWZa21mhqP5nLL01lF2A1K0xIYYQlP2PrzLzv
	Hgb1nLi40B4pwWaU8YQKz8hvwou/j4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-VXck7q9gONeARgML8N-CQA-1; Tue, 30 Mar 2021 02:19:51 -0400
X-MC-Unique: VXck7q9gONeARgML8N-CQA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3497E1008541;
	Tue, 30 Mar 2021 06:19:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDBEF9654E;
	Tue, 30 Mar 2021 06:19:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 759994BB7C;
	Tue, 30 Mar 2021 06:19:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12U6Jf3G005394 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 02:19:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9244619706; Tue, 30 Mar 2021 06:19:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E32A819C45;
	Tue, 30 Mar 2021 06:19:38 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 12U6JboM007382; 
	Tue, 30 Mar 2021 01:19:37 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 12U6JbE7007381;
	Tue, 30 Mar 2021 01:19:37 -0500
Date: Tue, 30 Mar 2021 01:19:36 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210330061936.GP15006@octiron.msp.redhat.com>
References: <20210329101255.21373-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210329101255.21373-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] multipathd: reduce log levels in
	cli_add_map()
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

On Mon, Mar 29, 2021 at 12:12:55PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Normally "add map" will be used to add a map which doesn't exist
> yet. Thus not finding this map in the first place is not a problem
> indicator and should be logged at level 3 only.
> 
Reviewed-by: Benjamin Marzinsk <bmarzins@redhat.com>

> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ----
> Note: 
> 
> I've applied this patch to my "queue" branch by mistake already.
> I thought I'd posted it before. Sorry.
> 
> ---
>  multipathd/cli_handlers.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
> index 7f3e61f..1de6ad8 100644
> --- a/multipathd/cli_handlers.c
> +++ b/multipathd/cli_handlers.c
> @@ -852,14 +852,15 @@ cli_add_map (void * v, char ** reply, int * len, void * data)
>  	}
>  	do {
>  		if (dm_get_major_minor(param, &major, &minor) < 0)
> -			condlog(2, "%s: not a device mapper table", param);
> +			condlog(count ? 2 : 3,
> +				"%s: not a device mapper table", param);
>  		else {
>  			sprintf(dev_path, "dm-%d", minor);
>  			alias = dm_mapname(major, minor);
>  		}
>  		/*if there is no mapname found, we first create the device*/
>  		if (!alias && !count) {
> -			condlog(2, "%s: mapname not found for %d:%d",
> +			condlog(3, "%s: mapname not found for %d:%d",
>  				param, major, minor);
>  			get_refwwid(CMD_NONE, param, DEV_DEVMAP,
>  				    vecs->pathvec, &refwwid);
> -- 
> 2.30.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

