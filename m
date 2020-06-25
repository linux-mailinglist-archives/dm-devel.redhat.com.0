Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 62E7C20AE4A
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jun 2020 10:14:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593159270;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vr7XetaQ7Mkz+wg1SM3CLRI5ihEPuI83vPoiy/t9274=;
	b=X4YZOXECWHvV5eB96Id7lAesAC4X8cAvDHUNDfQTMOIJgL8mrVwMaDTKAKwF01D6OcgDf1
	fXRvWm+2TCZeRrpOqETnbN7kobVXz3J4ULdGJrAvTn6iaDdzeU9Gw6lhVdnei+tHlUpqqe
	ChkTTs3MEy33v3fJAp9lsf/Z3wbj/iM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-USkdwB32NlSyJiBZdVwd8g-1; Fri, 26 Jun 2020 04:14:27 -0400
X-MC-Unique: USkdwB32NlSyJiBZdVwd8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D297C8015F7;
	Fri, 26 Jun 2020 08:14:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFA6911CC32;
	Fri, 26 Jun 2020 08:14:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 680BA1809557;
	Fri, 26 Jun 2020 08:14:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PDB8UJ032226 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 09:11:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D27CB2144B4B; Thu, 25 Jun 2020 13:11:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB9E6201181E
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 13:11:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52B73805F54
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 13:11:05 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-151-Z5vTnAgCPQ6m2Qrpe-aMYA-1; Thu, 25 Jun 2020 09:11:02 -0400
X-MC-Unique: Z5vTnAgCPQ6m2Qrpe-aMYA-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1joReZ-00077i-S6; Thu, 25 Jun 2020 13:10:55 +0000
Date: Thu, 25 Jun 2020 14:10:55 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Michal Hocko <mhocko@kernel.org>
Message-ID: <20200625131055.GC7703@casper.infradead.org>
References: <20200625113122.7540-1-willy@infradead.org>
	<20200625113122.7540-7-willy@infradead.org>
	<20200625124017.GL1320@dhcp22.suse.cz>
MIME-Version: 1.0
In-Reply-To: <20200625124017.GL1320@dhcp22.suse.cz>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Jun 2020 04:13:56 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jun 25, 2020 at 02:40:17PM +0200, Michal Hocko wrote:
> On Thu 25-06-20 12:31:22, Matthew Wilcox wrote:
> > Similar to memalloc_noio() and memalloc_nofs(), memalloc_nowait()
> > guarantees we will not sleep to reclaim memory.  Use it to simplify
> > dm-bufio's allocations.
> 
> memalloc_nowait is a good idea! I suspect the primary usecase would be
> vmalloc.

That's funny.  My use case is allocating page tables in an RCU protected
page fault handler.  Jens' use case is allocating page cache.  This one
is a vmalloc consumer (which is also indirectly page table allocation).

> > @@ -877,7 +857,9 @@ static struct dm_buffer *__alloc_buffer_wait_no_callback(struct dm_bufio_client
> >  	 */
> >  	while (1) {
> >  		if (dm_bufio_cache_size_latch != 1) {
> > -			b = alloc_buffer(c, GFP_NOWAIT | __GFP_NORETRY | __GFP_NOMEMALLOC | __GFP_NOWARN);
> > +			unsigned nowait_flag = memalloc_nowait_save();
> > +			b = alloc_buffer(c, GFP_KERNEL | __GFP_NOMEMALLOC | __GFP_NOWARN);
> > +			memalloc_nowait_restore(nowait_flag);
> 
> This looks confusing though. I am not familiar with alloc_buffer and
> there is quite some tweaking around __GFP_NORETRY in alloc_buffer_data
> which I do not follow but GFP_KERNEL just struck my eyes. So why cannot
> we have 
> 		alloc_buffer(GFP_NOWAIT | __GFP_NOMEMALLOC | __GFP_NOWARN);

Actually, I wanted to ask about the proliferation of __GFP_NOMEMALLOC
in the block layer.  Am I right in thinking it really has no effect
unless GFP_ATOMIC is set?  It seems like a magic flag that some driver
developers are sprinkling around randomly, so we probably need to clarify
the documentation on it.

What I was trying to do was just use the memalloc_nofoo API to control
what was going on and then the driver can just use GFP_KERNEL.  I should
probably have completed that thought before sending the patches out.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

