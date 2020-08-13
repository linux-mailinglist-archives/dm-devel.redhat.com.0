Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6959D24453A
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 09:07:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-owYZ5Yc6N6KBfkSAkkB8_Q-1; Fri, 14 Aug 2020 03:07:17 -0400
X-MC-Unique: owYZ5Yc6N6KBfkSAkkB8_Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90CD61030C5C;
	Fri, 14 Aug 2020 07:07:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70E7A5D759;
	Fri, 14 Aug 2020 07:07:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D9FE4EE15;
	Fri, 14 Aug 2020 07:07:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DEh87g020291 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 10:43:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F1F2F47CE2; Thu, 13 Aug 2020 14:43:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED1D847CD8
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 14:43:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0AD2101A540
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 14:43:07 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-482-N9ML-15rPBu9i3402iC8-w-1; Thu, 13 Aug 2020 10:43:02 -0400
X-MC-Unique: N9ML-15rPBu9i3402iC8-w-1
Received: by mail-il1-f195.google.com with SMTP id 77so5737149ilc.5;
	Thu, 13 Aug 2020 07:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=KILfYV/I05r54w/N5CnfJ8WQSq/xdrIhozq/NImqQxA=;
	b=Lj8wzCsJ8lupOm2Pm8kglHyTypoSoo8P6BMxQvx4iY3kVCWhFOman+5nfCLUs8FDj6
	VZvZQCXOrMbtcK6zutgd5f4wBk32hE9gPCuVCfaGbEDWH4ucIeTctoOhuUGmFilkGKRC
	sRsVpBByiAWIX5057GfSWxeCKGtlzwuDvcP9GqhBBlGhQIH7moDrDDEhTHWZxbUeRmFB
	osedU/+qogzGlffukbPj5HhukyHSR5tyv3JlbQSEFVHhMmt2p3LuHYgXrurrgVO2JYff
	pWti1ICkVzqrcXhb29sJFwvTbVZivr1oSVwPdD5kfD1g6iUK/z7s3i5ck+B65eqTv/PV
	eE7w==
X-Gm-Message-State: AOAM531QUQJDBUraVtaUubYyDR7RFyNEHouhpnpz0uZyd1CnBXJOn4/l
	t8+E4ke7ZEqFEk+MS5wiD98=
X-Google-Smtp-Source: ABdhPJxgrClyrzQX/PJcUbPmit0CzIEDPN6RcrMwhHvO56Hl7Nl5nMW+4QTSjkyJORRGbVY/nG4opg==
X-Received: by 2002:a05:6e02:d48:: with SMTP id
	h8mr5047638ilj.295.1597329781813; 
	Thu, 13 Aug 2020 07:43:01 -0700 (PDT)
Received: from anon-dhcp-152.1015granger.net
	(c-68-61-232-219.hsd1.mi.comcast.net. [68.61.232.219])
	by smtp.gmail.com with ESMTPSA id
	v17sm2821661ilj.33.2020.08.13.07.42.59
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Aug 2020 07:43:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
From: Chuck Lever <chucklever@gmail.com>
In-Reply-To: <1597247482.7293.18.camel@HansenPartnership.com>
Date: Thu, 13 Aug 2020 10:42:57 -0400
Message-Id: <D470BA4B-EF1A-49CA-AFB9-0F7FFC4C6001@gmail.com>
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
	<1597161218.4325.38.camel@HansenPartnership.com>
	<02D551EF-C975-4B91-86CA-356FA0FF515C@gmail.com>
	<1597247482.7293.18.camel@HansenPartnership.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07DEh87g020291
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 14 Aug 2020 03:04:01 -0400
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
X-Mimecast-Spam-Score: 0.502
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> On Aug 12, 2020, at 11:51 AM, James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> 
> On Wed, 2020-08-12 at 10:15 -0400, Chuck Lever wrote:
>>> On Aug 11, 2020, at 11:53 AM, James Bottomley
>>> <James.Bottomley@HansenPartnership.com> wrote:
>>> 
>>> On Tue, 2020-08-11 at 10:48 -0400, Chuck Lever wrote:
> [...]
>>>>> 
>>>>> and what is nice to have to speed up the verification
>>>>> process.  The choice for the latter is cache or reconstruct
>>>>> depending on the resources available.  If the tree gets cached
>>>>> on the server, that would be a server implementation detail
>>>>> invisible to the client.
>>>> 
>>>> We assume that storage targets (for block or file) are not
>>>> trusted. Therefore storage clients cannot rely on intermediate
>>>> results (eg, middle nodes in a Merkle tree) unless those results
>>>> are generated within the client's trust envelope.
>>> 
>>> Yes, they can ... because supplied nodes can be verified.  That's
>>> the whole point of a merkle tree.  As long as I'm sure of the root
>>> hash I can verify all the rest even if supplied by an untrusted
>>> source.  If you consider a simple merkle tree covering 4 blocks:
>>> 
>>>      R
>>>    /   \
>>> H11     H12
>>> / \     / \
>>> H21 H22 H23 H24
>>>>   |   |   |
>>> 
>>> B1   B2  B3  B4
>>> 
>>> Assume I have the verified root hash R.  If you supply B3 you also
>>> supply H24 and H11 as proof.  I verify by hashing B3 to produce H23
>>> then hash H23 and H24 to produce H12 and if H12 and your supplied
>>> H11 hash to R the tree is correct and the B3 you supplied must
>>> likewise be correct.
>> 
>> I'm not sure what you are proving here. Obviously this has to work
>> in order for a client to reconstruct the file's Merkle tree given
>> only R and the file content.
> 
> You implied the server can't be trusted to generate the merkel tree. 
> I'm showing above it can because of the tree path based verification.

