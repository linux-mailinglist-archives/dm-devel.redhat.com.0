Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9F1C32765E2
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 03:31:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-IJGzSpw5M7Way0n6tRKcmQ-1; Wed, 23 Sep 2020 21:31:51 -0400
X-MC-Unique: IJGzSpw5M7Way0n6tRKcmQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BCCC802B76;
	Thu, 24 Sep 2020 01:31:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AEA055768;
	Thu, 24 Sep 2020 01:31:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 27CE144A47;
	Thu, 24 Sep 2020 01:31:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08O1VbTR002604 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Sep 2020 21:31:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D89C010379C; Thu, 24 Sep 2020 01:31:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D42742B4D19
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 01:31:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B63F4900C62
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 01:31:34 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-375-nkw0EkE3MT6UftS728VFtQ-1; Wed, 23 Sep 2020 21:31:30 -0400
X-MC-Unique: nkw0EkE3MT6UftS728VFtQ-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1kLFlu-0001B3-Mr; Thu, 24 Sep 2020 01:10:06 +0000
Date: Thu, 24 Sep 2020 02:10:06 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200924011006.GT32101@casper.infradead.org>
References: <20200625113122.7540-1-willy@infradead.org>
	<20200625113122.7540-7-willy@infradead.org>
	<20200924003902.GA10500@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200924003902.GA10500@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [dm-devel] [PATCH 6/6] mm: Add memalloc_nowait
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 23, 2020 at 08:39:02PM -0400, Mike Snitzer wrote:
> On Thu, Jun 25 2020 at  7:31am -0400,
> Matthew Wilcox (Oracle) <willy@infradead.org> wrote:
> 
> > Similar to memalloc_noio() and memalloc_nofs(), memalloc_nowait()
> > guarantees we will not sleep to reclaim memory.  Use it to simplify
> > dm-bufio's allocations.
> > 
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > ---
> >  drivers/md/dm-bufio.c    | 30 ++++++++----------------------
> >  include/linux/sched.h    |  1 +
> >  include/linux/sched/mm.h | 12 ++++++++----
> >  3 files changed, 17 insertions(+), 26 deletions(-)
> 
> 
> Hi,
> 
> Curious on the state of this patchset?  Not seeing it in next-20200923
> 
> The dm-bufio cleanup looks desirable.

I've been busy with THPs and haven't pushed this patchset for this window.
It's probably a bit late now we're at rc6, so I'll clean it up and push
it for 5.11?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

