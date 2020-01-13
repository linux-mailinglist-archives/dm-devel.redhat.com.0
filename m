Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 59F4813A8C2
	for <lists+dm-devel@lfdr.de>; Tue, 14 Jan 2020 12:55:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579002958;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Do6G5VMMQl6E+i67Z3E7wmq334LwhbANgUoPyg58o9E=;
	b=W3fmPjez5Qgfu6i/SHSCIks+7lvdjAO1I2MG2fD2ctYGz1P9ceSp7pmoYoX/PqcNor18NB
	O00b2gdBpAfFy586FMaOHAJwVdo03l6iHKlAjGM26TQ6Kjs+05FByD3WpZRLCwrjntYotI
	cnHKq6M4/CG+bB9F+CHCj/SkFboFS5I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-gXVLltQINtyojkpTbz_K1g-1; Tue, 14 Jan 2020 06:55:56 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB9D3107ACE4;
	Tue, 14 Jan 2020 11:55:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFD1560BF1;
	Tue, 14 Jan 2020 11:55:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F5151803C38;
	Tue, 14 Jan 2020 11:55:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00DJlWZK008310 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jan 2020 14:47:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 82D6D2166B2C; Mon, 13 Jan 2020 19:47:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CB052166B2F
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 19:47:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1DD2803291
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 19:47:30 +0000 (UTC)
Received: from gateway31.websitewelcome.com (gateway31.websitewelcome.com
	[192.185.143.31]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-240-0veuzxQOM4KhE1lWtNZtjQ-1; Mon, 13 Jan 2020 14:47:28 -0500
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
	by gateway31.websitewelcome.com (Postfix) with ESMTP id 4604A40A3D
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 13:47:27 -0600 (CST)
Received: from host2059.hostmonster.com ([67.20.112.233]) by cmsmtp with SMTP
	id r5gMioNnvW4frr5gNi3IT0; Mon, 13 Jan 2020 13:47:27 -0600
X-Authority-Reason: nr=8
Received: from [196.157.140.70] (port=15411 helo=[192.168.100.109])
	by host2059.hostmonster.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
	(envelope-from <mmokhtar@petasan.org>)
	id 1ir5gM-000MKh-47; Mon, 13 Jan 2020 12:47:26 -0700
To: Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <msnitzer@redhat.com>
References: <alpine.LRH.2.02.2001081043420.682@file01.intranet.prod.int.rdu2.redhat.com>
From: Maged Mokhtar <mmokhtar@petasan.org>
Message-ID: <4a136e98-7a55-89e5-ac94-75080ec26df1@petasan.org>
Date: Mon, 13 Jan 2020 21:47:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2001081043420.682@file01.intranet.prod.int.rdu2.redhat.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - host2059.hostmonster.com
X-AntiAbuse: Original Domain - redhat.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - petasan.org
X-BWhitelist: no
X-Source-IP: 196.157.140.70
X-Source-L: No
X-Exim-ID: 1ir5gM-000MKh-47
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.100.109]) [196.157.140.70]:15411
X-Source-Auth: mmokhtar@petasan.org
X-Email-Count: 6
X-Source-Cap: cGV0YXNhbm87cGV0YXNhbm87aG9zdDIwNTkuaG9zdG1vbnN0ZXIuY29t
X-Local-Domain: yes
X-MC-Unique: 0veuzxQOM4KhE1lWtNZtjQ-1
X-MC-Unique: gXVLltQINtyojkpTbz_K1g-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 14 Jan 2020 06:55:09 -0500
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm-writecache: fix incorrect flush sequence
 when doing commit
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



