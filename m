Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 20C851EA5CF
	for <lists+dm-devel@lfdr.de>; Mon,  1 Jun 2020 16:29:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591021798;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=98wPBnoqQoaiHv0i5SgtqETycIs/QP3W2ZKSrdSnz4c=;
	b=PjyHIQlg1xXD5DB12obrHw+Ng3x7RXt9Ah82VUCXhExoQ00NTddLM43wJslyvpZVChYoFr
	Wq4IvJh9oim5FqC3qIQDMX6SMg91kvaOn122G9eN1cjRuzAwy2AdwPAkdN5ys41efVhOOs
	FaoBbrzuEoTvLLUyxk6+NE3pKCJjkTQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121--o0-RG7_P-WX3-2TUHpdag-1; Mon, 01 Jun 2020 10:29:54 -0400
X-MC-Unique: -o0-RG7_P-WX3-2TUHpdag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E1BA835BAA;
	Mon,  1 Jun 2020 14:29:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2EC65D9C9;
	Mon,  1 Jun 2020 14:29:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B57E1809543;
	Mon,  1 Jun 2020 14:29:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 051ETEUu023437 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jun 2020 10:29:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9363A61981; Mon,  1 Jun 2020 14:29:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BE26610AB;
	Mon,  1 Jun 2020 14:29:09 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 051ET8id023708; Mon, 1 Jun 2020 10:29:08 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 051ET8q5023704; Mon, 1 Jun 2020 10:29:08 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Mon, 1 Jun 2020 10:29:08 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Huaisheng Ye <yehs2007@zoho.com>
In-Reply-To: <20200530091250.58420-1-yehs2007@zoho.com>
Message-ID: <alpine.LRH.2.02.2006011022220.23428@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200530091250.58420-1-yehs2007@zoho.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: prarit@redhat.com, Huaisheng Ye <yehs1@lenovo.com>, snitzer@redhat.com,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	tyu1@lenovo.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH] dm writecache: reinitialize lru in writeback
 instead of endio
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Sat, 30 May 2020, Huaisheng Ye wrote:

> From: Huaisheng Ye <yehs1@lenovo.com>
> 
> When wc_entry has been removed from wbl->list in writeback, it will
> be not used again except waiting to be set free in writecache_free_entry.
> 
> That is a little of annoying, it has to reinitialize lru of wc_entry
> in endio before calling writecache_free_entry.
> 
> Using list_del_init instead of list_del in writeback for simpler code.
> 
> Signed-off-by: Huaisheng Ye <yehs1@lenovo.com>

This patch doesn't fix anything, so I think we don't need it.

Actually, it's better to keep the list entry uninitialized, because it 
helps us catch bugs where this uninitialized list entry could be used 
improperly.

Mikulas

> ---
>  drivers/md/dm-writecache.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
> index 7bbc21b..66f3a3b 100644
> --- a/drivers/md/dm-writecache.c
> +++ b/drivers/md/dm-writecache.c
> @@ -1519,7 +1519,6 @@ static void __writecache_endio_pmem(struct dm_writecache *wc, struct list_head *
>  			e = wb->wc_list[i];
>  			BUG_ON(!e->write_in_progress);
>  			e->write_in_progress = false;
> -			INIT_LIST_HEAD(&e->lru);
>  			if (!writecache_has_error(wc))
>  				writecache_free_entry(wc, e);
>  			BUG_ON(!wc->writeback_size);
> @@ -1555,7 +1554,6 @@ static void __writecache_endio_ssd(struct dm_writecache *wc, struct list_head *l
>  		do {
>  			BUG_ON(!e->write_in_progress);
>  			e->write_in_progress = false;
> -			INIT_LIST_HEAD(&e->lru);
>  			if (!writecache_has_error(wc))
>  				writecache_free_entry(wc, e);
>  
> @@ -1654,7 +1652,7 @@ static void __writecache_writeback_pmem(struct dm_writecache *wc, struct writeba
>  	while (wbl->size) {
>  		wbl->size--;
>  		e = container_of(wbl->list.prev, struct wc_entry, lru);
> -		list_del(&e->lru);
> +		list_del_init(&e->lru);
>  
>  		max_pages = e->wc_list_contiguous;
>  
> @@ -1685,7 +1683,7 @@ static void __writecache_writeback_pmem(struct dm_writecache *wc, struct writeba
>  			if (!wc_add_block(wb, f, GFP_NOWAIT | __GFP_NOWARN))
>  				break;
>  			wbl->size--;
> -			list_del(&f->lru);
> +			list_del_init(&f->lru);
>  			wb->wc_list[wb->wc_list_n++] = f;
>  			e = f;
>  		}
> @@ -1712,7 +1710,7 @@ static void __writecache_writeback_ssd(struct dm_writecache *wc, struct writebac
>  
>  		wbl->size--;
>  		e = container_of(wbl->list.prev, struct wc_entry, lru);
> -		list_del(&e->lru);
> +		list_del_init(&e->lru);
>  
>  		n_sectors = e->wc_list_contiguous << (wc->block_size_bits - SECTOR_SHIFT);
>  
> @@ -1732,7 +1730,7 @@ static void __writecache_writeback_ssd(struct dm_writecache *wc, struct writebac
>  			wbl->size--;
>  			f = container_of(wbl->list.prev, struct wc_entry, lru);
>  			BUG_ON(f != e + 1);
> -			list_del(&f->lru);
> +			list_del_init(&f->lru);
>  			e = f;
>  		}
>  
> -- 
> 1.8.3.1
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

