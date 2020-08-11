Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 221D7241DA2
	for <lists+dm-devel@lfdr.de>; Tue, 11 Aug 2020 17:54:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-mbqSNUr-ORGGApjopmHi5w-1; Tue, 11 Aug 2020 11:54:11 -0400
X-MC-Unique: mbqSNUr-ORGGApjopmHi5w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F8728015F0;
	Tue, 11 Aug 2020 15:54:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D3AE1EA;
	Tue, 11 Aug 2020 15:54:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8092EA553D;
	Tue, 11 Aug 2020 15:54:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07BFrqNE026268 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Aug 2020 11:53:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C29772156A30; Tue, 11 Aug 2020 15:53:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE4A02166B28
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 15:53:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B6121097AC2
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 15:53:50 +0000 (UTC)
Received: from bedivere.hansenpartnership.com
	(bedivere.hansenpartnership.com [66.63.167.143]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-268-PdA7JQcoPJ6z3QXEz4aQLw-1;
	Tue, 11 Aug 2020 11:53:45 -0400
X-MC-Unique: PdA7JQcoPJ6z3QXEz4aQLw-1
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id C778C8EE19D; 
	Tue, 11 Aug 2020 08:53:41 -0700 (PDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id sV-1x9AsTBa4; Tue, 11 Aug 2020 08:53:41 -0700 (PDT)
Received: from [153.66.254.174] (c-73-35-198-56.hsd1.wa.comcast.net
	[73.35.198.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 32BB98EE149;
	Tue, 11 Aug 2020 08:53:40 -0700 (PDT)
Message-ID: <1597161218.4325.38.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@hansenpartnership.com>
To: Chuck Lever <chucklever@gmail.com>
Date: Tue, 11 Aug 2020 08:53:38 -0700
In-Reply-To: <16C3BF97-A7D3-488A-9D26-7C9B18AD2084@gmail.com>
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
	<1597124623.30793.14.camel@HansenPartnership.com>
	<16C3BF97-A7D3-488A-9D26-7C9B18AD2084@gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2020-08-11 at 10:48 -0400, Chuck Lever wrote:
> > On Aug 11, 2020, at 1:43 AM, James Bottomley <James.Bottomley@Hanse
> > nPartnership.com> wrote:
> > 
> > On Mon, 2020-08-10 at 19:36 -0400, Chuck Lever wrote:
> > > > On Aug 10, 2020, at 11:35 AM, James Bottomley
> > > > <James.Bottomley@HansenPartnership.com> wrote:
[...]
> > > > The first basic is that a merkle tree allows unit at a time
> > > > verification. First of all we should agree on the unit.  Since
> > > > we always fault a page at a time, I think our merkle tree unit
> > > > should be a page not a block.
> > > 
> > > Remote filesystems will need to agree that the size of that unit
> > > is the same everywhere, or the unit size could be stored in the
> > > per-filemetadata.
> > > 
> > > 
> > > > Next, we should agree where the check gates for the per page
> > > > accesses should be ... definitely somewhere in readpage, I
> > > > suspect and finally we should agree how the merkle tree is
> > > > presented at the gate.  I think there are three ways:
> > > > 
> > > >  1. Ahead of time transfer:  The merkle tree is transferred and
> > > > verified
> > > >     at some time before the accesses begin, so we already have
> > > > a
> > > >     verified copy and can compare against the lower leaf.
> > > >  2. Async transfer:  We provide an async mechanism to transfer
> > > > the
> > > >     necessary components, so when presented with a unit, we
> > > > check the
> > > >     log n components required to get to the root
> > > >  3. The protocol actually provides the capability of 2 (like
> > > > the SCSI
> > > >     DIF/DIX), so to IMA all the pieces get presented instead of
> > > > IMA
> > > >     having to manage the tree
> > > 
> > > A Merkle tree is potentially large enough that it cannot be
> > > stored in an extended attribute. In addition, an extended
> > > attribute is not a byte stream that you can seek into or read
> > > small parts of, it is retrieved in a single shot.
> > 
> > Well you wouldn't store the tree would you, just the head
> > hash.  The rest of the tree can be derived from the data.  You need
> > to distinguish between what you *must* have to verify integrity
> > (the head hash, possibly signed)
> 
> We're dealing with an untrusted storage device, and for a remote
> filesystem, an untrusted network.
> 
> Mimi's earlier point is that any IMA metadata format that involves
> unsigned digests is exposed to an alteration attack at rest or in
> transit, thus will not provide a robust end-to-end integrity
> guarantee.
> 
> Therefore, tree root digests must be cryptographically signed to be
> properly protected in these environments. Verifying that signature
> should be done infrequently relative to reading a file's content.

I'm not disagreeing there has to be a way for the relying party to
trust the root hash.

> > and what is nice to have to speed up the verification
> > process.  The choice for the latter is cache or reconstruct
> > depending on the resources available.  If the tree gets cached on
> > the server, that would be a server implementation detail invisible
> > to the client.
> 
> We assume that storage targets (for block or file) are not trusted.
> Therefore storage clients cannot rely on intermediate results (eg,
> middle nodes in a Merkle tree) unless those results are generated
> within the client's trust envelope.

Yes, they can ... because supplied nodes can be verified.  That's the
whole point of a merkle tree.  As long as I'm sure of the root hash I
can verify all the rest even if supplied by an untrusted source.  If
you consider a simple merkle tree covering 4 blocks:

       R
     /   \
  H11     H12
  / \     / \
H21 H22 H23 H24
 |    |   |   |
B1   B2  B3  B4

Assume I have the verified root hash R.  If you supply B3 you also
supply H24 and H11 as proof.  I verify by hashing B3 to produce H23
then hash H23 and H24 to produce H12 and if H12 and your supplied H11
hash to R the tree is correct and the B3 you supplied must likewise be
correct.

> So: if the storage target is considered inside the client's trust
> envelope, it can cache or store durably any intermediate parts of
> the verification process. If not, the network and file storage is
> considered untrusted, and the client has to rely on nothing but the
> signed digest of the tree root.
> 
> We could build a scheme around, say, fscache, that might save the
> intermediate results durably and locally.

I agree we want caching on the client, but we can always page in from
the remote as long as we page enough to verify up to R, so we're always
sure the remote supplied genuine information.

> > > For this reason, the idea was to save only the signature of the
> > > tree's root on durable storage. The client would retrieve that
> > > signature possibly at open time, and reconstruct the tree at that
> > > time.
> > 
> > Right that's the integrity data you must have.
> > 
> > > Or the tree could be partially constructed on-demand at the time
> > > each unit is to be checked (say, as part of 2. above).
> > 
> > Whether it's reconstructed or cached can be an implementation
> > detail. You clearly have to reconstruct once, but whether you have
> > to do it again depends on the memory available for caching and all
> > the other resource calls in the system.
> > 
> > > The client would have to reconstruct that tree again if memory
> > > pressure caused some or all of the tree to be evicted, so perhaps
> > > an on-demand mechanism is preferable.
> > 
> > Right, but I think that's implementation detail.  Probably what we
> > need is a way to get the log(N) verification hashes from the server
> > and it's up to the client whether it caches them or not.
> 
> Agreed, these are implementation details. But see above about the
> trustworthiness of the intermediate hashes. If they are conveyed
> on an untrusted network, then they can't be trusted either.

Yes, they can, provided enough of them are asked for to verify.  If you
look at the simple example above, suppose I have cached H11 and H12,
but I've lost the entire H2X layer.  I want to verify B3 so I also ask
you for your copy of H24.  Then I generate H23 from B3 and Hash H23 and
H24.  If this doesn't hash to H12 I know either you supplied me the
wrong block or lied about H24.  However, if it all hashes correctly I
know you supplied me with both the correct B3 and the correct H24.

> > > > There are also a load of minor things like how we get the head
> > > > hash, which must be presented and verified ahead of time for
> > > > each of the above 3.
> > > 
> > > Also, changes to a file's content and its tree signature are not
> > > atomic. If a file is mutable, then there is the period between
> > > when the file content has changed and when the signature is
> > > updated. Some discussion of how a client is to behave in those
> > > situations will be necessary.
> > 
> > For IMA, if you write to a checked file, it gets rechecked the next
> > time the gate (open/exec/mmap) is triggered.  This means you must
> > complete the update and have the new integrity data in-place before
> > triggering the check.  I think this could apply equally to a merkel
> > tree based system.  It's a sort of Doctor, Doctor it hurts when I
> > do this situation.
> 
> I imagine it's a common situation where a "yum update" process is
> modifying executables while clients are running them. To prevent
> a read from pulling refreshed content before the new tree root is
> available, it would have to block temporarily until the verification
> process succeeds with the updated tree root.

No ... it's not.  Yum specifically worries about that today because if
you update running binaries, it causes a crash.  Yum constructs the
entire new file then atomically links it into place and deletes the old
inode to prevent these crashes.  It never allows you to get into the
situation where you can execute something that will be modified. 
That's also why you have to restart stuff after a yum update because if
you didn't it would still be attached to the deleted inode.

James

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

