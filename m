Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 211D6A7E49
	for <lists+dm-devel@lfdr.de>; Wed,  4 Sep 2019 10:48:59 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56416308213F;
	Wed,  4 Sep 2019 08:48:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD84360A9F;
	Wed,  4 Sep 2019 08:48:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A20074A486;
	Wed,  4 Sep 2019 08:48:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x848maEB014396 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Sep 2019 04:48:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 51B3F60C63; Wed,  4 Sep 2019 08:48:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9AD560BFB;
	Wed,  4 Sep 2019 08:48:30 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x848mUBu011879; Wed, 4 Sep 2019 04:48:30 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x848mUGT011875; Wed, 4 Sep 2019 04:48:30 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 4 Sep 2019 04:48:30 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Huaisheng Ye <yehs2007@zoho.com>
In-Reply-To: <20190902100450.10600-1-yehs2007@zoho.com>
Message-ID: <alpine.LRH.2.02.1909040444440.11252@file01.intranet.prod.int.rdu2.redhat.com>
References: <20190902100450.10600-1-yehs2007@zoho.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: prarit@redhat.com, Huaisheng Ye <yehs1@lenovo.com>, snitzer@redhat.com,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	tyu1@lenovo.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH] dm writecache: skip writecache_wait for pmem
	mode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Wed, 04 Sep 2019 08:48:57 +0000 (UTC)



On Mon, 2 Sep 2019, Huaisheng Ye wrote:

> From: Huaisheng Ye <yehs1@lenovo.com>
> 
> The array bio_in_progress[2] only have chance to be increased and
> decreased with ssd mode. For pmem mode, they are not involved at all.
> So skip writecache_wait_for_ios in writecache_flush for pmem.
> 
> Suggested-by: Doris Yu <tyu1@lenovo.com>
> Signed-off-by: Huaisheng Ye <yehs1@lenovo.com>
> ---
>  drivers/md/dm-writecache.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
> index c481947..d06b8aa 100644
> --- a/drivers/md/dm-writecache.c
> +++ b/drivers/md/dm-writecache.c
> @@ -726,7 +726,8 @@ static void writecache_flush(struct dm_writecache *wc)
>  	}
>  	writecache_commit_flushed(wc);
>  
> -	writecache_wait_for_ios(wc, WRITE);
> +	if (!WC_MODE_PMEM(wc))
> +		writecache_wait_for_ios(wc, WRITE);
>  
>  	wc->seq_count++;
>  	pmem_assign(sb(wc)->seq_count, cpu_to_le64(wc->seq_count));
> -- 
> 1.8.3.1

I think this is not needed - wait_event in writecache_wait_for_ios exits 
immediatelly if the condition is true.

This code path is not so hot that we would need microoptimizations like 
this to avoid function calls.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
