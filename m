Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EE97E710B7A
	for <lists+dm-devel@lfdr.de>; Thu, 25 May 2023 13:52:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685015537;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Mcm6q5MtNWvvXvH/VEkJ3fthzpqWlKeouZmRHySaRig=;
	b=CtgCyHz35qG21r5QQRvRG+RIR2uZqyxOMI86V+yfQImWKvBrvPNaZM85KVca8IBdHV05nr
	LqxZIhu3naaPvVkkhakWV0qvoTT5ZOD913M2dLStSMovlNUF1Rryd5asut/YAyhYTwLm/o
	jDa298C8MqoteiJrPyu/tinFigr/gW0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250--Qbt7j3yPD2dNwjmlqPI8A-1; Thu, 25 May 2023 07:52:15 -0400
X-MC-Unique: -Qbt7j3yPD2dNwjmlqPI8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D485D3C11CD3;
	Thu, 25 May 2023 11:52:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C40D2166B2B;
	Thu, 25 May 2023 11:52:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0928C19465B9;
	Thu, 25 May 2023 11:52:05 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 57B7719465A0
 for <dm-devel@listman.corp.redhat.com>; Thu, 25 May 2023 11:40:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 432F4492B0A; Thu, 25 May 2023 11:40:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B7C2492B0B
 for <dm-devel@redhat.com>; Thu, 25 May 2023 11:40:08 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AF3E85A5BF
 for <dm-devel@redhat.com>; Thu, 25 May 2023 11:40:08 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-Piu5nNYjOYKPJN6fufg-Dg-1; Thu, 25 May 2023 07:40:04 -0400
X-MC-Unique: Piu5nNYjOYKPJN6fufg-Dg-1
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-25374c9be49so1248765a91.3
 for <dm-devel@redhat.com>; Thu, 25 May 2023 04:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685014803; x=1687606803;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ByO40oJg6gb3zzbEXq+wYWD+I7DW+NPia1sYMNc7ASk=;
 b=GMJgwUscxGKX0D1bji1kNB2quEzp2Pt09AyYbK0952WT8hSYMQNwDw3S1wvUllsQNr
 mSQShbmk7eaDUBIE7vaNzQnMnIAPFeFbo37jdTKkZ49pOLglN+QGUuezf/M9JhanXQnU
 Xey4vmc4txx8gSLeqjEThz2pA8AKZY9VuPA1vlaOVQN9x5uLpkv1DH29t/U1boMrA8xj
 2zx8Bdo4+VMbPaLXOYFOgwTi1pPPiOfVMbVZFnQqJdlmHosFvXNUmHx1Jcxn0zZH3AjX
 Z5D1q9doTkYwsvjpcXIUz1CR2i1YHeRYQg0Mq6C7Iqc4hctWdPoKhzpF4BhmK8jtvZzF
 QVYA==
X-Gm-Message-State: AC+VfDwu1qekzuPxqH4zUp1+9e+FBey3bx8+RZrNMZvrby+c0QYw4twQ
 ehv61XkQBwZOPRQoLYNPVLrDPA==
X-Google-Smtp-Source: ACHHUZ5OdMp2D+FU9x9FyHSTtJJivoQSAPXf0t9QwJh6oGzaqp5K6xCLQk7awHgfJ2T3vEhSaxhMxw==
X-Received: by 2002:a17:90a:4fa2:b0:255:929c:5166 with SMTP id
 q31-20020a17090a4fa200b00255929c5166mr1528186pjh.26.1685014802903; 
 Thu, 25 May 2023 04:40:02 -0700 (PDT)
Received: from dread.disaster.area (pa49-179-0-188.pa.nsw.optusnet.com.au.
 [49.179.0.188]) by smtp.gmail.com with ESMTPSA id
 e18-20020a17090ac21200b00250c1392ed3sm1075402pjt.55.2023.05.25.04.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 04:40:02 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1q29K3-003iCB-15;
 Thu, 25 May 2023 21:39:59 +1000
Date: Thu, 25 May 2023 21:39:59 +1000
From: Dave Chinner <david@fromorbit.com>
To: Mike Snitzer <snitzer@kernel.org>
Message-ID: <ZG9JD+4Zu36lnm4F@dread.disaster.area>
References: <20230518223326.18744-1-sarthakkukreti@chromium.org>
 <ZGb2Xi6O3i2pLam8@infradead.org> <ZGeKm+jcBxzkMXQs@redhat.com>
 <ZGgBQhsbU9b0RiT1@dread.disaster.area>
 <ZGu0LaQfREvOQO4h@redhat.com> <ZGzIJlCE2pcqQRFJ@bfoster>
 <ZGzbGg35SqMrWfpr@redhat.com>
 <ZG1dAtHmbQ53aOhA@dread.disaster.area>
 <ZG5taYoXDRymo/e9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ZG5taYoXDRymo/e9@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [dm-devel] [PATCH v7 0/5] Introduce provisioning primitives
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
 Theodore Ts'o <tytso@mit.edu>, Sarthak Kukreti <sarthakkukreti@chromium.org>,
 dm-devel@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 "Darrick J. Wong" <djwong@kernel.org>, Brian Foster <bfoster@redhat.com>,
 Bart Van Assche <bvanassche@google.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Joe Thornber <ejt@redhat.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Stefan Hajnoczi <stefanha@redhat.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Jason Wang <jasowang@redhat.com>,
 Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 24, 2023 at 04:02:49PM -0400, Mike Snitzer wrote:
