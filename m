Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7CECF1C633D
	for <lists+dm-devel@lfdr.de>; Tue,  5 May 2020 23:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588714871;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uW1Fi0zqRO2OUitTzvyRu9PVBkCU5mgzuB4Gnuzn2kw=;
	b=Eob89NX7kMDRr0uRu4KnKZcXkquZr+Fpfk6hKBD1q3i+Re+jRLQ6PREjXIhNmX66e2RFQJ
	+vCNZ/YEA039MoKLUMO9qKyj+lUEoPiidYtNYn7+zHB8XO6I8bCrfKGSXwYV0vC3Dyr+1U
	gz0Fg667vDwY5g0pPlStE0wE8p3VHn0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-KU84mSenPTqXUl9CsVPAAg-1; Tue, 05 May 2020 17:41:08 -0400
X-MC-Unique: KU84mSenPTqXUl9CsVPAAg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4341D835B40;
	Tue,  5 May 2020 21:41:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82DFA5D9DD;
	Tue,  5 May 2020 21:41:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A8C74CAA8;
	Tue,  5 May 2020 21:40:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 045CAvYs010731 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 5 May 2020 08:10:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5F7882166BA2; Tue,  5 May 2020 12:10:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B5DA2156A22
	for <dm-devel@redhat.com>; Tue,  5 May 2020 12:10:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB98A8007C8
	for <dm-devel@redhat.com>; Tue,  5 May 2020 12:10:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-167-KHq9eMMfOxaO1P8KcMoq-w-1; Tue, 05 May 2020 08:10:52 -0400
X-MC-Unique: KHq9eMMfOxaO1P8KcMoq-w-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jVwPL-0004tR-Mq; Tue, 05 May 2020 12:10:43 +0000
Date: Tue, 5 May 2020 05:10:43 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Message-ID: <20200505121043.GG16070@bombadil.infradead.org>
References: <20200505115543.1660-1-thunder.leizhen@huawei.com>
	<20200505115543.1660-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200505115543.1660-2-thunder.leizhen@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 045CAvYs010731
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 05 May 2020 17:40:30 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid <linux-raid@vger.kernel.org>,
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm <linux-mm@kvack.org>,
	Song Liu <song@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>,
	Minchan Kim <minchan@kernel.org>, dm-devel <dm-devel@redhat.com>,
	Alasdair Kergon <agk@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>, Nitin Gupta <ngupta@vflare.org>
Subject: Re: [dm-devel] [PATCH 1/4] block: Move SECTORS_PER_PAGE and
 SECTORS_PER_PAGE_SHIFT definitions into <linux/blkdev.h>
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
Content-Disposition: inline

On Tue, May 05, 2020 at 07:55:40PM +0800, Zhen Lei wrote:
> +#ifndef SECTORS_PER_PAGE_SHIFT
> +#define SECTORS_PER_PAGE_SHIFT	(PAGE_SHIFT - SECTOR_SHIFT)
> +#endif
> +#ifndef SECTORS_PER_PAGE
> +#define SECTORS_PER_PAGE	(1 << SECTORS_PER_PAGE_SHIFT)
>  #endif

I find SECTORS_PER_PAGE_SHIFT quite hard to read.  I had a quick skim
of your other patches, and it seems to me that we could replace
'<< SECTORS_PER_PAGE_SHIFT' with '* SECTORS_PER_PAGE' and it would be
more readable in every case.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

