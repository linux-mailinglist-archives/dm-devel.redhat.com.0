Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id AF5C532B674
	for <lists+dm-devel@lfdr.de>; Wed,  3 Mar 2021 11:09:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614766180;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zcOB4R+zs1HSDp7oJipqwNX6qnoQgoKkUy42Gi314XA=;
	b=YdqVdTM4tiDwGtkbyXb/o6jid2yJBc8lyhCwbsOTJ6yGOVfHNn1KkLF7zc2cu5UNIdJS9C
	CpudaXgfHBiDYmDDhKj/n6wKRtCNp+lyQHiBx92ypRo5ATBXVGmhAqwCzs9tQ0CoT2Zq1D
	tUw4mExTntbhFH/YmpKPLFicPJnI5XI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-1FvVVTXLPs-4fHfC_PZ-BA-1; Wed, 03 Mar 2021 05:09:38 -0500
X-MC-Unique: 1FvVVTXLPs-4fHfC_PZ-BA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BE9C19611A3;
	Wed,  3 Mar 2021 10:09:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3B6C60BFA;
	Wed,  3 Mar 2021 10:09:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B665A4EEF6;
	Wed,  3 Mar 2021 10:09:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 123A9Mdo023287 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Mar 2021 05:09:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E3E4910023AD; Wed,  3 Mar 2021 10:09:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A946810013DB;
	Wed,  3 Mar 2021 10:09:19 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 123A9JHU002022; Wed, 3 Mar 2021 05:09:19 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 123A9Jip002018; Wed, 3 Mar 2021 05:09:19 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 3 Mar 2021 05:09:18 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <33fa121a-88a8-5c27-0a43-a7efc9b5b3e3@linux.alibaba.com>
Message-ID: <alpine.LRH.2.02.2103030505460.29593@file01.intranet.prod.int.rdu2.redhat.com>
References: <20210302190555.201228400@debian-a64.vm>
	<33fa121a-88a8-5c27-0a43-a7efc9b5b3e3@linux.alibaba.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, Mike Snitzer <msnitzer@redhat.com>,
	Heinz Mauelshagen <heinzm@redhat.com>, caspar@linux.alibaba.com,
	hch@lst.de, linux-block@vger.kernel.org,
	joseph.qi@linux.alibaba.com, dm-devel@redhat.com, io-uring@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 4/4] dm: support I/O polling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Wed, 3 Mar 2021, JeffleXu wrote:

> 
> 
> On 3/3/21 3:05 AM, Mikulas Patocka wrote:
> 
> > Support I/O polling if submit_bio_noacct_mq_direct returned non-empty
> > cookie.
> > 
> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > 
> > ---
> >  drivers/md/dm.c |    5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > Index: linux-2.6/drivers/md/dm.c
> > ===================================================================
> > --- linux-2.6.orig/drivers/md/dm.c	2021-03-02 19:26:34.000000000 +0100
> > +++ linux-2.6/drivers/md/dm.c	2021-03-02 19:26:34.000000000 +0100
> > @@ -1682,6 +1682,11 @@ static void __split_and_process_bio(stru
> >  		}
> >  	}
> >  
> > +	if (ci.poll_cookie != BLK_QC_T_NONE) {
> > +		while (atomic_read(&ci.io->io_count) > 1 &&
> > +		       blk_poll(ci.poll_queue, ci.poll_cookie, true)) ;
> > +	}
> > +
> >  	/* drop the extra reference count */
> >  	dec_pending(ci.io, errno_to_blk_status(error));
> >  }
> 
> It seems that the general idea of your design is to
> 1) submit *one* split bio
> 2) blk_poll(), waiting the previously submitted split bio complets

No, I submit all the bios and poll for the last one.

> and then submit next split bio, repeating the above process. I'm afraid
> the performance may be an issue here, since the batch every time
> blk_poll() reaps may decrease.

Could you benchmark it?

> Besides, the submitting routine and polling routine is bound together
> here, i.e., polling is always synchronous.

__split_and_process_bio calls __split_and_process_non_flush in a loop and 
__split_and_process_non_flush records the poll cookie in ci.poll_cookie. 
When we processed all the bios, we poll for the last cookie here:

        if (ci.poll_cookie != BLK_QC_T_NONE) {
                while (atomic_read(&ci.io->io_count) > 1 &&
                       blk_poll(ci.poll_queue, ci.poll_cookie, true)) ;
        }


Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

