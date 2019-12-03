Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id CB8501104B8
	for <lists+dm-devel@lfdr.de>; Tue,  3 Dec 2019 20:08:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575400116;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=n9ZpTNI4RmVZkRjyyQp8TwLZ+InTyB+904pG/HZHGSo=;
	b=ax5LileIQrgIeiwutIPpe+feADX7md0EMASeTvOrfIeva4ha9TePln4RGB20DI1mSAgUEw
	6NCeFB8rMpyP3VrvudnDsfR3JBAXnC8PycgzxUI4DOa5H39CmZQVxlxDK6WnnHOyjo5QH4
	b1bRnj5I45vsK4Xd1RMVqkGvh+ui9UA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-vnEAp635PX2pGfhRcRYBdA-1; Tue, 03 Dec 2019 14:08:33 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D2AE800C75;
	Tue,  3 Dec 2019 19:08:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BE1360BE1;
	Tue,  3 Dec 2019 19:08:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2E0D25BC01;
	Tue,  3 Dec 2019 19:08:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB3J7b3d009998 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Dec 2019 14:07:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 04CDE2166B2C; Tue,  3 Dec 2019 19:07:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3C132166B27
	for <dm-devel@redhat.com>; Tue,  3 Dec 2019 19:07:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25DB7185B0A1
	for <dm-devel@redhat.com>; Tue,  3 Dec 2019 19:07:35 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [173.205.220.69]) by
	relay.mimecast.com with ESMTP id us-mta-273-sukroEC2PSGcOEkNyrBegg-1;
	Tue, 03 Dec 2019 14:07:31 -0500
Received: from localhost (localhost [127.0.0.1])
	by mx.ewheeler.net (Postfix) with ESMTP id 3101AA0692;
	Tue,  3 Dec 2019 19:07:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at ewheeler.net
Received: from mx.ewheeler.net ([127.0.0.1])
	by localhost (mx.ewheeler.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id w6Q5D-2po1Ir; Tue,  3 Dec 2019 19:07:07 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [173.205.220.69])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx.ewheeler.net (Postfix) with ESMTPSA id 7A99DA0440;
	Tue,  3 Dec 2019 19:07:07 +0000 (UTC)
Date: Tue, 3 Dec 2019 19:07:06 +0000 (UTC)
From: Eric Wheeler <dm-devel@lists.ewheeler.net>
X-X-Sender: lists@mx.ewheeler.net
To: Mikulas Patocka <mpatocka@redhat.com>
In-Reply-To: <alpine.LRH.2.02.1912031020450.6813@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.11.1912031906380.11561@mx.ewheeler.net>
References: <alpine.LRH.2.02.1910150407210.26857@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.11.1912010116590.11561@mx.ewheeler.net>
	<alpine.LRH.2.02.1912031020450.6813@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.11 (LRH 23 2013-08-11)
MIME-Version: 1.0
X-MC-Unique: sukroEC2PSGcOEkNyrBegg-1
X-MC-Unique: vnEAp635PX2pGfhRcRYBdA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB3J7b3d009998
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, Joe Thornber <thornber@redhat.com>,
	dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm-thin: replace spin_lock_irqsave with
 spin_lock_irq
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 3 Dec 2019, Mikulas Patocka wrote:
> On Sun, 1 Dec 2019, Eric Wheeler wrote:
> 
> > On Tue, 15 Oct 2019, Mikulas Patocka wrote:
> > 
> > > If we are in a place where it is known that interrupts are enabled,
> > > functions spin_lock_irq/spin_unlock_irq should be used instead of
> > > spin_lock_irqsave/spin_unlock_irqrestore.
> > > 
> > > spin_lock_irq and spin_unlock_irq are faster because the don't need to
> > > push and pop the flags register.
> > 
> > Hi Mikulas, 
> > 
> > This cherry-picks clean into 4.19.y.  Is there any reason this would be 
> > unsafe in that kernel?  This provides a minor performance gain and we 
> > might pick it up internally unless you forsee a problem.
> > 
> > Thanks!
> > 
> > --
> > Eric Wheeler
> 
> I think there is nothing that could break if you backport it.


Thanks Mikulas, so far so good on 4.19.86.

