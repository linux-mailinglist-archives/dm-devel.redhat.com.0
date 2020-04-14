Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DFAEA1A8A83
	for <lists+dm-devel@lfdr.de>; Tue, 14 Apr 2020 21:05:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586891158;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UFCJHpJsXqREQt6nWUxYMGbj/CE1anIvFwZ7ayZTNlo=;
	b=ZhpgmyNEff7iaR+MUSxbF84AHSHyR+DAFzsLJKsrEAYdnhjoJ2uRWNsXkWlm8iGMcLFsL1
	nVjtiv8umWv53w4/IrwFrIr+6fEdhZYtgkpakR9M5/3kw1SJILjDrritJt+JGPKpxoLO4a
	UAiL6RCzUaM+8bUb4tMZbsOC/WbzKrg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-TDBQ9CUdNZika2DWqHCh8g-1; Tue, 14 Apr 2020 15:05:56 -0400
X-MC-Unique: TDBQ9CUdNZika2DWqHCh8g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3470F1007275;
	Tue, 14 Apr 2020 19:05:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CB905C1D4;
	Tue, 14 Apr 2020 19:05:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A403D18089C8;
	Tue, 14 Apr 2020 19:05:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03EJ5Jqu006135 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 15:05:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EBECE1A269; Tue, 14 Apr 2020 19:05:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D704026E46;
	Tue, 14 Apr 2020 19:05:16 +0000 (UTC)
Date: Tue, 14 Apr 2020 15:05:16 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200414190515.GA25340@redhat.com>
References: <alpine.LRH.2.02.2004081459520.14853@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2004081459520.14853@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, David Teigland <teigland@redhat.com>
Subject: Re: [dm-devel] dm writecache: fix data corruption when reloading
	the target
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Apr 08 2020 at  3:02pm -0400,
Mikulas Patocka <mpatocka@redhat.com> wrote:

> The dm-writecache reads metadata in the target constructor. However, when 
> we reload the target, there could be another active instance running on 
> the same device. This is the sequence of operations when doing a reload:
> 
> 1. construct new target
> 2. suspend old target
> 3. resume new target
> 4. destroy old target
> 
> Metadata that were written by the old target between steps 1 and 2 would
> not be visible by the new target.
> 
> This patch fixes the data corruption by loading the metadata in the resume
> handler.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org	# v4.18+
> Fixes: 48debafe4f2f ("dm: add writecache target")
> 
> ---
>  drivers/md/dm-writecache.c |   44 ++++++++++++++++++++++++++++++--------------
>  1 file changed, 30 insertions(+), 14 deletions(-)
> 
> Index: linux-2.6/drivers/md/dm-writecache.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm-writecache.c	2020-04-08 14:47:17.000000000 +0200
> +++ linux-2.6/drivers/md/dm-writecache.c	2020-04-08 20:59:15.000000000 +0200
> @@ -931,6 +931,24 @@ static int writecache_alloc_entries(stru
>  	return 0;
>  }
>  
> +static int writecache_read_metadata(struct dm_writecache *wc, sector_t n_sectors)
> +{
> +	struct dm_io_region region;
> +	struct dm_io_request req;
> +
> +	region.bdev = wc->ssd_dev->bdev;
> +	region.sector = wc->start_sector;
> +	region.count = wc->metadata_sectors;
> +	req.bi_op = REQ_OP_READ;
> +	req.bi_op_flags = REQ_SYNC;
> +	req.mem.type = DM_IO_VMA;
> +	req.mem.ptr.vma = (char *)wc->memory_map;
> +	req.client = wc->dm_io;
> +	req.notify.fn = NULL;
> +
> +	return dm_io(&req, 1, &region, NULL);
> +}
> +

You aren't using the passed n_sectors (for region.count?)


>  static void writecache_resume(struct dm_target *ti)
>  {
>  	struct dm_writecache *wc = ti->private;
> @@ -941,8 +959,16 @@ static void writecache_resume(struct dm_
>  
>  	wc_lock(wc);
>  
> -	if (WC_MODE_PMEM(wc))
> +	if (WC_MODE_PMEM(wc)) {
>  		persistent_memory_invalidate_cache(wc->memory_map, wc->memory_map_size);
> +	} else {
> +		r = writecache_read_metadata(wc, wc->metadata_sectors);
> +		if (r) {
> +			writecache_error(wc, r, "unable to read metadata: %d", r);
> +			memset((char *)wc->memory_map + offsetof(struct wc_memory_superblock, entries), -1,
> +			       (wc->metadata_sectors << SECTOR_SHIFT) - offsetof(struct wc_memory_superblock, entries));
> +		}
> +	}
>  
>  	wc->tree = RB_ROOT;
>  	INIT_LIST_HEAD(&wc->lru);
> @@ -2200,8 +2226,6 @@ invalid_optional:
>  			goto bad;
>  		}
>  	} else {
> -		struct dm_io_region region;
> -		struct dm_io_request req;
>  		size_t n_blocks, n_metadata_blocks;
>  		uint64_t n_bitmap_bits;
>  
> @@ -2258,17 +2282,9 @@ invalid_optional:
>  			goto bad;
>  		}
>  
> -		region.bdev = wc->ssd_dev->bdev;
> -		region.sector = wc->start_sector;
> -		region.count = wc->metadata_sectors;
> -		req.bi_op = REQ_OP_READ;
> -		req.bi_op_flags = REQ_SYNC;
> -		req.mem.type = DM_IO_VMA;
> -		req.mem.ptr.vma = (char *)wc->memory_map;
> -		req.client = wc->dm_io;
> -		req.notify.fn = NULL;
> -
> -		r = dm_io(&req, 1, &region, NULL);
> +		r = writecache_read_metadata(wc,
> +			min((sector_t)bdev_logical_block_size(wc->ssd_dev->bdev) >> SECTOR_SHIFT,
> +			    (sector_t)wc->metadata_sectors));

Can you explain why this is needed?  Why isn't wc->metadata_sectors
already compatible with wc->ssd_dev->bdev ?

Yet you just use wc->metadata_sectors in the new call to
writecache_read_metadata() in writecache_resume()...

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

