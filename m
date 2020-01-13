Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 98B0513A8C4
	for <lists+dm-devel@lfdr.de>; Tue, 14 Jan 2020 12:56:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579002962;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uvqLjn5xgBlkLO18UQCmKeNQM6/yy3VpZ1soeyr5Y+8=;
	b=IqOwsBqEw2djn2C1OsObmtOD3O/fjRN3bpY/pN50xyrebau/pZ9xNnGWqVE4BIRkKJJVfd
	Ksa1JUfzoVxEIwYaZkiL60LQ1NDmfGwXGlYr3+HGFAHyusSVVzJNPwZaUh4wpFy8VamBc8
	24szmTOWUgHhkETt/683s8L2iv3p/bY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-YEo3acOzOMe3TsXnZ22Y2A-1; Tue, 14 Jan 2020 06:55:54 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4106EDBAD;
	Tue, 14 Jan 2020 11:55:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18F695DA32;
	Tue, 14 Jan 2020 11:55:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99FB487088;
	Tue, 14 Jan 2020 11:55:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00DJZRHA007764 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jan 2020 14:35:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DB3F22166B28; Mon, 13 Jan 2020 19:35:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D56882166B2C
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 19:35:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE20E80004E
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 19:35:25 +0000 (UTC)
Received: from gateway36.websitewelcome.com (gateway36.websitewelcome.com
	[192.185.184.18]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-211-x6vYkdl9P9y7z7l-53Sy3g-1; Mon, 13 Jan 2020 14:35:23 -0500
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
	by gateway36.websitewelcome.com (Postfix) with ESMTP id E8249400C827C
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 12:47:44 -0600 (CST)
Received: from host2059.hostmonster.com ([67.20.112.233]) by cmsmtp with SMTP
	id r5UgiFMjaiJ43r5UgiW6hj; Mon, 13 Jan 2020 13:35:22 -0600
X-Authority-Reason: nr=8
Received: from [196.157.140.70] (port=15457 helo=[192.168.100.109])
	by host2059.hostmonster.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
	(envelope-from <mmokhtar@petasan.org>)
	id 1ir5Uf-0004RX-Gz; Mon, 13 Jan 2020 12:35:22 -0700
To: Mikulas Patocka <mpatocka@redhat.com>
References: <598c7c64-9b11-3407-2060-8d43b1ef1241@petasan.org>
	<d76f7245-034c-f225-00fe-f33c5e9abf1a@petasan.org>
	<alpine.LRH.2.02.2001021144450.18253@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2001081202001.7856@file01.intranet.prod.int.rdu2.redhat.com>
From: Maged Mokhtar <mmokhtar@petasan.org>
Message-ID: <1559eac4-3d99-2eb5-3137-1f194f5461b5@petasan.org>
Date: Mon, 13 Jan 2020 21:35:17 +0200
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
X-Source-IP: 196.157.140.70
X-Source-L: No
X-Exim-ID: 1ir5Uf-0004RX-Gz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.100.109]) [196.157.140.70]:15457
X-Source-Auth: mmokhtar@petasan.org
X-Email-Count: 2
X-Source-Cap: cGV0YXNhbm87cGV0YXNhbm87aG9zdDIwNTkuaG9zdG1vbnN0ZXIuY29t
X-Local-Domain: yes
X-MC-Unique: x6vYkdl9P9y7z7l-53Sy3g-1
X-MC-Unique: YEo3acOzOMe3TsXnZ22Y2A-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 14 Jan 2020 06:55:09 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit



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

Hi Mikulas

On a test disk, performance is same with or without patch.
Using fio 4k rand write iops:
12 K iops with sync/fua = 0
2.7K iops with sync/fua = 1

------- Without patch ----------

fio --name=4kiops --filename=/dev/vg1/slow --rw=randwrite --bs=4k 
--direct=1 --sync=0 --runtime=10 --time_based --numjobs=16 --iodepth=1 
--group_reporting

Run status group 0 (all jobs):
   WRITE: bw=46.9MiB/s (49.2MB/s), 46.9MiB/s-46.9MiB/s 
(49.2MB/s-49.2MB/s), io=469MiB (492MB), run=10005-10005msec

fio --name=4kiops --filename=/dev/vg1/slow --rw=randwrite --bs=4k 
--direct=1 --sync=1 --runtime=10 --time_based --numjobs=16 --iodepth=1 
--group_reporting

Run status group 0 (all jobs):
   WRITE: bw=10.7MiB/s (11.2MB/s), 10.7MiB/s-10.7MiB/s 
(11.2MB/s-11.2MB/s), io=107MiB (112MB), run=10007-1000    7msec


------- With patch ----------

fio --name=4kiops --filename=/dev/vg1/slow --rw=randwrite --bs=4k 
--direct=1 --sync=0 --runtime=10 --time_based --numjobs=16 --iodepth=1 
--group_reporting

Run status group 0 (all jobs):
   WRITE: bw=46.8MiB/s (49.0MB/s), 46.8MiB/s-46.8MiB/s 
(49.0MB/s-49.0MB/s), io=468MiB (491MB), run=10004-10004msec

fio --name=4kiops --filename=/dev/vg1/slow --rw=randwrite --bs=4k 
--direct=1 --sync=1 --runtime=10 --time_based --numjobs=16 --iodepth=1 
--group_reporting

Run status group 0 (all jobs):
   WRITE: bw=10.8MiB/s (11.3MB/s), 10.8MiB/s-10.8MiB/s 
(11.3MB/s-11.3MB/s), io=108MiB (113MB), run=10005-10005msec

/Maged

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

