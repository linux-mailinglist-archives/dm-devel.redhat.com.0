Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8A6660BF
	for <lists+dm-devel@lfdr.de>; Thu, 11 Jul 2019 22:36:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1183D308AA11;
	Thu, 11 Jul 2019 20:36:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F62A5C1B4;
	Thu, 11 Jul 2019 20:36:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 35E7541F53;
	Thu, 11 Jul 2019 20:36:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6BKaI8D007880 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 11 Jul 2019 16:36:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EBDB8600D1; Thu, 11 Jul 2019 20:36:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A65A1600CD;
	Thu, 11 Jul 2019 20:36:14 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 651E787628;
	Thu, 11 Jul 2019 20:36:13 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id t8so4766376qkt.1;
	Thu, 11 Jul 2019 13:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=uSnxLsSzOfQ6jhYWjArqH7RN7G7SNHxnXfQr0G/TkKw=;
	b=cEMAVGX/781/krz5KwrDIWw/pbzA3CDHmwFSWMkQzVjCK2hiQbaPVNMCEWY+dDMgGg
	L8GFaBoDTw6+TjUkR89zCOESxGbUQmohciRJwLQAwcJNUhydhe/dfh1Qd8PZaYAN9uo3
	PXOD/QqDWO7nGwHSMwYq4Wk6WO1B9gAE8pjBtZc6QYuGVt+U+3Q9CW8UVmv7stC+ZgqN
	yCCmTqisbUNRVqBkKh+IjppGxW34j5SaJCB6Fgd1Gn5hvKNTzNpckOh516U9fRRpmeVC
	badErlmj6t2AN/M6TnhFsARtJrxPYzmAQ/VlkXkLkP8gUraZuPtoTELEm0/wslKLqdfd
	g8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=uSnxLsSzOfQ6jhYWjArqH7RN7G7SNHxnXfQr0G/TkKw=;
	b=JZXgPzLtvBZfsGaokH8sogejT/dR60TRWxHregfcFtgs+VtHcot1AYsz/mDbVlB3nl
	d5uFv6KA8FQmw3SUqE8mURs84Bqgo4m0hB4n7XEa4O8Yx3HzZpWlrKX/3yM33U97cDaS
	xXEW9VE4bp19FMw7So8rfh9QdpqqNwtIOst5SRuvBCxC3bGy9ga3IrQx5TTYbeCgM55o
	bPkcud1IdoLsQnmmKdCNAGyEoBX9tl/irNUEeHcX0ch0d1ADXSslus/ccq8XkMXaZZhh
	aZdnHoFPNJpkBQ/+Kd7c44MHNpUuWcic3J3VunH0qw2A6qwht1XxnCdnRAbPxFPiYr9x
	qNBg==
X-Gm-Message-State: APjAAAUIHhDcOOrfOQJndsdenblKk6ijpkDHJh8CcZlc3qwXH3HR/7Rv
	2rE5oqn4b1wXZgz2ajFlryx5zXQR
X-Google-Smtp-Source: APXvYqxdjD2bUVW2vlP5+7W7x7eQU++KSqOePco2Z9x+N9KB0KAUzIC0qeAiz7UWSsEobYGvbHF+YA==
X-Received: by 2002:a37:a40f:: with SMTP id n15mr3143540qke.19.1562877372338; 
	Thu, 11 Jul 2019 13:36:12 -0700 (PDT)
Received: from localhost (nat-pool-bos-t.redhat.com. [66.187.233.206])
	by smtp.gmail.com with ESMTPSA id 39sm810883qts.41.2019.07.11.13.36.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jul 2019 13:36:11 -0700 (PDT)
Date: Thu, 11 Jul 2019 16:36:11 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <20190711203611.GA51041@lobo>
References: <20190703162504.GA34397@lobo>
	<fb809628-40e3-245a-dda4-034eee9a931b@arrikto.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fb809628-40e3-245a-dda4-034eee9a931b@arrikto.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 11 Jul 2019 20:36:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Thu, 11 Jul 2019 20:36:13 +0000 (UTC) for IP:'209.85.222.194'
	DOMAIN:'mail-qk1-f194.google.com'
	HELO:'mail-qk1-f194.google.com' FROM:'snitzer@gmail.com' RCPT:''
