Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D5E70E068
	for <lists+dm-devel@lfdr.de>; Tue, 23 May 2023 17:26:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684855595;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VLxWEVxwFGNiZMq4Qkk0jxH1Z3EcCSQSEQCRv0SJpFQ=;
	b=EVhk1vupURm873J8tfu/FzHtwtavh69YlA+W4U5vNK4giJ9txjoG/JVX2g8wOvxfRZeJHb
	+B8+KTqZHyVWmMuNmucgSKrPfF6X8CUGYtFSfjnHvVErIZrP5ph9q9bdQowVh1sFgjZyZS
	0Equ9sjvNkmeF+3XfwokjgVnrGuUQa8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-hdwR-xPbPEWGSCw3ZN659g-1; Tue, 23 May 2023 11:26:32 -0400
X-MC-Unique: hdwR-xPbPEWGSCw3ZN659g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C95EF1C09A41;
	Tue, 23 May 2023 15:26:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B5BC5492B0A;
	Tue, 23 May 2023 15:26:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 99A9E19465BB;
	Tue, 23 May 2023 15:26:25 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 28E8719465A0
 for <dm-devel@listman.corp.redhat.com>; Tue, 23 May 2023 15:26:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 05D36400F17; Tue, 23 May 2023 15:26:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1B12492B00
 for <dm-devel@redhat.com>; Tue, 23 May 2023 15:26:23 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7582280AA76
 for <dm-devel@redhat.com>; Tue, 23 May 2023 15:26:23 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-YwheB79rNomIc80mm0hbpQ-1; Tue, 23 May 2023 11:26:22 -0400
X-MC-Unique: YwheB79rNomIc80mm0hbpQ-1
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-75b050b4fa0so267962485a.0
 for <dm-devel@redhat.com>; Tue, 23 May 2023 08:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684855582; x=1687447582;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hOwa5nFzWuC8J25Geuotxcv/8rIn3BuiCtasU8soHSk=;
 b=I4NnZ7aIAk+rBnLd31ERnT/Zv5hAw0ihbJYn7BdvZrb8gMqAzUUUIaUzr1cQ9a40A0
 sTzjjCjNL0UUve1jesh3Ldzumo9CuMGnzE9cL/FITXx1qiey0MVXpgShxsgcoL2W+oSL
 hr2FoG4io5XXPhX3zNlEgUxEMN+xlVX7LwNVZ+9SDvpmgk7buDIQurow3SLCAHI144us
 at1yjExDO0BtQhw2UVi8AhLeetdoNdEwS+i9y7Fe7wJrNz5++I2T/7sbv4OU+P6mN3L4
 eSmieY2tCXXEA+I/liIR5kswApI0lUV8oSzA3lVPP1/HXttLonHZYYZ/8UeBUhEIt06F
 46wg==
X-Gm-Message-State: AC+VfDwZJh8YVEhYWfpM1KKHd4KgKrtOlr7+atQCW9e9xzOp3P2udmKP
 PoUy/uFLn3msv1rYqfWiGV9spkQ=
X-Google-Smtp-Source: ACHHUZ5DQUCXLPe0l5Sv6bRXDTH5MsYFi8eMw3CVk9o8lrYyCzhm/UIR8A5Md2PyHqNG7iks9yZx5g==
X-Received: by 2002:a37:a843:0:b0:75b:23a1:440 with SMTP id
 r64-20020a37a843000000b0075b23a10440mr4366557qke.6.1684855580214; 
 Tue, 23 May 2023 08:26:20 -0700 (PDT)
Received: from localhost (pool-68-160-166-30.bstnma.fios.verizon.net.
 [68.160.166.30]) by smtp.gmail.com with ESMTPSA id
 i6-20020a37c206000000b0075b04cad776sm2079156qkm.20.2023.05.23.08.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 08:26:19 -0700 (PDT)
