Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2459D3158F3
	for <lists+dm-devel@lfdr.de>; Tue,  9 Feb 2021 22:52:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612907548;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+ggrjhEl/8fsLfECgpf1B34aIcuBJTU3ZxJ81LbIShQ=;
	b=WdshQUNlwVizAEYKXH1thEy1ggfSRDtbSFsMNNRZr+qBGvmo1MonJm42xpo5ZpE0WABjpV
	8KbmyUk+CaT30EnO13iL4MTsUsN/euMWJMz3BCr2Zcd0rJY2LVpLpjYgVh4tt+vdMOCztQ
	YIV6bJctJrPIarGpvB99ibEmV0XOkCk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-s6OGadgiMFKdHC-GKZQ1dA-1; Tue, 09 Feb 2021 16:52:25 -0500
X-MC-Unique: s6OGadgiMFKdHC-GKZQ1dA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 497CF107ACE6;
	Tue,  9 Feb 2021 21:52:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15EA81820C;
	Tue,  9 Feb 2021 21:52:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66AAF18095CB;
	Tue,  9 Feb 2021 21:52:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 119Lq377022195 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Feb 2021 16:52:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8307C5D9CD; Tue,  9 Feb 2021 21:52:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 714765D9C0;
	Tue,  9 Feb 2021 21:52:00 +0000 (UTC)
Date: Tue, 9 Feb 2021 16:51:59 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20210209215159.GA2637@redhat.com>
References: <alpine.LRH.2.02.2102091053450.5801@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2102091053450.5801@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, David Teigland <teigland@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [dm-devel] dm-writecache: allow the underlying device to be
	shrunk
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

On Tue, Feb 09 2021 at 10:56am -0500,
Mikulas Patocka <mpatocka@redhat.com> wrote:

> Allow shrinking the underlying data device (dm-writecache must be
> suspended when the device is shrunk).
> 
> This patch modifies dm-writecache, so that it doesn't attempt to write any
> data beyond the end of the data device.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org
> 
> ---
>  drivers/md/dm-writecache.c |   18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> Index: linux-2.6/drivers/md/dm-writecache.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm-writecache.c	2021-02-05 20:30:35.000000000 +0100
> +++ linux-2.6/drivers/md/dm-writecache.c	2021-02-09 16:50:36.000000000 +0100
> @@ -148,6 +148,7 @@ struct dm_writecache {
>  	size_t metadata_sectors;
>  	size_t n_blocks;
>  	uint64_t seq_count;
> +	uint64_t data_device_sectors;
>  	void *block_start;
>  	struct wc_entry *entries;
>  	unsigned block_size;
> @@ -969,6 +970,8 @@ static void writecache_resume(struct dm_
>  
>  	wc_lock(wc);
>  
> +	wc->data_device_sectors = i_size_read(wc->dev->bdev->bd_inode) >> SECTOR_SHIFT;
> +

I switched it to using bdev_nr_sectors() (and sector_t instead of uint64_t) instead.

>  	if (WC_MODE_PMEM(wc)) {
>  		persistent_memory_invalidate_cache(wc->memory_map, wc->memory_map_size);
>  	} else {
> @@ -1638,6 +1641,10 @@ static bool wc_add_block(struct writebac
>  	void *address = memory_data(wc, e);
>  
>  	persistent_memory_flush_cache(address, block_size);
> +
> +	if (unlikely(wb->bio.bi_iter.bi_sector + bio_sectors(&wb->bio) >= wc->data_device_sectors))
> +		return true;
> +

I updated it to use bio_end_sector()

Otherwise looks good.

diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index d9c0d41e29f3..844c4be11768 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -148,7 +148,7 @@ struct dm_writecache {
        size_t metadata_sectors;
        size_t n_blocks;
        uint64_t seq_count;
-       uint64_t data_device_sectors;
+       sector_t data_device_sectors;
        void *block_start;
        struct wc_entry *entries;
        unsigned block_size;
@@ -978,7 +978,7 @@ static void writecache_resume(struct dm_target *ti)

        wc_lock(wc);

-       wc->data_device_sectors = i_size_read(wc->dev->bdev->bd_inode) >> SECTOR_SHIFT;
+       wc->data_device_sectors = bdev_nr_sectors(wc->dev->bdev);

        if (WC_MODE_PMEM(wc)) {
                persistent_memory_invalidate_cache(wc->memory_map, wc->memory_map_size);
@@ -1650,7 +1650,7 @@ static bool wc_add_block(struct writeback_struct *wb, struct wc_entry *e, gfp_t

        persistent_memory_flush_cache(address, block_size);

-       if (unlikely(wb->bio.bi_iter.bi_sector + bio_sectors(&wb->bio) >= wc->data_device_sectors))
+       if (unlikely(bio_end_sector(&wb->bio) >= wc->data_device_sectors))
                return true;

        return bio_add_page(&wb->bio, persistent_memory_page(address),


BUT, it should be noted bdev_nr_sectors is pretty recent, introduced
with commit a782483cc1f8 ("block: remove the nr_sects field in struct
hd_struct").  SO using bdev_nr_sectors creates problems with stable@... 
given that I'll revert back to open-coding it in the tsable@ patch and
then apply a quick change to use bdev_nr_sectors().

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

