Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 554212F3B5A
	for <lists+dm-devel@lfdr.de>; Tue, 12 Jan 2021 21:04:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610481886;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Nu7oh/SSpLGoTkRA9TqhpX2JIpWnE0ufKKfte/EimYo=;
	b=KTzkyhZlZ4d/9/LWKfl0dTuHKYb6REby7PZjxRllUKjryb1VHzTR6IVacIgghpZLsptzDt
	dxzHKgQxuGeDJAssdak6wkv04TxRmlUkh8MgTU8AYmiD7Aax3ML3G4CbgBonEAnY2qSh/e
	a4emoKLNcfxpbDvuemYYKgac95ZTwBM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-gh7xWvzHMVeLtZt3kcejhg-1; Tue, 12 Jan 2021 15:04:43 -0500
X-MC-Unique: gh7xWvzHMVeLtZt3kcejhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C682D809DC9;
	Tue, 12 Jan 2021 20:04:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7908B60BFA;
	Tue, 12 Jan 2021 20:04:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7885C18095C9;
	Tue, 12 Jan 2021 20:04:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10CK4L0w005513 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 12 Jan 2021 15:04:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3726C1975F; Tue, 12 Jan 2021 20:04:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 545F419744;
	Tue, 12 Jan 2021 20:04:18 +0000 (UTC)
Date: Tue, 12 Jan 2021 15:04:17 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20210112200417.GA15241@redhat.com>
References: <alpine.LRH.2.02.2101121453090.31583@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2101121453090.31583@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] dm-integrity: fix the maximum number of arguments
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 12 2021 at  2:54pm -0500,
Mikulas Patocka <mpatocka@redhat.com> wrote:

> Advance the maximum number of arguments to 15.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org	# v4.19+
> 
> ---
>  drivers/md/dm-integrity.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Index: linux-2.6/drivers/md/dm-integrity.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm-integrity.c	2021-01-12 20:45:23.000000000 +0100
> +++ linux-2.6/drivers/md/dm-integrity.c	2021-01-12 20:46:15.000000000 +0100
> @@ -3792,7 +3792,7 @@ static int dm_integrity_ctr(struct dm_ta
>  	unsigned extra_args;
>  	struct dm_arg_set as;
>  	static const struct dm_arg _args[] = {
> -		{0, 9, "Invalid number of feature args"},
> +		{0, 15, "Invalid number of feature args"},
>  	};
>  	unsigned journal_sectors, interleave_sectors, buffer_sectors, journal_watermark, sync_msec;
>  	bool should_write_sb;

Can you please expand on which args weren't accounted for?
Which commit introduced the problem? (I'd like a "Fixes:" reference)

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

