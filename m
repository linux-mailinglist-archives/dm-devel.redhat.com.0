Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B70251354ED
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jan 2020 09:57:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578560267;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Xhl3pn5cKpCYmBY4w+8zm+i3oLSpRLeAgWe5MU2og7I=;
	b=ILGvjgIfG8qHXBxFh28P3H74ykJ9bRtEAuWhJ/UdJyjKN2LEC0HVrYoFn6XHp8yn2cdcks
	uexFBw8uZhZ+PF6W4OuEdKROfhzA+ewICjntHvtdu6jBxeSx9ZtZZSU4LBTiSTQpXuI33t
	16hqs+7/UJUMDzOPUNE25/z1J3NSMSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-9VVoyhAoMtmXzF05X_kRMg-1; Thu, 09 Jan 2020 03:57:44 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAB09593A0;
	Thu,  9 Jan 2020 08:57:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76F7D60C88;
	Thu,  9 Jan 2020 08:57:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2460C18089C8;
	Thu,  9 Jan 2020 08:57:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 008JF0WV023365 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jan 2020 14:15:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2EAAB20230A6; Wed,  8 Jan 2020 19:15:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 289DD202A940
	for <dm-devel@redhat.com>; Wed,  8 Jan 2020 19:14:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A17D3800FC4
	for <dm-devel@redhat.com>; Wed,  8 Jan 2020 19:14:57 +0000 (UTC)
Received: from gateway34.websitewelcome.com (gateway34.websitewelcome.com
	[192.185.148.104]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-421-zt7_2ab4Pw-FlYbryTDkqw-1; Wed, 08 Jan 2020 14:14:55 -0500
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
	by gateway34.websitewelcome.com (Postfix) with ESMTP id DF324166D0
	for <dm-devel@redhat.com>; Wed,  8 Jan 2020 13:14:54 -0600 (CST)
Received: from host2059.hostmonster.com ([67.20.112.233]) by cmsmtp with SMTP
	id pGn8iQmlMiJ43pGn8ij2O3; Wed, 08 Jan 2020 13:14:54 -0600
X-Authority-Reason: nr=8
Received: from [196.158.145.136] (port=15092 helo=[192.168.100.109])
	by host2059.hostmonster.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
	(envelope-from <mmokhtar@petasan.org>)
	id 1ipGn7-003pLH-Lb; Wed, 08 Jan 2020 12:14:54 -0700
To: Mikulas Patocka <mpatocka@redhat.com>
References: <598c7c64-9b11-3407-2060-8d43b1ef1241@petasan.org>
	<d76f7245-034c-f225-00fe-f33c5e9abf1a@petasan.org>
	<alpine.LRH.2.02.2001021144450.18253@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2001081202001.7856@file01.intranet.prod.int.rdu2.redhat.com>
From: Maged Mokhtar <mmokhtar@petasan.org>
Message-ID: <9322edba-14b2-fafd-b49e-96af15fdb029@petasan.org>
Date: Wed, 8 Jan 2020 21:14:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2001081202001.7856@file01.intranet.prod.int.rdu2.redhat.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - host2059.hostmonster.com
X-AntiAbuse: Original Domain - redhat.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - petasan.org
X-BWhitelist: no
X-Source-IP: 196.158.145.136
X-Source-L: No
X-Exim-ID: 1ipGn7-003pLH-Lb
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.100.109]) [196.158.145.136]:15092
X-Source-Auth: mmokhtar@petasan.org
X-Email-Count: 3
X-Source-Cap: cGV0YXNhbm87cGV0YXNhbm87aG9zdDIwNTkuaG9zdG1vbnN0ZXIuY29t
X-Local-Domain: yes
X-MC-Unique: zt7_2ab4Pw-FlYbryTDkqw-1
X-MC-Unique: 9VVoyhAoMtmXzF05X_kRMg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 09 Jan 2020 03:55:26 -0500
Cc: dm-devel@redhat.com, Mike Snitzer <msnitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm writecache: SB remove seq_count
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

Yes sure. i will send you something early next week.

/Maged