What I was implying is that clients can't trust intermediate Merkle
tree content that is not also signed. So far we are talking about
signing only the tree root.

The storage server can store the tree durably, but if the intermediate
parts of the tree are not signed, the client has to verify them anyway,
and that reduces the value of storing potentially large data structures.


>> It's the construction of the tree and verification of the hashes that
>> are potentially expensive. The point of caching intermediate hashes
>> is so that the client verifies them as few times as possible.  I
>> don't see value in caching those hashes on an untrusted server --
>> the client will have to reverify them anyway, and there will be no
>> savings.
> 
> I'm not making any claim about server caching, I'm just saying the
> client can request pieces of the tree from the server without having to
> reconstruct the whole thing itself because it can verify their
> correctness.

To be clear, my concern is about how much of the tree might be stored
in a Merkle-based metadata format. I just don't see that it has much
value to store more than the signed tree root, because the client will
have to reconstitute or verify some tree contents on most every read.

For sufficiently large files, the tree itself can be larger than what
can be stored in an xattr. This is the same problem that fs-verity
faces. And, as I stated earlier, xattr objects are read in their
entirety, they can't be seeked into or read piecemeal.

What it seemed to me that you were suggesting was an offloaded cache
of the Merkle tree. Either the whole tree is stored on the storage
server, or the storage server provides a service that reconstitutes
that tree on behalf of clients. (Please correct me if I misunderstood).
I just don't think that will be practicable or provide the kind of
benefit you might want.


>> Cache once, as close as you can to where the data will be used.
>> 
>> 
>>>> So: if the storage target is considered inside the client's trust
>>>> envelope, it can cache or store durably any intermediate parts of
>>>> the verification process. If not, the network and file storage is
>>>> considered untrusted, and the client has to rely on nothing but
>>>> the signed digest of the tree root.
>>>> 
>>>> We could build a scheme around, say, fscache, that might save the
>>>> intermediate results durably and locally.
>>> 
>>> I agree we want caching on the client, but we can always page in
>>> from the remote as long as we page enough to verify up to R, so
>>> we're always sure the remote supplied genuine information.
>> 
>> Agreed.
>> 
>> 
>>>>>> For this reason, the idea was to save only the signature of
>>>>>> the tree's root on durable storage. The client would retrieve
>>>>>> that signature possibly at open time, and reconstruct the
>>>>>> tree at that time.
>>>>> 
>>>>> Right that's the integrity data you must have.
>>>>> 
>>>>>> Or the tree could be partially constructed on-demand at the
>>>>>> time each unit is to be checked (say, as part of 2. above).
>>>>> 
>>>>> Whether it's reconstructed or cached can be an implementation
>>>>> detail. You clearly have to reconstruct once, but whether you
>>>>> have to do it again depends on the memory available for caching
>>>>> and all the other resource calls in the system.
>>>>> 
>>>>>> The client would have to reconstruct that tree again if
>>>>>> memory pressure caused some or all of the tree to be evicted,
>>>>>> so perhaps an on-demand mechanism is preferable.
>>>>> 
>>>>> Right, but I think that's implementation detail.  Probably what
>>>>> we need is a way to get the log(N) verification hashes from the
>>>>> server and it's up to the client whether it caches them or not.
>>>> 
>>>> Agreed, these are implementation details. But see above about the
>>>> trustworthiness of the intermediate hashes. If they are conveyed
>>>> on an untrusted network, then they can't be trusted either.
>>> 
>>> Yes, they can, provided enough of them are asked for to verify.  If
>>> you look at the simple example above, suppose I have cached H11 and
>>> H12, but I've lost the entire H2X layer.  I want to verify B3 so I
>>> also ask you for your copy of H24.  Then I generate H23 from B3 and
>>> Hash H23 and H24.  If this doesn't hash to H12 I know either you
>>> supplied me the wrong block or lied about H24.  However, if it all
>>> hashes correctly I know you supplied me with both the correct B3
>>> and the correct H24.
>> 
>> My point is there is a difference between a trusted cache and an
>> untrusted cache. I argue there is not much value in a cache where
>> the hashes have to be verified again.
> 
> And my point isn't about caching, it's about where the tree comes from.
> I claim and you agree the client can get the tree from the server a
> piece at a time (because it can path verify it) and doesn't have to
> generate it itself.

OK, let's focus on where the tree comes from. It is certainly
possible to build protocol to exchange parts of a Merkle tree. The
question is how it might be stored on the server. There are some
underlying assumptions about the metadata storage mechanism that
should be stated up front.

Current forms of IMA metadata are limited in size and stored in a
container that is read and written in a single operation. If we stick
with that container format, I don't see a way to store a Merkle tree
in there for all file sizes.

Thus it seems to me that we cannot begin to consider the tree-on-the-
server model unless there is a proposed storage mechanism for that
whole tree. Otherwise, the client must have the primary role in
unpacking and verifying the tree.

Storing only the tree root in the metadata means the metadata format
is nicely bounded in size.


> How much of the tree the client has to store and
> whether the server caches, reads it in from somewhere or reconstructs
> it is an implementation detail.

Sure.


--
Chuck Lever
chucklever@gmail.com




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

