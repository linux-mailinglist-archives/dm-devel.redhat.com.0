Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 17A6B1D46E5
	for <lists+dm-devel@lfdr.de>; Fri, 15 May 2020 09:16:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589526963;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L1RxCa3KCEmxNyQRbSGO379AJQKphngZwRl8WzGprJE=;
	b=RpNM2l714BYorE5Y6Nu0YODnCZsHwvRpFR7fggAwmbOPzlAELaO8/6QJufwJRJx2E2PpWK
	xdTkCDF7RCwIl7rBXRK3/3uFMOMduQyaBsRw6/Ou1fINCWuwxfUE+R7/aqm9kchkczKR7/
	esmTH0d647jC8LTRYqvj7+iI++i0q7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-uT1f1m0ENeW9FfoKJIVN8w-1; Fri, 15 May 2020 03:15:53 -0400
X-MC-Unique: uT1f1m0ENeW9FfoKJIVN8w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D88B100CCC2;
	Fri, 15 May 2020 07:15:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA80610027AC;
	Fri, 15 May 2020 07:15:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D5F81809543;
	Fri, 15 May 2020 07:15:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04F4FE9D016002 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 15 May 2020 00:15:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 31BF710AF410; Fri, 15 May 2020 04:15:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21BFD10F1BE2
	for <dm-devel@redhat.com>; Fri, 15 May 2020 04:15:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85A638007CD
	for <dm-devel@redhat.com>; Fri, 15 May 2020 04:15:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-132-vsknKa7WMbSnrxon78--9Q-1; Fri, 15 May 2020 00:15:08 -0400
X-MC-Unique: vsknKa7WMbSnrxon78--9Q-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jZRkO-0003X9-II; Fri, 15 May 2020 04:14:56 +0000
Date: Thu, 14 May 2020 21:14:56 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Message-ID: <20200515041456.GD16070@bombadil.infradead.org>
References: <20200507075100.1779-1-thunder.leizhen@huawei.com>
	<20200507075100.1779-7-thunder.leizhen@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200507075100.1779-7-thunder.leizhen@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 15 May 2020 03:15:32 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid <linux-raid@vger.kernel.org>,
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm <linux-mm@kvack.org>,
	Song Liu <song@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	Coly Li <colyli@suse.de>, linux-block <linux-block@vger.kernel.org>,
	Minchan Kim <minchan@kernel.org>, dm-devel <dm-devel@redhat.com>,
	Alasdair Kergon <agk@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Nitin Gupta <ngupta@vflare.org>
Subject: Re: [dm-devel] [PATCH v2 06/10] mm/swap: use npage_to_sectors() and
 PAGE_SECTORS to clean up code
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, May 07, 2020 at 03:50:56PM +0800, Zhen Lei wrote:
> +++ b/mm/page_io.c
> @@ -38,7 +38,7 @@ static struct bio *get_swap_bio(gfp_t gfp_flags,
>  
>  		bio->bi_iter.bi_sector = map_swap_page(page, &bdev);
>  		bio_set_dev(bio, bdev);
> -		bio->bi_iter.bi_sector <<= PAGE_SHIFT - 9;
> +		bio->bi_iter.bi_sector *= PAGE_SECTORS;
>  		bio->bi_end_io = end_io;

This just doesn't look right.  Why is map_swap_page() returning a sector_t
which isn't actually a sector_t?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