--
Eric Wheeler


> 
> Mikulas
> 
> > > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > > 
> > > ---
> > >  drivers/md/dm-thin.c |  113 ++++++++++++++++++++-------------------------------
> > >  1 file changed, 46 insertions(+), 67 deletions(-)
> > > 
> > > Index: linux-2.6/drivers/md/dm-thin.c
> > > ===================================================================
> > > --- linux-2.6.orig/drivers/md/dm-thin.c	2019-10-11 18:57:08.000000000 +0200
> > > +++ linux-2.6/drivers/md/dm-thin.c	2019-10-11 21:33:40.000000000 +0200
> > > @@ -609,13 +609,12 @@ static void error_thin_bio_list(struct t
> > >  		blk_status_t error)
> > >  {
> > >  	struct bio_list bios;
> > > -	unsigned long flags;
> > >  
> > >  	bio_list_init(&bios);
> > >  
> > > -	spin_lock_irqsave(&tc->lock, flags);
> > > +	spin_lock_irq(&tc->lock);
> > >  	__merge_bio_list(&bios, master);
> > > -	spin_unlock_irqrestore(&tc->lock, flags);
> > > +	spin_unlock_irq(&tc->lock);
> > >  
> > >  	error_bio_list(&bios, error);
> > >  }
> > > @@ -623,15 +622,14 @@ static void error_thin_bio_list(struct t
> > >  static void requeue_deferred_cells(struct thin_c *tc)
> > >  {
> > >  	struct pool *pool = tc->pool;
> > > -	unsigned long flags;
> > >  	struct list_head cells;
> > >  	struct dm_bio_prison_cell *cell, *tmp;
> > >  
> > >  	INIT_LIST_HEAD(&cells);
> > >  
> > > -	spin_lock_irqsave(&tc->lock, flags);
> > > +	spin_lock_irq(&tc->lock);
> > >  	list_splice_init(&tc->deferred_cells, &cells);
> > > -	spin_unlock_irqrestore(&tc->lock, flags);
> > > +	spin_unlock_irq(&tc->lock);
> > >  
> > >  	list_for_each_entry_safe(cell, tmp, &cells, user_list)
> > >  		cell_requeue(pool, cell);
> > > @@ -640,14 +638,13 @@ static void requeue_deferred_cells(struc
> > >  static void requeue_io(struct thin_c *tc)
> > >  {
> > >  	struct bio_list bios;
> > > -	unsigned long flags;
> > >  
> > >  	bio_list_init(&bios);
> > >  
> > > -	spin_lock_irqsave(&tc->lock, flags);
> > > +	spin_lock_irq(&tc->lock);
> > >  	__merge_bio_list(&bios, &tc->deferred_bio_list);
> > >  	__merge_bio_list(&bios, &tc->retry_on_resume_list);
> > > -	spin_unlock_irqrestore(&tc->lock, flags);
> > > +	spin_unlock_irq(&tc->lock);
> > >  
> > >  	error_bio_list(&bios, BLK_STS_DM_REQUEUE);
> > >  	requeue_deferred_cells(tc);
> > > @@ -756,7 +753,6 @@ static void inc_all_io_entry(struct pool
> > >  static void issue(struct thin_c *tc, struct bio *bio)
> > >  {
> > >  	struct pool *pool = tc->pool;
> > > -	unsigned long flags;
> > >  
> > >  	if (!bio_triggers_commit(tc, bio)) {
> > >  		generic_make_request(bio);
> > > @@ -777,9 +773,9 @@ static void issue(struct thin_c *tc, str
> > >  	 * Batch together any bios that trigger commits and then issue a
> > >  	 * single commit for them in process_deferred_bios().
> > >  	 */
> > > -	spin_lock_irqsave(&pool->lock, flags);
> > > +	spin_lock_irq(&pool->lock);
> > >  	bio_list_add(&pool->deferred_flush_bios, bio);
> > > -	spin_unlock_irqrestore(&pool->lock, flags);
> > > +	spin_unlock_irq(&pool->lock);
> > >  }
> > >  
> > >  static void remap_to_origin_and_issue(struct thin_c *tc, struct bio *bio)
> > > @@ -960,7 +956,6 @@ static void process_prepared_mapping_fai
> > >  static void complete_overwrite_bio(struct thin_c *tc, struct bio *bio)
> > >  {
> > >  	struct pool *pool = tc->pool;
> > > -	unsigned long flags;
> > >  
> > >  	/*
> > >  	 * If the bio has the REQ_FUA flag set we must commit the metadata
> > > @@ -985,9 +980,9 @@ static void complete_overwrite_bio(struc
> > >  	 * Batch together any bios that trigger commits and then issue a
> > >  	 * single commit for them in process_deferred_bios().
> > >  	 */
> > > -	spin_lock_irqsave(&pool->lock, flags);
> > > +	spin_lock_irq(&pool->lock);
> > >  	bio_list_add(&pool->deferred_flush_completions, bio);
> > > -	spin_unlock_irqrestore(&pool->lock, flags);
> > > +	spin_unlock_irq(&pool->lock);
> > >  }
> > >  
> > >  static void process_prepared_mapping(struct dm_thin_new_mapping *m)
> > > @@ -1226,14 +1221,13 @@ static void process_prepared_discard_pas
> > >  static void process_prepared(struct pool *pool, struct list_head *head,
> > >  			     process_mapping_fn *fn)
> > >  {
> > > -	unsigned long flags;
> > >  	struct list_head maps;
> > >  	struct dm_thin_new_mapping *m, *tmp;
> > >  
> > >  	INIT_LIST_HEAD(&maps);
> > > -	spin_lock_irqsave(&pool->lock, flags);
> > > +	spin_lock_irq(&pool->lock);
> > >  	list_splice_init(head, &maps);
> > > -	spin_unlock_irqrestore(&pool->lock, flags);
> > > +	spin_unlock_irq(&pool->lock);
> > >  
> > >  	list_for_each_entry_safe(m, tmp, &maps, list)
> > >  		(*fn)(m);
> > > @@ -1510,14 +1504,12 @@ static int commit(struct pool *pool)
> > >  
> > >  static void check_low_water_mark(struct pool *pool, dm_block_t free_blocks)
> > >  {
> > > -	unsigned long flags;
> > > -
> > >  	if (free_blocks <= pool->low_water_blocks && !pool->low_water_triggered) {
> > >  		DMWARN("%s: reached low water mark for data device: sending event.",
> > >  		       dm_device_name(pool->pool_md));
> > > -		spin_lock_irqsave(&pool->lock, flags);
> > > +		spin_lock_irq(&pool->lock);
> > >  		pool->low_water_triggered = true;
> > > -		spin_unlock_irqrestore(&pool->lock, flags);
> > > +		spin_unlock_irq(&pool->lock);
> > >  		dm_table_event(pool->ti->table);
> > >  	}
> > >  }
> > > @@ -1593,11 +1585,10 @@ static void retry_on_resume(struct bio *
> > >  {
> > >  	struct dm_thin_endio_hook *h = dm_per_bio_data(bio, sizeof(struct dm_thin_endio_hook));
> > >  	struct thin_c *tc = h->tc;
> > > -	unsigned long flags;
> > >  
> > > -	spin_lock_irqsave(&tc->lock, flags);
> > > +	spin_lock_irq(&tc->lock);
> > >  	bio_list_add(&tc->retry_on_resume_list, bio);
> > > -	spin_unlock_irqrestore(&tc->lock, flags);
> > > +	spin_unlock_irq(&tc->lock);
> > >  }
> > >  
> > >  static blk_status_t should_error_unserviceable_bio(struct pool *pool)
> > > @@ -2170,7 +2161,6 @@ static void __sort_thin_deferred_bios(st
> > >  static void process_thin_deferred_bios(struct thin_c *tc)
> > >  {
> > >  	struct pool *pool = tc->pool;
> > > -	unsigned long flags;
> > >  	struct bio *bio;
> > >  	struct bio_list bios;
> > >  	struct blk_plug plug;
> > > @@ -2184,10 +2174,10 @@ static void process_thin_deferred_bios(s
> > >  
> > >  	bio_list_init(&bios);
> > >  
> > > -	spin_lock_irqsave(&tc->lock, flags);
> > > +	spin_lock_irq(&tc->lock);
> > >  
> > >  	if (bio_list_empty(&tc->deferred_bio_list)) {
> > > -		spin_unlock_irqrestore(&tc->lock, flags);
> > > +		spin_unlock_irq(&tc->lock);
> > >  		return;
> > >  	}
> > >  
> > > @@ -2196,7 +2186,7 @@ static void process_thin_deferred_bios(s
> > >  	bio_list_merge(&bios, &tc->deferred_bio_list);
> > >  	bio_list_init(&tc->deferred_bio_list);
> > >  
> > > -	spin_unlock_irqrestore(&tc->lock, flags);
> > > +	spin_unlock_irq(&tc->lock);
> > >  
> > >  	blk_start_plug(&plug);
> > >  	while ((bio = bio_list_pop(&bios))) {
> > > @@ -2206,10 +2196,10 @@ static void process_thin_deferred_bios(s
> > >  		 * prepared mappings to process.
> > >  		 */
> > >  		if (ensure_next_mapping(pool)) {
> > > -			spin_lock_irqsave(&tc->lock, flags);
> > > +			spin_lock_irq(&tc->lock);
> > >  			bio_list_add(&tc->deferred_bio_list, bio);
> > >  			bio_list_merge(&tc->deferred_bio_list, &bios);
> > > -			spin_unlock_irqrestore(&tc->lock, flags);
> > > +			spin_unlock_irq(&tc->lock);
> > >  			break;
> > >  		}
> > >  
> > > @@ -2264,16 +2254,15 @@ static unsigned sort_cells(struct pool *
> > >  static void process_thin_deferred_cells(struct thin_c *tc)
> > >  {
> > >  	struct pool *pool = tc->pool;
> > > -	unsigned long flags;
> > >  	struct list_head cells;
> > >  	struct dm_bio_prison_cell *cell;
> > >  	unsigned i, j, count;
> > >  
> > >  	INIT_LIST_HEAD(&cells);
> > >  
> > > -	spin_lock_irqsave(&tc->lock, flags);
> > > +	spin_lock_irq(&tc->lock);
> > >  	list_splice_init(&tc->deferred_cells, &cells);
> > > -	spin_unlock_irqrestore(&tc->lock, flags);
> > > +	spin_unlock_irq(&tc->lock);
> > >  
> > >  	if (list_empty(&cells))
> > >  		return;
> > > @@ -2294,9 +2283,9 @@ static void process_thin_deferred_cells(
> > >  				for (j = i; j < count; j++)
> > >  					list_add(&pool->cell_sort_array[j]->user_list, &cells);
> > >  
> > > -				spin_lock_irqsave(&tc->lock, flags);
> > > +				spin_lock_irq(&tc->lock);
> > >  				list_splice(&cells, &tc->deferred_cells);
> > > -				spin_unlock_irqrestore(&tc->lock, flags);
> > > +				spin_unlock_irq(&tc->lock);
> > >  				return;
> > >  			}
> > >  
> > > @@ -2349,7 +2338,6 @@ static struct thin_c *get_next_thin(stru
> > >  
> > >  static void process_deferred_bios(struct pool *pool)
> > >  {
> > > -	unsigned long flags;
> > >  	struct bio *bio;
> > >  	struct bio_list bios, bio_completions;
> > >  	struct thin_c *tc;
> > > @@ -2368,13 +2356,13 @@ static void process_deferred_bios(struct
> > >  	bio_list_init(&bios);
> > >  	bio_list_init(&bio_completions);
> > >  
> > > -	spin_lock_irqsave(&pool->lock, flags);
> > > +	spin_lock_irq(&pool->lock);
> > >  	bio_list_merge(&bios, &pool->deferred_flush_bios);
> > >  	bio_list_init(&pool->deferred_flush_bios);
> > >  
> > >  	bio_list_merge(&bio_completions, &pool->deferred_flush_completions);
> > >  	bio_list_init(&pool->deferred_flush_completions);
> > > -	spin_unlock_irqrestore(&pool->lock, flags);
> > > +	spin_unlock_irq(&pool->lock);
> > >  
> > >  	if (bio_list_empty(&bios) && bio_list_empty(&bio_completions) &&
> > >  	    !(dm_pool_changed_this_transaction(pool->pmd) && need_commit_due_to_time(pool)))
> > > @@ -2657,12 +2645,11 @@ static void metadata_operation_failed(st
> > >   */
> > >  static void thin_defer_bio(struct thin_c *tc, struct bio *bio)
> > >  {
> > > -	unsigned long flags;
> > >  	struct pool *pool = tc->pool;
> > >  
> > > -	spin_lock_irqsave(&tc->lock, flags);
> > > +	spin_lock_irq(&tc->lock);
> > >  	bio_list_add(&tc->deferred_bio_list, bio);
> > > -	spin_unlock_irqrestore(&tc->lock, flags);
> > > +	spin_unlock_irq(&tc->lock);
> > >  
> > >  	wake_worker(pool);
> > >  }
> > > @@ -2678,13 +2665,12 @@ static void thin_defer_bio_with_throttle
> > >  
> > >  static void thin_defer_cell(struct thin_c *tc, struct dm_bio_prison_cell *cell)
> > >  {
> > > -	unsigned long flags;
> > >  	struct pool *pool = tc->pool;
> > >  
> > >  	throttle_lock(&pool->throttle);
> > > -	spin_lock_irqsave(&tc->lock, flags);
> > > +	spin_lock_irq(&tc->lock);
> > >  	list_add_tail(&cell->user_list, &tc->deferred_cells);
> > > -	spin_unlock_irqrestore(&tc->lock, flags);
> > > +	spin_unlock_irq(&tc->lock);
> > >  	throttle_unlock(&pool->throttle);
> > >  
> > >  	wake_worker(pool);
> > > @@ -2810,15 +2796,14 @@ static int pool_is_congested(struct dm_t
> > >  
> > >  static void requeue_bios(struct pool *pool)
> > >  {
> > > -	unsigned long flags;
> > >  	struct thin_c *tc;
> > >  
> > >  	rcu_read_lock();
> > >  	list_for_each_entry_rcu(tc, &pool->active_thins, list) {
> > > -		spin_lock_irqsave(&tc->lock, flags);
> > > +		spin_lock_irq(&tc->lock);
> > >  		bio_list_merge(&tc->deferred_bio_list, &tc->retry_on_resume_list);
> > >  		bio_list_init(&tc->retry_on_resume_list);
> > > -		spin_unlock_irqrestore(&tc->lock, flags);
> > > +		spin_unlock_irq(&tc->lock);
> > >  	}
> > >  	rcu_read_unlock();
> > >  }
> > > @@ -3412,15 +3397,14 @@ static int pool_map(struct dm_target *ti
> > >  	int r;
> > >  	struct pool_c *pt = ti->private;
> > >  	struct pool *pool = pt->pool;
> > > -	unsigned long flags;
> > >  
> > >  	/*
> > >  	 * As this is a singleton target, ti->begin is always zero.
> > >  	 */
> > > -	spin_lock_irqsave(&pool->lock, flags);
> > > +	spin_lock_irq(&pool->lock);
> > >  	bio_set_dev(bio, pt->data_dev->bdev);
> > >  	r = DM_MAPIO_REMAPPED;
> > > -	spin_unlock_irqrestore(&pool->lock, flags);
> > > +	spin_unlock_irq(&pool->lock);
> > >  
> > >  	return r;
> > >  }
> > > @@ -3591,7 +3575,6 @@ static void pool_resume(struct dm_target
> > >  {
> > >  	struct pool_c *pt = ti->private;
> > >  	struct pool *pool = pt->pool;
> > > -	unsigned long flags;
> > >  
> > >  	/*
> > >  	 * Must requeue active_thins' bios and then resume
> > > @@ -3600,10 +3583,10 @@ static void pool_resume(struct dm_target
> > >  	requeue_bios(pool);
> > >  	pool_resume_active_thins(pool);
> > >  
> > > -	spin_lock_irqsave(&pool->lock, flags);
> > > +	spin_lock_irq(&pool->lock);
> > >  	pool->low_water_triggered = false;
> > >  	pool->suspended = false;
> > > -	spin_unlock_irqrestore(&pool->lock, flags);
> > > +	spin_unlock_irq(&pool->lock);
> > >  
> > >  	do_waker(&pool->waker.work);
> > >  }
> > > @@ -3612,11 +3595,10 @@ static void pool_presuspend(struct dm_ta
> > >  {
> > >  	struct pool_c *pt = ti->private;
> > >  	struct pool *pool = pt->pool;
> > > -	unsigned long flags;
> > >  
> > > -	spin_lock_irqsave(&pool->lock, flags);
> > > +	spin_lock_irq(&pool->lock);
> > >  	pool->suspended = true;
> > > -	spin_unlock_irqrestore(&pool->lock, flags);
> > > +	spin_unlock_irq(&pool->lock);
> > >  
> > >  	pool_suspend_active_thins(pool);
> > >  }
> > > @@ -3625,13 +3607,12 @@ static void pool_presuspend_undo(struct
> > >  {
> > >  	struct pool_c *pt = ti->private;
> > >  	struct pool *pool = pt->pool;
> > > -	unsigned long flags;
> > >  
> > >  	pool_resume_active_thins(pool);
> > >  
> > > -	spin_lock_irqsave(&pool->lock, flags);
> > > +	spin_lock_irq(&pool->lock);
> > >  	pool->suspended = false;
> > > -	spin_unlock_irqrestore(&pool->lock, flags);
> > > +	spin_unlock_irq(&pool->lock);
> > >  }
> > >  
> > >  static void pool_postsuspend(struct dm_target *ti)
> > > @@ -4110,11 +4091,10 @@ static void thin_put(struct thin_c *tc)
> > >  static void thin_dtr(struct dm_target *ti)
> > >  {
> > >  	struct thin_c *tc = ti->private;
> > > -	unsigned long flags;
> > >  
> > > -	spin_lock_irqsave(&tc->pool->lock, flags);
> > > +	spin_lock_irq(&tc->pool->lock);
> > >  	list_del_rcu(&tc->list);
> > > -	spin_unlock_irqrestore(&tc->pool->lock, flags);
> > > +	spin_unlock_irq(&tc->pool->lock);
> > >  	synchronize_rcu();
> > >  
> > >  	thin_put(tc);
> > > @@ -4150,7 +4130,6 @@ static int thin_ctr(struct dm_target *ti
> > >  	struct thin_c *tc;
> > >  	struct dm_dev *pool_dev, *origin_dev;
> > >  	struct mapped_device *pool_md;
> > > -	unsigned long flags;
> > >  
> > >  	mutex_lock(&dm_thin_pool_table.mutex);
> > >  
> > > @@ -4244,9 +4223,9 @@ static int thin_ctr(struct dm_target *ti
> > >  
> > >  	mutex_unlock(&dm_thin_pool_table.mutex);
> > >  
> > > -	spin_lock_irqsave(&tc->pool->lock, flags);
> > > +	spin_lock_irq(&tc->pool->lock);
> > >  	if (tc->pool->suspended) {
> > > -		spin_unlock_irqrestore(&tc->pool->lock, flags);
> > > +		spin_unlock_irq(&tc->pool->lock);
> > >  		mutex_lock(&dm_thin_pool_table.mutex); /* reacquire for __pool_dec */
> > >  		ti->error = "Unable to activate thin device while pool is suspended";
> > >  		r = -EINVAL;
> > > @@ -4255,7 +4234,7 @@ static int thin_ctr(struct dm_target *ti
> > >  	refcount_set(&tc->refcount, 1);
> > >  	init_completion(&tc->can_destroy);
> > >  	list_add_tail_rcu(&tc->list, &tc->pool->active_thins);
> > > -	spin_unlock_irqrestore(&tc->pool->lock, flags);
> > > +	spin_unlock_irq(&tc->pool->lock);
> > >  	/*
> > >  	 * This synchronize_rcu() call is needed here otherwise we risk a
> > >  	 * wake_worker() call finding no bios to process (because the newly
> > > 
> > > --
> > > dm-devel mailing list
> > > dm-devel@redhat.com
> > > https://www.redhat.com/mailman/listinfo/dm-devel
> > > 
> > 
> 
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

