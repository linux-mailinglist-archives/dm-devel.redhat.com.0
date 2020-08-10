Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C6A3B2416EB
	for <lists+dm-devel@lfdr.de>; Tue, 11 Aug 2020 09:10:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-CEMpalRiMmCqI80i3nF3hQ-1; Tue, 11 Aug 2020 03:09:08 -0400
X-MC-Unique: CEMpalRiMmCqI80i3nF3hQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EDBB8015CE;
	Tue, 11 Aug 2020 07:09:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DE0B6931B;
	Tue, 11 Aug 2020 07:09:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC3521809563;
	Tue, 11 Aug 2020 07:09:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07ANb0g1006377 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 19:37:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 68C0C208DD80; Mon, 10 Aug 2020 23:37:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 642F3208DD81
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 23:36:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51E4F8007B3
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 23:36:58 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-310-DLQsbmfCMPK42LQIPrIRag-1; Mon, 10 Aug 2020 19:36:52 -0400
X-MC-Unique: DLQsbmfCMPK42LQIPrIRag-1
Received: by mail-il1-f195.google.com with SMTP id z3so9092481ilh.3;
	Mon, 10 Aug 2020 16:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=LKyAC8SmzXgvrrYpq/s/3TsU/WRs+a9c0PUjRq1OPBQ=;
	b=Oirn23L0HcX58OP/n5CYX+y3VstMrTh6qO+tmi8BFrcbDGuK3PATz9RVjerufZ+dWP
	ZS5twNNP5s5kAcfpzlq4iLoaop/TzM6OX0VkFHXW7bwJHpApzROA1eI5jjl/v+N9/0zm
	QhslfoaLovMHKgQmkA5QuVZCqhjO3orfn8LniTejrP058xKzxabS6pm0MMOyXTUvit21
	xPYeEpkddTomxPJu+HTm9HWOX/PW7KxAfsh+irP7xSTCXYdH5BOhhbCCd+ZRk/pe8jhI
	uap1xAewDWna+P5kQPyUwKtEzAatMVJcpeyP/MVM1BzztW1i88yEQudzm1HqgvBvyVYV
	CW7g==
X-Gm-Message-State: AOAM533AngZEeaj5Fc0i31EVA7Uy7BETtEKliEsf7d9PrYbwiiEl0W0h
	VqTqsiaXaJKBWNTlHRRjZvw=
X-Google-Smtp-Source: ABdhPJy1S3g3p98Xi9EcsXNS6CmJzbt5rxJnpB8itBPIozhsJmELv5fUbjHEUzglUQlam96oFkStKA==
X-Received: by 2002:a92:8b11:: with SMTP id i17mr19417396ild.212.1597102610889;
	Mon, 10 Aug 2020 16:36:50 -0700 (PDT)