X-RedHat-Spam-Score: 1.792 * (DKIM_SIGNED, DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, PDS_NO_HELO_DNS,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.222.194 mail-qk1-f194.google.com 209.85.222.194
	mail-qk1-f194.google.com <snitzer@gmail.com>
X-RedHat-Possible-Forgery: <snitzer@gmail.com> Mike Snitzer
	<snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, John Dorminy <jdorminy@redhat.com>
Subject: Re: [dm-devel] dm snapshot: add optional discard support features
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Thu, 11 Jul 2019 20:36:50 +0000 (UTC)

On Fri, Jul 05 2019 at 12:03pm -0400,
Nikos Tsironis <ntsironis@arrikto.com> wrote:

> Hi Mike,
> 
> A question inline.
...
> > diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
> > index 3107f2b1988b..e894302619dd 100644
> > --- a/drivers/md/dm-snap.c
> > +++ b/drivers/md/dm-snap.c
> > @@ -1839,10 +1922,42 @@ static int snapshot_map(struct dm_target *ti, struct bio *bio)
> >  		goto out_unlock;
> >  	}
> >  
> > +	if (unlikely(bio_op(bio) == REQ_OP_DISCARD)) {
> > +		if (s->discard_passdown_origin && dm_bio_get_target_bio_nr(bio)) {
> > +			/*
> > +			 * passdown discard to origin (without triggering
> > +			 * snapshot exceptions via do_origin; doing so would
> > +			 * defeat the goal of freeing space in origin that is
> > +			 * implied by the "discard_passdown_origin" feature)
> > +			 */
> > +			bio_set_dev(bio, s->origin->bdev);
> > +			track_chunk(s, bio, chunk);
> > +			goto out_unlock;
> > +		}
> > +		/* discard to snapshot (target_bio_nr == 0) zeroes exceptions */
> > +	}
> > +
> >  	/* If the block is already remapped - use that, else remap it */
> >  	e = dm_lookup_exception(&s->complete, chunk);
> >  	if (e) {
> >  		remap_exception(s, e, bio, chunk);
> > +		if (unlikely(bio_op(bio) == REQ_OP_DISCARD) &&
> > +		    io_overlaps_chunk(s, bio)) {
> > +			dm_exception_table_unlock(&lock);
> > +			up_read(&s->lock);
> > +			zero_exception(s, e, bio, chunk);
> > +			goto out;
> > +		}
> > +		goto out_unlock;
> > +	}
> 
> In case an exception exists for a chunk and we get a discard for it, we
> want to zero the corresponding exception in the exception store.
> 
> The code remaps the discard bio, issues the zeroing operation by calling
> zero_exception() and returns DM_MAPIO_REMAPPED. If I am not missing
> something, device mapper core will then submit the discard bio to the
> COW device, so we end up both zeroing and discarding the chunk in the
> COW device.
> 
> Is this deliberate?

No, it was an oversight.

The following incremental patch fixes it and a couple other bugs I found
while fixing the issue you reported.  I'll post v2 in reply to v1.  Your
timely review would be appreciated.  I'd still like to send this
upstream for the 5.3 merge tomorrow (Friday) by my end of day.  Thanks!

diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
index e894302619dd..63916e1dc569 100644
--- a/drivers/md/dm-snap.c
+++ b/drivers/md/dm-snap.c
@@ -1,6 +1,4 @@
 /*
- * dm-snapshot.c
- *
  * Copyright (C) 2001-2002 Sistina Software (UK) Limited.
  *
  * This file is released under the GPL.
@@ -1865,9 +1863,12 @@ static void remap_exception(struct dm_snapshot *s, struct dm_exception *e,
 
 static void zero_callback(int read_err, unsigned long write_err, void *context)
 {
-	struct dm_snapshot *s = context;
+	struct bio *bio = context;
+	struct dm_snapshot *s = bio->bi_private;
 
 	up(&s->cow_count);
+	bio->bi_status = write_err ? BLK_STS_IOERR : 0;
+	bio_endio(bio);
 }
 
 static void zero_exception(struct dm_snapshot *s, struct dm_exception *e,
@@ -1880,7 +1881,9 @@ static void zero_exception(struct dm_snapshot *s, struct dm_exception *e,
 	dest.count = s->store->chunk_size;
 
 	down(&s->cow_count);
-	dm_kcopyd_zero(s->kcopyd_client, 1, &dest, 0, zero_callback, s);
+	WARN_ON_ONCE(bio->bi_private);
+	bio->bi_private = s;
+	dm_kcopyd_zero(s->kcopyd_client, 1, &dest, 0, zero_callback, bio);
 }
 
 static bool io_overlaps_chunk(struct dm_snapshot *s, struct bio *bio)
@@ -1946,6 +1949,7 @@ static int snapshot_map(struct dm_target *ti, struct bio *bio)
 			dm_exception_table_unlock(&lock);
 			up_read(&s->lock);
 			zero_exception(s, e, bio, chunk);
+			r = DM_MAPIO_SUBMITTED; /* discard is not issued */
 			goto out;
 		}
 		goto out_unlock;
@@ -2292,8 +2296,8 @@ static void snapshot_status(struct dm_target *ti, status_type_t type,
 		 * make sense.
 		 */
 		DMEMIT("%s %s", snap->origin->name, snap->cow->name);
-		snap->store->type->status(snap->store, type, result + sz,
-					  maxlen - sz);
+		sz += snap->store->type->status(snap->store, type, result + sz,
+						maxlen - sz);
 		num_features = snap->discard_zeroes_cow + snap->discard_passdown_origin;
 		if (num_features) {
 			DMEMIT(" %u", num_features);
@@ -2325,6 +2329,12 @@ static void snapshot_io_hints(struct dm_target *ti, struct queue_limits *limits)
 	struct dm_snapshot *snap = ti->private;
 
 	if (snap->discard_zeroes_cow) {
+		struct dm_snapshot *snap_src = NULL, *snap_dest = NULL;
+
+		(void) __find_snapshots_sharing_cow(snap, &snap_src, &snap_dest, NULL);
+		if (snap_src && snap_dest)
+			snap = snap_src;
+
 		/* All discards are split on chunk_size boundary */
 		limits->discard_granularity = snap->store->chunk_size;
 		limits->max_discard_sectors = snap->store->chunk_size;

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
