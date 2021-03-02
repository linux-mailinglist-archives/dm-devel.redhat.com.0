Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDD932A9F2
	for <lists+dm-devel@lfdr.de>; Tue,  2 Mar 2021 20:04:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614711889;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LLjckU+lMMDcrFTFYXxs3NJodSyrTOt9/rRDBKLq21c=;
	b=LUyynpijbCVbzUt3WVtx2Ii9TJlIXTWQpHPoPEs1CFKqDNrGXUNQ+xm1W8vXL+MhQLBzsx
	vNASv8EiQKPTWdyOcXWY1iO1p9CRC1/Sgpg6e4nlSZzUtl69OGuPcZ9Dx9sqX7ercP8l9/
	J/RAwnuarheijf67CJHAxCT4PuUJDSs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-0xm4MLMmNgiroHaXC9IC5Q-1; Tue, 02 Mar 2021 14:04:46 -0500
X-MC-Unique: 0xm4MLMmNgiroHaXC9IC5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B4BC80196E;
	Tue,  2 Mar 2021 19:04:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C7706F996;
	Tue,  2 Mar 2021 19:04:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E08B018095CB;
	Tue,  2 Mar 2021 19:04:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 122J47gD010792 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Mar 2021 14:04:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0BA0D61F20; Tue,  2 Mar 2021 19:04:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5C9B62465;
	Tue,  2 Mar 2021 19:03:56 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 122J3uSc011834; Tue, 2 Mar 2021 14:03:56 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 122J3sh4011830; Tue, 2 Mar 2021 14:03:55 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 2 Mar 2021 14:03:54 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <af9223b9-8960-1ed4-799a-bcd56299c587@linux.alibaba.com>
Message-ID: <alpine.LRH.2.02.2103021353490.9353@file01.intranet.prod.int.rdu2.redhat.com>
References: <20210208085243.82367-1-jefflexu@linux.alibaba.com>
	<20210208085243.82367-12-jefflexu@linux.alibaba.com>
	<alpine.LRH.2.02.2102191351200.10545@file01.intranet.prod.int.rdu2.redhat.com>
	<af9223b9-8960-1ed4-799a-bcd56299c587@linux.alibaba.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, snitzer@redhat.com, caspar@linux.alibaba.com, hch@lst.de,
	linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, io-uring@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v3 11/11] dm: fastpath of bio-based polling
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Fri, 26 Feb 2021, JeffleXu wrote:

> 
> 
> On 2/20/21 3:38 AM, Mikulas Patocka wrote:
> > 
> > 
> > On Mon, 8 Feb 2021, Jeffle Xu wrote:
> > 
> >> Offer one fastpath of bio-based polling when bio submitted to dm device
> >> is not split.
> >>
> >> In this case, there will be only one bio submitted to only one polling
> >> hw queue of one underlying mq device, and thus we don't need to track
> >> all split bios or iterate through all polling hw queues. The pointer to
> >> the polling hw queue the bio submitted to is returned here as the
> >> returned cookie.
> > 
> > This doesn't seem safe - note that between submit_bio() and blk_poll(), no 
> > locks are held - so the device mapper device may be reconfigured 
> > arbitrarily. When you call blk_poll() with a pointer returned by 
> > submit_bio(), the pointer may point to a stale address.
> > 
> 
> Thanks for the feedback. Indeed maybe it's not a good idea to directly
> return a 'struct blk_mq_hw_ctx *' pointer as the returned cookie.
> 
> Currently I have no idea to fix it, orz... The
> blk_get_queue()/blk_put_queue() tricks may not work in this case.
> Because the returned cookie may not be used at all. Before calling
> blk_poll(), the polling routine may find that the corresponding IO has
> already completed, and thus won't call blk_poll(), in which case we have
> no place to put the refcount.
> 
> But I really don't want to drop this optimization, since this
> optimization is quite intuitive when dm device maps to a lot of
> underlying devices. Though this optimization doesn't actually achieve
> reasonable performance gain in my test, maybe because there are at most
> seven nvme devices in my test machine.
> 
> Any thoughts?
> 
> Thanks,
> Jeffle

Hi

I reworked device mapper polling, so that we poll in the function 
__split_and_process_bio. The pointer to a queue and the polling cookie is 
passed only inside device mapper code, it never leaves it.

I'll send you my patches - try them and tell me how does it perform 
compared to your patchset.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

