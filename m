Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A00F91149B7
	for <lists+dm-devel@lfdr.de>; Fri,  6 Dec 2019 00:15:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575587718;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iBt5A3Q6KgNOL7VaPsrDk57dkcajtiGwt+lAGQoz0YI=;
	b=boBiEPrNJly5KEbf0EFRYGVh0NBEC0XwVf/fL5V1N1Yk8TeBTevI3XQk91vsCG0qn1dC76
	PVqnkb19g6n5/wlyEOuZxhdLTkHz6vAiNBlPA6Ofv1eLOdSkLQGbv6BcCCkDcksWafFCS1
	kUHt5/31Vom0bfyEPn+VRlLmzwgmAc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-WHcLqiIKOiaZcBH9WT6ulg-1; Thu, 05 Dec 2019 18:15:16 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 978711883521;
	Thu,  5 Dec 2019 23:15:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCD7560C80;
	Thu,  5 Dec 2019 23:15:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D484918089CD;
	Thu,  5 Dec 2019 23:15:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB5NES8b024630 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Dec 2019 18:14:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 26233167ED3; Thu,  5 Dec 2019 23:14:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21015167ED2
	for <dm-devel@redhat.com>; Thu,  5 Dec 2019 23:14:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A80710163CC
	for <dm-devel@redhat.com>; Thu,  5 Dec 2019 23:14:26 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [173.205.220.69]) by
	relay.mimecast.com with ESMTP id us-mta-111-uEGVXxnGOQeziReQNpjkSA-1;
	Thu, 05 Dec 2019 18:14:24 -0500
Received: from localhost (localhost [127.0.0.1])
	by mx.ewheeler.net (Postfix) with ESMTP id 10210A0633;
	Thu,  5 Dec 2019 23:14:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at ewheeler.net
Received: from mx.ewheeler.net ([127.0.0.1])
	by localhost (mx.ewheeler.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id w-w1J2nLpTsq; Thu,  5 Dec 2019 23:14:01 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [173.205.220.69])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx.ewheeler.net (Postfix) with ESMTPSA id 7EB97A0440;
	Thu,  5 Dec 2019 23:14:01 +0000 (UTC)
Date: Thu, 5 Dec 2019 23:14:00 +0000 (UTC)
From: Eric Wheeler <dm-devel@lists.ewheeler.net>
X-X-Sender: lists@mx.ewheeler.net
To: Joe Thornber <thornber@redhat.com>
In-Reply-To: <20191204121106.lw32xoe7mil274of@reti>
Message-ID: <alpine.LRH.2.11.1912041959250.11561@mx.ewheeler.net>
References: <35cf1ecf-5cd8-604b-ec4e-18c9fd4a4195@linux.alibaba.com>
	<20191122185530.pcrgmb655dkdbdcq@reti>
	<6b12137e-411e-0368-518e-41ae54e138e0@linux.alibaba.com>
	<alpine.LRH.2.11.1912022002210.11561@mx.ewheeler.net>
	<20191203125115.rdc74jgjdz2673ig@reti>
	<20191204121106.lw32xoe7mil274of@reti>
User-Agent: Alpine 2.11 (LRH 23 2013-08-11)
MIME-Version: 1.0
X-MC-Unique: uEGVXxnGOQeziReQNpjkSA-1
X-MC-Unique: WHcLqiIKOiaZcBH9WT6ulg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB5NES8b024630
X-loop: dm-devel@redhat.com
Cc: JeffleXu <jefflexu@linux.alibaba.com>, dm-devel@redhat.com
Subject: Re: [dm-devel] dm-thin: Several Questions on dm-thin performance.
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

Thanks Joe, great writeup.  Maybe this should go in thin-provisioning.txt.

More below:

On Wed, 4 Dec 2019, Joe Thornber wrote:

> (These notes are for my own benefit as much as anything, I haven't
> worked on this for a couple of years and will forget it all completely
> if I don't write it down somewhere).
> 
> Let's start by writing some pseudocode for what the remap function for
> thin provisioning actually does.
> 
> 	----------------------------------------------------------
> 	-- Metadata
> 
> 	newtype ThinId = Int
> 	data Bio = Bio
> 	newtype VBlock = Integer	-- virtual block
> 	newtype DBlock = Integer	-- data block

Can you define virtual block vs data block?  Is this just the thin volume 
offset vs the tdata offset?

> 
> 	data LookupResult =
> 	    Unprovisioned |
> 	    Provisioned { lrDBlock :: DataBlock,
> 	                  lrShared :: Bool
> 	                }

What is "lr"? as in lrDBlock?

> 	metadataLookup :: ThinId -> VBlock -> Task LookupResult
> 	metadataLookup = undefined
> 
> 	metadataInsert :: ThinId -> VBlock -> DBlock -> Task ()
> 	metadataInsert = undefined
> 
> 	metadataRemove :: ThinId -> VBlock -> Task ()
> 	metadataRemove = undefined
> 
> 	-- Blocks all other metadata operations while running
> 	metadataCommit :: Task ()
> 	metadataCommit = undefined
> 
> 	----------------------------------------------------------
> 	-- Tasks
> 
> 	-- Many steps of servicing a bio can block.  eg, taking a lock,
> 	-- reading metadata, updating metadata, zeroing data, copying
> 	-- data ...
> 	-- So we completely side step the issue in this pseudocode by
> 	-- running everything in a magic light weight thread.
> 	spawn :: Task () -> IO ()
> 	spawn = undefined
> 
> 	----------------------------------------------------------
> 	-- Locking
> 
> 	-- These 'with' primitives acquire a lock (can block of course), perform
> 	-- an action, and then automatically release the lock.
> 	 
> 	-- Shared lock can be upgraded, so we need to pass the lock into
> 	-- the action body.
> 	withSharedLock :: ThinId -> VBlock -> (Lock -> Task ()) -> Task ()
> 	withSharedLock thinId vblock actionFn = undefined
> 
> 	withExclusiveLock :: ThinId -> VBlock -> Task () -> Task ()
> 	withExclusiveLock thinId vblock action = undefined
> 
> 	-- This promotes a shared lock to exclusive.
> 	withUpgradedLock :: Lock -> Task () -> Task ()
> 	withUpgradedLock lock action = undefined
> 
> 	-- Data locks are always exclusive
> 	withDataLock :: DBlock -> Task () -> Task ()
> 	withDataLock dblock action = undefined
> 
> 	----------------------------------------------------------
> 
> 	-- Top level remap function.  Kicks off a green thread for each bio.
> 	-- How we handle a bio depends on whether it's a read, write, discard
> 	-- or flush bio.  Whether the block is already provisioned, and if so
> 	-- whether it is shared between snapshots.
> 	remap :: ThinId -> Bio -> IO ()
> 	remap thinId bio = spawn $ remapFn thinId bio vblock
> 	    where
> 	        vblock = virtBlock bio
> 	        remapFn = case classifyBio bio of
> 	            ReadBio -> remapRead
> 	            WriteBio -> remapWrite
> 	            DiscardBio -> remapDiscard
> 	            FlushBio -> remapFlush
> 
> 	----------------------------------------------------------
> 
> 	remapRead :: ThinId -> Bio -> VBlock -> Task ()
> 	remapRead thinId bio vblock = do
> 	    withSharedLock thinId vblock $ \_ -> do
> 	        lr <- metadataLookup thinId vblock
> 	        case lr of
> 	            -- Read, Unprovisioned, Shared/!Shared
> 	            Unprovisioned -> do
> 	                fillWithZeroes bio
> 	                complete bio Success
> 
> 	            -- Read, Provisioned, Shared/!Shared
> 	            (Provisioned dblock _) ->
> 	                remapAndWait bio dblock
> 
> 	----------------------------------------------------------
> 
> 	remapWrite :: ThinId -> Bio -> VBlock -> Task ()
> 	remapWrite thinId bio vblock = do
> 	    withSharedLock thinId vblock $ \lock -> do
> 	        lr <- metadataLookup thinId vblock
> 	        case lr of
> 	            -- Write, Unprovisioned
> 	            Unprovisioned ->
> 	                withUpgradedLock lock $
> 	                    provision thinId bio vblock
> 
> 	            -- Write, Provisioned, !Shared
> 	            (Provisioned dblock False) ->
> 	                remapAndWait bio dblock
> 
> 	            -- Write, Provisioned, Shared
> 	            (Provisioned dblock True) ->
> 	                withUpgradedLock lock $
> 	                    breakSharing thinId bio vblock dblock
> 
> 	breakSharing :: ThinId -> Bio -> VBlock -> DataBlock -> Task ()
> 	breakSharing thinId bio vblock dblockOld = do
> 	    ab <- allocateBlock
> 	   case ab of
> 	       NoDataSpace ->
> 	           complete bio Failure
> 
> 	       (Allocated dblockNew) ->
> 	           withDataLock dblockOld $		-- we grab data locks to avoid races with discard
> 	               withDataLock dblockNew $ do
> 	                   copy dblockOld dblockNew
> 	                   metadataInsert thinId vblock dblockNew
> 	           remapAndWait thinId bio dblockNew
> 
> 	provision :: ThinId -> Bio -> VBlock -> Task ()
> 	provision thinId bio vblock = do
> 	    case allocateBlock of
> 	        NoDataSpace ->
> 	            complete bio Failure
> 
> 	        (Allocated dblock) ->
> 	            withDataLock dblock $ do
> 	                metadataInsert thinId vblock dblock
> 	                remapAndWait thinId bio dblock

Does the allocator block?  If so, it would be neat to pre-allocate some 
number of blocks during metadata idle times.  There could be a hidden thin 
volume (ie, devid #16777215) that blocks are allocated into and then 
stolen from for use elsewhere.  The blocks could be pre-zeroed, too!

> 	            
> 	----------------------------------------------------------
> 
> 	discard :: ThinId -> Bio -> VBlock -> Task ()
> 	discard thinId bio vblock = do
> 	    withExclusiveLock thinId vblock $ do
> 	        lr <- metadataLookup thinId vblock
> 	        case lr of
> 	            -- Discard, Unprovisioned
> 	            Unprovisioned ->
> 	                complete bio Success
> 
> 	            -- Discard, Provisioned, !Shared
> 	            (Provisioned dblock False) ->
> 	                withDataLock dblock $ do
> 	                    remapAndWait bio dblock  		-- passdown
> 	                    metadataRemove thinId dblock
> 
> 	            -- Discard, Provisioned, Shared
> 	           (Provisioned dblock True) ->
> 	               withDataLock dblock $ do
> 	                   metadataRemove thinId dblock
> 	                   complete bio Success
> 
> 	----------------------------------------------------------
> 
> 	flush :: Task ()
> 	flush = metadataCommit
> 	    
> 	----------------------------------------------------------
> 
> 	remapAndWait :: Bio -> DataBlock -> Task ()
> 	remapAndWait bio dblock = do
> 	    remap bio dblock
> 	    issue bio
> 	    wait bio
>    
> The above is a simplification (eg, discards can cover more than a single
> block, the pool has multiple modes like OUT_OF_DATA_SPACE).  But it gives
> a good idea of what the dm target needs to do, and in a succinct manner.
> 
> Now dm-thin.c is anything but succinct, for a couple of reasons:
> 
> - Because of where we are in the IO stack we cannot allocate memory.
>   This means we either use memory preallocated via mempools, or allocate
>   a fixed size block before a bio is processed.
> 
> - We don't have a magic green threads library that hides the numerous
>   blocking operations that we need.  Instead we have low level facilities
>   like workqueues etc.  This tends to have the effect of breaking up the logic
>   and scattering it across lots of little completion functions.
> 
> 
> How we handle blocking, locking, and quiescing IO are all intertwined.
> Which is why switching over to the new bio_prison interface is going to
> involve an awful lot of churn.
> 
> In the upstream code
> ====================
> 
> - Locking
> 
>   The locks provided by bio_prison (v1), are all exclusive locks.  As such
>   we take pains to hold them for as short a period as possible.  This means
>   holding them for the duration of an IO is completely out of the question.
>   Nonetheless, as pointed out in the original post for this thread, this
>   can cause bad lock contention, especially if the data block size is large.
> 
> - Quiescing
> 
>   Because we do not hold locks for the lifetime of the bios, we need
>   another way of tracking IO and quiescing regions.  This is what the
>   deferred_set component does.  Effectively it divides time up into
>   bins, and keeps a reference count of how many IOs are still in flight
>   for each bin.  To quiesce we grab a lock, and then wait for all bins
>   before this lock was acquired to drain.  Advantages of this approach
>   is it uses very little memory (I think we're currently running with
>   64 bins), and consumes v. little cpu.  But we're never specific about

curious, is "v." short for "very" (not "versus")?

>   which region we're waiting to quiesce, instead always waiting for all
>   IO older than a certain point to drain.  So we are certainly introducing
>   more latency here.
> 
> - Blocking
> 
>   A single thread services any operations that could block.
>   When there is work for this thread to perform a work queue item
>   is queued (do_worker()).  This then examines linked lists of work
>   (prepared_mappings, discard_pt1, discard_pt2, prefetches etc), and
>   processes each list as a batch.  Batching like this is a mixed blessing;
>   it allows us to sort incoming bios so we can process bios to the same
>   region at the same time, but it is also v. bad for max latency, as we
>   have no idea which piece of work was there the longest.
> 
> Next iteration of the code
> ========================== 
> 
> - Locking
> 
>   bio_prison (v2) provides shared locks, and custom lock levels.  So,
>   at the expense of memory, we can hold shared locks for long periods
>   that cover the lifetime of the bio.  Acquiring a lock now blocks.
> 
> - Quiescing
> 
>   Because we hold the locks for long periods we can now do away with the
>   deferred set completely.  If you want to quiesce a region, just grab
>   the exclusive lock associated with it, when it's finally granted you
>   know it's also quiesced.
> 

good to know.

> - Blocking
> 
>   I want to move away from the idea of a single worker function that
>   has different categories of work stored for it in different lists.
>   Instead, storing specific work structs on the work queue for each bio.
>   Partly this is to reduce latency by increasing 'fairness'.  But also
>   the fact that acquiring a lock now blocks means there are a lot more
>   block operations to handle, and we'd just end up with a lot of these
>   lists of work.  It would also allow us to have multiple kernel threads
>   servicing the workqueue.
> 
>   If you look at dm-cache-target.c you'll see this has already been
>   done for that target.  We have continuation structs that represent
>   the work to be performed after the current blocking op has completed.
>   dm-cache uses this for migrations, which have a much simpler state model
>   than dm-thin.  Even so there are a lot of these little continuation
>   functions (eg, mg_start, mg_lock_writes, mg_copy, mg_full_copy,
>   mg_upgrade_lock, mg_update_metadata_after_copy, mg_update_metadata,
>   mg_success, mg_complete).
> 
> 
> Where are we now?
> =================
> 
> I did a lot of work on this a couple of years ago.  First I just dove
> in, trying to code things up by hand.  But it quickly devolved into a
> maze of badly named continuation functions, all alike.  It's very hard
> to give these functions meaningful names; go through the pseudocode at
> the top of this email and for each place where we could block, try to
> describe where we are.  The biggest problem is as we introduce more of
> these continuations big picture logic receeds and it becomes v. hard to
> reason about the code.

Event-driven continuation functions seem to pop up frequently in the Linux 
kernel.  It would be neat if there was a framework to write these 
procedurally.  Macros might help, could still be pretty ugly.  Almost 
needs GCC support.
 
> I then experimented with automatically generating all the code from a
> simpler specification (I used a lispy version of the pseudocode above).
> This showed promise and I got it generating kernel code that would
> compile.  I was debugging this when I got dragged onto other work,
> and this has stagnated since.

Do you think this is the best way to proceed?  Someone with Lisp 
background would need to help. It might generate first-pass code but would 
be difficult to maintain as kernel changes patch the auto-generated code.

-Eric

> 
> 
> So that's where we are.
>  
> 
> 
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

