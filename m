Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C6C28112B14
	for <lists+dm-devel@lfdr.de>; Wed,  4 Dec 2019 13:11:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575461514;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EWCIRDCZsvfgymyUuw1uzRluhnlSAnKmdU62YtJ9JCE=;
	b=W17LRXTrtvrvIPsJAw+rrkZgWKrch9vIBdMN6/FUcCz8CexPplDReinMMAwO/QJxtGMtD8
	2onlqDmybk7QvmUKN6o/vWvmh3N98BA7Re39N8twfP20hyGJtDyIFlRbL3wMkQ4H7f+rUJ
	rWn2SG77AFuccIh/LgsForylOtFGPN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-RCM2o45cOdGMJ5pAIMi3pg-1; Wed, 04 Dec 2019 07:11:51 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C75AA1005509;
	Wed,  4 Dec 2019 12:11:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62DE71001925;
	Wed,  4 Dec 2019 12:11:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 82FDA5BC01;
	Wed,  4 Dec 2019 12:11:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB4CBAhT031036 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Dec 2019 07:11:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A2A975D6BB; Wed,  4 Dec 2019 12:11:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.33.36.177])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C14E5D6AE;
	Wed,  4 Dec 2019 12:11:07 +0000 (UTC)
Date: Wed, 4 Dec 2019 12:11:06 +0000
From: Joe Thornber <thornber@redhat.com>
To: Eric Wheeler <dm-devel@lists.ewheeler.net>,
	JeffleXu <jefflexu@linux.alibaba.com>, dm-devel@redhat.com
Message-ID: <20191204121106.lw32xoe7mil274of@reti>
Mail-Followup-To: Eric Wheeler <dm-devel@lists.ewheeler.net>,
	JeffleXu <jefflexu@linux.alibaba.com>, dm-devel@redhat.com
References: <35cf1ecf-5cd8-604b-ec4e-18c9fd4a4195@linux.alibaba.com>
	<20191122185530.pcrgmb655dkdbdcq@reti>
	<6b12137e-411e-0368-518e-41ae54e138e0@linux.alibaba.com>
	<alpine.LRH.2.11.1912022002210.11561@mx.ewheeler.net>
	<20191203125115.rdc74jgjdz2673ig@reti>
MIME-Version: 1.0
In-Reply-To: <20191203125115.rdc74jgjdz2673ig@reti>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: RCM2o45cOdGMJ5pAIMi3pg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