Date: Tue, 23 May 2023 11:26:18 -0400
From: Mike Snitzer <snitzer@kernel.org>
To: Brian Foster <bfoster@redhat.com>
Message-ID: <ZGzbGg35SqMrWfpr@redhat.com>
References: <20230518223326.18744-1-sarthakkukreti@chromium.org>
 <ZGb2Xi6O3i2pLam8@infradead.org> <ZGeKm+jcBxzkMXQs@redhat.com>
 <ZGgBQhsbU9b0RiT1@dread.disaster.area>
 <ZGu0LaQfREvOQO4h@redhat.com> <ZGzIJlCE2pcqQRFJ@bfoster>
MIME-Version: 1.0
In-Reply-To: <ZGzIJlCE2pcqQRFJ@bfoster>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Jason Wang <jasowang@redhat.com>, Bart Van Assche <bvanassche@google.com>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Sarthak Kukreti <sarthakkukreti@chromium.org>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Joe Thornber <ejt@redhat.com>,
 Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 23 2023 at 10:05P -0400,
Brian Foster <bfoster@redhat.com> wrote:

> On Mon, May 22, 2023 at 02:27:57PM -0400, Mike Snitzer wrote:
> > On Fri, May 19 2023 at  7:07P -0400,
> > Dave Chinner <david@fromorbit.com> wrote:
> > 
...
> > > e.g. If the device takes a snapshot, it needs to reprovision the
> > > potential COW ranges that overlap with the provisioned LBA range at
> > > snapshot time. e.g. by re-reserving the space from the backing pool
> > > for the provisioned space so if a COW occurs there is space
> > > guaranteed for it to succeed.  If there isn't space in the backing
> > > pool for the reprovisioning, then whatever operation that triggers
> > > the COW behaviour should fail with ENOSPC before doing anything
> > > else....
> > 
> > Happy to implement this in dm-thinp.  Each thin block will need a bit
> > to say if the block must be REQ_PROVISION'd at time of snapshot (and
> > the resulting block will need the same bit set).
> > 
> > Walking all blocks of a thin device and triggering REQ_PROVISION for
> > each will obviously make thin snapshot creation take more time.
> > 
> > I think this approach is better than having a dedicated bitmap hooked
> > off each thin device's metadata (with bitmap being copied and walked
> > at the time of snapshot). But we'll see... I'll get with Joe to
> > discuss further.
> > 
> 
> Hi Mike,
> 
> If you recall our most recent discussions on this topic, I was thinking
> about the prospect of reserving the entire volume at mount time as an
> initial solution to this problem. When looking through some of the old
> reservation bits we prototyped years ago, it occurred to me that we have
> enough mechanism to actually prototype this.
> 
> So FYI, I have some hacky prototype code that essentially has the
> filesystem at mount time tell dm it's using the volume and expects all
> further writes to succeed. dm-thin acquires reservation for the entire
> range of the volume for which writes would require block allocation
> (i.e., holes and shared dm blocks) or otherwise warns that the fs cannot
> be "safely" mounted.
> 
> The reservation pool associates with the thin volume (not the
> filesystem), so if a snapshot is requested from dm, the snapshot request
> locates the snapshot origin and if it's currently active, increases the
> reservation pool to account for outstanding blocks that are about to
> become shared, or otherwise fails the snapshot with -ENOSPC. (I suspect
> discard needs similar treatment, but I hadn't got to that yet.). If the
> fs is not active, there is nothing to protect and so the snapshot
> proceeds as normal.
> 
> This seems to work on my simple, initial tests for protecting actively
> mounted filesystems from dm-thin -ENOSPC. This definitely needs a sanity
> check from dm-thin folks, however, because I don't know enough about the
> broader subsystem to reason about whether it's sufficiently correct. I
> just managed to beat the older prototype code into submission to get it
> to do what I wanted on simple experiments.

Feel free to share what you have.

But my initial gut on the approach is: why even use thin provisioning
at all if you're just going to reserve the entire logical address
space of each thin device?

> Thoughts on something like this? I think the main advantage is that it
> significantly reduces the requirements on the fs to track individual
> allocations. It's basically an on/off switch from the fs perspective,
> doesn't require any explicit provisioning whatsoever (though it can be
> done to improve things in the future) and in fact could probably be tied
> to thin volume activation to be made completely filesystem agnostic.
> Another advantage is that it requires no on-disk changes, no breaking
> COWs up front during snapshots, etc.

