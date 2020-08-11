Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 42A6124161C
	for <lists+dm-devel@lfdr.de>; Tue, 11 Aug 2020 07:44:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-mai4Rl5KNJm4qh5qKehYIg-1; Tue, 11 Aug 2020 01:44:33 -0400
X-MC-Unique: mai4Rl5KNJm4qh5qKehYIg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F3C91800D41;
	Tue, 11 Aug 2020 05:44:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 411FF65C6F;
	Tue, 11 Aug 2020 05:44:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1586BA5528;
	Tue, 11 Aug 2020 05:44:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07B5i0jp017108 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Aug 2020 01:44:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AAEB32156A4A; Tue, 11 Aug 2020 05:44:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A67702156A4B
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 05:43:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96BCB80067A
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 05:43:58 +0000 (UTC)
Received: from bedivere.hansenpartnership.com
	(bedivere.hansenpartnership.com [66.63.167.143]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-374-mbfb9O8sNnWmH06agjK3TA-1;
	Tue, 11 Aug 2020 01:43:53 -0400
X-MC-Unique: mbfb9O8sNnWmH06agjK3TA-1
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 6E31D8EE1C8; 
	Mon, 10 Aug 2020 22:43:47 -0700 (PDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id BX1EFXHll9pB; Mon, 10 Aug 2020 22:43:47 -0700 (PDT)
Received: from [153.66.254.174] (c-73-35-198-56.hsd1.wa.comcast.net
	[73.35.198.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id EEC048EE12E;
	Mon, 10 Aug 2020 22:43:45 -0700 (PDT)
Message-ID: <1597124623.30793.14.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@hansenpartnership.com>
To: Chuck Lever <chucklever@gmail.com>
Date: Mon, 10 Aug 2020 22:43:43 -0700
In-Reply-To: <6E907A22-02CC-42DD-B3CD-11D304F3A1A8@gmail.com>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200802115545.GA1162@bug> <20200802140300.GA2975990@sasha-vm>
	<20200802143143.GB20261@amd>
	<1596386606.4087.20.camel@HansenPartnership.com>
	<fb35a1f7-7633-a678-3f0f-17cf83032d2b@linux.microsoft.com>
	<1596639689.3457.17.camel@HansenPartnership.com>
	<alpine.LRH.2.21.2008050934060.28225@namei.org>
	<b08ae82102f35936427bf138085484f75532cff1.camel@linux.ibm.com>
	<329E8DBA-049E-4959-AFD4-9D118DEB176E@gmail.com>
	<da6f54d0438ee3d3903b2c75fcfbeb0afdf92dc2.camel@linux.ibm.com>
	<1597073737.3966.12.camel@HansenPartnership.com>
	<6E907A22-02CC-42DD-B3CD-11D304F3A1A8@gmail.com>
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
	Mimi Zohar <zohar@linux.ibm.com>, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, Pavel Machek <pavel@ucw.cz>, Paul,
	agk@redhat.com, Sasha Levin <sashal@kernel.org>,
	Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>,
	James Morris <jmorris@namei.org>, nramas@linux.microsoft.com,
	serge@hallyn.com, pasha.tatashin@soleen.com,
	Jann Horn <jannh@google.com>, linux-block@vger.kernel.org,
	Al Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>,
	mdsakib@microsoft.com, open list <linux-kernel@vger.kernel.org>,
	eparis@redhat.com, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-integrity@vger.kernel.org, jaskarankhurana@linux.microsoft.com
Subject: Re: [dm-devel] [RFC PATCH v5 00/11] Integrity Policy Enforcement
 LSM (IPE)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-10 at 19:36 -0400, Chuck Lever wrote:
> > On Aug 10, 2020, at 11:35 AM, James Bottomley
> > <James.Bottomley@HansenPartnership.com> wrote:
> > On Sun, 2020-08-09 at 13:16 -0400, Mimi Zohar wrote:
> > > On Sat, 2020-08-08 at 13:47 -0400, Chuck Lever wrote:
[...]
> > > > The first priority (for me, anyway) therefore is getting the
> > > > ability to move IMA metadata between NFS clients and servers
> > > > shoveled into the NFS protocol, but that's been blocked for
> > > > various legal reasons.
> > > 
> > > Up to now, verifying remote filesystem file integrity has been
> > > out of scope for IMA.   With fs-verity file signatures I can at
> > > least grasp how remote file integrity could possibly work.  I
> > > don't understand how remote file integrity with existing IMA
> > > formats could be supported. You might want to consider writing a
> > > whitepaper, which could later be used as the basis for a patch
> > > set cover letter.
> > 
> > I think, before this, we can help with the basics (and perhaps we
> > should sort them out before we start documenting what we'll do).
> 
> Thanks for the help! I just want to emphasize that documentation
> (eg, a specification) will be critical for remote filesystems.
> 
> If any of this is to be supported by a remote filesystem, then we
> need an unencumbered description of the new metadata format rather
> than code. GPL-encumbered formats cannot be contributed to the NFS
> standard, and are probably difficult for other filesystems that are
> not Linux-native, like SMB, as well.

I don't understand what you mean by GPL encumbered formats.  The GPL is
a code licence not a data or document licence.  The way the spec
process works in Linux is that we implement or evolve a data format
under a GPL implementaiton, but that implementation doesn't implicate
the later standardisation of the data format and people are free to
reimplement under any licence they choose.

> > The first basic is that a merkle tree allows unit at a time
> > verification. First of all we should agree on the unit.  Since we
> > always fault a page at a time, I think our merkle tree unit should
> > be a page not a block.
> 
> Remote filesystems will need to agree that the size of that unit is
> the same everywhere, or the unit size could be stored in the per-file
> metadata.
> 
> 
> > Next, we should agree where the check gates for the per page
> > accesses should be ... definitely somewhere in readpage, I suspect
> > and finally we should agree how the merkle tree is presented at the
> > gate.  I think there are three ways:
> > 
> >   1. Ahead of time transfer:  The merkle tree is transferred and
> > verified
> >      at some time before the accesses begin, so we already have a
> >      verified copy and can compare against the lower leaf.
> >   2. Async transfer:  We provide an async mechanism to transfer the
> >      necessary components, so when presented with a unit, we check
> > the
> >      log n components required to get to the root
> >   3. The protocol actually provides the capability of 2 (like the
> > SCSI
> >      DIF/DIX), so to IMA all the pieces get presented instead of
> > IMA
> >      having to manage the tree
> 
> A Merkle tree is potentially large enough that it cannot be stored in
> an extended attribute. In addition, an extended attribute is not a
> byte stream that you can seek into or read small parts of, it is
> retrieved in a single shot.

Well you wouldn't store the tree would you, just the head hash.  The
rest of the tree can be derived from the data.  You need to distinguish
between what you *must* have to verify integrity (the head hash,
possibly signed) and what is nice to have to speed up the verification
process.  The choice for the latter is cache or reconstruct depending
on the resources available.  If the tree gets cached on the server,
that would be a server implementation detail invisible to the client.

> For this reason, the idea was to save only the signature of the
> tree's root on durable storage. The client would retrieve that
> signature possibly at open time, and reconstruct the tree at that
> time.

Right that's the integrity data you must have.

> Or the tree could be partially constructed on-demand at the time each
> unit is to be checked (say, as part of 2. above).

Whether it's reconstructed or cached can be an implementation detail. 
You clearly have to reconstruct once, but whether you have to do it
again depends on the memory available for caching and all the other
resource calls in the system.

> The client would have to reconstruct that tree again if memory
> pressure caused some or all of the tree to be evicted, so perhaps an
> on-demand mechanism is preferable.

Right, but I think that's implementation detail.  Probably what we need
is a way to get the log(N) verification hashes from the server and it's
up to the client whether it caches them or not.

> > There are also a load of minor things like how we get the head
> > hash, which must be presented and verified ahead of time for each
> > of the above 3.
> 
> Also, changes to a file's content and its tree signature are not
> atomic. If a file is mutable, then there is the period between when
> the file content has changed and when the signature is updated.
> Some discussion of how a client is to behave in those situations will
> be necessary.

For IMA, if you write to a checked file, it gets rechecked the next
time the gate (open/exec/mmap) is triggered.  This means you must
complete the update and have the new integrity data in-place before
triggering the check.  I think this could apply equally to a merkel
tree based system.  It's a sort of Doctor, Doctor it hurts when I do
this situation.

James

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

