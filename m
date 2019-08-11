Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C1489310
	for <lists+dm-devel@lfdr.de>; Sun, 11 Aug 2019 20:11:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 380C4307D962;
	Sun, 11 Aug 2019 18:11:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45BDA6012D;
	Sun, 11 Aug 2019 18:10:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 213664A486;
	Sun, 11 Aug 2019 18:10:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7BIAUlG021333 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 11 Aug 2019 14:10:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9DF0628D36; Sun, 11 Aug 2019 18:10:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4894928D1C;
	Sun, 11 Aug 2019 18:10:26 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x7BIAPHN014772; Sun, 11 Aug 2019 14:10:25 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x7BIAOrP014768; Sun, 11 Aug 2019 14:10:25 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Sun, 11 Aug 2019 14:10:24 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Huaisheng Ye <yehs2007@zoho.com>
In-Reply-To: <20190811161233.7616-1-yehs2007@zoho.com>
Message-ID: <alpine.LRH.2.02.1908111410040.13454@file01.intranet.prod.int.rdu2.redhat.com>
References: <20190811161233.7616-1-yehs2007@zoho.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: prarit@redhat.com, Huaisheng Ye <yehs1@lenovo.com>, snitzer@redhat.com,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	tyu1@lenovo.com, agk@redhat.com
Subject: Re: [dm-devel] dm writecache: remove unused member pointer in
 writeback_struct
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Sun, 11 Aug 2019 18:11:05 +0000 (UTC)



On Mon, 12 Aug 2019, Huaisheng Ye wrote:

> From: Huaisheng Ye <yehs1@lenovo.com>
> 
> The stucture member pointer page in writeback_struct never has been
> used actually. Remove it.
> 
> Signed-off-by: Huaisheng Ye <yehs1@lenovo.com>

Acked-by: Mikulas Patocka <mpatocka@redhat.com>

> ---
>  drivers/md/dm-writecache.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
> index 1cb137f..5c7009d 100644
> --- a/drivers/md/dm-writecache.c
> +++ b/drivers/md/dm-writecache.c
> @@ -190,7 +190,6 @@ struct writeback_struct {
>  	struct dm_writecache *wc;
>  	struct wc_entry **wc_list;
>  	unsigned wc_list_n;
> -	struct page *page;
>  	struct wc_entry *wc_list_inline[WB_LIST_INLINE];
>  	struct bio bio;
>  };
> -- 
> 1.8.3.1
> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