> On Tue, May 23 2023 at  8:40P -0400,
> Dave Chinner <david@fromorbit.com> wrote:
> 
> > On Tue, May 23, 2023 at 11:26:18AM -0400, Mike Snitzer wrote:
> > > On Tue, May 23 2023 at 10:05P -0400, Brian Foster <bfoster@redhat.com> wrote:
> > > > On Mon, May 22, 2023 at 02:27:57PM -0400, Mike Snitzer wrote:
> > > > ... since I also happen to think there is a potentially interesting
> > > > development path to make this sort of reserve pool configurable in terms
> > > > of size and active/inactive state, which would allow the fs to use an
> > > > emergency pool scheme for managing metadata provisioning and not have to
> > > > track and provision individual metadata buffers at all (dealing with
> > > > user data is much easier to provision explicitly). So the space
> > > > inefficiency thing is potentially just a tradeoff for simplicity, and
> > > > filesystems that want more granularity for better behavior could achieve
> > > > that with more work. Filesystems that don't would be free to rely on the
> > > > simple/basic mechanism provided by dm-thin and still have basic -ENOSPC
> > > > protection with very minimal changes.
> > > > 
> > > > That's getting too far into the weeds on the future bits, though. This
> > > > is essentially 99% a dm-thin approach, so I'm mainly curious if there's
> > > > sufficient interest in this sort of "reserve mode" approach to try and
> > > > clean it up further and have dm guys look at it, or if you guys see any
> > > > obvious issues in what it does that makes it potentially problematic, or
> > > > if you would just prefer to go down the path described above...
> > > 
> > > The model that Dave detailed, which builds on REQ_PROVISION and is
> > > sticky (by provisioning same blocks for snapshot) seems more useful to
> > > me because it is quite precise.  That said, it doesn't account for
> > > hard requirements that _all_ blocks will always succeed.
> > 
> > Hmmm. Maybe I'm misunderstanding the "reserve pool" context here,
> > but I don't think we'd ever need a hard guarantee from the block
> > device that every write bio issued from the filesystem will succeed
> > without ENOSPC.
> > 
> > If the block device can provide a guarantee that a provisioned LBA
> > range is always writable, then everything else is a filesystem level
> > optimisation problem and we don't have to involve the block device
> > in any way. All we need is a flag we can ready out of the bdev at
> > mount time to determine if the filesystem should be operating with
> > LBA provisioning enabled...
> > 
> > e.g. If we need to "pre-provision" a chunk of the LBA space for
> > filesystem metadata, we can do that ahead of time and track the
> > pre-provisioned range(s) in the filesystem itself.
> > 
> > In XFS, That could be as simple as having small chunks of each AG
> > reserved to metadata (e.g. start with the first 100MB) and limiting
> > all metadata allocation free space searches to that specific block
> > range. When we run low on that space, we pre-provision another 100MB
> > chunk and then allocate all metadata out of that new range. If we
> > start getting ENOSPC to pre-provisioning, then we reduce the size of
> > the regions and log low space warnings to userspace. If we can't
> > pre-provision any space at all and we've completely run out, we
> > simply declare ENOSPC for all incoming operations that require
> > metadata allocation until pre-provisioning succeeds again.
> 
> This is basically saying the same thing but:
> 
> It could be that the LBA space is fragmented and so falling back to
> the smallest region size (that matches the thinp block size) would be
> the last resort?  Then if/when thinp cannot even service allocating a
> new free thin block, dm-thinp will transition to out-of-data-space
> mode.

Yes, something of that sort, though we'd probably give up if we
can't get at least megabyte scale reservations - a single
modification in XFS can modify many structures and require
allocation of a lot of new metadata, so the fileystem cut-off would
for metadata provisioning failure would be much larger than the
dm-thinp region size....