On 08/01/2020 17:46, Mikulas Patocka wrote:
> When commiting state, the function writecache_flush does the following:
> 1. write metadata (writecache_commit_flushed)
> 2. flush disk cache (writecache_commit_flushed)
> 3. wait for data writes to complete (writecache_wait_for_ios)
> 4. increase superblock seq_count
> 5. write the superblock
> 6. flush disk cache
> 
> It may happen that at step 3, when we wait for some write to finish, the
> disk may report the write as finished, but the write only hit the disk
> cache and it is not yet stored in persistent storage. At step 5 we write
> the superblock - it may happen that the superblock is written before the
> write that we waited for in step 3. If the machine crashes, it may result
> in incorect data being returned after reboot.
> 
> In order to fix the bug, we must swap steps 2 and 3 in the above sequence,
> so that we first wait for writes to complete and then flush the disk
> cache.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org	# 4.18+
> Fixes: 48debafe4f2f ("dm: add writecache target")
> 
> ---
>   drivers/md/dm-writecache.c |   42 +++++++++++++++++++++---------------------
>   1 file changed, 21 insertions(+), 21 deletions(-)
> 
> Index: linux-2.6/drivers/md/dm-writecache.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm-writecache.c	2020-01-08 15:14:51.000000000 +0100
> +++ linux-2.6/drivers/md/dm-writecache.c	2020-01-08 16:15:43.000000000 +0100
> @@ -442,7 +442,13 @@ static void writecache_notify_io(unsigne
>   		complete(&endio->c);
>   }
>   
> -static void ssd_commit_flushed(struct dm_writecache *wc)
> +static void writecache_wait_for_ios(struct dm_writecache *wc, int direction)
> +{
> +	wait_event(wc->bio_in_progress_wait[direction],
> +		   !atomic_read(&wc->bio_in_progress[direction]));
> +}
> +
> +static void ssd_commit_flushed(struct dm_writecache *wc, bool wait_for_ios)
>   {
>   	struct dm_io_region region;
>   	struct dm_io_request req;
> @@ -488,17 +494,20 @@ static void ssd_commit_flushed(struct dm
>   	writecache_notify_io(0, &endio);
>   	wait_for_completion_io(&endio.c);
>   
> +	if (wait_for_ios)
> +		writecache_wait_for_ios(wc, WRITE);
> +
>   	writecache_disk_flush(wc, wc->ssd_dev);
>   
>   	memset(wc->dirty_bitmap, 0, wc->dirty_bitmap_size);
>   }
>   
> -static void writecache_commit_flushed(struct dm_writecache *wc)
> +static void writecache_commit_flushed(struct dm_writecache *wc, bool wait_for_ios)
>   {
>   	if (WC_MODE_PMEM(wc))
>   		wmb();
>   	else
> -		ssd_commit_flushed(wc);
> +		ssd_commit_flushed(wc, wait_for_ios);
>   }
>   
>   static void writecache_disk_flush(struct dm_writecache *wc, struct dm_dev *dev)
> @@ -522,12 +531,6 @@ static void writecache_disk_flush(struct
>   		writecache_error(wc, r, "error flushing metadata: %d", r);
>   }
>   
> -static void writecache_wait_for_ios(struct dm_writecache *wc, int direction)
> -{
> -	wait_event(wc->bio_in_progress_wait[direction],
> -		   !atomic_read(&wc->bio_in_progress[direction]));
> -}
> -
>   #define WFE_RETURN_FOLLOWING	1
>   #define WFE_LOWEST_SEQ		2
>   
> @@ -724,15 +727,12 @@ static void writecache_flush(struct dm_w
>   		e = e2;
>   		cond_resched();
>   	}
> -	writecache_commit_flushed(wc);
> -
> -	if (!WC_MODE_PMEM(wc))
> -		writecache_wait_for_ios(wc, WRITE);
> +	writecache_commit_flushed(wc, true);
>   
>   	wc->seq_count++;
>   	pmem_assign(sb(wc)->seq_count, cpu_to_le64(wc->seq_count));
>   	writecache_flush_region(wc, &sb(wc)->seq_count, sizeof sb(wc)->seq_count);
> -	writecache_commit_flushed(wc);
> +	writecache_commit_flushed(wc, false);
>   
>   	wc->overwrote_committed = false;
>   
> @@ -756,7 +756,7 @@ static void writecache_flush(struct dm_w
>   	}
>   
>   	if (need_flush_after_free)
> -		writecache_commit_flushed(wc);
> +		writecache_commit_flushed(wc, false);
>   }
>   
>   static void writecache_flush_work(struct work_struct *work)
> @@ -809,7 +809,7 @@ static void writecache_discard(struct dm
>   	}
>   
>   	if (discarded_something)
> -		writecache_commit_flushed(wc);
> +		writecache_commit_flushed(wc, false);
>   }
>   
>   static bool writecache_wait_for_writeback(struct dm_writecache *wc)
> @@ -958,7 +958,7 @@ erase_this:
>   
>   	if (need_flush) {
>   		writecache_flush_all_metadata(wc);
> -		writecache_commit_flushed(wc);
> +		writecache_commit_flushed(wc, false);
>   	}
>   
>   	wc_unlock(wc);
> @@ -1342,7 +1342,7 @@ static void __writecache_endio_pmem(stru
>   			wc->writeback_size--;
>   			n_walked++;
>   			if (unlikely(n_walked >= ENDIO_LATENCY)) {
> -				writecache_commit_flushed(wc);
> +				writecache_commit_flushed(wc, false);
>   				wc_unlock(wc);
>   				wc_lock(wc);
>   				n_walked = 0;
> @@ -1423,7 +1423,7 @@ pop_from_list:
>   			writecache_wait_for_ios(wc, READ);
>   		}
>   
> -		writecache_commit_flushed(wc);
> +		writecache_commit_flushed(wc, false);
>   
>   		wc_unlock(wc);
>   	}
> @@ -1766,10 +1766,10 @@ static int init_memory(struct dm_writeca
>   		write_original_sector_seq_count(wc, &wc->entries[b], -1, -1);
>   
>   	writecache_flush_all_metadata(wc);
> -	writecache_commit_flushed(wc);
> +	writecache_commit_flushed(wc, false);
>   	pmem_assign(sb(wc)->magic, cpu_to_le32(MEMORY_SUPERBLOCK_MAGIC));
>   	writecache_flush_region(wc, &sb(wc)->magic, sizeof sb(wc)->magic);
> -	writecache_commit_flushed(wc);
> +	writecache_commit_flushed(wc, false);
>   
>   	return 0;
>   }
> 

Hi Mikulas,

Swapping of the steps does indeed make sense.

/Maged

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

