Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 17B4E20D0F1
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 20:39:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-d65rB4VmNQm0H7F8FrlC3g-1; Mon, 29 Jun 2020 14:39:51 -0400
X-MC-Unique: d65rB4VmNQm0H7F8FrlC3g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03284804006;
	Mon, 29 Jun 2020 18:39:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D87C42C6C1;
	Mon, 29 Jun 2020 18:39:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 97BAB8789F;
	Mon, 29 Jun 2020 18:39:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TDjbxP012702 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 09:45:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D9E6201F406; Mon, 29 Jun 2020 13:45:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68E70207AC20
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 13:45:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DFE0821BB1
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 13:45:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-344-ngo_EQGeOauBwSu2_KRZew-1;
	Mon, 29 Jun 2020 09:45:25 -0400
X-MC-Unique: ngo_EQGeOauBwSu2_KRZew-1
Received: from [10.56.182.155] (unknown [2.55.133.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 966E123B06;
	Mon, 29 Jun 2020 13:45:22 +0000 (UTC)
Date: Mon, 29 Jun 2020 16:45:14 +0300
User-Agent: K-9 Mail for Android
In-Reply-To: <20200629125231.GJ32461@dhcp22.suse.cz>
References: <20200625113122.7540-1-willy@infradead.org>
	<20200625113122.7540-7-willy@infradead.org>
	<20200629050851.GC1492837@kernel.org>
	<20200629121816.GC25523@casper.infradead.org>
	<20200629125231.GJ32461@dhcp22.suse.cz>
MIME-Version: 1.0
To: Michal Hocko <mhocko@kernel.org>, Matthew Wilcox <willy@infradead.org>
From: Mike Rapoport <rppt@kernel.org>
Message-ID: <6421BC93-CF2F-4697-B5CB-5ECDAA9FCB37@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05TDjbxP012702
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On June 29, 2020 3:52:31 PM GMT+03:00, Michal Hocko <mhocko@kernel.org> wrote:
>On Mon 29-06-20 13:18:16, Matthew Wilcox wrote:
>> On Mon, Jun 29, 2020 at 08:08:51AM +0300, Mike Rapoport wrote:
>> > > @@ -886,8 +868,12 @@ static struct dm_buffer
>*__alloc_buffer_wait_no_callback(struct dm_bufio_client
>> > >  			return NULL;
>> > >  
>> > >  		if (dm_bufio_cache_size_latch != 1 && !tried_noio_alloc) {
>> > > +			unsigned noio_flag;
>> > > +
>> > >  			dm_bufio_unlock(c);
>> > > -			b = alloc_buffer(c, GFP_NOIO | __GFP_NORETRY |
>__GFP_NOMEMALLOC | __GFP_NOWARN);
>> > > +			noio_flag = memalloc_noio_save();
>> > 
>> > I've read the series twice and I'm still missing the definition of
>> > memalloc_noio_save().
>> > 
>> > And also it would be nice to have a paragraph about it in
>> > Documentation/core-api/memory-allocation.rst
>> 
>>
>Documentation/core-api/gfp_mask-from-fs-io.rst:``memalloc_nofs_save``,
>``memalloc_nofs_restore`` respectively ``memalloc_noio_save``,
>> Documentation/core-api/gfp_mask-from-fs-io.rst:   :functions:
>memalloc_noio_save memalloc_noio_restore
>> Documentation/core-api/gfp_mask-from-fs-io.rst:allows nesting so it
>is safe to call ``memalloc_noio_save`` or
> 
>The patch is adding memalloc_nowait* and I suspect Mike had that in
>mind, which would be a fair request. 

Right, sorry misprinted that.

> Btw. we are missing
>memalloc_nocma*
>documentation either - I was just reminded of its existence today..
-- 
Sincerely yours,
Mike


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

