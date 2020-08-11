Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7F7242888
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 13:09:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-_PYCykV8P9ehQmIoziMrQA-1; Wed, 12 Aug 2020 07:08:55 -0400
X-MC-Unique: _PYCykV8P9ehQmIoziMrQA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0348F101C8A7;
	Wed, 12 Aug 2020 11:08:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0D105D6BD;
	Wed, 12 Aug 2020 11:08:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F3B5180B656;
	Wed, 12 Aug 2020 11:08:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07BEnC4m019685 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Aug 2020 10:49:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0D3D110F26EE; Tue, 11 Aug 2020 14:49:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07EE810F26F1
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 14:49:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62290857D16
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 14:49:06 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-115-8MPynw91P0OmyfrgBRZtvg-1; Tue, 11 Aug 2020 10:49:03 -0400
X-MC-Unique: 8MPynw91P0OmyfrgBRZtvg-1
Received: by mail-io1-f66.google.com with SMTP id a5so12852073ioa.13;
	Tue, 11 Aug 2020 07:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ssCUdk2zq99A1t5Xbqgx8UHBKHD/0i4VjYZSywQf6Uc=;
	b=g6oLmG42+RQuNbqLl8a4P2W9ewV1VraOdx3aGjZ42b6ntvDfjJT1UjnEGv2/Oxy/D+
	CS246S1OrX/vSbJiRw7pSsUGvOxixza1+PPw59fsoCdIvcm+kFFdSscF+JObcm+H9tl6
	8fY1lmhTc9AnI5Fa7V5Oxt0liaphW9gHEwuVWRFoJ/wl7D0ZMPR+noOiUNtH/2/E3p7j
	uGayrI7pBcr+Qk1AIFc5Nw7zCcExdi+JVRoK+jlfV0mg3h2oVGcqKtT7vml7lM6LqJF8
	T/DUBkKFjegBjhGuR35iAUY/dsrICdos0z6I0P0mSXJAtL1wACWWXP8iOldlOP+URVW8
	IF+Q==
X-Gm-Message-State: AOAM533Z7CJiZ5sWUKoV2d2gABTbdw5jwA39XZEbk5MYyE3lozNKpMgi
	7yAvaeLv5/EKhEdYNzqrq/I=
X-Google-Smtp-Source: ABdhPJx9oBpKDQjhGxFTArOcdwz/YcDQe6ebrHQfAhI5awzlneg9cuaJfws7mJgcTr8p8Q++EoRMAA==
X-Received: by 2002:a05:6638:1b5:: with SMTP id
	b21mr27017984jaq.125.1597157342319; 
	Tue, 11 Aug 2020 07:49:02 -0700 (PDT)
Received: from anon-dhcp-152.1015granger.net
	(c-68-61-232-219.hsd1.mi.comcast.net. [68.61.232.219])
	by smtp.gmail.com with ESMTPSA id
	x5sm12687773iol.36.2020.08.11.07.48.59
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2020 07:49:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
From: Chuck Lever <chucklever@gmail.com>
In-Reply-To: <1597124623.30793.14.camel@HansenPartnership.com>
Date: Tue, 11 Aug 2020 10:48:58 -0400
Message-Id: <16C3BF97-A7D3-488A-9D26-7C9B18AD2084@gmail.com>
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
To: James Bottomley <James.Bottomley@HansenPartnership.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07BEnC4m019685
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 12 Aug 2020 07:08:24 -0400
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
	Mimi Zohar <zohar@linux.ibm.com>, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, Pavel Machek <pavel@ucw.cz>,
	agk@redhat.com, Sasha Levin <sashal@kernel.org>,
	Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>,
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



