Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B2BAE10E005
	for <lists+dm-devel@lfdr.de>; Sun,  1 Dec 2019 02:17:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575163036;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ra8WCVy97iAZadzs0VC/dwoD7Hnv4i/OYZPvCpI9/a8=;
	b=NZTuc7rEjUKT3MnDIoBeAR5yp4s/p30Vd2GwPjZrQtYt6L5nqhsafRApMXCp43a0zXDW6i
	/A4kFseryr6j50EVKJkKktR1PZd58owQMNFCX/vvL8i5y42E6d5dX95z80KdE/9IQPo2sv
	eyf6rYhIFUqmoy0zOMJ7t7EMistpiso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-4cI2muJoO1mHJ-WEuFN3Gw-1; Sat, 30 Nov 2019 20:17:14 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B9EA800D4C;
	Sun,  1 Dec 2019 01:17:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A885819C70;
	Sun,  1 Dec 2019 01:17:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C1454BB5C;
	Sun,  1 Dec 2019 01:16:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB11GKS3030633 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 30 Nov 2019 20:16:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2C7E0A316B; Sun,  1 Dec 2019 01:16:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28246A316C
	for <dm-devel@redhat.com>; Sun,  1 Dec 2019 01:16:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D101F10163D7
	for <dm-devel@redhat.com>; Sun,  1 Dec 2019 01:16:17 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [173.205.220.69]) by
	relay.mimecast.com with ESMTP id us-mta-324-6pEMwduiNrOllqj9ne9CQA-1;
	Sat, 30 Nov 2019 20:16:14 -0500
Received: from localhost (localhost [127.0.0.1])
	by mx.ewheeler.net (Postfix) with ESMTP id 69B83A0633;
	Sun,  1 Dec 2019 01:16:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at ewheeler.net
Received: from mx.ewheeler.net ([127.0.0.1])
	by localhost (mx.ewheeler.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id S50VhAqloMQc; Sun,  1 Dec 2019 01:15:41 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [173.205.220.69])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx.ewheeler.net (Postfix) with ESMTPSA id 74C77A0440;
	Sun,  1 Dec 2019 01:15:41 +0000 (UTC)
Date: Sun, 1 Dec 2019 01:15:37 +0000 (UTC)
From: Eric Wheeler <dm-devel@lists.ewheeler.net>
X-X-Sender: lists@mx.ewheeler.net
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <20191114154848.GA21426@redhat.com>
Message-ID: <alpine.LRH.2.11.1912010110570.31846@mx.ewheeler.net>
References: <1573740655-104317-1-git-send-email-jefflexu@linux.alibaba.com>
	<20191114154848.GA21426@redhat.com>
User-Agent: Alpine 2.11 (LRH 23 2013-08-11)
MIME-Version: 1.0
X-MC-Unique: 6pEMwduiNrOllqj9ne9CQA-1
X-MC-Unique: 4cI2muJoO1mHJ-WEuFN3Gw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB11GKS3030633
X-loop: dm-devel@redhat.com
Cc: Jeffle Xu <jefflexu@linux.alibaba.com>, joseph.qi@linux.alibaba.com,
	ejt@redhat.com, dm-devel@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] dm-thin: wakeup worker only when deferred bios exist
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 14 Nov 2019, Mike Snitzer wrote:

> On Thu, Nov 14 2019 at  9:10am -0500,
> Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
> 
> > Single thread fio test (read, bs=4k, ioengine=libaio, iodepth=128,
> > numjobs=1) over dm-thin device has poor performance versus bare nvme
> > disk on v5.4.0-rc7.
> > 
> > Further investigation with perf indicates that queue_work_on() consumes
> > over 20% CPU time when doing IO over dm-thin device. The call stack is
> > as follows.
> > 
> > - 46.64% thin_map
> >    + 22.28% queue_work_on
> >    + 12.98% dm_thin_find_block
> >    + 5.07% cell_defer_no_holder
> >    + 2.42% bio_detain.isra.33
> >    + 0.95% inc_all_io_entry.isra.31.part.32
> >      0.80% remap.isra.41
> > 
> > In cell_defer_no_holder(), wakeup_worker() is always called, no matter whether
> > the cell->bios list is empty or not. In single thread IO model, cell->bios list
> > is most likely empty. So skip waking up worker thread if cell->bios list is
> > empty.
> > 
> > A significant IO performance of single thread can be seen with this patch.
> > The original IO performance is 445 MiB/s with the fio test previously
> > described, while it is 643 MiB/s after applying the patch, which is a
> > 44% performance improvement.
> > 
> > Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> 
> 
> Nice find, implementation detail questions inlined below.

