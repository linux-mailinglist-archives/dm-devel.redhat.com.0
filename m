Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0161C2CD5
	for <lists+dm-devel@lfdr.de>; Sun,  3 May 2020 15:42:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588513359;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4+RUf1mnA5IuKUKhJGVG3/tmw8WMzgM4vrzE3ap3adE=;
	b=ceyzzwuLdCPxDV2qwoMsDgW+xjdE850y3+3WwCCeQGpfnjJuAog6LOs8jsTe40fnlpE71u
	mDYK4u68UNZzmKdOM7fDHAS8Os9nbJLQ1V4MYYE6aQsgJ2gww5zJlK4TtgadbLnq0bcS62
	yD4pDjkPO7HJ3OXxOA8fKvW05vwc53w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-Cg72Z7a6P82L1PF34z_nHA-1; Sun, 03 May 2020 09:42:37 -0400
X-MC-Unique: Cg72Z7a6P82L1PF34z_nHA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C118B800687;
	Sun,  3 May 2020 13:42:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 953DD2B6DF;
	Sun,  3 May 2020 13:42:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 141F61809542;
	Sun,  3 May 2020 13:42:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03UHnPrc013910 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 30 Apr 2020 13:49:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5361C120EAE; Thu, 30 Apr 2020 17:49:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D043121136
	for <dm-devel@redhat.com>; Thu, 30 Apr 2020 17:49:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FC6F800655
	for <dm-devel@redhat.com>; Thu, 30 Apr 2020 17:49:22 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
	[46.235.227.227]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-425-l3f8z-xwNg2YYH0599xz0A-1; Thu, 30 Apr 2020 13:49:17 -0400
X-MC-Unique: l3f8z-xwNg2YYH0599xz0A-1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: krisman) with ESMTPSA id 3528E2A2AA4
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: agk@redhat.com
Organization: Collabora
References: <20200428005146.242231-1-krisman@collabora.com>
Date: Thu, 30 Apr 2020 13:49:12 -0400
In-Reply-To: <20200428005146.242231-1-krisman@collabora.com> (Gabriel Krisman
	Bertazi's message of "Mon, 27 Apr 2020 20:51:43 -0400")
Message-ID: <85lfmcrhif.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03UHnPrc013910
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Sun, 03 May 2020 09:42:24 -0400
Cc: dm-devel@redhat.com, kernel@collabora.com, khazhy@google.com,
	snitzer@redhat.com
Subject: Re: [dm-devel] [PATCH v2 0/3] Historical Service Time Path Selector
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Gabriel Krisman Bertazi <krisman@collabora.com> writes:

> Hi Mike,
>
> Please find an updated version of HST integrating the change you
> requested to also support BIO based multipath.  I hope you don't mind me
> folding the function you implemented into patch 2.  If you prefer, I can
> integrate a patch you provide into the series.

Hi Mike,

Sorry for the encapsulation patches, I'll pass the parameter directly on
v3.

> One interesting data point is that the selection performance on
> BIO-based is worse when compared to request-based.  I tested a bit and I
> believe the reason is that the paths are more sticky because the bucket
> is too large, and it takes longer for HST to detect differences.  By
> changing the bucket_size indirectly through the bucket_shift, the
> bio-based multipath performance improved, but I'm not sure this is a
> knob we want to expose to users.  For now, please consider the patches
> below, for review.
>

The reason for the BIO-based being worse than request-based was that we
are comparing the jiffies_to_nsecs(jiffies) with ktime_get_ns(), which is not
accurate, given the different precision of the clocks.  Problem is,
request-based mpath uses ktime_get_ns in the block layer, while
dm_io->start_time uses jiffies, and inside the path selector, we don't
have a way to distinguish those paths.  I see a few ways forward, but in
the best interest of getting it right early, I'd like to hear what you
think it is best:

1) My best suggestion would be converting dm_io->start_time to use
ktime_get_ns.  This has the advantage of simplifying dm_stats_account_io
and wouldn't affect the ABI of the accounting histogram.  The only
downside, from what I can see is that ktime_get is slightly more
expensive than reading jiffies, which might be a problem according to
Documentation/admin-guide/device-mapper/statistics.rst.  Is that really
a problem?  I see your FIXME note on the function you implemented, but
are you suggesting exactly this or simply storing
jiffies_to_nsecs(jiffies) in dm_io->start_time?

