Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB4669A87
	for <lists+dm-devel@lfdr.de>; Mon, 15 Jul 2019 20:08:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0AD513098558;
	Mon, 15 Jul 2019 18:08:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE24F61786;
	Mon, 15 Jul 2019 18:07:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F33D654D3D;
	Mon, 15 Jul 2019 18:07:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6FI728w021101 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 15 Jul 2019 14:07:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 916C85C266; Mon, 15 Jul 2019 18:07:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44F7F5C224;
	Mon, 15 Jul 2019 18:06:55 +0000 (UTC)
Date: Mon, 15 Jul 2019 14:06:54 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <20190715180654.GA15315@redhat.com>
References: <20190703162504.GA34397@lobo>
	<fb809628-40e3-245a-dda4-034eee9a931b@arrikto.com>
	<20190711203611.GA51041@lobo> <20190711204633.GA51116@lobo>
	<321dff9f-a55c-e6ac-4a18-2e9eda0d05fe@arrikto.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <321dff9f-a55c-e6ac-4a18-2e9eda0d05fe@arrikto.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, John Dorminy <jdorminy@redhat.com>
Subject: Re: [dm-devel] [PATCH v2] dm snapshot: add optional discard support
	features
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 15 Jul 2019 18:08:02 +0000 (UTC)

On Fri, Jul 12 2019 at  9:40am -0400,
Nikos Tsironis <ntsironis@arrikto.com> wrote:

> Hi Mike,
> 
> I have reviewed the patch. A few comments below.

Thanks, my email filtering caused this mail to miss my INBOX (still yet
to reason through why).  So I'm just seeing this now.

> On 7/11/19 11:46 PM, Mike Snitzer wrote:
> > @@ -1839,10 +1925,43 @@ static int snapshot_map(struct dm_target *ti, struct bio *bio)
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
> Why track_chunk() is needed here?
> 
> We track snapshot reads redirected to the origin to ensure that the
> origin will not be written while the reads are in-flight, thus returning
> corrupted data. Also, we track writes to a merging snapshot, which are
> redirected to the COW device, to ensure we don't merge these COW chunks
> before the writes finish.
> 
> I am probably missing something, but I can't understand why we need to
> track the discard to the origin.

I followed how reads are remapped to origin when remapping the discard
destined for origin because a competing write to origin could trigger
copyout that undermines the intent behind passing down the discard to
the origin.  That said, even if the write is withheld until the discard
completes that write triggered copyout could still undermine that intent.

But for this usecase, the origin wouldn't even be mounted (and is
incapable of being written due to it being full).  So I quickly stopped
caring and was only interested in ensuring do crash would occur in the
face of this hypotehtical concurrent access.

> > @@ -2198,6 +2324,22 @@ static int snapshot_iterate_devices(struct dm_target *ti,
> >  	return r;
> >  }
> >  > +static void snapshot_io_hints(struct dm_target *ti, struct queue_limits *limits)
> > +{
> > +	struct dm_snapshot *snap = ti->private;
> > +
> > +	if (snap->discard_zeroes_cow) {
> > +		struct dm_snapshot *snap_src = NULL, *snap_dest = NULL;
> > +
> 
> I think the following:
> 
> > +		(void) __find_snapshots_sharing_cow(snap, &snap_src, &snap_dest, NULL);
> > +		if (snap_src && snap_dest)
> > +			snap = snap_src;
> > +
> > +		/* All discards are split on chunk_size boundary */
> > +		limits->discard_granularity = snap->store->chunk_size;
> > +		limits->max_discard_sectors = snap->store->chunk_size;
> 
> should be:
> 
> 	down_read(&_origins_lock);
> 
> 	(void) __find_snapshots_sharing_cow(snap, &snap_src, &snap_dest, NULL);
> 	if (snap_src && snap_dest)
> 		snap = snap_src;
> 
> 	/* All discards are split on chunk_size boundary */
> 	limits->discard_granularity = snap->store->chunk_size;
> 	limits->max_discard_sectors = snap->store->chunk_size;
> 
> 	up_read(&_origins_lock);
> 
> Taking _origins_lock protects us against:
> 
> 	* Concurrent modification of the _origins hash table by
> 	  register/unregister_snapshot().
> 	* snapshot_dtr() unregistering snap_src and freeing the relevant
> 	  resources, e.g., snap_src->store.

I agree, will stage incremental fix.

> One final note. The discard features can also be used by the
> snapshot-merge target. But, snapshot_merge_map() is not doing anything
> special about discards. They are treated like normal writes.

Another oversight, but the usecase of async discards coming in after the
merge has started (while very much possible) is not the intended
workflow.
 
> For chunks that reside in the origin this means that the discard will be
> passed down to it using do_origin(). Although this could trigger
> exceptions to other snapshots, I think that for the use case these features
> are trying to solve there is going to be only one active snapshot. Otherwise,
> if we have multiple snapshots, discard_passdown_origin would mean that
> discarding one snapshot could affect/corrupt the rest of the snapshots.

Yes, there should probably be a negative check to ensure there is only 1
active snapshot.  The quirky nature of dm-snap.c's snapshot exception
store handover is what teased out the need for me to even care about
multiple "snapshot" or "snapshot-merge" devices sharing the same cow in
the context of snapshot_io_hints() -- I triggered the need to account
for this in followup testing that did:

(snapshot active with table: "0 2097152 snapshot 253:0 253:2 P 8")
echo "0 2097152 snapshot 253:0 253:2 P 8 2 discard_zeroes_cow discard_passdown_origin" | dmsetup load test-snap
dmsetup suspend test-snap
dmsetup resume test-snap

This reload triggers handover.  That handover caused chunk_size to be 0
thanks to snapshiot_ctr()'s: s->store->chunk_size = 0; which caused
snapshot_io_hints() to incorrectly set the 2 discard limits to 0.

> For the not-yet-merged, remapped chunks the discard will be redirected to
> the COW device, so discard_zeroes_cow is not really zeroing COW in this
> case, it is discarding it.
> 
> Also, if both discard_zeroes_cow and discard_passdown_origin are enabled,
> the relevant chunk, either in origin or in COW, will be discarded twice.

snapshot_merge_map() does need to account for discards, not doing so was
an oversight due to the narrow usecase I was catering to (again, only 1
snapshot and all IO meant to free space having been completed before
merge is started).  I'll fix this up as well.

Thanks again for your careful review Nikos, much appreciated!

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