I'm just really unclear on the details without seeing it.

You shared a roll-up of the code we did from years ago so I can kind
of imagine the nature of the changes.  I'm concerned about snapshots,
and the implicit need to compound the reservation for each snapshot.

> The disadvantages are that it's space inefficient wrt to thin pool free
> space, but IIUC this is essentially what userspace management layers
> (such as Stratis) are doing today, they just put restrictions up front
> at volume configuration/creation time instead of at runtime. There also
> needs to be some kind of interface between the fs and dm. I suppose we
> could co-opt provision and discard primitives with a "reservation"
> modifier flag to get around that in a simple way, but that sounds
> potentially ugly. TBH, the more I think about this the more I think it
> makes sense to reserve on volume activation (with some caveats to allow
> a read-only mode, explicit bypass, etc.) and then let the
> cross-subsystem interface be dictated by granularity improvements...

It just feels imprecise to the point of being both excessive and
nebulous.

thin devices, and snapshots of them, can be active without associated
filesystem mounts being active.  It just takes a single origin volume
to be mounted, with a snapshot active, to force thin blocks' sharing
to be broken.

> ... since I also happen to think there is a potentially interesting
> development path to make this sort of reserve pool configurable in terms
> of size and active/inactive state, which would allow the fs to use an
> emergency pool scheme for managing metadata provisioning and not have to
> track and provision individual metadata buffers at all (dealing with
> user data is much easier to provision explicitly). So the space
> inefficiency thing is potentially just a tradeoff for simplicity, and
> filesystems that want more granularity for better behavior could achieve
> that with more work. Filesystems that don't would be free to rely on the
> simple/basic mechanism provided by dm-thin and still have basic -ENOSPC
> protection with very minimal changes.
> 
> That's getting too far into the weeds on the future bits, though. This
> is essentially 99% a dm-thin approach, so I'm mainly curious if there's
> sufficient interest in this sort of "reserve mode" approach to try and
> clean it up further and have dm guys look at it, or if you guys see any
> obvious issues in what it does that makes it potentially problematic, or
> if you would just prefer to go down the path described above...

The model that Dave detailed, which builds on REQ_PROVISION and is
sticky (by provisioning same blocks for snapshot) seems more useful to
me because it is quite precise.  That said, it doesn't account for
hard requirements that _all_ blocks will always succeed.  I'm really
not sure we need to go to your extreme (even though stratis
has.. difference is they did so as a crude means to an end because the
existing filesystem code can easily get caught out by -ENOSPC at
exactly the wrong time).

Mike


> > > Software devices like dm-thin/snapshot should really only need to
> > > keep a persistent map of the provisioned space and refresh space
> > > reservations for used space within that map whenever something that
> > > triggers COW behaviour occurs. i.e. a snapshot needs to reset the
> > > provisioned ranges back to "all ranges are freshly provisioned"
> > > before the snapshot is started. If that space is not available in
> > > the backing pool, then the snapshot attempt gets ENOSPC....
> > > 
> > > That means filesystems only need to provision space for journals and
> > > fixed metadata at mkfs time, and they only need issue a
> > > REQ_PROVISION bio when they first allocate over-write in place
> > > metadata. We already have online discard and/or fstrim for releasing
> > > provisioned space via discards.
> > > 
> > > This will require some mods to filesystems like ext4 and XFS to
> > > issue REQ_PROVISION and fail gracefully during metadata allocation.
> > > However, doing so means that we can actually harden filesystems
> > > against sparse block device ENOSPC errors by ensuring they will
> > > never occur in critical filesystem structures....
> > 
> > Yes, let's finally _do_ this! ;)
> > 
> > Mike
> > 
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://listman.redhat.com/mailman/listinfo/dm-devel
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

