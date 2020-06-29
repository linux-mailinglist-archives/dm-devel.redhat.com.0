Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6654120D0F2
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 20:39:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-2stwu0UsOBuTNapXLf9CtQ-1; Mon, 29 Jun 2020 14:39:47 -0400
X-MC-Unique: 2stwu0UsOBuTNapXLf9CtQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A48F51054F97;
	Mon, 29 Jun 2020 18:39:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85B935D9DA;
	Mon, 29 Jun 2020 18:39:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E2831809557;
	Mon, 29 Jun 2020 18:39:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TCIpl7000980 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 08:18:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 906502156A50; Mon, 29 Jun 2020 12:18:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C6D82156A4E
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 12:18:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42FDC108C26F
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 12:18:49 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-417-AjypBkSLMVWM2ELrs86JVg-1; Mon, 29 Jun 2020 08:18:26 -0400
X-MC-Unique: AjypBkSLMVWM2ELrs86JVg-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jpsjo-00026M-RY; Mon, 29 Jun 2020 12:18:16 +0000
Date: Mon, 29 Jun 2020 13:18:16 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200629121816.GC25523@casper.infradead.org>
References: <20200625113122.7540-1-willy@infradead.org>
	<20200625113122.7540-7-willy@infradead.org>
	<20200629050851.GC1492837@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200629050851.GC1492837@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 29 Jun 2020 14:39:14 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jun 29, 2020 at 08:08:51AM +0300, Mike Rapoport wrote:
> > @@ -886,8 +868,12 @@ static struct dm_buffer *__alloc_buffer_wait_no_callback(struct dm_bufio_client
> >  			return NULL;
> >  
> >  		if (dm_bufio_cache_size_latch != 1 && !tried_noio_alloc) {
> > +			unsigned noio_flag;
> > +
> >  			dm_bufio_unlock(c);
> > -			b = alloc_buffer(c, GFP_NOIO | __GFP_NORETRY | __GFP_NOMEMALLOC | __GFP_NOWARN);
> > +			noio_flag = memalloc_noio_save();
> 
> I've read the series twice and I'm still missing the definition of
> memalloc_noio_save().
> 
> And also it would be nice to have a paragraph about it in
> Documentation/core-api/memory-allocation.rst

Documentation/core-api/gfp_mask-from-fs-io.rst:``memalloc_nofs_save``, ``memalloc_nofs_restore`` respectively ``memalloc_noio_save``,
Documentation/core-api/gfp_mask-from-fs-io.rst:   :functions: memalloc_noio_save memalloc_noio_restore
Documentation/core-api/gfp_mask-from-fs-io.rst:allows nesting so it is safe to call ``memalloc_noio_save`` or

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

