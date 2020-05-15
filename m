Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 33A601D46E2
	for <lists+dm-devel@lfdr.de>; Fri, 15 May 2020 09:15:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589526958;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+lkqGETu0Ad4+vnGM+iwamUgIIeOT/Bzc2mTNvfwM+g=;
	b=OyILwPXwvrhjoKI/Km0Yj0tjl3fsxtbj2tUxCkqhvZDoNDsH4XePUv9Bb3kJ2/+u2s+qhJ
	Aki5wmRZrsFTAhwuK108Ja9D14uODJ3wRFaqnEl1DsYA1fe+7xVXQh+BhTgSO8WhwqdT1S
	U5lDlsLSk9t0mfHD6BBFqnGRamHCQhI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-RpLepi4WNdOgLzYxmtddDQ-1; Fri, 15 May 2020 03:15:55 -0400
X-MC-Unique: RpLepi4WNdOgLzYxmtddDQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 044CE1899536;
	Fri, 15 May 2020 07:15:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D18E4100EBAC;
	Fri, 15 May 2020 07:15:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8AF801809547;
	Fri, 15 May 2020 07:15:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04F4JVQM016227 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 15 May 2020 00:19:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ECF17F7FB2; Fri, 15 May 2020 04:19:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E089AF5674
	for <dm-devel@redhat.com>; Fri, 15 May 2020 04:19:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18E4A185A78B
	for <dm-devel@redhat.com>; Fri, 15 May 2020 04:19:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-371-Tcyplx9oP4CF5YDqaTt66g-1; Fri, 15 May 2020 00:19:24 -0400
X-MC-Unique: Tcyplx9oP4CF5YDqaTt66g-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jZRoa-0006Is-Ic; Fri, 15 May 2020 04:19:16 +0000
Date: Thu, 14 May 2020 21:19:16 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Message-ID: <20200515041916.GE16070@bombadil.infradead.org>
References: <20200507075100.1779-1-thunder.leizhen@huawei.com>
	<20200507075100.1779-8-thunder.leizhen@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200507075100.1779-8-thunder.leizhen@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Subject: Re: [dm-devel] [PATCH v2 07/10] block: use sectors_to_npage() and
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

On Thu, May 07, 2020 at 03:50:57PM +0800, Zhen Lei wrote:
> +++ b/block/blk-settings.c
> @@ -150,7 +150,7 @@ void blk_queue_max_hw_sectors(struct request_queue *q, unsigned int max_hw_secto
>  	unsigned int max_sectors;
>  
>  	if ((max_hw_sectors << 9) < PAGE_SIZE) {
> -		max_hw_sectors = 1 << (PAGE_SHIFT - 9);
> +		max_hw_sectors = PAGE_SECTORS;

Surely this should be:

	if (max_hw_sectors < PAGE_SECTORS) {
		max_hw_sectors = PAGE_SECTORS;

... no?

> -	page = read_mapping_page(mapping,
> -			(pgoff_t)(n >> (PAGE_SHIFT - 9)), NULL);
> +	page = read_mapping_page(mapping, (pgoff_t)sectors_to_npage(n), NULL);

... again, get the type right, and you won't need the cast.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

