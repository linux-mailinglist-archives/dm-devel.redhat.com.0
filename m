Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0AF240BB6
	for <lists+dm-devel@lfdr.de>; Mon, 10 Aug 2020 19:14:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-96b459v2NxCTDW3kayy0Pg-1; Mon, 10 Aug 2020 13:14:00 -0400
X-MC-Unique: 96b459v2NxCTDW3kayy0Pg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D7BC8014D7;
	Mon, 10 Aug 2020 17:13:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F293919C4F;
	Mon, 10 Aug 2020 17:13:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5DB719754B;
	Mon, 10 Aug 2020 17:13:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07AHDMol025470 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 13:13:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DDFA42156A52; Mon, 10 Aug 2020 17:13:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8EA32156A4C
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 17:13:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 982F4803883
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 17:13:18 +0000 (UTC)
Received: from bedivere.hansenpartnership.com
	(bedivere.hansenpartnership.com [66.63.167.143]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-182-SHHkPBwcOmyB01rKYYDWYw-1;
	Mon, 10 Aug 2020 13:13:12 -0400
X-MC-Unique: SHHkPBwcOmyB01rKYYDWYw-1
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 999ED8EE1C0; 
	Mon, 10 Aug 2020 10:13:08 -0700 (PDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id kjQAlOlinWBO; Mon, 10 Aug 2020 10:13:08 -0700 (PDT)
Received: from [153.66.254.174] (c-73-35-198-56.hsd1.wa.comcast.net
	[73.35.198.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 22EBE8EE12E;
	Mon, 10 Aug 2020 10:13:07 -0700 (PDT)
Message-ID: <1597079586.3966.34.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@hansenpartnership.com>
To: Mimi Zohar <zohar@linux.ibm.com>, Chuck Lever <chucklever@gmail.com>,
	James Morris <jmorris@namei.org>
Date: Mon, 10 Aug 2020 10:13:06 -0700
In-Reply-To: <4664ab7dc3b324084df323bfa4670d5bfde76e66.camel@linux.ibm.com>
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
	<4664ab7dc3b324084df323bfa4670d5bfde76e66.camel@linux.ibm.com>
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
	dm-devel@redhat.com, tyhicks@linux.microsoft.com,
	Pavel Machek <pavel@ucw.cz>, Paul, agk@redhat.com,
	Sasha Levin <sashal@kernel.org>, Moore <paul@paul-moore.com>,
	Jonathan Corbet <corbet@lwn.net>, nramas@linux.microsoft.com,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-10 at 12:35 -0400, Mimi Zohar wrote:
> On Mon, 2020-08-10 at 08:35 -0700, James Bottomley wrote:
[...]
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
> I'm not opposed to doing that, but you're taking this discussion in a
> totally different direction.  The current discussion is about NFSv4
> supporting the existing IMA signatures, not only fs-verity
> signatures. I'd like to understand how that is possible and for the
> community to weigh in on whether it makes sense.

Well, I see the NFS problem as being chunk at a time, right, which is
merkle tree, or is there a different chunk at a time mechanism we want
to use?  IMA currently verifies signature on open/exec and then
controls updates.  Since for NFS we only control the client, we can't
do that on an NFS server, so we really do need verification at read
time ... unless we're threading IMA back to the NFS server?

> > The first basic is that a merkle tree allows unit at a time
> > verification. First of all we should agree on the unit.  Since we
> > always fault a page at a time, I think our merkle tree unit should
> > be a page not a block. Next, we should agree where the check gates
> > for the per page accesses should be ... definitely somewhere in
> > readpage, I suspect and finally we should agree how the merkle tree
> > is presented at the gate.  I think there are three ways:
> > 
> >    1. Ahead of time transfer:  The merkle tree is transferred and
> > verified
> >       at some time before the accesses begin, so we already have a
> >       verified copy and can compare against the lower leaf.
> >    2. Async transfer:  We provide an async mechanism to transfer
> > the
> >       necessary components, so when presented with a unit, we check
> > the
> >       log n components required to get to the root
> >    3. The protocol actually provides the capability of 2 (like the
> > SCSI
> >       DIF/DIX), so to IMA all the pieces get presented instead of
> > IMA
> >       having to manage the tree
> > 
> > There are also a load of minor things like how we get the head
> > hash, which must be presented and verified ahead of time for each
> > of the above 3.
> 
>  
> I was under the impression that IMA support for fs-verity signatures
> would be limited to including the fs-verity signature in the
> measurement list and verifying the fs-verity signature.   As fs-
> verity is limited to immutable files, this could be done on file
> open.  fs-verity would be responsible for enforcing the block/page
> data integrity.   From a local filesystem perspective, I think that
> is all that is necessary.

The fs-verity use case is a bit of a crippled one because it's
immutable.  I think NFS represents more the general case where you
can't rely on immutability and have to verify at chunk read time.  If
we get chunk at a time working for NFS, it should work also for fs-
verity and we wouldn't need to have two special paths.

I think, even for NFS we would only really need to log the open, so
same as you imagine for fs-verity.  As long as the chunk read hashes
match, we can be silent because everything is going OK, so we only need
to determine what to do and log on mismatch (which isn't expected to
happen for fs-verity).

> In terms of remote file systems,  the main issue is transporting and
> storing the Merkle tree.  As fs-verity is limited to immutable files,
> this could still be done on file open.

Right, I mentioned that in my options ... we need some "supply
integrity" hook ... or possibly multiple hooks for a variety of
possible methods.

James

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