> > This is built entirely on the premise that once proactive backing
> > device provisioning fails, the backing device is at ENOSPC and we
> > have to wait for that situation to go away before allowing new data
> > to be ingested. Hence the block device really doesn't need to know
> > anything about what the filesystem is doing and vice versa - The
> > block dev just says "yes" or "no" and the filesystem handles
> > everything else.
> 
> Yes.
> 
> > It's worth noting that XFS already has a coarse-grained
> > implementation of preferred regions for metadata storage. It will
> > currently not use those metadata-preferred regions for user data
> > unless all the remaining user data space is full.  Hence I'm pretty
> > sure that a pre-provisioning enhancment like this can be done
> > entirely in-memory without requiring any new on-disk state to be
> > added.
> > 
> > Sure, if we crash and remount, then we might chose a different LBA
> > region for pre-provisioning. But that's not really a huge deal as we
> > could also run an internal background post-mount fstrim operation to
> > remove any unused pre-provisioning that was left over from when the
> > system went down.
> 
> This would be the FITRIM with extension you mention below? Which is a
> filesystem interface detail?

No. We might reuse some of the internal infrastructure we use to
implement FITRIM, but that's about it. It's just something kinda
like FITRIM but with different constraints determined by the
filesystem rather than the user...

As it is, I'm not sure we'd even need it - a preiodic userspace
FITRIM would acheive the same result, so leaked provisioned spaces
would get cleaned up eventually without the filesystem having to do
anything specific...

> So dm-thinp would _not_ need to have new
> state that tracks "provisioned but unused" block?

No idea - that's your domain. :)

dm-snapshot, for certain, will need to track provisioned regions
because it has to guarantee that overwrites to provisioned space in
the origin device will always succeed. Hence it needs to know how
much space breaking sharing in provisioned regions after a snapshot
has been taken with be required...

> Nor would the block
> layer need an extra discard flag for a new class of "provisioned"
> blocks.

Right, I don't see that the discard operations need to care whether
the underlying storage is provisioned. dm-thinp and dm-snapshot can
treat REQ_OP_DISCARD as "this range is not longer in use" and do
whatever they want with them. 

> If XFS tracked this "provisioned but unused" state, dm-thinp could
> just discard the block like its told.  Would be nice to avoid dm-thinp
> needing to track "provisioned but unused".
>
> That said, dm-thinp does still need to know if a block was provisioned
> (given our previous designed discussion, to allow proper guarantees
> from this interface at snapshot time) so that XFS and other
> filesystems don't need to re-provision areas they already
> pre-provisioned.

Right.

I've simply assumed that dm-thinp would need to track entire
provisioned regions - used or unused - so it knows which writes to
empty or shared regions have a reservation to allow allocation to
succeed when the backing pool is otherwise empty.....

> However, it may be that if thinp did track "provisioned but unused"
> it'd be useful to allow snapshots to share provisioned blocks that
> were never used.  Meaning, we could then avoid "breaking sharing" at
> snapshot-time for "provisioned but unused" blocks.  But allowing this
> "optimization" undercuts the gaurantee that XFS needs for thinp
> storage that allows snapshots... SO, I think I answered my own
> question: thinp doesnt need to track "provisioned but unused" blocks
> but we must always ensure snapshots inherit provisoned blocks ;)

Sounds like a potential optimisation, but I haven't thought through
a potential snapshot device implementation that far to comment
sanely. I stopped once I got to the point where accounting tricks
count be used to guarantee space is available for breaking sharing
of used provisioned space after a snapshot was taken....

> > Further, managing shared pool exhaustion doesn't require a
> > reservation pool in the backing device and for the filesystems to
> > request space from it. Filesystems already have their own reserve
> > pools via pre-provisioning. If we want the filesystems to be able to
> > release that space back to the shared pool (e.g. because the shared
> > backing pool is critically short on space) then all we need is an
> > extension to FITRIM to tell the filesystem to also release internal
> > pre-provisioned reserves.
> 
> So by default FITRIM will _not_ discard provisioned blocks.  Only if
> a flag is used will it result in discarding provisioned blocks.

No. FITRIM results in discard of any unused free space in the
filesystem that matches the criteria set by the user. We don't care
if free space was once provisioned used space - we'll issue a
discard for the range regardless. The "special" FITRIM extension I
mentioned is to get filesystem metadata provisioning released;
that's completely separate to user data provisioning through
fallocate() which FITRIM will always discard if it has been freed...

IOWs, normal behaviour will be that a FITRIM ends up discarding a
mix of unprovisioned and provisioned space. Nobody will be able to
predict what mix the device is going to get at any point in time.
Also, if we turn on online discard, the block device is going to get
a constant stream of discard operations that will also be a mix of
provisioned and unprovisioned space that is not longer in use by the
filesystem. 

I suspect that you need to stop trying to double guess what
operations the filesystem will use provisioning for, what it will
send discards for and when it will send discards for them.. Just
assume the device will receive a constant stream of both
REQ_PROVISION and REQ_OP_DISCARD (for both provisioned and
unprovisioned regions) operations whenver the filesystem is active
on a thinp device.....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