On 08/01/2020 19:04, Mikulas Patocka wrote:
> BTW. I would be interested if this patch improves performance for you.
> Could you test it?
> 
> (you also need my previous patch posted here
> https://www.redhat.com/archives/dm-devel/2020-January/msg00027.html )
> 
> Mikulas
> 
> 
> 
> 
> dm-writecache: use REQ_FUA when writing the superblock
> 
> When writing the superblock, it may be better to submit just one I/O with
> the FUA bit set instead of two I/Os.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> 
> ---
>   drivers/md/dm-writecache.c |   29 +++++++++++++++--------------
>   1 file changed, 15 insertions(+), 14 deletions(-)
> 
> Index: linux-2.6/drivers/md/dm-writecache.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm-writecache.c	2020-01-08 17:56:41.000000000 +0100
> +++ linux-2.6/drivers/md/dm-writecache.c	2020-01-08 17:56:49.000000000 +0100
> @@ -448,7 +448,7 @@ static void writecache_wait_for_ios(stru
>   		   !atomic_read(&wc->bio_in_progress[direction]));
>   }
>   
> -static void ssd_commit_flushed(struct dm_writecache *wc, bool wait_for_ios)
> +static void ssd_commit_flushed(struct dm_writecache *wc, bool wait_for_ios, bool use_fua)
>   {
>   	struct dm_io_region region;
>   	struct dm_io_request req;
> @@ -479,7 +479,7 @@ static void ssd_commit_flushed(struct dm
>   		region.sector += wc->start_sector;
>   		atomic_inc(&endio.count);
>   		req.bi_op = REQ_OP_WRITE;
> -		req.bi_op_flags = REQ_SYNC;
> +		req.bi_op_flags = REQ_SYNC | (use_fua ? REQ_FUA : 0);
>   		req.mem.type = DM_IO_VMA;
>   		req.mem.ptr.vma = (char *)wc->memory_map + (size_t)i * BITMAP_GRANULARITY;
>   		req.client = wc->dm_io;
> @@ -497,17 +497,18 @@ static void ssd_commit_flushed(struct dm
>   	if (wait_for_ios)
>   		writecache_wait_for_ios(wc, WRITE);
>   
> -	writecache_disk_flush(wc, wc->ssd_dev);
> +	if (!use_fua)
> +		writecache_disk_flush(wc, wc->ssd_dev);
>   
>   	memset(wc->dirty_bitmap, 0, wc->dirty_bitmap_size);
>   }
>   
> -static void writecache_commit_flushed(struct dm_writecache *wc, bool wait_for_ios)
> +static void writecache_commit_flushed(struct dm_writecache *wc, bool wait_for_ios, bool use_fua)
>   {
>   	if (WC_MODE_PMEM(wc))
>   		wmb();
>   	else
> -		ssd_commit_flushed(wc, wait_for_ios);
> +		ssd_commit_flushed(wc, wait_for_ios, use_fua);
>   }
>   
>   static void writecache_disk_flush(struct dm_writecache *wc, struct dm_dev *dev)
> @@ -727,12 +728,12 @@ static void writecache_flush(struct dm_w
>   		e = e2;
>   		cond_resched();
>   	}
> -	writecache_commit_flushed(wc, true);
> +	writecache_commit_flushed(wc, true, false);
>   
>   	wc->seq_count++;
>   	pmem_assign(sb(wc)->seq_count, cpu_to_le64(wc->seq_count));
>   	writecache_flush_region(wc, &sb(wc)->seq_count, sizeof sb(wc)->seq_count);
> -	writecache_commit_flushed(wc, false);
> +	writecache_commit_flushed(wc, false, true);
>   
>   	wc->overwrote_committed = false;
>   
> @@ -756,7 +757,7 @@ static void writecache_flush(struct dm_w
>   	}
>   
>   	if (need_flush_after_free)
> -		writecache_commit_flushed(wc, false);
> +		writecache_commit_flushed(wc, false, false);
>   }
>   
>   static void writecache_flush_work(struct work_struct *work)
> @@ -809,7 +810,7 @@ static void writecache_discard(struct dm
>   	}
>   
>   	if (discarded_something)
> -		writecache_commit_flushed(wc, false);
> +		writecache_commit_flushed(wc, false, false);
>   }
>   
>   static bool writecache_wait_for_writeback(struct dm_writecache *wc)
> @@ -958,7 +959,7 @@ erase_this:
>   
>   	if (need_flush) {
>   		writecache_flush_all_metadata(wc);
> -		writecache_commit_flushed(wc, false);
> +		writecache_commit_flushed(wc, false, false);
>   	}
>   
>   	wc_unlock(wc);
> @@ -1342,7 +1343,7 @@ static void __writecache_endio_pmem(stru
>   			wc->writeback_size--;
>   			n_walked++;
>   			if (unlikely(n_walked >= ENDIO_LATENCY)) {
> -				writecache_commit_flushed(wc, false);
> +				writecache_commit_flushed(wc, false, false);
>   				wc_unlock(wc);
>   				wc_lock(wc);
>   				n_walked = 0;
> @@ -1423,7 +1424,7 @@ pop_from_list:
>   			writecache_wait_for_ios(wc, READ);
>   		}
>   
> -		writecache_commit_flushed(wc, false);
> +		writecache_commit_flushed(wc, false, false);
>   
>   		wc_unlock(wc);
>   	}
> @@ -1766,10 +1767,10 @@ static int init_memory(struct dm_writeca
>   		write_original_sector_seq_count(wc, &wc->entries[b], -1, -1);
>   
>   	writecache_flush_all_metadata(wc);
> -	writecache_commit_flushed(wc, false);
> +	writecache_commit_flushed(wc, false, false);
>   	pmem_assign(sb(wc)->magic, cpu_to_le32(MEMORY_SUPERBLOCK_MAGIC));
>   	writecache_flush_region(wc, &sb(wc)->magic, sizeof sb(wc)->magic);
> -	writecache_commit_flushed(wc, false);
> +	writecache_commit_flushed(wc, false, false);
>   
>   	return 0;
>   }
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