Received: from anon-dhcp-152.1015granger.net
	(c-68-61-232-219.hsd1.mi.comcast.net. [68.61.232.219])
	by smtp.gmail.com with ESMTPSA id
	o11sm11353713iom.25.2020.08.10.16.36.48
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Aug 2020 16:36:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
From: Chuck Lever <chucklever@gmail.com>
In-Reply-To: <1597073737.3966.12.camel@HansenPartnership.com>
Date: Mon, 10 Aug 2020 19:36:47 -0400
Message-Id: <6E907A22-02CC-42DD-B3CD-11D304F3A1A8@gmail.com>
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
To: James Bottomley <James.Bottomley@HansenPartnership.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07ANb0g1006377
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 11 Aug 2020 03:08:22 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> On Aug 10, 2020, at 11:35 AM, James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> 
> On Sun, 2020-08-09 at 13:16 -0400, Mimi Zohar wrote:
>> On Sat, 2020-08-08 at 13:47 -0400, Chuck Lever wrote:
>>>> On Aug 5, 2020, at 2:15 PM, Mimi Zohar <zohar@linux.ibm.com>
>>>> wrote:
>> 
>> <snip>
>> 
>>>> If block layer integrity was enough, there wouldn't have been a
>>>> need for fs-verity.   Even fs-verity is limited to read only
>>>> filesystems, which makes validating file integrity so much
>>>> easier.  From the beginning, we've said that fs-verity signatures
>>>> should be included in the measurement list.  (I thought someone
>>>> signed on to add that support to IMA, but have not yet seen
>>>> anything.)
>>> 
>>> Mimi, when you and I discussed this during LSS NA 2019, I didn't
>>> fully understand that you expected me to implement signed Merkle
>>> trees for all filesystems. At the time, it sounded to me like you
>>> wanted signed Merkle trees only for NFS files. Is that still the
>>> case?
>> 
>> I definitely do not expect you to support signed Merkle trees for all
>> filesystems.  My interested is from an IMA perspective of measuring
>> and verifying the fs-verity Merkle tree root (and header info)
>> signature. This is independent of which filesystems support it.
>> 
>>> 
>>> The first priority (for me, anyway) therefore is getting the
>>> ability to move IMA metadata between NFS clients and servers
>>> shoveled into the NFS protocol, but that's been blocked for various
>>> legal reasons.
>> 
>> Up to now, verifying remote filesystem file integrity has been out of
>> scope for IMA.   With fs-verity file signatures I can at least grasp
>> how remote file integrity could possibly work.  I don't understand
>> how remote file integrity with existing IMA formats could be
>> supported. You might want to consider writing a whitepaper, which
>> could later be used as the basis for a patch set cover letter.
> 
> I think, before this, we can help with the basics (and perhaps we
> should sort them out before we start documenting what we'll do).

Thanks for the help! I just want to emphasize that documentation
(eg, a specification) will be critical for remote filesystems.

If any of this is to be supported by a remote filesystem, then we
need an unencumbered description of the new metadata format rather
than code. GPL-encumbered formats cannot be contributed to the NFS
standard, and are probably difficult for other filesystems that are
not Linux-native, like SMB, as well.


> The
> first basic is that a merkle tree allows unit at a time verification. 
> First of all we should agree on the unit.  Since we always fault a page
> at a time, I think our merkle tree unit should be a page not a block.

Remote filesystems will need to agree that the size of that unit is
the same everywhere, or the unit size could be stored in the per-file
metadata.


> Next, we should agree where the check gates for the per page accesses
> should be ... definitely somewhere in readpage, I suspect and finally
> we should agree how the merkle tree is presented at the gate.  I think
> there are three ways:
> 
>   1. Ahead of time transfer:  The merkle tree is transferred and verified
>      at some time before the accesses begin, so we already have a
>      verified copy and can compare against the lower leaf.
>   2. Async transfer:  We provide an async mechanism to transfer the
>      necessary components, so when presented with a unit, we check the
>      log n components required to get to the root
>   3. The protocol actually provides the capability of 2 (like the SCSI
>      DIF/DIX), so to IMA all the pieces get presented instead of IMA
>      having to manage the tree

A Merkle tree is potentially large enough that it cannot be stored in
an extended attribute. In addition, an extended attribute is not a
byte stream that you can seek into or read small parts of, it is
retrieved in a single shot.

For this reason, the idea was to save only the signature of the tree's
root on durable storage. The client would retrieve that signature
possibly at open time, and reconstruct the tree at that time.

Or the tree could be partially constructed on-demand at the time each
unit is to be checked (say, as part of 2. above).

The client would have to reconstruct that tree again if memory pressure
caused some or all of the tree to be evicted, so perhaps an on-demand
mechanism is preferable.


> There are also a load of minor things like how we get the head hash,
> which must be presented and verified ahead of time for each of the
> above 3.

Also, changes to a file's content and its tree signature are not
atomic. If a file is mutable, then there is the period between when
the file content has changed and when the signature is updated.
Some discussion of how a client is to behave in those situations will
be necessary.


--
Chuck Lever
chucklever@gmail.com




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