2) Alternatively, pass end_io_time to the path selector as well, and do
the time collection outside the path selector.  This makes the interface
look ugly, adds the cost anyway of doing ktime operations.

3) Alternatively, collect ktime start/end costs inside HST.  This means
we need to match the IO on start_io and end_io from inside HST, which
doesn't seem like a good design either.

4) ?

As you can see, I'm leaning towards option 1.  Would you be open to a
patch like the following?  Completely untested, still need some work,
just to show the idea.

Khazhy, any thoughts?

diff --git a/drivers/md/dm-rq.c b/drivers/md/dm-rq.c
index 3f8577e2c13b..eb7c7fae4bc6 100644
--- a/drivers/md/dm-rq.c
+++ b/drivers/md/dm-rq.c
@@ -23,7 +23,7 @@ struct dm_rq_target_io {
 	blk_status_t error;
 	union map_info info;
 	struct dm_stats_aux stats_aux;
-	unsigned long duration_jiffies;
+	u64 duration_ns;
 	unsigned n_sectors;
 	unsigned completed;
 };
@@ -132,10 +132,10 @@ static void rq_end_stats(struct mapped_device *md, struct request *orig)
 {
 	if (unlikely(dm_stats_used(&md->stats))) {
 		struct dm_rq_target_io *tio = tio_from_request(orig);
-		tio->duration_jiffies = jiffies - tio->duration_jiffies;
+		tio->duration_ns = ktime_get_ns() - tio->duration_ns;
 		dm_stats_account_io(&md->stats, rq_data_dir(orig),
 				    blk_rq_pos(orig), tio->n_sectors, true,
-				    tio->duration_jiffies, &tio->stats_aux);
+				    tio->duration_ns, &tio->stats_aux);
 	}
 }
 