(These notes are for my own benefit as much as anything, I haven't
worked on this for a couple of years and will forget it all completely
if I don't write it down somewhere).

Let's start by writing some pseudocode for what the remap function for
thin provisioning actually does.

	----------------------------------------------------------
	-- Metadata

	newtype ThinId = Int
	data Bio = Bio
	newtype VBlock = Integer	-- virtual block
	newtype DBlock = Integer	-- data block

	data LookupResult =
	    Unprovisioned |
	    Provisioned { lrDBlock :: DataBlock,
	                  lrShared :: Bool
	                }

	metadataLookup :: ThinId -> VBlock -> Task LookupResult
	metadataLookup = undefined

	metadataInsert :: ThinId -> VBlock -> DBlock -> Task ()
	metadataInsert = undefined

	metadataRemove :: ThinId -> VBlock -> Task ()
	metadataRemove = undefined

	-- Blocks all other metadata operations while running
	metadataCommit :: Task ()
	metadataCommit = undefined

	----------------------------------------------------------
	-- Tasks

	-- Many steps of servicing a bio can block.  eg, taking a lock,
	-- reading metadata, updating metadata, zeroing data, copying
	-- data ...
	-- So we completely side step the issue in this pseudocode by
	-- running everything in a magic light weight thread.
	spawn :: Task () -> IO ()
	spawn = undefined

	----------------------------------------------------------
	-- Locking

	-- These 'with' primitives acquire a lock (can block of course), perform
	-- an action, and then automatically release the lock.
	 
	-- Shared lock can be upgraded, so we need to pass the lock into
	-- the action body.
	withSharedLock :: ThinId -> VBlock -> (Lock -> Task ()) -> Task ()
	withSharedLock thinId vblock actionFn = undefined

	withExclusiveLock :: ThinId -> VBlock -> Task () -> Task ()
	withExclusiveLock thinId vblock action = undefined

	-- This promotes a shared lock to exclusive.
	withUpgradedLock :: Lock -> Task () -> Task ()
	withUpgradedLock lock action = undefined

	-- Data locks are always exclusive
	withDataLock :: DBlock -> Task () -> Task ()
	withDataLock dblock action = undefined

	----------------------------------------------------------

	-- Top level remap function.  Kicks off a green thread for each bio.
	-- How we handle a bio depends on whether it's a read, write, discard
	-- or flush bio.  Whether the block is already provisioned, and if so
	-- whether it is shared between snapshots.
	remap :: ThinId -> Bio -> IO ()
	remap thinId bio = spawn $ remapFn thinId bio vblock
	    where
	        vblock = virtBlock bio
	        remapFn = case classifyBio bio of
	            ReadBio -> remapRead
	            WriteBio -> remapWrite
	            DiscardBio -> remapDiscard
	            FlushBio -> remapFlush

	----------------------------------------------------------

	remapRead :: ThinId -> Bio -> VBlock -> Task ()
	remapRead thinId bio vblock = do
	    withSharedLock thinId vblock $ \_ -> do
	        lr <- metadataLookup thinId vblock
	        case lr of
	            -- Read, Unprovisioned, Shared/!Shared
	            Unprovisioned -> do
	                fillWithZeroes bio
	                complete bio Success

	            -- Read, Provisioned, Shared/!Shared
	            (Provisioned dblock _) ->
	                remapAndWait bio dblock

	----------------------------------------------------------

	remapWrite :: ThinId -> Bio -> VBlock -> Task ()
	remapWrite thinId bio vblock = do
	    withSharedLock thinId vblock $ \lock -> do
	        lr <- metadataLookup thinId vblock
	        case lr of
	            -- Write, Unprovisioned
	            Unprovisioned ->
	                withUpgradedLock lock $
	                    provision thinId bio vblock

	            -- Write, Provisioned, !Shared
	            (Provisioned dblock False) ->
	                remapAndWait bio dblock

	            -- Write, Provisioned, Shared
	            (Provisioned dblock True) ->
	                withUpgradedLock lock $
	                    breakSharing thinId bio vblock dblock

	breakSharing :: ThinId -> Bio -> VBlock -> DataBlock -> Task ()
	breakSharing thinId bio vblock dblockOld = do
	    ab <- allocateBlock
	   case ab of
	       NoDataSpace ->
	           complete bio Failure

	       (Allocated dblockNew) ->
	           withDataLock dblockOld $		-- we grab data locks to avoid races with discard
	               withDataLock dblockNew $ do
	                   copy dblockOld dblockNew
	                   metadataInsert thinId vblock dblockNew
	           remapAndWait thinId bio dblockNew

	provision :: ThinId -> Bio -> VBlock -> Task ()
	provision thinId bio vblock = do
	    case allocateBlock of
	        NoDataSpace ->
	            complete bio Failure

	        (Allocated dblock) ->
	            withDataLock dblock $ do
	                metadataInsert thinId vblock dblock
	                remapAndWait thinId bio dblock
	            
	----------------------------------------------------------

	discard :: ThinId -> Bio -> VBlock -> Task ()
	discard thinId bio vblock = do
	    withExclusiveLock thinId vblock $ do
	        lr <- metadataLookup thinId vblock
	        case lr of
	            -- Discard, Unprovisioned
	            Unprovisioned ->
	                complete bio Success

	            -- Discard, Provisioned, !Shared
	            (Provisioned dblock False) ->
	                withDataLock dblock $ do
	                    remapAndWait bio dblock  		-- passdown
	                    metadataRemove thinId dblock

	            -- Discard, Provisioned, Shared
	           (Provisioned dblock True) ->
	               withDataLock dblock $ do
	                   metadataRemove thinId dblock
	                   complete bio Success

	----------------------------------------------------------

	flush :: Task ()
	flush = metadataCommit
	    
	----------------------------------------------------------

	remapAndWait :: Bio -> DataBlock -> Task ()
	remapAndWait bio dblock = do
	    remap bio dblock
	    issue bio
	    wait bio
   
The above is a simplification (eg, discards can cover more than a single
block, the pool has multiple modes like OUT_OF_DATA_SPACE).  But it gives
a good idea of what the dm target needs to do, and in a succinct manner.

Now dm-thin.c is anything but succinct, for a couple of reasons:

- Because of where we are in the IO stack we cannot allocate memory.
  This means we either use memory preallocated via mempools, or allocate
  a fixed size block before a bio is processed.

- We don't have a magic green threads library that hides the numerous
  blocking operations that we need.  Instead we have low level facilities
  like workqueues etc.  This tends to have the effect of breaking up the logic
  and scattering it across lots of little completion functions.


How we handle blocking, locking, and quiescing IO are all intertwined.
Which is why switching over to the new bio_prison interface is going to
involve an awful lot of churn.

In the upstream code
====================

- Locking

  The locks provided by bio_prison (v1), are all exclusive locks.  As such
  we take pains to hold them for as short a period as possible.  This means
  holding them for the duration of an IO is completely out of the question.
  Nonetheless, as pointed out in the original post for this thread, this
  can cause bad lock contention, especially if the data block size is large.

- Quiescing

  Because we do not hold locks for the lifetime of the bios, we need
  another way of tracking IO and quiescing regions.  This is what the
  deferred_set component does.  Effectively it divides time up into
  bins, and keeps a reference count of how many IOs are still in flight
  for each bin.  To quiesce we grab a lock, and then wait for all bins
  before this lock was acquired to drain.  Advantages of this approach
  is it uses very little memory (I think we're currently running with
  64 bins), and consumes v. little cpu.  But we're never specific about
  which region we're waiting to quiesce, instead always waiting for all
  IO older than a certain point to drain.  So we are certainly introducing
  more latency here.

- Blocking

  A single thread services any operations that could block.
  When there is work for this thread to perform a work queue item
  is queued (do_worker()).  This then examines linked lists of work
  (prepared_mappings, discard_pt1, discard_pt2, prefetches etc), and
  processes each list as a batch.  Batching like this is a mixed blessing;
  it allows us to sort incoming bios so we can process bios to the same
  region at the same time, but it is also v. bad for max latency, as we
  have no idea which piece of work was there the longest.

Next iteration of the code
========================== 

- Locking

  bio_prison (v2) provides shared locks, and custom lock levels.  So,
  at the expense of memory, we can hold shared locks for long periods
  that cover the lifetime of the bio.  Acquiring a lock now blocks.

- Quiescing

  Because we hold the locks for long periods we can now do away with the
  deferred set completely.  If you want to quiesce a region, just grab
  the exclusive lock associated with it, when it's finally granted you
  know it's also quiesced.

- Blocking

  I want to move away from the idea of a single worker function that
  has different categories of work stored for it in different lists.
  Instead, storing specific work structs on the work queue for each bio.
  Partly this is to reduce latency by increasing 'fairness'.  But also
  the fact that acquiring a lock now blocks means there are a lot more
  block operations to handle, and we'd just end up with a lot of these
  lists of work.  It would also allow us to have multiple kernel threads
  servicing the workqueue.

  If you look at dm-cache-target.c you'll see this has already been
  done for that target.  We have continuation structs that represent
  the work to be performed after the current blocking op has completed.
  dm-cache uses this for migrations, which have a much simpler state model
  than dm-thin.  Even so there are a lot of these little continuation
  functions (eg, mg_start, mg_lock_writes, mg_copy, mg_full_copy,
  mg_upgrade_lock, mg_update_metadata_after_copy, mg_update_metadata,
  mg_success, mg_complete).


Where are we now?
=================

I did a lot of work on this a couple of years ago.  First I just dove
in, trying to code things up by hand.  But it quickly devolved into a
maze of badly named continuation functions, all alike.  It's very hard
to give these functions meaningful names; go through the pseudocode at
the top of this email and for each place where we could block, try to
describe where we are.  The biggest problem is as we introduce more of
these continuations big picture logic receeds and it becomes v. hard to
reason about the code.

I then experimented with automatically generating all the code from a
simpler specification (I used a lispy version of the pseudocode above).
This showed promise and I got it generating kernel code that would
compile.  I was debugging this when I got dragged onto other work,
and this has stagnated since.


So that's where we are.
 



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

