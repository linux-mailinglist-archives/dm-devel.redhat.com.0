Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B90CC5E7EFD
	for <lists+dm-devel@lfdr.de>; Fri, 23 Sep 2022 17:53:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663948393;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jQEoukUDM7UiWSG2QTi6/B0LA1gKI/2Ccf4CxaJ+dJI=;
	b=GgcYE08Q0+USscj+42u5A7XMZMkZ/HfAuCxO3w2gHzLmn8LyS02oTARtI5zG3mM6GW9Sv9
	rMlLI48XujiCs59Yh/ximVIATWC91QXHXR3Tqz4BMLUR6ZFFxYeTpuxK8xLOaw7pdkDEck
	5U/MzmIFF/U3mNWO4ib9y4x4gQs9rXI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-Frfs9ZYUPvuE8STm3drxXA-1; Fri, 23 Sep 2022 11:53:10 -0400
X-MC-Unique: Frfs9ZYUPvuE8STm3drxXA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD5F6101A528;
	Fri, 23 Sep 2022 15:53:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E48A640C83D9;
	Fri, 23 Sep 2022 15:53:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D03981946A5A;
	Fri, 23 Sep 2022 15:53:03 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2767419465A4
 for <dm-devel@listman.corp.redhat.com>; Fri, 23 Sep 2022 15:53:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1390DC15BA5; Fri, 23 Sep 2022 15:53:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C786C15BA4
 for <dm-devel@redhat.com>; Fri, 23 Sep 2022 15:53:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0EEB3C1023A
 for <dm-devel@redhat.com>; Fri, 23 Sep 2022 15:53:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-501-xUcQeYaXOQW9hr1eBM4hHA-1; Fri, 23 Sep 2022 11:52:59 -0400
X-MC-Unique: xUcQeYaXOQW9hr1eBM4hHA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1obkz3-004tlz-5e; Fri, 23 Sep 2022 15:52:57 +0000
Date: Fri, 23 Sep 2022 08:52:57 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <Yy3WWap0A3WD8nkq@infradead.org>
References: <alpine.LRH.2.02.2209201350470.26058@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2209201353540.26058@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2209201353540.26058@file01.intranet.prod.int.rdu2.redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [dm-devel] [PATCH v2 2/4] brd: extend the rcu regions to cover
 read and write
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
 dm-devel@redhat.com, linux-block@vger.kernel.org,
 Zdenek Kabelac <zkabelac@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 20, 2022 at 01:56:25PM -0400, Mikulas Patocka wrote:
> This patch extends the rcu regions, so that lookup followed by a read or
> write of a page is done inside rcu read lock. This si be needed for the
> following patch that enables discard.
> 
> Note that we also replace "BUG_ON(!page);" with "if (page) ..." in
> copy_to_brd - the page may be NULL if write races with discard. In this
> situation, the result is undefined, so we can actually skip the write
> operation at all.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> 
> ---
>  drivers/block/brd.c |   59 +++++++++++++++++++++++-----------------------------
>  1 file changed, 27 insertions(+), 32 deletions(-)
> 
> Index: linux-2.6/drivers/block/brd.c
> ===================================================================
> --- linux-2.6.orig/drivers/block/brd.c
> +++ linux-2.6/drivers/block/brd.c
> @@ -50,31 +50,12 @@ struct brd_device {
>  
>  /*
>   * Look up and return a brd's page for a given sector.
> + * This must be called with the rcu lock held.
>   */
>  static struct page *brd_lookup_page(struct brd_device *brd, sector_t sector)
>  {
> +	pgoff_t idx = sector >> PAGE_SECTORS_SHIFT; /* sector to page index */
> +	return radix_tree_lookup(&brd->brd_pages, idx);
>  }

This is still missing the rcu_read_lock_held() assertation if you
want to keep it as separate function.

> +	rcu_read_lock();
> +	page = brd_lookup_page(brd, sector);
> +	if (page) {
> +		dst = kmap_atomic(page);
> +		memcpy(dst + offset, src, copy);
> +		kunmap_atomic(dst);
> +	}
> +	rcu_read_unlock();

How is the null check going to work here?  Simply not copying
data is no exactly the expected result.

This is why I think we need the higher level rework I suggested
last time where we have a helper that always gives you page
(or maybe an error) by moving the insert so that it also does
the actual final lookup.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