@@ -451,7 +451,7 @@ static void dm_start_request(struct mapped_device *md, struct request *orig)
 
 	if (unlikely(dm_stats_used(&md->stats))) {
 		struct dm_rq_target_io *tio = tio_from_request(orig);
-		tio->duration_jiffies = jiffies;
+		tio->duration_ns = ktime_get_ns();
 		tio->n_sectors = blk_rq_sectors(orig);
 		dm_stats_account_io(&md->stats, rq_data_dir(orig),
 				    blk_rq_pos(orig), tio->n_sectors, false, 0,
diff --git a/drivers/md/dm-stats.c b/drivers/md/dm-stats.c
index 71417048256a..4353dd04ec42 100644
--- a/drivers/md/dm-stats.c
+++ b/drivers/md/dm-stats.c
@@ -514,7 +514,7 @@ static void dm_stat_round(struct dm_stat *s, struct dm_stat_shared *shared,
 static void dm_stat_for_entry(struct dm_stat *s, size_t entry,
 			      int idx, sector_t len,
 			      struct dm_stats_aux *stats_aux, bool end,
-			      unsigned long duration_jiffies)
+			      u64 duration_ns)
 {
 	struct dm_stat_shared *shared = &s->stat_shared[entry];
 	struct dm_stat_percpu *p;
@@ -553,11 +553,11 @@ static void dm_stat_for_entry(struct dm_stat *s, size_t entry,
 		p->ios[idx] += 1;
 		p->merges[idx] += stats_aux->merged;
 		if (!(s->stat_flags & STAT_PRECISE_TIMESTAMPS)) {
-			p->ticks[idx] += duration_jiffies;
-			duration = jiffies_to_msecs(duration_jiffies);
+			p->ticks[idx] += nsecs_to_jiffies(duration_ns);
+			duration = div64_u64(duration_ns, 1000000);
 		} else {
-			p->ticks[idx] += stats_aux->duration_ns;
-			duration = stats_aux->duration_ns;
+			p->ticks[idx] += duration_ns;
+			duration = duration_ns;
 		}
 		if (s->n_histogram_entries) {
 			unsigned lo = 0, hi = s->n_histogram_entries + 1;
@@ -583,7 +583,7 @@ static void dm_stat_for_entry(struct dm_stat *s, size_t entry,
 
 static void __dm_stat_bio(struct dm_stat *s, int bi_rw,
 			  sector_t bi_sector, sector_t end_sector,
-			  bool end, unsigned long duration_jiffies,
+			  bool end, u64 duration_ns,
 			  struct dm_stats_aux *stats_aux)
 {
 	sector_t rel_sector, offset, todo, fragment_len;
@@ -612,7 +612,7 @@ static void __dm_stat_bio(struct dm_stat *s, int bi_rw,
 		if (fragment_len > s->step - offset)
 			fragment_len = s->step - offset;
 		dm_stat_for_entry(s, entry, bi_rw, fragment_len,
-				  stats_aux, end, duration_jiffies);
+				  stats_aux, end, duration_ns);
 		todo -= fragment_len;
 		entry++;
 		offset = 0;
@@ -621,13 +621,11 @@ static void __dm_stat_bio(struct dm_stat *s, int bi_rw,
 
 void dm_stats_account_io(struct dm_stats *stats, unsigned long bi_rw,
 			 sector_t bi_sector, unsigned bi_sectors, bool end,
-			 unsigned long duration_jiffies,
-			 struct dm_stats_aux *stats_aux)
+			 u64 duration_ns, struct dm_stats_aux *stats_aux)
 {
 	struct dm_stat *s;
 	sector_t end_sector;
 	struct dm_stats_last_position *last;
-	bool got_precise_time;
 
 	if (unlikely(!bi_sectors))
 		return;
@@ -651,17 +649,9 @@ void dm_stats_account_io(struct dm_stats *stats, unsigned long bi_rw,
 
 	rcu_read_lock();
 
-	got_precise_time = false;
-	list_for_each_entry_rcu(s, &stats->list, list_entry) {
-		if (s->stat_flags & STAT_PRECISE_TIMESTAMPS && !got_precise_time) {
-			if (!end)
-				stats_aux->duration_ns = ktime_to_ns(ktime_get());
-			else
-				stats_aux->duration_ns = ktime_to_ns(ktime_get()) - stats_aux->duration_ns;
-			got_precise_time = true;
-		}
-		__dm_stat_bio(s, bi_rw, bi_sector, end_sector, end, duration_jiffies, stats_aux);
-	}
+	list_for_each_entry_rcu(s, &stats->list, list_entry)
+		__dm_stat_bio(s, bi_rw, bi_sector, end_sector, end,
+			      duration_ns, stats_aux);
 
 	rcu_read_unlock();
 }
diff --git a/drivers/md/dm-stats.h b/drivers/md/dm-stats.h
index 2ddfae678f32..e9755f14ce68 100644
--- a/drivers/md/dm-stats.h
+++ b/drivers/md/dm-stats.h
@@ -19,7 +19,6 @@ struct dm_stats {
 
 struct dm_stats_aux {
 	bool merged;
-	unsigned long long duration_ns;
 };
 
 void dm_stats_init(struct dm_stats *st);
@@ -32,8 +31,7 @@ int dm_stats_message(struct mapped_device *md, unsigned argc, char **argv,
 
 void dm_stats_account_io(struct dm_stats *stats, unsigned long bi_rw,
 			 sector_t bi_sector, unsigned bi_sectors, bool end,
-			 unsigned long duration_jiffies,
-			 struct dm_stats_aux *aux);
+			 u64 duration_ns, struct dm_stats_aux *aux);
 
 static inline bool dm_stats_used(struct dm_stats *st)
 {
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index c5deee1bea67..10ca0d0c3c46 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -689,7 +689,7 @@ static void start_io_acct(struct dm_io *io)
 	struct mapped_device *md = io->md;
 	struct bio *bio = io->orig_bio;
 
-	io->start_time = jiffies;
+	io->start_time = ktime_get_ns();
 
 	generic_start_io_acct(md->queue, bio_op(bio), bio_sectors(bio),
 			      &dm_disk(md)->part0);
@@ -704,10 +704,10 @@ static void end_io_acct(struct dm_io *io)
 {
 	struct mapped_device *md = io->md;
 	struct bio *bio = io->orig_bio;
-	unsigned long duration = jiffies - io->start_time;
+	u64 duration = ktime_get_ns() - io->start_time;
 
 	generic_end_io_acct(md->queue, bio_op(bio), &dm_disk(md)->part0,
-			    io->start_time);
+			    nsecs_to_jiffies(io->start_time));
 
 	if (unlikely(dm_stats_used(&md->stats)))
 		dm_stats_account_io(&md->stats, bio_data_dir(bio),


-- 
Gabriel Krisman Bertazi


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