Indeed!  

This cherry-picks clean into v4.19.y.  

Is there any reason this would be unsafe in 4.19?

--
Eric Wheeler


> 
> > ---
> >  drivers/md/dm-bio-prison-v1.c |  8 +++++++-
> >  drivers/md/dm-bio-prison-v1.h |  2 +-
> >  drivers/md/dm-thin.c          | 10 ++++++----
> >  3 files changed, 14 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/md/dm-bio-prison-v1.c b/drivers/md/dm-bio-prison-v1.c
> > index b538989..b2a9b8d 100644
> > --- a/drivers/md/dm-bio-prison-v1.c
> > +++ b/drivers/md/dm-bio-prison-v1.c
> > @@ -219,11 +219,17 @@ static void __cell_release_no_holder(struct dm_bio_prison *prison,
> >  
> >  void dm_cell_release_no_holder(struct dm_bio_prison *prison,
> >  			       struct dm_bio_prison_cell *cell,
> > -			       struct bio_list *inmates)
> > +			       struct bio_list *inmates, int *empty)
> >  {
> >  	unsigned long flags;
> >  
> >  	spin_lock_irqsave(&prison->lock, flags);
> > +	/*
> > +	 * The empty flag should represent the list state exactly
> > +	 * when the list is merged into @inmates, thus get the
> > +	 * list state when prison->lock is held.
> > +	 */
> > +	*empty = bio_list_empty(&cell->bios);
> >  	__cell_release_no_holder(prison, cell, inmates);
> >  	spin_unlock_irqrestore(&prison->lock, flags);
> >  }
> > diff --git a/drivers/md/dm-bio-prison-v1.h b/drivers/md/dm-bio-prison-v1.h
> > index cec52ac..500edbc 100644
> > --- a/drivers/md/dm-bio-prison-v1.h
> > +++ b/drivers/md/dm-bio-prison-v1.h
> > @@ -89,7 +89,7 @@ void dm_cell_release(struct dm_bio_prison *prison,
> >  		     struct bio_list *bios);
> >  void dm_cell_release_no_holder(struct dm_bio_prison *prison,
> >  			       struct dm_bio_prison_cell *cell,
> > -			       struct bio_list *inmates);
> > +			       struct bio_list *inmates, int *empty);
> >  void dm_cell_error(struct dm_bio_prison *prison,
> >  		   struct dm_bio_prison_cell *cell, blk_status_t error);
> >  
> > diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
> > index fcd8877..51fd396 100644
> > --- a/drivers/md/dm-thin.c
> > +++ b/drivers/md/dm-thin.c
> > @@ -480,9 +480,9 @@ static void cell_visit_release(struct pool *pool,
> >  
> >  static void cell_release_no_holder(struct pool *pool,
> >  				   struct dm_bio_prison_cell *cell,
> > -				   struct bio_list *bios)
> > +				   struct bio_list *bios, int *empty)
> >  {
> > -	dm_cell_release_no_holder(pool->prison, cell, bios);
> > +	dm_cell_release_no_holder(pool->prison, cell, bios, empty);
> >  	dm_bio_prison_free_cell(pool->prison, cell);
> >  }
> >  
> > @@ -886,12 +886,14 @@ static void cell_defer_no_holder(struct thin_c *tc, struct dm_bio_prison_cell *c
> >  {
> >  	struct pool *pool = tc->pool;
> >  	unsigned long flags;
> > +	int empty;
> >  
> >  	spin_lock_irqsave(&tc->lock, flags);
> > -	cell_release_no_holder(pool, cell, &tc->deferred_bio_list);
> > +	cell_release_no_holder(pool, cell, &tc->deferred_bio_list, &empty);
> >  	spin_unlock_irqrestore(&tc->lock, flags);
> >  
> > -	wake_worker(pool);
> > +	if (!empty)
> > +		wake_worker(pool);
> >  }
> 
> Think your point is tc->deferred_bio_list may have bios already, before
> the call to cell_release_no_holder, so simply checking if it is empty
> after the cell_release_no_holder call isn't enough?
> 
> But if tc->deferred_bio_list isn't empty then there is work that needs
> to be done, regardless of whether this particular cell created work, so
> I'm left wondering if you first tried simply checking if
> tc->deferred_bio_list is empty after cell_release_no_holder() in
> cell_defer_no_holder?
> 
> Thanks,
> Mike
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
> 
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