> On Aug 11, 2020, at 1:43 AM, James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> 
> On Mon, 2020-08-10 at 19:36 -0400, Chuck Lever wrote:
>>> On Aug 10, 2020, at 11:35 AM, James Bottomley
>>> <James.Bottomley@HansenPartnership.com> wrote:
>>> On Sun, 2020-08-09 at 13:16 -0400, Mimi Zohar wrote:
>>>> On Sat, 2020-08-08 at 13:47 -0400, Chuck Lever wrote:
> [...]
>>>>> The first priority (for me, anyway) therefore is getting the
>>>>> ability to move IMA metadata between NFS clients and servers
>>>>> shoveled into the NFS protocol, but that's been blocked for
>>>>> various legal reasons.
>>>> 
>>>> Up to now, verifying remote filesystem file integrity has been
>>>> out of scope for IMA.   With fs-verity file signatures I can at
>>>> least grasp how remote file integrity could possibly work.  I
>>>> don't understand how remote file integrity with existing IMA
>>>> formats could be supported. You might want to consider writing a
>>>> whitepaper, which could later be used as the basis for a patch
>>>> set cover letter.
>>> 
>>> I think, before this, we can help with the basics (and perhaps we
>>> should sort them out before we start documenting what we'll do).
>> 
>> Thanks for the help! I just want to emphasize that documentation
>> (eg, a specification) will be critical for remote filesystems.
>> 
>> If any of this is to be supported by a remote filesystem, then we
>> need an unencumbered description of the new metadata format rather
>> than code. GPL-encumbered formats cannot be contributed to the NFS
>> standard, and are probably difficult for other filesystems that are
>> not Linux-native, like SMB, as well.
> 
> I don't understand what you mean by GPL encumbered formats.  The GPL is
> a code licence not a data or document licence.

IETF contributions occur under a BSD-style license incompatible
with the GPL.

https://trustee.ietf.org/trust-legal-provisions.html

Non-Linux implementers (of OEM storage devices) rely on such standards
processes to indemnify them against licensing claims.

Today, there is no specification for existing IMA metadata formats,
there is only code. My lawyer tells me that because the code that
implements these formats is under GPL, the formats themselves cannot
be contributed to, say, the IETF without express permission from the
authors of that code. There are a lot of authors of the Linux IMA
code, so this is proving to be an impediment to contribution. That
blocks the ability to provide a fully-specified NFS protocol
extension to support IMA metadata formats.


> The way the spec
> process works in Linux is that we implement or evolve a data format
> under a GPL implementaiton, but that implementation doesn't implicate
> the later standardisation of the data format and people are free to
> reimplement under any licence they choose.

That technology transfer can happen only if all the authors of that
prototype agree to contribute to a standard. That's much easier if
that agreement comes before an implementation is done. The current
IMA code base is more than a decade old, and there are more than a
hundred authors who have contributed to that base.

Thus IMO we want an unencumbered description of any IMA metadata
format that is to be contributed to an open standards body (as it
would have to be to extend, say, the NFS protocol).

I'm happy to write that specification, as long as any contributions
here are unencumbered and acknowledged. In fact, I have been working
on a (so far, flawed) NFS extension:

https://datatracker.ietf.org/doc/draft-ietf-nfsv4-integrity-measurement/

Now, for example, the components of a putative Merkle-based IMA
metadata format are all already open:

- The unit size is just an integer

- A certificate fingerprint is a de facto standard, and the
fingerprint digest algorithms are all standardized

- Merkle trees are public domain, I believe, and we're not adding
any special sauce here

- Digital signing algorithms are all standardized

Wondering if we want to hash and save the file's mtime and size too.


>>> The first basic is that a merkle tree allows unit at a time
>>> verification. First of all we should agree on the unit.  Since we
>>> always fault a page at a time, I think our merkle tree unit should
>>> be a page not a block.
>> 
>> Remote filesystems will need to agree that the size of that unit is
>> the same everywhere, or the unit size could be stored in the per-file
>> metadata.
>> 
>> 
>>> Next, we should agree where the check gates for the per page
>>> accesses should be ... definitely somewhere in readpage, I suspect
>>> and finally we should agree how the merkle tree is presented at the
>>> gate.  I think there are three ways:
>>> 
>>>  1. Ahead of time transfer:  The merkle tree is transferred and
>>> verified
>>>     at some time before the accesses begin, so we already have a
>>>     verified copy and can compare against the lower leaf.
>>>  2. Async transfer:  We provide an async mechanism to transfer the
>>>     necessary components, so when presented with a unit, we check
>>> the
>>>     log n components required to get to the root
>>>  3. The protocol actually provides the capability of 2 (like the
>>> SCSI
>>>     DIF/DIX), so to IMA all the pieces get presented instead of
>>> IMA
>>>     having to manage the tree
>> 
>> A Merkle tree is potentially large enough that it cannot be stored in
>> an extended attribute. In addition, an extended attribute is not a
>> byte stream that you can seek into or read small parts of, it is
>> retrieved in a single shot.
> 
> Well you wouldn't store the tree would you, just the head hash.  The
> rest of the tree can be derived from the data.  You need to distinguish
> between what you *must* have to verify integrity (the head hash,
> possibly signed)

We're dealing with an untrusted storage device, and for a remote
filesystem, an untrusted network.

Mimi's earlier point is that any IMA metadata format that involves
unsigned digests is exposed to an alteration attack at rest or in
transit, thus will not provide a robust end-to-end integrity
guarantee.

Therefore, tree root digests must be cryptographically signed to be
properly protected in these environments. Verifying that signature
should be done infrequently relative to reading a file's content.


> and what is nice to have to speed up the verification
> process.  The choice for the latter is cache or reconstruct depending
> on the resources available.  If the tree gets cached on the server,
> that would be a server implementation detail invisible to the client.

We assume that storage targets (for block or file) are not trusted.
Therefore storage clients cannot rely on intermediate results (eg,
middle nodes in a Merkle tree) unless those results are generated
within the client's trust envelope.

So: if the storage target is considered inside the client's trust
envelope, it can cache or store durably any intermediate parts of
the verification process. If not, the network and file storage is
considered untrusted, and the client has to rely on nothing but the
signed digest of the tree root.

We could build a scheme around, say, fscache, that might save the
intermediate results durably and locally.


>> For this reason, the idea was to save only the signature of the
>> tree's root on durable storage. The client would retrieve that
>> signature possibly at open time, and reconstruct the tree at that
>> time.
> 
> Right that's the integrity data you must have.
> 
>> Or the tree could be partially constructed on-demand at the time each
>> unit is to be checked (say, as part of 2. above).
> 
> Whether it's reconstructed or cached can be an implementation detail.
> You clearly have to reconstruct once, but whether you have to do it
> again depends on the memory available for caching and all the other
> resource calls in the system.
> 
>> The client would have to reconstruct that tree again if memory
>> pressure caused some or all of the tree to be evicted, so perhaps an
>> on-demand mechanism is preferable.
> 
> Right, but I think that's implementation detail.  Probably what we need
> is a way to get the log(N) verification hashes from the server and it's
> up to the client whether it caches them or not.

Agreed, these are implementation details. But see above about the
trustworthiness of the intermediate hashes. If they are conveyed
on an untrusted network, then they can't be trusted either.


>>> There are also a load of minor things like how we get the head
>>> hash, which must be presented and verified ahead of time for each
>>> of the above 3.
>> 
>> Also, changes to a file's content and its tree signature are not
>> atomic. If a file is mutable, then there is the period between when
>> the file content has changed and when the signature is updated.
>> Some discussion of how a client is to behave in those situations will
>> be necessary.
> 
> For IMA, if you write to a checked file, it gets rechecked the next
> time the gate (open/exec/mmap) is triggered.  This means you must
> complete the update and have the new integrity data in-place before
> triggering the check.  I think this could apply equally to a merkel
> tree based system.  It's a sort of Doctor, Doctor it hurts when I do
> this situation.

I imagine it's a common situation where a "yum update" process is
modifying executables while clients are running them. To prevent
a read from pulling refreshed content before the new tree root is
available, it would have to block temporarily until the verification
process succeeds with the updated tree root.


--
Chuck Lever
chucklever@gmail.com




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

